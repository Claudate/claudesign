#!/usr/bin/env ruby
# frozen_string_literal: true

require "yaml"

ROOT = File.expand_path("..", __dir__)
ROUTER_MAP_PATH = File.join(ROOT, "agents", "router-map.yaml")
SKILL_INDEX_PATH = File.join(ROOT, "skills", "skill-index.yaml")
CASE_PATH = File.join(ROOT, "agents", "router-validation-cases.yaml")
SKILL_DOC_GLOB = File.join(ROOT, "skills", "*", "SKILL.md")
DESIGN_DOC_GLOB = File.join(ROOT, "skills", "*", "DESIGN.md")
DESIGN_SAMPLE_GLOB = File.join(ROOT, "docs", "designmd-examples", "*.DESIGN.md")

def load_yaml(path)
  YAML.load_file(path)
end

def normalize(text)
  text.downcase.strip.gsub(/\s+/, " ")
end

def expand_by_synonyms(text, synonym_groups, group_name)
  expanded = normalize(text)
  groups = synonym_groups.fetch(group_name, [])

  groups.each do |item|
    canonical = normalize(item.fetch("canonical"))
    aliases = item.fetch("aliases", []).map { |alias_name| normalize(alias_name) }
    words = [canonical, *aliases]

    expanded = "#{expanded} #{canonical}" if words.any? { |word| expanded.include?(word) }
  end

  expanded
end

def tokenize_skill(skill_id)
  skill_id.split(/[.\-]/).reject { |token| token.length <= 1 }
end

def score_skill(skill_id, expanded_prompt)
  tokenize_skill(skill_id).count { |token| expanded_prompt.include?(token.tr("_", " ")) }
end

def includes_any?(text, phrases)
  phrases.any? { |phrase| text.include?(normalize(phrase)) }
end

def skill_execution_mode(skill)
  skill["execution_mode"]
end

def skill_bridge_status(skill)
  skill["execution_bridge_status"]
end

def agent_default_execution_mode(agent)
  agent["default_execution_mode"]
end

def bridge_config(router_map)
  router_map["execution_bridge"]
end

def parse_frontmatter(path)
  lines = File.readlines(path)
  return nil if lines.empty?
  return nil unless lines[0].strip == "---"

  ending_index = nil
  lines.each_with_index do |line, idx|
    next if idx.zero?
    if line.strip == "---"
      ending_index = idx
      break
    end
  end

  return nil if ending_index.nil?

  data = YAML.safe_load(lines[1...ending_index].join)
  return {} if data.nil?
  data
end

def validate_skill_doc_frontmatter
  errors = []
  files = Dir.glob(SKILL_DOC_GLOB).sort

  if files.empty?
    errors << "No skill docs found under skills/*/SKILL.md"
    return errors
  end

  files.each do |path|
    frontmatter = parse_frontmatter(path)
    if frontmatter.nil?
      errors << "Skill doc #{path} is missing YAML frontmatter"
      next
    end

    if frontmatter["name"].to_s.strip.empty?
      errors << "Skill doc #{path} frontmatter is missing name"
    end

    if frontmatter["description"].to_s.strip.empty?
      errors << "Skill doc #{path} frontmatter is missing description"
    end
  end

  errors
end

def validate_design_doc_frontmatter
  errors = []
  files = (Dir.glob(DESIGN_DOC_GLOB) + Dir.glob(DESIGN_SAMPLE_GLOB)).sort

  files.each do |path|
    frontmatter = parse_frontmatter(path)
    if frontmatter.nil?
      errors << "Design doc #{path} is missing YAML frontmatter"
      next
    end

    if frontmatter["name"].to_s.strip.empty?
      errors << "Design doc #{path} frontmatter is missing name"
    end
  end

  errors
end

def infer_mode(prompt, expanded_prompt, agent_id, default_mode, skills_by_id, best_skill, best_skill_score)
  text = normalize("#{prompt} #{expanded_prompt}")

  case agent_id
  when "agent.visual-style"
    return "image-first" if includes_any?(text, ["image-first", "image first", "按图实现", "先出图再实现", "先生成图"])
    return "style-redesign" if includes_any?(text, ["redesign", "revamp", "ui upgrade", "改版", "重设计", "界面重做"])
    return "design-spec" if includes_any?(text, ["style profile", "visual style", "minimalist", "brutalist", "soft ui", "stitch design", "output enforcement", "design md", "风格化", "视觉风格", "极简", "野兽派", "工业风", "柔和风格", "禁止省略", "不要偷懒"])
  when "agent.web-design"
    return "animation" if includes_any?(text, ["component state", "hover", "focus", "loading", "motion", "animation", "动效", "状态过渡"])
    return "critique" if includes_any?(text, ["responsive", "audit", "qa", "review", "检查", "自适应", "响应式"])
    return "prototype" if includes_any?(text, ["prototype", "wireframe", "原型", "线框", "原型结构", "区块层级", "布局", "层级", "hierarchy"])
    return "html-design" if includes_any?(text, ["html design", "html", "high fidelity", "高保真", "设计稿", "landing page", "页面"])
  when "agent.design-system"
    return "critique" if includes_any?(text, ["consistency", "review", "audit", "检查", "漂移", "可访问性"])
    return "analysis" if includes_any?(text, ["token", "inventory", "盘点"])
    return "html-design" if includes_any?(text, ["visual language", "style guide", "视觉规范"])
  when "agent.diagram-design"
    return "animation" if includes_any?(text, ["animation", "transition", "动效"])
    return "critique" if includes_any?(text, ["clarity", "review", "检查", "审查"])
    return "slides" if includes_any?(text, ["flowchart", "user flow", "decision tree", "汇报", "流程页", "链路"])
  when "agent.comp-design"
    return "analysis" if includes_any?(text, ["analysis", "estimate", "climate", "solar", "load", "概念阶段", "分析", "估算"])
  end

  if best_skill && best_skill_score.positive?
    skill_mode = skill_execution_mode(skills_by_id.fetch(best_skill))
    return default_mode if skill_mode.nil?
    return skill_mode unless skill_mode == "reference-only"
  end

  default_mode
end

def route_prompt(prompt, router_map, skills_by_id)
  synonym_groups = router_map.fetch("intent_normalization").fetch("synonym_groups")
  agents = router_map.fetch("agents")

  candidates = agents.map do |agent|
    group_name = agent.fetch("intent_match").fetch("synonym_group")
    expanded = expand_by_synonyms(prompt, synonym_groups, group_name)
    keyword_hits = agent.fetch("intent_keywords").count do |keyword|
      expanded.include?(normalize(keyword))
    end

    next if keyword_hits < agent.fetch("intent_match").fetch("min_keyword_hits")

    preferred_skills = agent.fetch("preferred_skills")
    best_skill = preferred_skills.max_by do |skill_id|
      [
        score_skill(skill_id, expanded),
        skills_by_id.fetch(skill_id).fetch("curation_tier") == "core" ? 1 : 0
      ]
    end
    best_skill_score = score_skill(best_skill, expanded)
    chosen_mode = infer_mode(
      prompt,
      expanded,
      agent.fetch("id"),
      agent_default_execution_mode(agent),
      skills_by_id,
      best_skill,
      best_skill_score
    )

    route_priority = agent.fetch("route_priority", 0)
    priority_boost = includes_any?(expanded, agent.fetch("priority_when_any_keywords_present", [])) ? 1 : 0

    {
      "agent_id" => agent.fetch("id"),
      "keyword_hits" => keyword_hits,
      "route_priority" => route_priority,
      "priority_boost" => priority_boost,
      "default_mode" => agent_default_execution_mode(agent),
      "chosen_mode" => chosen_mode,
      "best_skill" => best_skill,
      "best_skill_score" => best_skill_score,
      "expanded_prompt" => expanded
    }
  end.compact

  candidates.max_by do |candidate|
    [
      candidate.fetch("priority_boost"),
      candidate.fetch("keyword_hits"),
      candidate.fetch("route_priority"),
      -agents.index { |agent| agent.fetch("id") == candidate.fetch("agent_id") }
    ]
  end
end

def validate_structure(router_map, skills_by_id)
  errors = []

  bridge = bridge_config(router_map)
  unless bridge
    errors << "Router map is missing execution_bridge"
    return errors
  end

  mode_catalog = bridge.fetch("mode_catalog").keys

  skills_by_id.each_value do |skill|
    if skill_execution_mode(skill).nil?
      errors << "Skill #{skill.fetch("id")} is missing execution_mode"
    end

    if skill_bridge_status(skill).nil?
      errors << "Skill #{skill.fetch("id")} is missing execution_bridge_status"
    end

    mode = skill_execution_mode(skill)
    next unless mode

    next if mode == "reference-only" || mode_catalog.include?(mode)

    errors << "Skill #{skill.fetch("id")} uses unknown execution_mode #{mode}"
  end

  router_map.fetch("agents").each do |agent|
    agent.fetch("preferred_skills").each do |skill_id|
      errors << "Agent #{agent.fetch("id")} references missing preferred skill #{skill_id}" unless skills_by_id.key?(skill_id)
    end

    agent.fetch("curated_primary_skills").each do |skill_id|
      skill = skills_by_id[skill_id]

      unless skill
        errors << "Agent #{agent.fetch("id")} references missing curated skill #{skill_id}"
        next
      end

      errors << "Curated skill #{skill_id} is not core tier" unless skill.fetch("curation_tier") == "core"
    end

    errors << "Agent #{agent.fetch("id")} is missing default_execution_mode" unless agent_default_execution_mode(agent)
    errors << "Agent #{agent.fetch("id")} is missing execution_chain" unless agent.key?("execution_chain")

    next unless agent.key?("required_quality_gates")

    quality_gates = router_map.fetch("shared_quality_gates", {})
    agent.fetch("required_quality_gates").each do |gate_id|
      unless quality_gates.key?(gate_id)
        errors << "Agent #{agent.fetch("id")} requires missing shared quality gate #{gate_id}"
      end
    end
  end

  errors.concat(validate_skill_doc_frontmatter)
  errors.concat(validate_design_doc_frontmatter)

  errors
end

def validate_cases(router_map, skills_by_id, cases)
  errors = []
  passes = []

  cases.fetch("routing_cases").each do |test_case|
    result = route_prompt(test_case.fetch("prompt"), router_map, skills_by_id)

    if result.nil?
      errors << "#{test_case.fetch("id")} expected #{test_case.fetch("expected_agent")} but got no match"
      next
    end

    if result.fetch("agent_id") != test_case.fetch("expected_agent")
      errors << "#{test_case.fetch("id")} expected agent #{test_case.fetch("expected_agent")} but got #{result.fetch("agent_id")}"
      next
    end

    if result.fetch("chosen_mode") != test_case.fetch("expected_mode")
      errors << "#{test_case.fetch("id")} expected mode #{test_case.fetch("expected_mode")} but got #{result.fetch("chosen_mode")}"
      next
    end

    passes << "#{test_case.fetch("id")} => #{result.fetch("agent_id")} / #{result.fetch("chosen_mode")}"
  end

  cases.fetch("rejection_cases").each do |test_case|
    result = route_prompt(test_case.fetch("prompt"), router_map, skills_by_id)
    if result
      errors << "#{test_case.fetch("id")} expected no match but got #{result.fetch("agent_id")}"
      next
    end

    passes << "#{test_case.fetch("id")} => no-match"
  end

  cases.fetch("guard_cases").each do |test_case|
    result = route_prompt(test_case.fetch("prompt"), router_map, skills_by_id)

    if result.nil?
      errors << "#{test_case.fetch("id")} expected guarded route via #{test_case.fetch("expected_agent")} but got no match"
      next
    end

    if result.fetch("agent_id") != test_case.fetch("expected_agent")
      errors << "#{test_case.fetch("id")} expected guarded agent #{test_case.fetch("expected_agent")} but got #{result.fetch("agent_id")}"
      next
    end

    passes << "#{test_case.fetch("id")} => guarded via #{result.fetch("agent_id")} #{test_case.fetch("expected_guard_label")}"
  end

  mode_cases = cases["execution_mode_cases"] || []
  mode_cases.each do |test_case|
    result = route_prompt(test_case.fetch("prompt"), router_map, skills_by_id)

    if result.nil?
      errors << "#{test_case.fetch("id")} expected #{test_case.fetch("expected_agent")} but got no match"
      next
    end

    if result.fetch("agent_id") != test_case.fetch("expected_agent")
      errors << "#{test_case.fetch("id")} expected agent #{test_case.fetch("expected_agent")} but got #{result.fetch("agent_id")}"
      next
    end

    if result.fetch("chosen_mode") != test_case.fetch("expected_mode")
      errors << "#{test_case.fetch("id")} expected mode #{test_case.fetch("expected_mode")} but got #{result.fetch("chosen_mode")}"
      next
    end

    passes << "#{test_case.fetch("id")} => #{result.fetch("agent_id")} / #{result.fetch("chosen_mode")}"
  end

  [passes, errors]
end

router_map = load_yaml(ROUTER_MAP_PATH)
skill_index = load_yaml(SKILL_INDEX_PATH)
cases = load_yaml(CASE_PATH)
skills_by_id = skill_index.fetch("skills").each_with_object({}) do |skill, acc|
  acc[skill.fetch("id")] = skill
end

structure_errors = validate_structure(router_map, skills_by_id)
case_passes, case_errors = validate_cases(router_map, skills_by_id, cases)
errors = structure_errors + case_errors

puts "Router validation"
puts "- files: agents/router-map.yaml, skills/skill-index.yaml, agents/router-validation-cases.yaml"
puts "- case passes: #{case_passes.length}"
puts "- errors: #{errors.length}"

case_passes.each { |line| puts "  PASS #{line}" }

if errors.empty?
  puts "Result: PASS"
  exit 0
end

errors.each { |line| puts "  FAIL #{line}" }
puts "Result: FAIL"
exit 1
