# claudesign

`claudesign` packages the current design skill catalog, routing contracts, and validation tooling into a portable execution bundle.

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

## Validation
- Run `ruby scripts/validate_router.rb` to verify routing structure, rejection thresholds, guarded computational cases, and execution mode mappings.
- Run `make validate-router` as the local shorthand.
- Machine-readable cases live in `agents/router-validation-cases.yaml`.
- GitHub Actions entrypoint lives at `.github/workflows/router-validation.yml`.

## Branding And Authorization
- Public project name: `claudesign`.
- Use remains subject to the applicable upstream terms collected in [LICENSE.md](LICENSE.md).

See [docs/derived-integration-note.md](docs/derived-integration-note.md), [docs/prompt-mapping-samples.md](docs/prompt-mapping-samples.md), and [LICENSE.md](LICENSE.md).
