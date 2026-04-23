# Prompt Mapping Samples

> 日期：2026-04-23  
> 目的：给当前执行工作流提供一组可直接复用的 prompt 到路由落点样例。

## Mapping Table
| sample_id | prompt | normalized_intent | expected_agent | expected_execution_mode | execution_chain_anchor |
|---|---|---|---|---|---|
| `P1` | `给我一个 SaaS 登录页原型结构，先梳理区块层级和 CTA` | `interface layout + prototype` | `agent.web-design` | `prototype` | `agents/router-map.yaml -> agent.web-design.execution_chain` |
| `P2` | `把首页做成高保真 HTML 设计稿，要求能直接进入前端实现` | `web ui + html-design` | `agent.web-design` | `html-design` | `agents/router-map.yaml -> agent.web-design.execution_chain` |
| `P3` | `补齐 hover、focus、loading、empty state 的状态过渡` | `component state + animation` | `agent.web-design` | `animation` | `agents/router-map.yaml -> agent.web-design.execution_chain` |
| `P4` | `审查这套设计系统的 token、组件规则和一致性漂移` | `design system + token + consistency` | `agent.design-system` | `critique` | `agents/router-map.yaml -> agent.design-system.execution_chain` |
| `P5` | `把 onboarding 审批链路整理成汇报用流程页和决策树` | `flowchart + decision tree` | `agent.diagram-design` | `slides` | `agents/router-map.yaml -> agent.diagram-design.execution_chain` |
| `P6` | `把现有流程图的异常分支补齐，并说明每个分支的转移条件` | `decision tree + critique` | `agent.diagram-design` | `slides` | `agents/router-map.yaml -> agent.diagram-design.execution_chain` |
| `P7` | `基于场地朝向、气候条件和性能目标做概念阶段分析` | `solar analysis + climate analysis` | `agent.comp-design` | `analysis` | `agents/router-map.yaml -> agent.comp-design.execution_chain` |
| `P8` | `我想做计算设计，但暂时没有地点、体量和目标参数` | `computational design + guarded fallback` | `agent.comp-design` | `analysis` | `agents/router-map.yaml -> agent.comp-design.fallback_guard` |
| `P9` | `这个项目按 image-first 执行：先出图，再分析，再落地前端` | `image-first + visual style` | `agent.visual-style` | `image-first` | `agents/router-map.yaml -> agent.visual-style.execution_chain` |
| `P10` | `把现有首页做 redesign，保持技术栈不变` | `redesign + visual style` | `agent.visual-style` | `style-redesign` | `agents/router-map.yaml -> agent.visual-style.execution_chain` |

## Notes
- `prototype` 适合页面结构、区块层级、线框和初步布局提案。
- `html-design` 适合高保真页面、组件规范和实现导向的视觉稿。
- `animation` 适合状态过渡、交互动效与状态矩阵延展。
- `critique` 适合 token 审核、一致性诊断、响应式问题和可访问性检查。
- `slides` 适合流程图、决策树、汇报型结构页和故事化编排。
- `analysis` 适合定量或准定量分析，但在 computational 场景下仍受 guard 约束。

## Guard Reminder
- 当 `agent.comp-design` 缺失关键输入时，输出必须转入 reference-style guard path。
- 不得把 reference-style guidance 表述为已完成的计算结果。
- 不得绕过 `location_or_climate_zone`、`geometry_or_massing_assumptions`、`target_performance_goal` 的输入要求。
