# claudesign

`claudesign` packages the current design skill catalog, routing contracts, and validation tooling into a portable multi-platform execution bundle.

## Quick Start / 快速开始

Install with `npx` after publishing to npm:

发布到 npm 后，可直接通过 `npx` 安装：

```bash
npx claudesign-plugin install
```

List available adapters / 查看可用适配目标:

```bash
npx claudesign-plugin list
```

Install a specific adapter / 安装指定适配版本:

```bash
npx claudesign-plugin install --adapter claude
npx claudesign-plugin install --adapter openai --target ~/.claudesign/plugins/openai
```

Detailed guides / 详细说明:

- [English Usage Guide](docs/usage.en.md)
- [中文使用说明](docs/usage.zh-CN.md)

## Platform Support / 平台支持

- `generic`: neutral adapter bundle for custom runtimes
- `claude`: adapter bundle for Claude-oriented hosts
- `openai`: adapter bundle for OpenAI-oriented hosts
- `codex`: supported through `.codex-plugin/plugin.json` plus the same shared contracts

## Core Contracts
- `skills/skill-index.yaml` is the canonical skill directory.
- `agents/router-map.yaml` is the source of truth for routing.
- The curated categories remain available: `web-ui`, `visual-style`, `design-system`, `ux-adjacent`, `diagram-flow`, `computational-design`.
- The routing model includes `agent.visual-style`, `agent.web-design`, `agent.design-system`, `agent.diagram-design`, and `agent.comp-design`.
- Intent normalization, keyword thresholds, fallback order, and computational guards are validated as part of the repository.

## Execution Model
- Each skill exposes `execution_mode` and `execution_bridge_status`.
- Each agent exposes `default_execution_mode` and `execution_chain`.
- Capabilities that do not cleanly map to the main execution path are explicitly marked `reference-only` or `guarded`.

## Packaging
- Core contract manifest: `core/manifest.yaml`
- Adapter metadata: `adapters/generic/adapter.yaml`, `adapters/claude/adapter.yaml`, `adapters/openai/adapter.yaml`
- List available targets with `sh install.sh --list`
- Build a portable bundle with `sh install.sh generic`, `sh install.sh claude`, or `sh install.sh openai`
- Override the output directory with `sh install.sh <target> <output_dir>`
- Portable bundles now include skill assets under `skills/*/SKILL.md` (plus `DESIGN.md` when present), not just metadata indexes.
- The npm entrypoint is `bin/claudesign-plugin.mjs`, exposed as `claudesign-plugin` for `npx`.

## Validation
- Run `ruby scripts/validate_router.rb` to verify routing structure, rejection thresholds, guarded computational cases, and execution mode mappings.
- Run `node ./scripts/designmd.mjs lint ./skills/visual-style/DESIGN.md` to validate bundled `DESIGN.md` artifacts when `@google/design.md` is installed or reachable through `npx`.
- Run `node ./scripts/designmd.mjs diff ./docs/designmd-examples/taste-stitch-base.DESIGN.md ./docs/designmd-examples/taste-stitch-variant.DESIGN.md` to compare stitch-oriented revisions.
- Run `node ./scripts/designmd.mjs export --format tailwind ./skills/visual-style/DESIGN.md` to export design tokens for downstream implementation use.
- Run `npx claudesign-plugin designmd spec --rules` to access the same wrapper through the package CLI.
- Run `make validate-router` as the local shorthand.
- Run `make designmd-lint`, `make designmd-diff-sample`, or `make designmd-export-tailwind` for local DESIGN.md workflows.
- Machine-readable cases live in `agents/router-validation-cases.yaml`.
- GitHub Actions entrypoint lives at `.github/workflows/router-validation.yml`.

## Branding And Authorization
- Public project name: `claudesign`.
- Use remains subject to the applicable upstream terms collected in [LICENSE.md](LICENSE.md).

See [docs/derived-integration-note.md](docs/derived-integration-note.md), [docs/prompt-mapping-samples.md](docs/prompt-mapping-samples.md), and [LICENSE.md](LICENSE.md).
