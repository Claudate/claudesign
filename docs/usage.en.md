# Claudesign Usage Guide

## Overview

Claudesign is a portable multi-platform design-skill bundle with:

- A curated skill catalog in `skills/skill-index.yaml`
- A validated router contract in `agents/router-map.yaml`
- Host adapters for `generic`, `claude`, and `openai`
- Optional Codex plugin metadata in `.codex-plugin/plugin.json`
- A CLI installer that can be published and used through `npx`

## Install With `npx`

After this package is published to npm, users can install a bundle with:

```bash
npx claudesign-plugin install
```

By default, the command installs the `generic` bundle into:

```text
~/.claudesign/plugins/generic
```

## Common Commands

List supported adapters:

```bash
npx claudesign-plugin list
```

Install the Claude-oriented bundle:

```bash
npx claudesign-plugin install --adapter claude
```

Install the OpenAI-oriented bundle to a custom directory:

```bash
npx claudesign-plugin install --adapter openai --target ~/.claudesign/plugins/openai
```

Use `--platform` as an alias for `--adapter`:

```bash
npx claudesign-plugin install --platform claude
```

## Platform Support

- `generic`: neutral bundle for custom or internal agent runtimes
- `claude`: adapter bundle for Claude-oriented hosts
- `openai`: adapter bundle for OpenAI-oriented hosts
- `codex`: supported through the repository plugin manifest plus the same shared source contracts

## Local Development

Run the installer directly from the repository:

```bash
node ./bin/claudesign-plugin.mjs list
node ./bin/claudesign-plugin.mjs install --adapter generic --target /tmp/claudesign-local
```

Validate router contracts before publishing:

```bash
ruby scripts/validate_router.rb
```

Validate the bundled `DESIGN.md` sample with Google Labs' alpha CLI:

```bash
node ./scripts/designmd.mjs lint ./skills/visual-style/DESIGN.md
```

Export tokens for downstream consumers:

```bash
node ./scripts/designmd.mjs export --format tailwind ./skills/visual-style/DESIGN.md
node ./scripts/designmd.mjs export --format dtcg ./skills/visual-style/DESIGN.md
```

Run the included stitch diff sample:

```bash
node ./scripts/designmd.mjs diff \
  ./docs/designmd-examples/taste-stitch-base.DESIGN.md \
  ./docs/designmd-examples/taste-stitch-variant.DESIGN.md
```

The wrapper prefers a local or global `designmd` binary and falls back to `npx @google/design.md`. Upstream `DESIGN.md` is still marked alpha as of 2026-04-23.

If you are using the published package CLI, the same wrapper is exposed as:

```bash
npx claudesign-plugin designmd spec --rules
```

## Package Contents

Each installed bundle includes:

- Skills
- Router contracts
- Validation cases
- Validation scripts
- Optional `DESIGN.md` helper wrapper
- Example `DESIGN.md` diff fixtures
- README and selected docs
- One adapter-specific metadata file
