# Claudesign 使用说明

## 一句话理解

`claudesign` 最适合这样用：

先让 AI 生成一份 `DESIGN.md`，你再人工优化它，校验通过后，把它当成设计规范交给 AI 或工程师开发。

如果你是第一次接触这个项目，只需要先理解这一条就够了。

## 最推荐的新手流程

### 第 1 步：先看格式

先看看这个项目支持什么样的 `DESIGN.md`：

```bash
npx claudesign-plugin designmd spec --rules
sed -n '1,220p' ./skills/visual-style/DESIGN.md
```

你不需要一开始看懂全部细节，只要知道它大概会包含这些内容：

- 颜色
- 字体
- 间距
- 圆角
- 组件 token
- 页面和视觉规则
- Do / Don't 约束

### 第 2 步：让 AI 生成第一版

把你的项目信息告诉 AI，让它先输出一份 `DESIGN.md` 初稿。

最少建议提供这些信息：

- 产品类型
- 目标用户
- 品牌关键词
- 参考产品或参考风格
- 需要设计的页面
- 是否偏品牌感、工具感、科技感、极简感等

### 第 3 步：手动优化

AI 生成的第一版通常只能当草稿，建议你重点检查这些地方：

- 颜色是否符合品牌
- 字体层级是否清楚
- spacing / radius 是否完整
- 组件规则是否足够落地
- 有没有写清楚状态和异常态
- 有没有明确写 Do / Don't

### 第 4 步：校验文件

```bash
node ./scripts/designmd.mjs lint ./your.DESIGN.md
```

如果校验通过，这份文件就更适合拿去做后续开发了。

### 第 5 步：拿它指导开发

把通过校验的 `DESIGN.md` 交给：

- AI 编码代理
- 前端工程师
- 设计系统维护者

它的作用不是替代设计稿，而是把设计约束写成更稳定、更可复用的规范。

### 第 6 步：改版时做版本对比

```bash
node ./scripts/designmd.mjs diff ./old.DESIGN.md ./new.DESIGN.md
```

这样你就能看到两版设计规范具体改了什么。

### 第 7 步：导出 token 给工程侧

```bash
node ./scripts/designmd.mjs export --format tailwind ./your.DESIGN.md
node ./scripts/designmd.mjs export --format dtcg ./your.DESIGN.md
```

## 可以直接复制给 AI 的提示词模板

如果你想让 AI 帮你先生成第一版 `DESIGN.md`，可以直接用下面这个模板。

```text
请根据以下项目背景，生成一份结构清晰、可用于开发协作的 DESIGN.md。

项目类型：
目标用户：
品牌关键词：
参考产品 / 参考风格：
主要页面：
核心组件：
是否需要移动端适配：
希望避免的风格：

请输出内容至少包含：
1. 基本信息（name / description）
2. colors
3. typography
4. spacing / rounded
5. components
6. layout guidance
7. interaction states
8. do / don't

要求：
- 风格具体，不要空泛
- token 命名清楚
- 不要只写营销形容词
- 组件规则要能指导前端实现
- 明确列出不建议出现的视觉问题
```

## 常见命令

### 安装

```bash
npx claudesign-plugin install
```

默认安装到：

```text
~/.claudesign/plugins/generic
```

### 查看支持的适配目标

```bash
npx claudesign-plugin list
```

### 查看 `DESIGN.md` 规则

```bash
npx claudesign-plugin designmd spec --rules
```

### 校验设计规范

```bash
node ./scripts/designmd.mjs lint ./your.DESIGN.md
```

### 对比两个版本

```bash
node ./scripts/designmd.mjs diff ./old.DESIGN.md ./new.DESIGN.md
```

### 导出 token

```bash
node ./scripts/designmd.mjs export --format tailwind ./your.DESIGN.md
node ./scripts/designmd.mjs export --format dtcg ./your.DESIGN.md
```

## 如果你只想快速试一下

直接跑这三条命令就行：

```bash
npx claudesign-plugin designmd spec --rules
sed -n '1,220p' ./skills/visual-style/DESIGN.md
node ./scripts/designmd.mjs lint ./skills/visual-style/DESIGN.md
```

这样你就能快速知道：

- 格式长什么样
- 仓库样例长什么样
- 校验命令怎么用

## 仓库里最值得先看的文件

- `skills/visual-style/DESIGN.md`
- `docs/designmd-workflows.md`
- `docs/designmd-examples/taste-stitch-base.DESIGN.md`
- `docs/designmd-examples/taste-stitch-variant.DESIGN.md`

## 适合什么用户

这套工作流特别适合：

- 想让 AI 辅助做设计规范的人
- 想让前端实现更稳定的人
- 在做设计系统或品牌规范的人
- 希望保留设计版本变化记录的人

## 不适合把它当成什么

它不适合直接当成：

- 绘图软件
- 高保真视觉稿替代品
- Figma 替代品

更准确地说，它是设计规范和工程实现之间的桥梁。

## 平台支持

- `generic`：适用于自定义或内部 Agent 运行时
- `claude`：面向 Claude 宿主环境
- `openai`：面向 OpenAI 宿主环境
- `codex`：通过插件清单和同一套共享契约提供支持

## 给维护者看的补充说明

如果你是在维护这个仓库，而不是普通用户，可以重点看这些文件：

- `skills/skill-index.yaml`
- `agents/router-map.yaml`
- `core/manifest.yaml`
- `scripts/designmd.mjs`
- `scripts/validate_router.rb`

## 重要说明

这个包装脚本会优先使用本地或全局安装的 `designmd`，找不到时再回退到 `npx @google/design.md`。

截至 2026-04-23，上游 Google Labs `DESIGN.md` 规范仍然处于 `alpha` 阶段，所以建议你把它理解成“已经可以用，但后续还可能变化”。
