# claudesign

`claudesign` is a portable design skill bundle for AI hosts. It now also includes a simple `DESIGN.md` workflow, so users can not only install design skills, but also validate, compare, and export structured design specs.

`claudesign` 是一个给 AI 宿主环境使用的可移植设计技能包。现在它还内置了一套简单的 `DESIGN.md` 工作流，用户不仅能安装设计技能，还能校验、对比、导出结构化设计规范。

## Start Here / 从这里开始

If you only remember three things, remember these:

如果你只记三件事，记下面这三条：

```bash
npx claudesign-plugin install
npx claudesign-plugin list
npx claudesign-plugin designmd spec --rules
```

- `install`: install the default bundle
- `list`: show available adapters
- `designmd spec --rules`: show what a valid `DESIGN.md` should look like

## What Is `DESIGN.md`? / `DESIGN.md` 是什么

`DESIGN.md` is a structured design spec file for coding agents. You can think of it as "design rules that both humans and agents can read."

`DESIGN.md` 是一种给 coding agents 使用的结构化设计规范文件。你可以把它理解成“人能看、Agent 也能读懂的设计规则文件”。

In this repo, `DESIGN.md` is used for three very practical jobs:

在这个仓库里，`DESIGN.md` 主要做三件很实际的事：

- `lint`: check whether a design spec is structurally valid
- `diff`: compare two design specs and see what changed
- `export`: turn tokens into formats a downstream app can consume

## 3-Minute Quick Start / 3 分钟上手

### 1. Install a bundle / 安装 bundle

```bash
npx claudesign-plugin install
```

By default this installs the `generic` bundle to `~/.claudesign/plugins/generic`.

默认会把 `generic` 版本安装到 `~/.claudesign/plugins/generic`。

### 2. Check available adapters / 查看可用适配目标

```bash
npx claudesign-plugin list
```

You can also install a specific target:

你也可以安装指定目标：

```bash
npx claudesign-plugin install --adapter claude
npx claudesign-plugin install --adapter openai --target ~/.claudesign/plugins/openai
```

### 3. See the `DESIGN.md` rules / 查看 `DESIGN.md` 规范

```bash
npx claudesign-plugin designmd spec --rules
```

This is the easiest way to understand what kind of design file this repo supports.

这是理解本仓库支持什么样的设计规范文件的最简单方式。

### 4. Validate the built-in sample / 校验内置样例

Inside the repo:

在仓库内执行：

```bash
node ./scripts/designmd.mjs lint ./skills/visual-style/DESIGN.md
```

### 5. Compare two examples / 对比两个样例

```bash
node ./scripts/designmd.mjs diff \
  ./docs/designmd-examples/taste-stitch-base.DESIGN.md \
  ./docs/designmd-examples/taste-stitch-variant.DESIGN.md
```

### 6. Export tokens / 导出 token

```bash
node ./scripts/designmd.mjs export --format tailwind ./skills/visual-style/DESIGN.md
node ./scripts/designmd.mjs export --format dtcg ./skills/visual-style/DESIGN.md
```

## Who Is This For? / 适合谁用

Use `claudesign` if you want one of these:

如果你需要下面这些能力，`claudesign` 会比较适合：

- a portable design skill bundle for Claude, OpenAI, Codex, or internal runtimes
- a router contract that maps user intent to design execution modes
- a simple `DESIGN.md` workflow for design-spec validation and export
- stitch-style design-spec output that is easier to review and reuse

## If You Want The Dumb-Simple Version / 如果你只想傻瓜式使用

### I just want to install it / 我只想安装

```bash
npx claudesign-plugin install
```

### I just want to know what `DESIGN.md` is / 我只想知道 `DESIGN.md` 是啥

```bash
npx claudesign-plugin designmd spec --rules
```

### I just want to test whether the sample is valid / 我只想测试样例对不对

```bash
node ./scripts/designmd.mjs lint ./skills/visual-style/DESIGN.md
```

### I just want something I can hand to engineers / 我只想导出给工程侧

```bash
node ./scripts/designmd.mjs export --format tailwind ./skills/visual-style/DESIGN.md
```

## Main Guides / 主要文档

- [English Usage Guide](docs/usage.en.md)
- [中文使用说明](docs/usage.zh-CN.md)
- [DESIGN.md Workflows](docs/designmd-workflows.md)

## Platform Support / 平台支持

- `generic`: neutral adapter bundle for custom runtimes
- `claude`: adapter bundle for Claude-oriented hosts
- `openai`: adapter bundle for OpenAI-oriented hosts
- `codex`: supported through `.codex-plugin/plugin.json` plus the same shared contracts

## Local Shortcuts / 本地快捷命令

```bash
make validate-router
make designmd-lint
make designmd-diff-sample
make designmd-export-tailwind
make designmd-export-dtcg
```

## Under The Hood / 底层结构

These are mainly useful for maintainers, not first-time users:

这些内容主要对维护者有用，不是给第一次使用的人优先看的：

- `skills/skill-index.yaml`: canonical skill directory
- `agents/router-map.yaml`: routing source of truth
- `core/manifest.yaml`: package contract manifest
- `scripts/validate_router.rb`: router validation
- `scripts/designmd.mjs`: wrapper around Google Labs `@google/design.md`

## Important Note / 重要说明

The upstream Google Labs `DESIGN.md` format is still marked `alpha` as of 2026-04-23. This repo supports it in an optional-but-practical way: use it when you want structured design-spec workflows, but do not treat the upstream format as permanently stable yet.

截至 2026-04-23，上游 Google Labs 的 `DESIGN.md` 规范仍然是 `alpha`。本仓库已经把它接进来了，但定位仍然是“可选且实用”的能力层，不建议把上游格式当成完全稳定不变的长期标准。

## More / 更多

See [docs/derived-integration-note.md](docs/derived-integration-note.md), [docs/prompt-mapping-samples.md](docs/prompt-mapping-samples.md), and [LICENSE.md](LICENSE.md).
