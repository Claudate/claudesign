# Design Skill Canonical Map (v1.2)

> 创建日期：2026-04-21  
> 目的：沉淀 dedup 后的标准 skill 清单，标记 canonical 与 variant 关系。

## Canonical Mapping Table
| canonical_skill_id | skill_name | type | category | execution_mode | execution_bridge_status | source_repo | variant_ids | merged_from | review_date |
|---|---|---|---|---|---|---|---|---|---|
| `web.interface-design-core` | `Interface Design Core` | `executable` | `web-ui` | `html-design` | `bridge-ready` | `Dammyjay93/interface-design` | `[web.layout-hierarchy, web.state-spec, web.responsive-qa]` | `[interface-design, claude-code-ui-agents/prompts/responsive]` | `2026-04-22` |
| `taste.taste-core` | `Taste Core` | `executable` | `visual-style` | `image-first` | `bridge-ready` | `Leonxlnx/taste-skill` | `[taste.gpt-taste, taste.images-taste, taste.redesign, taste.soft, taste.minimalist, taste.brutalist, taste.stitch, taste.output-enforcement]` | `[taste-skill]` | `2026-04-23` |
| `system.signature-visual-language` | `Signature Visual Language` | `executable` | `design-system` | `html-design` | `bridge-ready` | `dominikmartn/nothing-design-skill` | `[system.token-audit, system.component-ruleset, system.visual-drift-review]` | `[visual-language-source, curated-design-reference-source, ui-agent-prompts/ui-design]` | `2026-04-22` |
| `ux.review-suite` | `UX Review Suite` | `executable` | `ux-adjacent` | `critique` | `bridge-ready` | `nextlevelbuilder/ui-ux-pro-max-skill` | `[ux.ux-friction-scan, ux.a11y-light-audit, ux.flow-clarity-pass]` | `[ux-review-source, ui-agent-prompts/accessibility, ui-agent-prompts/ux-research]` | `2026-04-22` |
| `diagram.diagram-design-core` | `Diagram Design Core` | `executable` | `diagram-flow` | `slides` | `bridge-ready` | `cathrynlavery/diagram-design` | `[diagram.flow-skeleton, diagram.branch-logic-normalize, diagram.diagram-clarity-check]` | `[diagram-design]` | `2026-04-22` |
| `comp.computational-design-suite` | `Computational Design Suite` | `executable` | `computational-design` | `analysis` | `guarded` | `Amanbh997/Claude-skills-for-Computational-Designers` | `[comp.workflow-calculator, comp.climate-analysis, comp.site-solar-analysis, comp.building-load-calculations, comp.lifecycle-sustainability, comp.accessibility-code-compliance]` | `[computational-design-source]` | `2026-04-22` |
| `library.curated-design-reference` | `Curated Design Reference Index` | `reference` | `design-system` | `reference-only` | `reference-only` | `rohitg00/awesome-claude-design` | `[]` | `[curated-design-reference-source]` | `2026-04-22` |

## Merge Policy Snapshot
- 能力重叠 > 70%：合并到 canonical skill。
- 输入假设或输出合同显著不同：保留为 variant。
- 所有合并必须保留 `source_repo + source_section` 映射。

## Change Log
- `2026-04-21`：初始化文档骨架。
- `2026-04-21`：补齐 canonical 与 variant 映射（v1）。
- `2026-04-22`：补齐执行桥接字段：`execution_mode` 与 `execution_bridge_status`。
- `2026-04-23`：新增 `visual-style` 体系与 `taste.taste-core` canonical 映射。
