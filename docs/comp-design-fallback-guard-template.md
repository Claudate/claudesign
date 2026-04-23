# Computational Design Fallback Guard Template

> 日期：2026-04-21  
> 适用对象：`agent.comp-design`

## Trigger Conditions
仅在以下条件全部满足时启用 fallback：
1. 无法命中任何 `computational-design` 可执行 skill。
2. 用户请求仍属于计算设计语义域（气候/日照/荷载/可持续/规范）。
3. 当前输入不足以输出可靠计算结论。

## Required Input Checklist
- `location_or_climate_zone`
- `geometry_or_massing_assumptions`
- `target_performance_goal`

## Intent-Specific Input Hints
- `climate-analysis`:
  - `location_or_climate_zone`
  - `seasonal_priority`
  - `envelope_assumptions`
- `site-solar-analysis`:
  - `site_orientation`
  - `massing_assumptions`
  - `daylight_or_solar_goal`
- `building-load-calculations`:
  - `occupancy_program_assumptions`
  - `envelope_assumptions`
  - `operation_schedule_assumptions`

## Response Contract
### Required Header
`[Reference Mode]`

### Required Disclaimer
`This is reference-only guidance, not a computational result.`

### Output Rules
1. 先列缺失输入，再给可参考方向。
2. 缺失关键输入时，不给最终定量建议。
3. 必须提示用户补充输入后可切回计算技能。

## Suggested Reply Skeleton
```text
[Reference Mode]
This is reference-only guidance, not a computational result.

Missing Inputs:
- ...
- ...

What You Can Do Now:
1. ...
2. ...

Next Step:
Provide the missing inputs above and I will run a computational-design skill path.
```
