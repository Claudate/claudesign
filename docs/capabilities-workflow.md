# Dual-Capability Workflow

> Date: 2026-04-24  
> Scope: public entrypoints for DESIGN.md generation and website implementation

`claudesign` exposes two public capabilities:

1. `Generate DESIGN.md`
2. `Build Website from DESIGN.md`

## Command Entry

```bash
npx claudesign-plugin capability list
npx claudesign-plugin capability spec-template
npx claudesign-plugin capability web-template
npx claudesign-plugin capability contract
```

## Capability A: Generate DESIGN.md

Goal:
- produce a structured, implementable design spec

Required behavior:
- dynamic role switching by task context
- six-step workflow execution
- OKLCH-oriented color extension
- validation closure with explicit risk/assumption note

Validation:

```bash
node ./scripts/designmd.mjs lint ./your.DESIGN.md
```

## Capability B: Build Website from DESIGN.md

Goal:
- produce complete runnable website code from the validated spec

Required behavior:
- treat `DESIGN.md` as source of truth
- include responsive behavior and interaction state coverage
- return complete code (no placeholders)

## Bridge Contract

Hand-off requirements from A to B:

1. `DESIGN.md` passes lint.
2. required pages and components are explicit in the spec.
3. interaction states are defined.
4. do/don't constraints are explicit.
5. implementation output maps UI decisions to the spec.
