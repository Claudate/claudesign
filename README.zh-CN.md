# claudesign

[English](README.md) | [简体中文](README.zh-CN.md)

`claudesign` 是一个把模糊设计想法整理成 `DESIGN.md` 的工具包，方便 AI 和工程一起使用。

你可以先让 AI 生成一版 `DESIGN.md`，再人工修改、校验、对比版本，最后导出 token 给前端开发。

## 先看这个

如果你只想用最简单的话理解这个项目，可以这样记：

1. 先让 AI 按你的产品需求生成一份 `DESIGN.md`
2. 你再手动调整这份设计规范
3. 用 `lint` 检查格式对不对
4. 再让 AI 或工程师根据这份 `DESIGN.md` 开发
5. 需要时导出 token 给前端使用

这就是这个仓库最核心、也最适合普通用户的用法。

## 这个项目到底是什么

它不是画图工具，也不是 Figma 替代品。

它更像一个“设计规范工作流工具包”，主要提供这些能力：

- 给 AI 宿主安装一套可复用的设计技能
- 用 `DESIGN.md` 写结构化设计规范
- 用 `lint` 校验设计规范
- 用 `diff` 对比两个设计版本
- 用 `export` 导出工程可用的 token
- 在 Claude、OpenAI、Codex 和内部运行时之间共用同一套设计契约

## `DESIGN.md` 适合拿来做什么

如果你希望 AI 产出的设计更稳定、更容易落地开发，那么 `DESIGN.md` 很适合。

常见用途：

- 用 AI 生成第一版设计系统
- 定义颜色、字体、间距、圆角、组件 token
- 写清楚视觉规则和 Do / Don't
- 审查设计改版时到底改了什么
- 把结构化 token 交给前端工程师

它尤其适合这些场景：

- 落地页
- 产品 UI 风格规范
- 组件库
- 品牌视觉基线
- 设计系统交付

## 快速开始

### 1. 安装

```bash
npx claudesign-plugin install
```

默认会安装 `generic` 版本到 `~/.claudesign/plugins/generic`。

### 2. 先看一个合法的 `DESIGN.md` 长什么样

```bash
npx claudesign-plugin designmd spec --rules
sed -n '1,220p' ./skills/visual-style/DESIGN.md
```

### 3. 校验仓库自带样例

```bash
node ./scripts/designmd.mjs lint ./skills/visual-style/DESIGN.md
```

看懂之后，把样例路径换成你自己的 `DESIGN.md` 文件即可。

## 推荐使用流程

如果你是设计师、产品经理、独立开发者，或者正在和 AI 协作做设计，建议直接按这个流程走：

### 第 1 步：先让 AI 生成第一版

你可以把这些信息交给 AI：

- 产品类型
- 目标用户
- 品牌关键词
- 参考产品
- 需要设计的页面或组件

让 AI 输出一份 `DESIGN.md` 初稿。

### 第 2 步：手动优化这份文件

重点检查这些内容有没有写清楚：

- 颜色 token
- 字体 token
- 间距和圆角
- 组件规则
- 布局指导
- 交互状态
- Do / Don't 约束

### 第 3 步：校验文件

```bash
node ./scripts/designmd.mjs lint ./your.DESIGN.md
```

### 第 4 步：拿它指导开发

把校验通过的 `DESIGN.md` 当成设计源文件，交给 AI 编码代理或前端工程师实现。

### 第 5 步：设计改版时做对比

```bash
node ./scripts/designmd.mjs diff ./old.DESIGN.md ./new.DESIGN.md
```

### 第 6 步：导出 token 给工程侧

```bash
node ./scripts/designmd.mjs export --format tailwind ./your.DESIGN.md
node ./scripts/designmd.mjs export --format dtcg ./your.DESIGN.md
```

## 常用命令

### 安装

```bash
npx claudesign-plugin install
npx claudesign-plugin install --adapter claude
npx claudesign-plugin install --adapter openai --target ~/.claudesign/plugins/openai
```

### 查看格式规则

```bash
npx claudesign-plugin designmd spec --rules
```

### 校验一份设计规范

```bash
node ./scripts/designmd.mjs lint ./your.DESIGN.md
```

### 比较两个版本

```bash
node ./scripts/designmd.mjs diff \
  ./docs/designmd-examples/taste-stitch-base.DESIGN.md \
  ./docs/designmd-examples/taste-stitch-variant.DESIGN.md
```

### 导出 token

```bash
node ./scripts/designmd.mjs export --format tailwind ./your.DESIGN.md
node ./scripts/designmd.mjs export --format dtcg ./your.DESIGN.md
```

## 仓库里都有什么

- `skills/`：设计能力和技能资产
- `agents/`：路由规则和校验用例
- `adapters/`：不同宿主的打包元数据
- `scripts/`：校验命令和 `DESIGN.md` 工具脚本
- `docs/`：说明文档、样例和集成说明

如果你只是普通使用者，前期其实不用关心这些目录，先聚焦 `DESIGN.md` 和上面的命令就够了。

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

## 微信群

扫描下方二维码即可加入 `claudesign` 微信群：

![claudesign 微信群二维码](public/wechat.png)

## 重要说明

截至 2026-04-23，上游 Google Labs `DESIGN.md` 规范仍然处于 `alpha` 阶段。

这意味着这套流程已经可以实际使用，但上游格式未来仍可能继续变化。
