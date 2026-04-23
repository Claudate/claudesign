# claudesign

[English](README.md) | [简体中文](README.zh-CN.md)

`claudesign` is a portable design-skill bundle for AI hosts. It packages a curated design skill catalog, a validated routing contract, and a practical `DESIGN.md` workflow for structured design-spec validation, diffing, and export.

## What This Project Is

`claudesign` is the packaging and contract layer behind a multi-host design workflow.

It helps you:

- install a reusable design skill bundle
- route user requests into explicit design execution modes
- ship structured `DESIGN.md` artifacts that can be linted, diffed, and exported
- keep the same design contract across Claude, OpenAI, Codex, and internal runtimes

## What It Includes

- a canonical skill catalog in `skills/skill-index.yaml`
- a routing source of truth in `agents/router-map.yaml`
- host adapters for `generic`, `claude`, and `openai`
- a `DESIGN.md` wrapper in `scripts/designmd.mjs`
- built-in `DESIGN.md` examples and workflows for `taste.stitch`-style outputs

## Architecture At A Glance

The repository is intentionally split into a few clear layers:

- `skills/`: the design capabilities and skill assets
- `agents/`: routing rules, execution modes, and validation cases
- `adapters/`: host-specific packaging metadata
- `scripts/`: validation and `DESIGN.md` helper commands
- `docs/`: usage guides, examples, and contract notes

If you only want to understand the project quickly, the mental model is:

`skills` define what the bundle can do, `agents` decide how requests are routed, `adapters` package the bundle for each host, and `DESIGN.md` provides a structured output format for design-spec workflows.

## Quick Start

### Install the default bundle

```bash
npx claudesign-plugin install
```

By default this installs the `generic` bundle to `~/.claudesign/plugins/generic`.

### List available adapters

```bash
npx claudesign-plugin list
```

### Inspect the `DESIGN.md` rules

```bash
npx claudesign-plugin designmd spec --rules
```

This is the fastest way to see what a supported structured design spec looks like.

## The `DESIGN.md` Workflow

`DESIGN.md` is a structured design spec file for coding agents. In this repo it is used for three practical jobs:

- `lint`: validate the structure of a design spec
- `diff`: compare two design spec revisions
- `export`: convert tokens into downstream-friendly formats such as Tailwind or DTCG

### Validate the built-in sample

```bash
node ./scripts/designmd.mjs lint ./skills/visual-style/DESIGN.md
```

### Compare two included examples

```bash
node ./scripts/designmd.mjs diff \
  ./docs/designmd-examples/taste-stitch-base.DESIGN.md \
  ./docs/designmd-examples/taste-stitch-variant.DESIGN.md
```

### Export tokens for downstream use

```bash
node ./scripts/designmd.mjs export --format tailwind ./skills/visual-style/DESIGN.md
node ./scripts/designmd.mjs export --format dtcg ./skills/visual-style/DESIGN.md
```

## Platform Support

- `generic`: neutral adapter bundle for custom runtimes
- `claude`: adapter bundle for Claude-oriented hosts
- `openai`: adapter bundle for OpenAI-oriented hosts
- `codex`: supported through `.codex-plugin/plugin.json` plus the same shared contracts

## Local Shortcuts

```bash
make validate-router
make designmd-lint
make designmd-diff-sample
make designmd-export-tailwind
make designmd-export-dtcg
```

## Documentation

- [Chinese README](README.zh-CN.md)
- [English Usage Guide](docs/usage.en.md)
- [中文使用说明](docs/usage.zh-CN.md)
- [DESIGN.md Workflows](docs/designmd-workflows.md)
- [Execution Contract Notes](docs/derived-integration-note.md)

## Important Note

As of 2026-04-23, the upstream Google Labs `DESIGN.md` format is still marked `alpha`. `claudesign` supports it in an optional-but-practical way for structured design-spec workflows, but you should not treat the upstream format as permanently stable yet.
