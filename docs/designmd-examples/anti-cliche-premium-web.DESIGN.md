---
version: alpha
name: Anti Cliche Premium Web Sample
description: Anti-cliche premium web sample for lint, diff, and export workflows.
colors:
  primary: "#111827"
  secondary: "#334155"
  tertiary: "#C86A35"
  accent: "#0E7490"
  surface: "#F8F5EF"
  on-primary: "#FFFFFF"
typography:
  h1:
    fontFamily: "Sora"
    fontSize: 3.125rem
    fontWeight: 600
    lineHeight: 1.04
  body-md:
    fontFamily: "Manrope"
    fontSize: 1rem
    fontWeight: 400
    lineHeight: 1.68
rounded:
  sm: 6px
  md: 14px
spacing:
  sm: 8px
  md: 16px
  lg: 36px
components:
  button-primary:
    backgroundColor: "{colors.tertiary}"
    textColor: "{colors.on-primary}"
    rounded: "{rounded.sm}"
    padding: 12px
  feature-panel:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.primary}"
    rounded: "{rounded.md}"
    padding: 16px
---

## Overview

Premium but restrained web style with intentional hierarchy, asymmetric rhythm, and anti-generic constraints.

## Colors

Use `tertiary` for primary actions and reserve `accent` for sparse highlight moments.

Avoid default purple-neon gradients unless explicitly required by brand.

## Typography

Headlines should be confident and compact while body text remains easy to scan.

Avoid default system stacks on brand-facing surfaces.

## Layout

Preserve asymmetry in hero and mid-page sections to avoid template-like repetition.

Keep whitespace deliberate and avoid equal-weight card grids across every block.

## Components

Buttons and panels should preserve high contrast and calm density.

Interactive elements must include loading, empty, error, focus, and active states.

## Workflow Expectations

1. Draft v0 structure and content hierarchy first.
2. Expand to full state-complete implementation.
3. Verify responsive behavior on mobile, tablet, and desktop.

## Do's and Don'ts

Do keep contrast, spacing, and rhythm intentional.
Do keep component states complete before handoff.

Don't ship placeholder shortcuts such as TODO or rest-of-code markers.
Don't rely on repetitive interchangeable hero patterns.
