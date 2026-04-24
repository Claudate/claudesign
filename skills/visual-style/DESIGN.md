---
version: alpha
name: Claudesign Visual Style Baseline
description: Premium visual-style baseline for stitch-compatible DESIGN.md generation inside claudesign.
colors:
  primary: "#1F2933"
  secondary: "#52606D"
  tertiary: "#C24D2C"
  neutral: "#F7F5F0"
  surface: "#FFFDF8"
  border: "#D9D2C3"
  on-primary: "#FFFFFF"
typography:
  h1:
    fontFamily: "Space Grotesk"
    fontSize: 3rem
    fontWeight: 600
    lineHeight: 1.05
  body-md:
    fontFamily: "Manrope"
    fontSize: 1rem
    fontWeight: 400
    lineHeight: 1.6
  label-sm:
    fontFamily: "Space Grotesk"
    fontSize: 0.75rem
    fontWeight: 500
    letterSpacing: 0.08em
rounded:
  sm: 6px
  md: 12px
spacing:
  sm: 8px
  md: 16px
  lg: 32px
components:
  button-primary:
    backgroundColor: "{colors.tertiary}"
    textColor: "{colors.on-primary}"
    typography: "{typography.label-sm}"
    rounded: "{rounded.sm}"
    padding: 12px
  panel-default:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.primary}"
    rounded: "{rounded.md}"
    padding: 16px
---

## Overview

A premium, high-contrast but non-neon interface language with clear hierarchy, controlled visual experimentation, and strong anti-slop guardrails.

Execution posture should remain role-adaptive:

- treat the user as product owner and final decision-maker
- adapt to motion/UX/deck/system tasks with matching designer specialization
- keep decisions aligned with user goals and delivery constraints

## Colors

The palette should stay grounded in dark editorial neutrals with one warm accent.

- `primary` is the default text and structural anchor.
- `tertiary` is the main interaction accent and should not be replaced with purple-neon hues.
- `surface` and `neutral` should keep the interface warm instead of stark white.
- When extending the palette, use OKLCH to keep lightness and chroma consistent across hues.
- Avoid HSL-only expansion when it causes uneven perceived brightness.

## Typography

Typography should feel intentional and contemporary rather than system-default.

- Use distinctive sans families for interface work.
- Preserve readable body copy at around `65ch`.
- Keep labels compact and suitable for controls and metadata.
- Maintain clear contrast between heading/body/caption scale and weight.
- Avoid over-decorative type pairings that reduce readability.

## Layout

Use grid-first composition for complex layouts and preserve asymmetry on desktop when it adds hierarchy.

- Avoid repetitive three-card marketing rhythms unless they are explicitly requested.
- Collapse asymmetry to a single clear column on mobile.
- Keep whitespace purposeful so dense interfaces still breathe.
- Keep content density controlled; do not fill every section with equal visual weight.

## Components

Components should encode the same anti-generic constraints as the skill output.

- Buttons should use the warm accent, compact label typography, and small-radius corners.
- Panels should prefer warm light surfaces, generous padding, and strong text contrast.
- Interactive components must define loading, empty, error, focus, and active states.

## Workflow Expectations

Follow a six-step sequence for design execution quality:

1. Understand request and constraints.
2. Explore references and reusable patterns.
3. Plan structure and style decisions.
4. Build layout, components, and state behavior.
5. Validate visual quality and factual correctness.
6. Summarize only key notes and next action.

If requirements are unclear and risk is high, ask focused questions first.
If urgency is high and requirements are sufficient, proceed and state assumptions after execution.

## Do's and Don'ts

Do preserve clear state coverage, visual hierarchy, and premium restraint.
Do run a self-check for likely content or UI logic errors before finalizing.
Do challenge at least one likely assumption during validation to reduce confirmation bias.

Don't ship placeholder truncation output such as `...`, `TODO`, or `rest of code`.
Don't clone generic hero patterns or spam equal-weight cards.
Don't omit loading, empty, error, focus, or active states in interactive UI.
