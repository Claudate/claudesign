# claudesign

[English](README.md) | [简体中文](README.zh-CN.md)

`claudesign` 是一个面向 AI 宿主环境的可移植设计技能包。它把精选设计技能目录、可校验的路由契约，以及一套实用的 `DESIGN.md` 工作流打包在一起，用来支持结构化设计规范的校验、对比和导出。

## 这个项目是什么

`claudesign` 可以理解成一层“设计能力打包与契约层”。

它主要帮你做这些事：

- 安装一套可复用的设计技能 bundle
- 把用户请求路由到明确的设计执行模式
- 产出可 lint、可 diff、可 export 的 `DESIGN.md` 结构化设计规范
- 在 Claude、OpenAI、Codex 和内部运行时之间保持同一套设计契约

## 里面包含什么

- `skills/skill-index.yaml`：canonical skill catalog
- `agents/router-map.yaml`：路由 source of truth
- `adapters/`：`generic`、`claude`、`openai` 的打包元数据
- `scripts/designmd.mjs`：`DESIGN.md` 命令包装
- `docs/designmd-examples/`：`taste.stitch` 风格输出的内置样例

## 架构一眼看懂

这个仓库刻意分成几层：

- `skills/`：定义技能能力和技能资产
- `agents/`：定义路由规则、执行模式和验证用例
- `adapters/`：定义不同宿主的打包元数据
- `scripts/`：验证脚本和 `DESIGN.md` 辅助命令
- `docs/`：使用说明、样例和契约文档

如果你只想快速理解这个项目，可以这样记：

`skills` 决定能做什么，`agents` 决定请求怎么路由，`adapters` 决定怎么打包到不同宿主，`DESIGN.md` 则提供结构化设计规范输出。

## 快速开始

### 安装默认 bundle

```bash
npx claudesign-plugin install
```

默认会把 `generic` 版本安装到 `~/.claudesign/plugins/generic`。

### 查看可用适配目标

```bash
npx claudesign-plugin list
```

### 查看 `DESIGN.md` 规范

```bash
npx claudesign-plugin designmd spec --rules
```

这是理解本仓库支持什么样的结构化设计规范文件的最快方式。

## 具体怎么用

### 使用场景 1：把 bundle 安装到宿主环境

如果你的目标只是“把这套 bundle 装到 AI 宿主里”，按下面做：

1. 安装默认 bundle：

```bash
npx claudesign-plugin install
```

2. 或者安装指定宿主适配版本：

```bash
npx claudesign-plugin install --adapter claude
npx claudesign-plugin install --adapter openai --target ~/.claudesign/plugins/openai
```

3. 在你的宿主运行时里指向安装后的 bundle 目录。

结果：宿主会拿到这个仓库分发的同一套 `skills`、`agents`、适配器元数据和文档。

### 使用场景 2：先看懂设计规范格式，再决定怎么生成

如果你的目标是“先看懂这个项目到底支持什么格式”，按下面做：

1. 打印 `DESIGN.md` 规则：

```bash
npx claudesign-plugin designmd spec --rules
```

2. 打开仓库内置基线样例：

```bash
sed -n '1,220p' ./skills/visual-style/DESIGN.md
```

3. 再看工作流说明：

```bash
sed -n '1,220p' ./docs/designmd-workflows.md
```

结果：你会按顺序看到规范长什么样、真实样例长什么样、推荐工作流怎么走。

### 使用场景 3：校验或审查一份设计规范

如果你的目标是“检查这份设计规范能不能用”，按下面做：

1. 先校验仓库内置样例：

```bash
node ./scripts/designmd.mjs lint ./skills/visual-style/DESIGN.md
```

2. 如果你要校验自己的文件，把这个路径替换成你自己的 `DESIGN.md` 文件路径。

3. 如果你要比较两个版本之间的变化：

```bash
node ./scripts/designmd.mjs diff \
  ./docs/designmd-examples/taste-stitch-base.DESIGN.md \
  ./docs/designmd-examples/taste-stitch-variant.DESIGN.md
```

结果：你可以知道文件结构是否有效，以及两个版本之间具体改了什么。

### 使用场景 4：把 token 交给工程侧或下游工具

如果你的目标是“把设计规范变成工程更容易接的格式”，按下面做：

1. 导出 Tailwind token：

```bash
node ./scripts/designmd.mjs export --format tailwind ./skills/visual-style/DESIGN.md
```

2. 导出 DTCG token：

```bash
node ./scripts/designmd.mjs export --format dtcg ./skills/visual-style/DESIGN.md
```

3. 如果你想保存成文件，可以直接重定向：

```bash
node ./scripts/designmd.mjs export --format tailwind ./skills/visual-style/DESIGN.md > tailwind.theme.json
```

结果：工程师或下游系统拿到的是机器可读 token，而不只是说明文字。

## `DESIGN.md` 工作流

`DESIGN.md` 是一种给 coding agents 使用的结构化设计规范文件。在这个仓库里，它主要承担三件事情：

- `lint`：校验设计规范结构是否有效
- `diff`：比较两个设计规范版本之间的变化
- `export`：把 token 转成 Tailwind 或 DTCG 这类下游可消费格式

### 校验内置样例

```bash
node ./scripts/designmd.mjs lint ./skills/visual-style/DESIGN.md
```

### 对比仓库内置的两个样例

```bash
node ./scripts/designmd.mjs diff \
  ./docs/designmd-examples/taste-stitch-base.DESIGN.md \
  ./docs/designmd-examples/taste-stitch-variant.DESIGN.md
```

### 导出给下游使用的 token

```bash
node ./scripts/designmd.mjs export --format tailwind ./skills/visual-style/DESIGN.md
node ./scripts/designmd.mjs export --format dtcg ./skills/visual-style/DESIGN.md
```

## 平台支持

- `generic`：适用于自定义运行时的中性 bundle
- `claude`：面向 Claude 宿主环境的适配 bundle
- `openai`：面向 OpenAI 宿主环境的适配 bundle
- `codex`：通过 `.codex-plugin/plugin.json` 和同一套共享契约提供支持

## 本地快捷命令

```bash
make validate-router
make designmd-lint
make designmd-diff-sample
make designmd-export-tailwind
make designmd-export-dtcg
```

## 文档入口

- [English README](README.md)
- [English Usage Guide](docs/usage.en.md)
- [中文使用说明](docs/usage.zh-CN.md)
- [DESIGN.md Workflows](docs/designmd-workflows.md)
- [Execution Contract Notes](docs/derived-integration-note.md)

## 重要说明

截至 2026-04-23，上游 Google Labs `DESIGN.md` 规范仍然标记为 `alpha`。`claudesign` 已经把它作为结构化设计规范工作流接入进来，但不建议把上游格式当成完全稳定不变的长期标准。
