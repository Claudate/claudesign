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

## Package Contents

Each installed bundle includes:

- Skills
- Router contracts
- Validation cases
- Validation script
- README and selected docs
- One adapter-specific metadata file
