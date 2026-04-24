# Web Design Engineer -> DESIGN.md Bridge

> Date: 2026-04-24
> Scope: optional style-layer bridge for `web.web-design-engineer`

## Goal

Map the `web-design-engineer` core rules into the existing `DESIGN.md` pipeline without changing the default repository workflow.

Default workflow remains:

1. Generate `DESIGN.md`
2. Run `lint`
3. Build Website from `DESIGN.md`

The bridge only enriches style quality and anti-cliche constraints.

## Rule Mapping Table

| web-design-engineer rule | DESIGN.md target | Mapping method |
|---|---|---|
| design system before code | frontmatter `colors` / `typography` / `spacing` / `rounded` / `components` | fill all foundational tokens before section-level prose |
| anti-cliche guardrails | prose sections (`## Layout`, `## Components`, `## Do's and Don'ts`) | encode explicit bans (no default purple gradient, no repetitive card rhythm, no placeholder output) |
| v0 first, then final | `## Workflow Expectations` | add sequence: v0 structure -> state-complete implementation -> responsive closure |
| state completeness | `## Components` and quality notes | require `loading/empty/error/focus/active` states |
| practical color/type discipline | `## Colors` + `## Typography` | enforce contrast rationale and readable text scale |

## Recommended DESIGN.md Authoring Pattern

1. Frontmatter first:
- define token primitives (`colors`, `typography`, `spacing`, `rounded`)
- define component defaults in `components`

2. Constraints second:
- add anti-cliche constraints in `## Do's and Don'ts`
- add layout rhythm and hierarchy constraints in `## Layout`

3. Delivery sequence third:
- add v0 -> final execution sequence in `## Workflow Expectations`
- add responsive and state closure expectations

## Drop-in Constraint Snippets

Use these snippets when the style intent is anti-generic:

- "Avoid default purple-neon gradients unless explicitly requested by brand direction."
- "Avoid repetitive equal-weight card grids across all sections."
- "Interactive components must include loading, empty, error, focus, and active states."
- "Use OKLCH-informed color extension to preserve perceptual balance."

## Non-Goals

- No change to router default execution modes.
- No replacement of existing `taste.*` or `web.*` canonical chain.
- No deviation from `DESIGN.md` as primary contract artifact.
