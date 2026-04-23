---
version: alpha
name: Taste Stitch Base
description: Baseline stitch-oriented design spec sample for claudesign medium integration tests.
colors:
  primary: "#1F2933"
  secondary: "#52606D"
  tertiary: "#C24D2C"
  surface: "#FFFDF8"
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
rounded:
  sm: 6px
spacing:
  md: 16px
components:
  button-primary:
    backgroundColor: "{colors.tertiary}"
    textColor: "{colors.on-primary}"
    rounded: "{rounded.sm}"
    padding: 12px
---

## Overview

Editorial premium UI with one warm accent and restrained density.

## Colors

Use `tertiary` as the only interaction-driving accent and keep surfaces warm.

## Typography

Headlines should feel assertive; body copy should stay calm and readable.

## Layout

Preserve asymmetric hierarchy on desktop, then collapse to one column on mobile.

## Components

Primary buttons should feel compact, warm, and high-contrast.

## Do's and Don'ts

Do keep whitespace intentional.
Don't duplicate equal-weight marketing cards by default.
