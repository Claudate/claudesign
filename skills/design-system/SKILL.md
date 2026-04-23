---
name: design-system
description: Define reusable visual language, token contracts, and component rules to keep product interfaces consistent across surfaces.
---

# Design System Skill

## Purpose
Define and maintain a reusable visual language and component ruleset for consistent product design.

## Skill Pack

### 1) `token-audit`
#### Inputs
- Existing UI snapshots or component references
- Brand direction and tone
- Platform constraints

#### Workflow
1. Inventory current color, type, spacing, radius, and motion tokens.
2. Identify collisions, duplicates, and ambiguous token naming.
3. Propose normalized token set and deprecation list.
4. Return migration-safe token recommendations.

#### Output Contract
- Token inventory and gap report
- Normalized token proposal
- Deprecation and migration notes

### 2) `component-ruleset`
#### Inputs
- Core component list
- Component variants and state requirements
- Product-level UI constraints

#### Workflow
1. Define base anatomy for each core component.
2. Normalize component states and variant boundaries.
3. Add usage rules, anti-patterns, and CSS architecture layering constraints.
4. Return a practical component convention draft for design+dev alignment.

#### Output Contract
- Component anatomy and state rules
- Variant strategy and usage boundaries
- Anti-pattern list for implementation review
- CSS architecture ruleset (token/base/component/utility layering)

### 3) `visual-drift-review`
#### Inputs
- Existing screens across product surfaces
- Reference system rules (token and component level)
- Priority product flows

#### Workflow
1. Compare actual UI usage against system rules.
2. Tag drift by severity and user impact.
3. Recommend fix order by reuse and risk.
4. Return system repair plan for next iteration.

#### Output Contract
- Drift findings by severity
- Priority-ordered fix list
- Recommended system updates

## Shared In Scope
- Visual language, tokens, and component standards
- Design consistency and reuse strategy
- System-level design decisions

## Shared Out of Scope
- Full engineering implementation details
- Infrastructure or deployment tasks

## Source Mapping
- Source repo: https://github.com/dominikmartn/nothing-design-skill
- Source repo: https://github.com/rohitg00/awesome-claude-design
- Retention mode: keep
- Last reviewed: 2026-04-21
