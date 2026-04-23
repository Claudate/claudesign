# Claudesign Usage Guide

## One-Sentence Version

`claudesign` works best when you ask AI to generate a first `DESIGN.md`, refine it manually, validate it, and then use it as the design spec for development.

If you are new to this repo, that is the only workflow you need to understand first.

## Recommended Beginner Flow

### Step 1. Look at the format first

See what a valid `DESIGN.md` looks like:

```bash
npx claudesign-plugin designmd spec --rules
sed -n '1,220p' ./skills/visual-style/DESIGN.md
```

You do not need to understand every detail immediately. Just notice that it usually includes:

- colors
- typography
- spacing
- rounded values
- component tokens
- layout and visual rules
- do / don't constraints

### Step 2. Ask AI to generate the first draft

Give AI enough context to produce a first-pass `DESIGN.md`.

At minimum, provide:

- product type
- target users
- brand keywords
- reference products or visual references
- required pages
- desired tone, such as premium, minimal, editorial, or technical

### Step 3. Refine it manually

The first AI draft is usually only a starting point. Review it for:

- brand-appropriate colors
- clear typography hierarchy
- complete spacing and radius tokens
- practical component rules
- state coverage and edge cases
- explicit do / don't guidance

### Step 4. Validate the file

```bash
node ./scripts/designmd.mjs lint ./your.DESIGN.md
```

Once it passes validation, it is more ready for downstream use.

### Step 5. Use it during development

Treat the validated `DESIGN.md` as the design source of truth for:

- AI coding agents
- frontend engineers
- design-system maintainers

It is not a replacement for visual design files. It is a more stable design contract for implementation.

### Step 6. Compare revisions when the design changes

```bash
node ./scripts/designmd.mjs diff ./old.DESIGN.md ./new.DESIGN.md
```

### Step 7. Export tokens for implementation

```bash
node ./scripts/designmd.mjs export --format tailwind ./your.DESIGN.md
node ./scripts/designmd.mjs export --format dtcg ./your.DESIGN.md
```

## Prompt Template You Can Give To AI

If you want AI to generate the first version for you, you can copy this prompt:

```text
Generate a structured DESIGN.md for the following project.

Project type:
Target users:
Brand keywords:
Reference products / visual references:
Main pages:
Core components:
Mobile support needed:
Styles to avoid:

Please include at least:
1. Basic metadata (name / description)
2. colors
3. typography
4. spacing / rounded
5. components
6. layout guidance
7. interaction states
8. do / don't

Requirements:
- Be specific rather than generic
- Use clear token names
- Do not rely on vague marketing adjectives
- Make component rules implementable
- Explicitly call out visual patterns that should be avoided
```

## Common Commands

### Install

```bash
npx claudesign-plugin install
```

Default install location:

```text
~/.claudesign/plugins/generic
```

### List supported adapters

```bash
npx claudesign-plugin list
```

### Print the `DESIGN.md` rules

```bash
npx claudesign-plugin designmd spec --rules
```

### Validate a design spec

```bash
node ./scripts/designmd.mjs lint ./your.DESIGN.md
```

### Compare two revisions

```bash
node ./scripts/designmd.mjs diff ./old.DESIGN.md ./new.DESIGN.md
```

### Export tokens

```bash
node ./scripts/designmd.mjs export --format tailwind ./your.DESIGN.md
node ./scripts/designmd.mjs export --format dtcg ./your.DESIGN.md
```

## If You Only Want A Quick Trial

Run these three commands:

```bash
npx claudesign-plugin designmd spec --rules
sed -n '1,220p' ./skills/visual-style/DESIGN.md
node ./scripts/designmd.mjs lint ./skills/visual-style/DESIGN.md
```

That is enough to understand:

- what the format looks like
- what the bundled sample looks like
- how validation works

## Best Files To Read First

- `skills/visual-style/DESIGN.md`
- `docs/designmd-workflows.md`
- `docs/designmd-examples/taste-stitch-base.DESIGN.md`
- `docs/designmd-examples/taste-stitch-variant.DESIGN.md`

## Who This Is Good For

This workflow is especially useful if you:

- want AI help drafting design rules
- want more stable frontend implementation
- are building a design system or brand baseline
- want revision history for design decisions

## What This Is Not

This is not:

- a drawing tool
- a high-fidelity mockup replacement
- a Figma replacement

It is better understood as a bridge between design intent and implementation.

## Platform Support

- `generic`: for custom or internal agent runtimes
- `claude`: for Claude-oriented hosts
- `openai`: for OpenAI-oriented hosts
- `codex`: supported through the plugin manifest and the same shared contracts

## Maintainer Notes

If you are maintaining the repo instead of just using it, start with:

- `skills/skill-index.yaml`
- `agents/router-map.yaml`
- `core/manifest.yaml`
- `scripts/designmd.mjs`
- `scripts/validate_router.rb`

## Important Note

The wrapper prefers a local or globally installed `designmd` binary and falls back to `npx @google/design.md` if needed.

As of 2026-04-23, the upstream Google Labs `DESIGN.md` format is still marked `alpha`, so it is best treated as practical and usable today, but still subject to change.
