# Execution Contract Notes

> Date: 2026-04-23
> Status: active repository contract
> Project: `claudesign`

## Purpose

This repository packages the curated skill catalog, router contracts, validation cases, and host adapters used by `claudesign`.

The goal of the current structure is to keep routing behavior explicit, packaging predictable, and validation reproducible across supported hosts.

## Source Of Truth

- `skills/skill-index.yaml`: canonical skill catalog and execution metadata
- `agents/router-map.yaml`: canonical routing model, synonym groups, fallback rules, and execution chains
- `agents/router-validation-cases.yaml`: machine-readable routing and guard cases
- `scripts/validate_router.rb`: validation entrypoint for local runs and CI
- `scripts/designmd.mjs`: optional wrapper around Google Labs `@google/design.md` for lint/diff/export/spec workflows
- `docs/designmd-examples/*.DESIGN.md`: sample stitch-oriented artifacts for diff and export demonstrations

## Execution Contract

### Skills
- Every executable or reference skill declares `execution_mode`.
- Every skill declares `execution_bridge_status`.
- Supported status values are `bridge-ready`, `reference-only`, and `guarded`.

### Agents
- Every agent declares `default_execution_mode`.
- Every agent declares an `execution_chain`.
- Supporting documentation is referenced at the tail of each execution chain for human review and handoff.

## Agent Routing Bridge

### `agent.visual-style` chain
- `intent_normalization`
- `agent.visual-style`
- `execution.image-first`
- `execution.style-redesign`
- `execution.design-spec`
- `docs/web-high-fidelity-replication-playbook.md`

### `agent.web-design` chain
- `intent_normalization`
- `agent.web-design`
- `execution.html-design`
- `execution.prototype`
- `execution.animation`
- `docs/web-high-fidelity-replication-playbook.md`

### `agent.design-system` chain
- `intent_normalization`
- `agent.design-system`
- `execution.critique`
- `execution.html-design`
- `execution.analysis`
- `docs/design-skill-canonical-map.md`

### `agent.diagram-design` chain
- `intent_normalization`
- `agent.diagram-design`
- `execution.slides`
- `execution.animation`
- `execution.critique`
- `docs/agent-router-validation-matrix.md`

### `agent.comp-design` chain
- `intent_normalization`
- `agent.comp-design`
- `execution.analysis`
- `docs/comp-design-fallback-guard-template.md`

Computational outputs remain guarded. Missing-input checks, reference-mode disclaimers, and recommendation blocking remain mandatory when critical inputs are absent.

## Packaging Notes

- `install.sh` builds portable directory bundles for `generic`, `claude`, and `openai`.
- Generated bundles are build artifacts and are not source-controlled in this repository.
- Bundles include the skill docs, router files, validation scripts, and selected top-level docs needed by downstream hosts.

## DESIGN.md Integration Notes

- `claudesign` remains the source of truth for routing, execution modes, and host adapters.
- `DESIGN.md` is an optional artifact and validation target for `design-spec` style outputs, especially `taste.stitch`.
- The repository includes example before/after stitch artifacts for local `diff` workflows and downstream smoke tests.
- The repository wrapper targets Google Labs `@google/design.md`, which remained marked `alpha` on 2026-04-23.
- Repository validation only enforces local structural presence for bundled `DESIGN.md` files; semantic linting is delegated to the upstream CLI when available.

## Documentation Policy

- Keep docs that are referenced by the router, adapters, validation flow, or bundle packaging.
- Remove temporary migration notes, generated output snapshots, and obsolete compatibility docs when they stop serving the current repository contract.
