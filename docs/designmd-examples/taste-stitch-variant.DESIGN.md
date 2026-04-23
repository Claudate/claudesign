---
version: alpha
name: Taste Stitch Variant
description: Variant stitch-oriented design spec sample for diff/export examples.
colors:
  primary: "#18212A"
  secondary: "#61707F"
  tertiary: "#A63F24"
  accent: "#E5B66B"
  surface: "#FCF8F1"
  on-primary: "#FFFFFF"
typography:
  h1:
    fontFamily: "Space Grotesk"
    fontSize: 3.25rem
    fontWeight: 600
    lineHeight: 1
  body-md:
    fontFamily: "Manrope"
    fontSize: 1rem
    fontWeight: 400
    lineHeight: 1.65
rounded:
  sm: 6px
  md: 14px
spacing:
  md: 16px
  lg: 32px
components:
  button-primary:
    backgroundColor: "{colors.tertiary}"
    textColor: "{colors.on-primary}"
    rounded: "{rounded.sm}"
    padding: 12px
  panel-highlight:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.primary}"
    rounded: "{rounded.md}"
    padding: 16px
---

## Overview

Editorial premium UI with a warmer canvas, stronger typographic hierarchy, and a secondary accent for highlight moments only.

## Colors

Use `tertiary` for primary actions and reserve `accent` for emphasis rather than core controls.

## Typography

Headlines should feel slightly more dramatic than the base version while body copy remains stable.

## Layout

Keep asymmetric desktop composition, but allow larger gutters and calmer section pacing.

## Components

Highlight panels may use the lighter surface token and larger radius to separate editorial callouts.

## Do's and Don'ts

Do make hierarchy feel deliberate and premium.
Don't introduce neon accent colors or placeholder-only output.
