---
name: web-ui
description: Build web UI pages with layout hierarchy, interaction states, responsive QA, and strict high-fidelity replication mode. Use when implementing or replicating websites/pages, especially for one-to-one visual parity and animation parity requests.
---

# Web UI Design Skill

## Purpose
Produce implementable web UI with clear hierarchy, complete interaction behavior, and responsive reliability.

## Modes

### Standard Mode
Use for normal product UI implementation.

### High-Fidelity Replication Mode
Use when user asks for “复刻 / 一比一 / pixel-perfect / 像素级”.

Required execution order:
1. Capture source structure and assets (sections, icons, logos, images, fonts, key CSS)
2. Implement structure parity before enhancement
3. Implement interaction parity (hover/focus/active/accordion/carousel/marquee)
4. Run responsive parity checks (mobile/tablet/desktop)
5. Run final parity checklist and report gaps

If the user explicitly wants exact visual/functional parity and source allows embedding, prefer mirror strategy (iframe) as the default highest-fidelity path.

## Skill Pack

### 1) `layout-hierarchy`
#### Inputs
- Product goal and primary task
- Screen/page list
- Content and visual priority

#### Workflow
1. Define primary action and visual entry point.
2. Recreate section order and density.
3. Match spacing rhythm and container widths.
4. Deliver implementation-ready structure.

#### Output Contract
- Section blueprint with order and priorities
- Type scale and spacing rules
- Component grouping rules

### 2) `state-spec`
#### Inputs
- Core interactive components
- Trigger events (hover/focus/active/disabled/loading/error)
- Accessibility constraints

#### Workflow
1. Enumerate required states per component.
2. Define visual/behavior deltas.
3. Add keyboard/focus behavior.
4. Add motion details (duration/easing/delay).

#### Output Contract
- Component-state matrix
- State behavior notes
- Accessibility notes
- Motion notes

### 3) `responsive-qa`
#### Inputs
- Breakpoint strategy
- Key user journeys
- Current implementation

#### Workflow
1. Validate mobile/tablet/desktop behavior.
2. Identify overflow, truncation, misalignment, missing icons.
3. Prioritize by flow impact.
4. Return concrete fix list.

#### Output Contract
- Responsive issue list
- Breakpoint-specific fix guidance
- Recheck checklist
- Breakpoint behavior matrix

## High-Fidelity Parity Checklist (Mandatory in Replication Mode)
- All source icons/logos/images visible (no placeholder text substitution)
- Hero/background/CTA visuals match source assets
- Typography weight/size/line-height matches at major breakpoints
- Section order and content density match
- Core interactions work: nav buttons, accordion, carousel, marquee, CTA links
- Hover/focus/active states present for interactive controls
- No major layout overflow at 390px / 768px / 1440px
- Final report includes: done items, known gaps, and why

## Shared In Scope
- Structure, visual hierarchy, interaction behavior, responsive closure

## Shared Out of Scope
- Backend/APIs
- CI/CD and infra
- Non-product marketing operations

## Source Mapping
- Source repo: https://github.com/Dammyjay93/interface-design
- Retention mode: keep
- Last reviewed: 2026-04-21
