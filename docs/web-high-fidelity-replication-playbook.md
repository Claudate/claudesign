# Web High-Fidelity Replication Playbook

> Version: v1  
> Date: 2026-04-21  
> Strategy: quality-first + high-fidelity replication (no AI-look output)

## 1. Fixed Execution Chain
Entrypoint must be `agent.web-design`, and execution order is fixed:
1. `web.interface-design-core`
2. `web.layout-hierarchy`
3. `web.state-spec`
4. `web.responsive-qa`
5. `system.component-ruleset`
6. `ux.a11y-light-audit`

No skill additions are allowed in this workflow.

## 2. Batch Workflow (2-4 pages per batch)
Each batch must contain `2-4` pages and follow this order:
1. Structure replication (layout and hierarchy)
2. Interaction/state replication
3. Responsive and accessibility closure

A batch cannot proceed to the next batch until all gate checks pass.

## 3. Per-Batch Gate Checklist
- Structure: section order, hierarchy, information sequence aligned
- Visual: typography rhythm, spacing cadence, component detail aligned
- Interaction: key controls have full states (`hover/focus/active/disabled/loading/error`)
- Responsive: mobile/tablet/desktop no overflow or breakage
- Accessibility: visible focus, basic semantic correctness, readable key contrast
- Component consistency: same component families follow unified rules across pages

## 4. Per-Batch Required Deliverables
- `semantic_layout_blueprint`: page structure + semantic grouping + hierarchy annotations
- `component_state_matrix`: component states and behavior deltas (`hover/focus/active/disabled/loading/error`)
- `breakpoint_behavior_matrix`: mobile/tablet/desktop behavior matrix with known risks
- `css_architecture_ruleset`: token/base/component/utility layering and naming constraints
- `accessibility_issue_checklist`: focus, semantics, contrast, keyboard path findings
- `asset_replacement_map`: authorized replacements for non-reusable brand/media assets

## 5. Anti-AI-Look Hard Rules
- Do not use one-template hero repeatedly across pages.
- Do not use repetitive same-shape card rhythm without hierarchy changes.
- Keep realistic content density and intentional whitespace.
- Use meaningful visual anchors per page; avoid interchangeable sections.

## 6. Authorization Boundary
Allowed:
- High-fidelity visual and interaction replication

Not allowed:
- Unauthorized brand assets
- Copyright-protected text/media copying
- Restricted source code copying

## 7. Final Site Acceptance
Site is accepted only when:
- All page batches pass gate checks
- All required deliverables are produced for every batch
- Shared token/component rules are applied across the full site
- No obvious AI-template traces remain (layout repetition, weak hierarchy, generic section stacking)
