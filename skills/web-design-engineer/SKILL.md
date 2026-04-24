---
name: web-design-engineer
description: Optional anti-cliche web design execution mode. Use when the user wants sharper visual taste for website implementation while keeping the existing DESIGN.md-first workflow intact.
---

# Web Design Engineer Skill

## Purpose
Provide an optional style-intent layer for web implementation requests that need stronger visual differentiation and fewer generic AI patterns.

This skill does not replace the default `claudesign` workflow. It should be composed with:
- `Generate DESIGN.md`
- `lint`
- `Build Website from DESIGN.md`

## Activation
Use this skill when prompts include:
- anti-cliche, anti-generic, premium web style intent
- explicit request to avoid common AI aesthetic defaults
- rapid v0 mockup followed by production-ready implementation

## Core Rules

### 1) Design System Before Code
- Declare color, typography, spacing, radius, and interaction baseline first.
- Avoid coding page sections before baseline tokens are stated.
- Keep type, spacing, and contrast decisions consistent across sections.

### 2) Anti-Cliche Guardrails
- Avoid default purple gradient + glassmorphism combinations unless explicitly requested.
- Avoid default system font stacks for expressive brand surfaces.
- Avoid repetitive equal-weight card grids and interchangeable hero layouts.
- Keep hierarchy intentional through contrast, spacing, and motion rhythm.

### 3) v0 to Final Delivery
- Start with structure-first v0 (layout and information hierarchy).
- Upgrade to full implementation with states (`loading`, `empty`, `error`, `focus`, `active`).
- Confirm responsive behavior at mobile/tablet/desktop breakpoints before closure.

### 4) Practical Color and Type Discipline
- Prefer OKLCH-aware palette balancing for predictable perceptual contrast.
- Keep body copy readable and maintain heading/body scale separation.
- Use color accents intentionally, not as decorative noise.

## Integration Contract with DESIGN.md
- Primary path remains `DESIGN.md` as source of truth.
- This skill contributes style decisions that can be serialized into `DESIGN.md`.
- If style guidance conflicts with existing `DESIGN.md`, prioritize `DESIGN.md` and report the mismatch.

See bridge mapping:
- `docs/web-design-engineer-designmd-bridge.md`

## Output Contract
When this skill is active, expected output includes:
1. Style baseline summary (tokens + anti-cliche constraints)
2. v0 structural draft summary
3. final implementation summary with state coverage
4. responsive check summary
5. DESIGN.md bridge notes (if requested)

## In Scope
- website and landing-page visual quality uplift
- anti-generic style direction and implementation constraints
- composable usage with existing web and visual-style skills

## Out of Scope
- backend implementation
- deployment, infra, or API wiring
- replacing core `claudesign` contracts

## Source Mapping
- Source repo: https://github.com/ConardLi/web-design-skill
- Integration mode: optional support skill
- Last reviewed: 2026-04-24
