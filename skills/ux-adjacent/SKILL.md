---
name: ux-adjacent
description: Run lightweight UX quality checks including friction scans, accessibility quick audits, and flow clarity passes.
---

# UX Adjacent Skill

## Purpose
Improve usability quality through lightweight UX research signals, accessibility checks, and responsive validation.

## Skill Pack

### 1) `ux-friction-scan`
#### Inputs
- Current UI or prototype
- Primary user tasks
- Release constraints

#### Workflow
1. Map task path from entry to completion.
2. Identify friction points, ambiguity, and unnecessary steps.
3. Rate friction by task criticality and frequency.
4. Return prioritized UX issue list.

#### Output Contract
- Top UX issues by severity
- Task-level friction evidence
- Priority order for iteration

### 2) `a11y-light-audit`
#### Inputs
- Current screens or component snapshots
- Interaction states
- Accessibility baseline targets

#### Workflow
1. Run quick checks for contrast, focus visibility, and semantics.
2. Check error clarity, input labeling, and keyboard path basics.
3. Identify high-impact accessibility risks.
4. Return fix-ready accessibility guidance.

#### Output Contract
- Accessibility gaps and suggested fixes
- Risk level tags
- Recheck list for regression prevention

### 3) `flow-clarity-pass`
#### Inputs
- Critical user flow definition
- Information architecture snapshot
- Current copy and control labels

#### Workflow
1. Validate flow naming, action labels, and step expectations.
2. Find points where users may misinterpret next action.
3. Propose copy and layout clarity improvements.
4. Return clarity-first flow update recommendations.

#### Output Contract
- Flow clarity issues
- Label and copy improvement suggestions
- IA-level changes for reduced confusion

## Shared In Scope
- UX heuristics, usability feedback, accessibility, responsive guidance
- Information architecture recommendations

## Shared Out of Scope
- Full user-research operations management
- Engineering implementation and release pipeline work

## Source Mapping
- Source repo: https://github.com/nextlevelbuilder/ui-ux-pro-max-skill
- Source repo: https://github.com/mustafakendiguzel/claude-code-ui-agents (design/ux sections only)
- Retention mode: keep and partial
- Last reviewed: 2026-04-21
