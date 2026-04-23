# Claudesign 使用说明

## 简介

Claudesign 是一个面向多平台的可移植设计技能包，包含：

- `skills/skill-index.yaml` 中的精选技能目录
- `agents/router-map.yaml` 中的路由契约
- `generic`、`claude`、`openai` 三种适配目标
- 可选的 Codex 插件清单 `.codex-plugin/plugin.json`
- 一个可发布到 npm、并通过 `npx` 调用的安装命令

## 通过 `npx` 安装

在这个包发布到 npm 之后，可以直接这样安装：

```bash
npx claudesign-plugin install
```

默认会安装 `generic` 版本到：

```text
~/.claudesign/plugins/generic
```

## 常用命令

查看支持的适配目标：

```bash
npx claudesign-plugin list
```

安装 Claude 适配版本：

```bash
npx claudesign-plugin install --adapter claude
```

安装 OpenAI 适配版本到自定义目录：

```bash
npx claudesign-plugin install --adapter openai --target ~/.claudesign/plugins/openai
```

`--platform` 也可以作为 `--adapter` 的别名使用：

```bash
npx claudesign-plugin install --platform claude
```

## 平台支持

- `generic`：适用于自定义或内部 Agent 运行时的中性 bundle
- `claude`：面向 Claude 宿主环境的适配 bundle
- `openai`：面向 OpenAI 宿主环境的适配 bundle
- `codex`：通过仓库中的插件清单和同一套共享契约提供支持

## 本地开发调试

在仓库内直接运行安装器：

```bash
node ./bin/claudesign-plugin.mjs list
node ./bin/claudesign-plugin.mjs install --adapter generic --target /tmp/claudesign-local
```

发布前建议先执行路由校验：

```bash
ruby scripts/validate_router.rb
```

## 安装后的内容

每次安装生成的 bundle 会包含：

- 技能目录
- 路由契约
- 校验用例
- 校验脚本
- README 和部分文档
- 当前适配目标对应的元数据文件
