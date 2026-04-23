# Adapter Layer

This directory contains thin packaging adapters on top of the `claudesign` core contracts.

The package is intentionally multi-platform: Codex can consume the plugin manifest, while Claude-, OpenAI-, and generic-oriented hosts consume adapter bundles generated from the same source contracts.

## Design Rules
- Keep `skills/skill-index.yaml` and `agents/router-map.yaml` as the source of truth.
- Adapters may add installer metadata, packaging metadata, or platform-specific entrypoints.
- Adapters must not rename canonical skill IDs.
- Adapter logic must not bypass computational guards or authorization boundaries.

## Current Adapters
- `generic/`: neutral bundle metadata for any external agent platform.
- `claude/`: compatibility metadata for Claude-hosted installs.
- `openai/`: compatibility metadata for OpenAI-hosted installs.
