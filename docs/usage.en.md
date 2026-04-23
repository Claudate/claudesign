# Claudesign Usage Guide

## Plain-English Version

If you want the short version:

- `claudesign` is a portable design skill bundle
- it now also supports `DESIGN.md`
- `DESIGN.md` gives you a design spec file that can be validated, diffed, and exported

So this repo is no longer only about "installing design skills." It now also supports "working with structured design spec files."

## What The New `DESIGN.md` Support Actually Does

Think of `DESIGN.md` as a design rules file that both agents and humans can understand.

The three most practical commands are:

1. `lint`
Check whether a design spec file is valid.

2. `diff`
Compare two design spec versions and see what changed.

3. `export`
Convert design tokens into downstream-friendly formats such as Tailwind or DTCG.

## Dumb-Simple Usage

### I just want to install it

```bash
npx claudesign-plugin install
```

By default this installs the `generic` bundle to:

```text
~/.claudesign/plugins/generic
```

### I just want to see the supported targets

```bash
npx claudesign-plugin list
```

### I just want to see what a `DESIGN.md` looks like

```bash
npx claudesign-plugin designmd spec --rules
```

### I just want to validate the sample in this repo

Run inside the repository:

```bash
node ./scripts/designmd.mjs lint ./skills/visual-style/DESIGN.md
```

### I just want to compare two design specs

```bash
node ./scripts/designmd.mjs diff \
  ./docs/designmd-examples/taste-stitch-base.DESIGN.md \
  ./docs/designmd-examples/taste-stitch-variant.DESIGN.md
```

### I just want something engineers can consume

```bash
node ./scripts/designmd.mjs export --format tailwind ./skills/visual-style/DESIGN.md
node ./scripts/designmd.mjs export --format dtcg ./skills/visual-style/DESIGN.md
```

## Common Install Paths

Install the Claude-oriented bundle:

```bash
npx claudesign-plugin install --adapter claude
```

Install the OpenAI-oriented bundle to a custom path:

```bash
npx claudesign-plugin install --adapter openai --target ~/.claudesign/plugins/openai
```

Use `--platform` as an alias for `--adapter`:

```bash
npx claudesign-plugin install --platform claude
```

## If You Are Developing In This Repo

List adapters:

```bash
node ./bin/claudesign-plugin.mjs list
```

Install a local test bundle:

```bash
node ./bin/claudesign-plugin.mjs install --adapter generic --target /tmp/claudesign-local
```

Run router validation before publishing:

```bash
ruby scripts/validate_router.rb
```

## Local Shortcuts

```bash
make validate-router
make designmd-lint
make designmd-diff-sample
make designmd-export-tailwind
make designmd-export-dtcg
```

## The Repo Already Explains `DESIGN.md`

You do not need to guess how this works. The repo already includes:

- baseline sample: `skills/visual-style/DESIGN.md`
- diff fixtures: `docs/designmd-examples/taste-stitch-base.DESIGN.md`
- workflow guide: `docs/designmd-workflows.md`

If this is your first time using it, read things in this order:

1. `npx claudesign-plugin designmd spec --rules`
2. `skills/visual-style/DESIGN.md`
3. `docs/designmd-workflows.md`
4. the `diff` and `export` commands

## Package Contents

Each installed bundle includes:

- skills
- router contracts
- validation cases
- validation scripts
- the `DESIGN.md` helper wrapper
- built-in `DESIGN.md` diff fixtures
- README and selected docs
- one adapter-specific metadata file

## Platform Support

- `generic`: neutral bundle for custom or internal agent runtimes
- `claude`: adapter bundle for Claude-oriented hosts
- `openai`: adapter bundle for OpenAI-oriented hosts
- `codex`: supported through the repository plugin manifest plus the same shared contracts

## Maintainer Notes

If you are maintaining the repo rather than just using it, these are the important files:

- `skills/skill-index.yaml`: canonical skill directory
- `agents/router-map.yaml`: routing source of truth
- `core/manifest.yaml`: package contract manifest
- `scripts/designmd.mjs`: wrapper around Google Labs `@google/design.md`
- `scripts/validate_router.rb`: router and doc-structure validation entrypoint

## Important Note

The wrapper prefers a local or global `designmd` binary and falls back to `npx @google/design.md` if none is available.

As of 2026-04-23, the upstream Google Labs `DESIGN.md` format is still marked `alpha`. In practice that means this integration is usable today, but the upstream spec may still change.
