# Claudesign 使用说明

## 先说人话

如果你只是想快速理解这个项目，可以直接这样看：

- `claudesign` 是一个可移植的设计技能包
- 现在它额外支持 `DESIGN.md`
- `DESIGN.md` 可以让你把“设计风格说明”变成“可校验、可对比、可导出”的文件

也就是说，这个仓库现在不只是“装技能”，还支持“管理设计规范文件”。

## 新增的 `DESIGN.md` 到底有什么用

把它理解成给 Agent 和工程师共用的设计说明文件就行。

它最常见的三个用途是：

1. `lint`
检查这份设计规范文件写得对不对。

2. `diff`
比较两个设计规范版本之间到底改了什么。

3. `export`
把设计 token 导出成 Tailwind 或 DTCG 这类下游能消费的格式。

## 傻瓜式使用

### 我只想安装

```bash
npx claudesign-plugin install
```

默认会安装 `generic` 版本到：

```text
~/.claudesign/plugins/generic
```

### 我只想看支持哪些目标

```bash
npx claudesign-plugin list
```

### 我只想看 `DESIGN.md` 应该长什么样

```bash
npx claudesign-plugin designmd spec --rules
```

### 我只想验证仓库里的样例是否有效

在仓库目录里运行：

```bash
node ./scripts/designmd.mjs lint ./skills/visual-style/DESIGN.md
```

### 我只想看两份设计规范差异

```bash
node ./scripts/designmd.mjs diff \
  ./docs/designmd-examples/taste-stitch-base.DESIGN.md \
  ./docs/designmd-examples/taste-stitch-variant.DESIGN.md
```

### 我只想导出给工程侧

```bash
node ./scripts/designmd.mjs export --format tailwind ./skills/visual-style/DESIGN.md
node ./scripts/designmd.mjs export --format dtcg ./skills/visual-style/DESIGN.md
```

## 常用安装方式

安装 Claude 适配版本：

```bash
npx claudesign-plugin install --adapter claude
```

安装 OpenAI 适配版本到自定义目录：

```bash
npx claudesign-plugin install --adapter openai --target ~/.claudesign/plugins/openai
```

`--platform` 也可以作为 `--adapter` 的别名：

```bash
npx claudesign-plugin install --platform claude
```

## 如果你在仓库里本地开发

先列出适配目标：

```bash
node ./bin/claudesign-plugin.mjs list
```

本地安装一个测试 bundle：

```bash
node ./bin/claudesign-plugin.mjs install --adapter generic --target /tmp/claudesign-local
```

发布前跑路由校验：

```bash
ruby scripts/validate_router.rb
```

## 本地快捷命令

```bash
make validate-router
make designmd-lint
make designmd-diff-sample
make designmd-export-tailwind
make designmd-export-dtcg
```

## 仓库里已经给你的 `DESIGN.md` 说明

仓库里现在已经有三类现成材料，不需要你自己猜：

- 基线样例：`skills/visual-style/DESIGN.md`
- 对比样例：`docs/designmd-examples/taste-stitch-base.DESIGN.md`
- 工作流说明：`docs/designmd-workflows.md`

如果你是第一次接触，建议就按这个顺序看：

1. `npx claudesign-plugin designmd spec --rules`
2. `skills/visual-style/DESIGN.md`
3. `docs/designmd-workflows.md`
4. `diff` / `export` 命令

## 安装后的内容

每次安装生成的 bundle 会包含：

- 技能目录
- 路由契约
- 校验用例
- 校验脚本
- `DESIGN.md` 命令包装脚本
- 内置的 `DESIGN.md` diff 样例
- README 和部分文档
- 当前适配目标对应的元数据文件

## 平台支持

- `generic`：适用于自定义或内部 Agent 运行时的中性 bundle
- `claude`：面向 Claude 宿主环境的适配 bundle
- `openai`：面向 OpenAI 宿主环境的适配 bundle
- `codex`：通过仓库中的插件清单和同一套共享契约提供支持

## 给维护者看的补充说明

如果你是维护这个仓库，而不是普通使用者，再看下面这些：

- `skills/skill-index.yaml`：技能目录的 canonical source
- `agents/router-map.yaml`：路由 source of truth
- `core/manifest.yaml`：打包契约
- `scripts/designmd.mjs`：对 Google Labs `@google/design.md` 的包装
- `scripts/validate_router.rb`：路由和文档结构校验入口

## 重要说明

这个包装脚本会优先使用本地或全局安装的 `designmd`，找不到时再回退到 `npx @google/design.md`。

截至 2026-04-23，上游 Google Labs `DESIGN.md` 规范仍然处于 `alpha` 阶段。所以这里的定位是“已经能用，但上游规范还可能继续变”。
