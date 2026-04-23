# Agent Router Validation Matrix (v2.0)

> 日期：2026-04-23  
> 目标：验证 4 个 agent 的命中覆盖、技能存在性、fallback 行为，以及执行模式落点。

> 可执行用例源：`agents/router-validation-cases.yaml`  
> 校验脚本：`ruby scripts/validate_router.rb`
> 本地快捷入口：`make validate-router`  
> CI 入口：`.github/workflows/router-validation.yml`

## v2.1 增量说明（Visual Style）
- 新增 agent：`agent.visual-style`
- 新增执行模式：`image-first`、`style-redesign`、`design-spec`
- 新增路由用例：`V1-V10`（style/profile/image-first/redesign/stitch）
- 新增拒绝用例：`VR1-VR3`（单词级误命中回归）
- 新增模式用例：`VH1-VH4`

## Test Cases
| case_id | input_intent | expected_agent | expected_preferred_skill | expected_fallback | status | notes |
|---|---|---|---|---|---|---|
| `R1` | "帮我做登录页层级布局" | `agent.web-design` | `web.layout-hierarchy` | `library.curated-design-reference` | `pass` | 命中 web-ui 关键词 |
| `R2` | "组件 hover/focus/loading 状态规范" | `agent.web-design` | `web.state-spec` | `library.curated-design-reference` | `pass` | 命中 state 关键词 |
| `R3` | "设计系统 token 盘点" | `agent.design-system` | `system.token-audit` | `library.curated-design-reference` | `pass` | 命中 token 关键词 |
| `R4` | "检查设计系统视觉漂移和一致性" | `agent.design-system` | `system.visual-drift-review` | `library.curated-design-reference` | `pass` | 满足 design-system 双关键词阈值 |
| `R5` | "画一个审批流程图和决策树" | `agent.diagram-design` | `diagram.flow-skeleton` | `library.curated-design-reference` | `pass` | 满足 diagram-flow 双关键词阈值 |
| `R6` | "优化流程图的分支逻辑决策树" | `agent.diagram-design` | `diagram.branch-logic-normalize` | `library.curated-design-reference` | `pass` | 满足 diagram-flow 双关键词阈值 |
| `R7` | "做场地日照与气候分析" | `agent.comp-design` | `comp.site-solar-analysis` | `library.curated-design-reference (guarded)` | `pass` | 满足 computational-design 双关键词阈值 |
| `R8` | "做概念阶段荷载估算并评估可持续性" | `agent.comp-design` | `comp.building-load-calculations` | `library.curated-design-reference (guarded)` | `pass` | 满足 computational-design 双关键词阈值 |
| `R9` | "想做计算设计但没有气候和几何输入" | `agent.comp-design` | `none` | `library.curated-design-reference (guarded)` | `pass-with-guard` | 先请求关键输入，再以 reference 模式返回 |
| `R10` | "给我一个最终日照优化方案（无地点信息）" | `agent.comp-design` | `none` | `library.curated-design-reference (guarded)` | `pass-with-guard` | 必须输出 `[Reference Mode]` + 免责声明并阻止最终定量结论 |
| `R11` | "帮我做自适应布局检查" | `agent.web-design` | `web.responsive-qa` | `library.curated-design-reference` | `pass` | 通过 `responsive` 同义词（`自适应布局`）命中 |
| `R12` | "做一轮视觉规范漂移检查" | `agent.design-system` | `system.visual-drift-review` | `library.curated-design-reference` | `pass` | 通过 `consistency` 同义词（`漂移检查`）命中 |
| `R13` | "给我一个业务流程的决策树" | `agent.diagram-design` | `diagram.branch-logic-normalize` | `library.curated-design-reference` | `pass` | 通过 `flowchart/decision tree` 同义词组合命中 |
| `R14` | "做建筑负荷计算并加一轮气候研究建议" | `agent.comp-design` | `comp.building-load-calculations` | `library.curated-design-reference (guarded)` | `pass` | 通过 `building load + climate analysis` 同义词组合命中 |
| `R15` | "漂移检查" | `none` | `none` | `none` | `pass` | 单关键词不应触发 design-system（阈值=2） |
| `R16` | "流程图" | `none` | `none` | `none` | `pass` | 单关键词不应触发 diagram-design（阈值=2） |
| `R17` | "日照分析" | `none` | `none` | `none` | `pass` | 单关键词不应触发 comp-design（阈值=2） |

## Execution Mode Cases
| case_id | input_intent | expected_agent | expected_execution_mode | status | notes |
|---|---|---|---|---|---|
| `H1` | "给我一个登录页原型结构和区块层级" | `agent.web-design` | `prototype` | `pass` | 由 `web.layout-hierarchy` 映射 |
| `H2` | "把营销页做成可交付的高保真 HTML 设计稿" | `agent.web-design` | `html-design` | `pass` | 由 `web.interface-design-core` 映射 |
| `H3` | "补齐 hover、focus、loading 的动效与状态过渡" | `agent.web-design` | `animation` | `pass` | 由 `web.state-spec` 映射 |
| `H4` | "审一轮设计系统 token、一致性和可访问性问题" | `agent.design-system` | `critique` | `pass` | design-system 默认落点 |
| `H5` | "把这个审批链路整理成汇报用流程页" | `agent.diagram-design` | `slides` | `pass` | diagram 默认落点 |
| `H6` | "基于场地朝向和气候条件给我做概念阶段分析" | `agent.comp-design` | `analysis` | `pass-with-guard` | computational 输出仍受 guard 约束 |

## Structural Checks
- 所有 `preferred_skills` 均能在 `skills/skill-index.yaml` 找到对应 `id`。
- 所有 `curated_primary_skills` 均能在 `skills/skill-index.yaml` 找到，且 `curation_tier=core`。
- `agent.web-design / agent.design-system / agent.diagram-design` 均配置了跨分类参考 fallback。
- `agent.comp-design` 已配置参考 fallback，并通过 `fallback_constraints` 约束触发条件。
- `agent.comp-design` 已配置 `fallback_guard`（触发条件、必需输入、固定免责声明与阻断规则）。
- 已启用 `intent_normalization`，并为 4 个 agent 配置 `synonym_group`。
- 已启用分级阈值：`web-design=1`，`design-system=2`，`diagram-design=2`，`comp-design=2`。
- `agent.web-design` 已配置固定复刻链路（6 skill）与页面批次门禁（2-4 页）。
- 所有 skill 均已声明 `execution_mode`，并对非主干能力标记 `reference-only` 或 `guarded`。
- 所有 agent 均已声明 `default_execution_mode` 与 `execution_chain`。

## Replication Workflow Checks
- `W1`: fixed skill chain order must equal: `interface-core -> layout-hierarchy -> state-spec -> responsive-qa -> component-ruleset -> a11y-light-audit`.
- `W2`: page batch size must stay in `[2,4]`.
- `W3`: next batch must be blocked until all per-batch gates pass.
- `W4`: anti-ai-look hard rules must be active in replication policy.
- `W5`: authorization boundary must explicitly block unauthorized assets and restricted code copying.
- `W6`: required replication deliverables must be configured and non-empty for each batch.

## Open Risks
- `agent.comp-design` 的 reference fallback 仍是跨域兜底，需持续监控误命中。
- 同义词表已启用，但多语言别名仍需按真实查询持续扩充。
- `animation` 当前主要由 `web.state-spec` 与 diagram execution chain 承接，后续若增加独立动效 skill，需补专门回归用例。
