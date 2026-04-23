# claudesign Skills Catalog

This directory stores the `claudesign` design skill catalog and its portable execution metadata.

## Integration Status
- `skills/skill-index.yaml` remains the canonical skill catalog.
- Each skill carries `execution_mode` + `execution_bridge_status` so runtime hosts can resolve execution behavior without renaming skill IDs.
- Applicable use and upstream terms are summarized in `LICENSE.md`.

## Structure
- `skill-index.yaml`: canonical index for all curated skills.
- `_templates/SKILL.template.md`: template for creating or normalizing a skill file.
- `web-ui/`: web and UI design skills.
- `visual-style/`: taste-style art direction, image-first, redesign, and output enforcement skills.
- `design-system/`: visual language and design system skills.
- `ux-adjacent/`: UX research, accessibility, responsive, IA.
- `diagram-flow/`: flowchart and diagram design skills.
- `computational-design/`: computational design skills (the designated upstream source pack is retained in full).

## Current Policy
- Strategy: design-first curation with traceable source mapping.
- Exception: keep the designated computational-design source pack in full.
- Mixed repos: keep design/UX content, clean non-design engineering content.

## Metadata Requirements
Every skill in `skill-index.yaml` must include:
- `id`
- `name`
- `category`
- `source_repo`
- `retention_mode`
- `status`
- `execution_mode`
- `execution_bridge_status`
- optional visual-style fields:
  - `style_profile`
  - `dial_defaults`
  - `workflow_policy`
- `agent_entrypoints`
- `last_reviewed`
- `in_scope`
- `out_of_scope`
