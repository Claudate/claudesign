---
name: visual-style
description: Taste-skill inspired visual style execution pack for premium frontend output. Includes style profiles, image-first workflow, redesign mode, stitch semantic export, and anti-slop completeness gates.
---

# Visual Style Skill

## Purpose
Provide a dedicated style-execution layer for premium web UI tasks.

This skill pack is optimized for:
- style-profile directed generation (soft/minimalist/brutalist/balanced)
- image-first implementation workflows
- redesign of existing interfaces
- stitch-compatible design spec export
- anti-slop and full-output enforcement

## Role Contract

Use a dynamic expert role model instead of a single fixed persona.

- Default frame: AI is expert designer, user is product manager and final decision owner.
- Role switching by task:
  - motion-heavy requests -> motion designer
  - structure and flow requests -> UX designer
  - presentation requests -> deck designer
  - design-system and token requests -> design-system designer
- The final decision standard is user goals and constraints, not model preference.

## Six-Step Workflow Contract

All visual-style tasks should follow this sequence:

1. Understand request and constraints.
2. Explore references, patterns, and reusable assets.
3. Produce a concise execution plan.
4. Build structure, style system, and interaction details.
5. Validate quality, correctness, and state coverage.
6. Summarize only key notes and next action.

Clarification boundary:
- If request is ambiguous and risk is high, ask focused clarifying questions first.
- If request is urgent or constraints are explicit, proceed directly and state assumptions after execution.

## Shared Quality Gates

### 1) `anti-slop-core`
Mandatory for visual-generation tasks:
- avoid template-like hero repetition across pages
- avoid repetitive same-shape card rhythm without hierarchy shifts
- avoid placeholder truncation patterns in code or prose
- enforce intentional whitespace and typographic contrast
- enforce complete state coverage (loading/empty/error/focus/active)

### 2) `output-enforcement`
Mandatory for final deliverables:
- no omitted code placeholders (`...`, `TODO`, `rest of code`, `continue pattern`)
- no partial skeleton output when full implementation is requested
- no deferred completion phrasing
- split cleanly with resumable markers if token budget is exhausted

### 3) `validation-closure`
Mandatory for design-spec and implementation outputs:
- run a self-check pass for factual/content errors before finalizing
- verify interactions across loading/empty/error/focus/active states
- explicitly challenge one likely weak assumption to reduce confirmation bias
- if uncertainty remains, mark it and propose a concrete verification step

### 4) `anti-ai-design-principles`
Mandatory for premium visual outcomes:
- prefer restrained, intentional composition over decorative noise
- apply typographic hierarchy with clear contrast in scale/weight/rhythm
- keep content concise and avoid overfilled sections
- prefer OKLCH-informed color balancing for hue/lightness/chroma consistency
- avoid generic "AI-look" defaults and repetitive section patterns

## Skill Pack

### 1) `taste-core`
#### Inputs
- target page/product type
- visual intent keywords
- fidelity target

#### Workflow
1. Parse visual direction and required level of creativity.
2. Apply style dials (variance/motion/density).
3. Build anti-slop layout and state strategy.
4. Produce implementation-ready design output.

#### Output Contract
- style dial declaration
- layout and interaction strategy
- anti-slop checklist result

### 2) `gpt-taste`
#### Inputs
- model/runtime constraints
- desired motion depth
- content hierarchy

#### Workflow
1. Increase structure variance and motion strictness.
2. Prefer deterministic section planning before code.
3. Enforce premium typography and spacing constraints.
4. Return high-opinion implementation blueprint.

#### Output Contract
- deterministic section plan
- typography/motion constraints
- premium layout variants

### 3) `images-taste`
#### Inputs
- visual-first task scope
- section list
- expected fidelity level

#### Workflow
1. Generate section-level design references first.
2. Analyze generated images and extract visual tokens.
3. Implement frontend from extracted reference system.
4. If image generation is unavailable, degrade explicitly to text-first guidance.

#### Output Contract
- image-first execution log
- extracted visual system notes
- implementation mapping and degradation note (if applicable)

### 4) `redesign-skill`
#### Inputs
- existing UI/project snapshot
- constraints (stack, scope, timeline)
- quality goals

#### Workflow
1. Audit current UI for generic patterns.
2. Prioritize upgrades by impact and risk.
3. Apply stack-compatible redesign strategy.
4. Validate interactions and responsive quality.

#### Output Contract
- redesign audit findings
- prioritized upgrade plan
- compatibility-safe redesign guidance

### 5) `soft-skill`
#### Inputs
- calm/premium style intent
- content density target

#### Workflow
1. Apply soft contrast and whitespace bias.
2. Use premium typography and subtle depth.
3. Add restrained motion.

#### Output Contract
- soft-style palette and spacing profile
- component style and motion notes

### 6) `minimalist-skill`
#### Inputs
- editorial/minimal style intent
- information hierarchy needs

#### Workflow
1. Build warm monochrome system.
2. Enforce flat, disciplined component language.
3. Keep motion subtle and purposeful.

#### Output Contract
- minimalist design profile
- typography and layout constraints

### 7) `brutalist-skill`
#### Inputs
- industrial/brutalist style intent
- density and contrast needs

#### Workflow
1. Select one brutalist archetype and lock it.
2. Apply rigid grid and utility-first visual language.
3. Use constrained accent and high-contrast typography.

#### Output Contract
- selected archetype
- layout/color/type constraints

### 8) `stitch-skill`
#### Inputs
- project context
- style profile and constraints
- stitch output requirements

#### Workflow
1. Convert style intent to semantic design language.
2. Emit structured `DESIGN.md` rules for stitch generation.
3. Encode anti-pattern bans and responsive rules.
4. Include role assumptions, six-step trace, and validation-closure notes in output rationale.

#### Output Contract
- stitch-ready semantic design system
- anti-pattern and responsive rules

### 9) `output-enforcement`
#### Inputs
- user request scope
- expected deliverable count

#### Workflow
1. Lock expected output scope.
2. Validate no omission shortcuts are present.
3. Force complete output or controlled split.

#### Output Contract
- completion check summary
- split marker (if response paused)

## Image-First Degradation Policy
When image generation is unavailable:
1. Emit `[Image-First Degraded]` label.
2. Explain degraded path: text-first implementation guidance.
3. Include risk note for visual parity.
4. Continue with complete, non-placeholder output.

## Shared In Scope
- premium visual direction and style execution
- image-first and redesign workflows
- anti-slop and completeness enforcement
- role-adaptive design decision behavior
- six-step design workflow execution
- confirmation-bias-resistant validation closure

## Shared Out of Scope
- backend implementation
- deployment/infrastructure workflows
- legal licensing interpretation

## Source Mapping
- Source repo: https://github.com/Leonxlnx/taste-skill
- Retention mode: keep
- Last reviewed: 2026-04-23
