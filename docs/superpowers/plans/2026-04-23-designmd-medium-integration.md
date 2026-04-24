# DESIGN.md Medium Integration Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a medium-depth `DESIGN.md` integration layer that lets `claudesign` lint, diff, and export `DESIGN.md` artifacts without changing the existing router contract model.

**Architecture:** Keep `claudesign` as the routing and packaging source of truth, and add a small Node wrapper around `@google/design.md` for optional CLI-backed validation. Extend the existing repository validator so local and packaged bundles can verify that bundled `DESIGN.md` files are structurally present and expose stable commands for downstream hosts.

**Tech Stack:** Node.js, existing repo shell installer, Ruby router validator, Markdown/YAML docs

---

### Task 1: Add DESIGN.md command wrapper

**Files:**
- Create: `scripts/designmd.mjs`
- Modify: `package.json`
- Modify: `Makefile`

- [ ] **Step 1: Add a Node wrapper for `lint`, `diff`, `export`, and `spec`**
- [ ] **Step 2: Make the wrapper prefer a local `designmd` binary, then `npx @google/design.md`, with a clear fallback error**
- [ ] **Step 3: Expose repo scripts so contributors can run the wrapper consistently**

### Task 2: Extend repository validation and packaging

**Files:**
- Modify: `scripts/validate_router.rb`
- Modify: `core/manifest.yaml`
- Modify: `install.sh`
- Modify: `adapters/generic/adapter.yaml`
- Modify: `adapters/claude/adapter.yaml`
- Modify: `adapters/openai/adapter.yaml`

- [ ] **Step 1: Add a validator check that each bundled `DESIGN.md` has YAML front matter and a top-level `name`**
- [ ] **Step 2: Add contract metadata for the DESIGN.md command wrapper**
- [ ] **Step 3: Ensure portable bundles ship the new wrapper script**
- [ ] **Step 4: Surface a stable validation/designmd entrypoint in adapter metadata**

### Task 3: Improve the bundled DESIGN.md baseline and documentation

**Files:**
- Modify: `skills/visual-style/DESIGN.md`
- Modify: `README.md`
- Modify: `docs/usage.en.md`
- Modify: `docs/usage.zh-CN.md`
- Modify: `docs/derived-integration-note.md`

- [ ] **Step 1: Upgrade the sample `DESIGN.md` to align with the upstream alpha spec shape**
- [ ] **Step 2: Document local lint/diff/export commands**
- [ ] **Step 3: Explain that Google CLI integration is optional-but-supported and date-stamp the dependency**

### Task 4: Verify the integration

**Files:**
- Test: `scripts/validate_router.rb`
- Test: `scripts/designmd.mjs`
- Test: `install.sh`

- [ ] **Step 1: Run the router validator and confirm the new DESIGN.md checks pass**
- [ ] **Step 2: Run the wrapper `spec` command in no-install mode and confirm fallback behavior is helpful**
- [ ] **Step 3: Build a local bundle and verify the wrapper script is included**
