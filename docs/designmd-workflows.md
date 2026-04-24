# DESIGN.md Workflows

> Date: 2026-04-23
> Scope: medium-depth `DESIGN.md` integration for `claudesign`

## Purpose

This repository now exposes `DESIGN.md` workflows as an optional-but-supported layer for `design-spec` outputs, especially `taste.stitch`.
It also supports an optional style enhancement bridge for `web.web-design-engineer` without changing the default workflow.

## Sample Files

- Base sample: `docs/designmd-examples/taste-stitch-base.DESIGN.md`
- Variant sample: `docs/designmd-examples/taste-stitch-variant.DESIGN.md`
- Anti-cliche sample: `docs/designmd-examples/anti-cliche-premium-web.DESIGN.md`
- Skill baseline: `skills/visual-style/DESIGN.md`
- Web design bridge: `docs/web-design-engineer-designmd-bridge.md`

## Local Commands

Validate the bundled baseline:

```bash
node ./scripts/designmd.mjs lint ./skills/visual-style/DESIGN.md
```

Compare the base and variant stitch samples:

```bash
node ./scripts/designmd.mjs diff \
  ./docs/designmd-examples/taste-stitch-base.DESIGN.md \
  ./docs/designmd-examples/taste-stitch-variant.DESIGN.md
```

Export the baseline to Tailwind:

```bash
node ./scripts/designmd.mjs export --format tailwind ./skills/visual-style/DESIGN.md
```

Export the baseline to DTCG:

```bash
node ./scripts/designmd.mjs export --format dtcg ./skills/visual-style/DESIGN.md
```

Run lint/diff/export on the anti-cliche sample:

```bash
node ./scripts/designmd.mjs lint ./docs/designmd-examples/anti-cliche-premium-web.DESIGN.md
node ./scripts/designmd.mjs diff ./docs/designmd-examples/taste-stitch-base.DESIGN.md ./docs/designmd-examples/anti-cliche-premium-web.DESIGN.md
node ./scripts/designmd.mjs export --format tailwind ./docs/designmd-examples/anti-cliche-premium-web.DESIGN.md
```

## Expected Medium-Integration Usage

1. Route a request into `agent.visual-style` with `design-spec`.
2. Emit a stitch-compatible `DESIGN.md` artifact.
3. Run `lint` before handing the artifact to downstream implementation.
4. Run `diff` when revising an existing design system.
5. Run `export` when a downstream runtime needs machine-readable tokens.

Optional bridge path for web anti-cliche style uplift:

1. Activate `web.web-design-engineer` for style intent and guardrails.
2. Serialize those constraints into `DESIGN.md` using the bridge mapping doc.
3. Keep `DESIGN.md` as source of truth and continue with `lint/diff/export`.

## Notes

- These workflows depend on Google Labs `@google/design.md`, which is still marked `alpha`.
- Repository validation only checks local structural presence and front matter for bundled `DESIGN.md` artifacts.
- Semantic lint findings, token diffs, and export shape remain the responsibility of the upstream CLI.
