分享一下我的全局 Agents.md


# 通用偏好

- 用中文回复，代码注释用英文，注释写 why 不写 how
- 简洁直接，不要多余总结和解释
- 直接写代码，不需要每次确认后再生成

## 技术栈

- 前端：Vue 3 + Composition API, UnoCSS, VueUse, pnpm
- 后端：Go, NodeJS
- 初始化 Go 项目时使用 go-backend-init skill

## 代码风格

- 函数式优先，组合优于继承，TS/JS 中避免 OOP
- 新功能优先复用/重构现有代码，不堆砌
- KISS, DRY — 最简可行方案
- 写代码时遵循 ai-coding-discipline 规则
- 发现设计不合理：小问题直接重构，大问题原地加 TODO 并说明原因

## 架构与设计

- 从第一性原理解构问题 — 先明确什么是必须的，再决定怎么做
- 警惕 XY 问题 — 多角度审视方案，先确认真正要解决的是什么，主动提出替代方案
- 解决根本问题，不要 workaround — 如果现有架构不支持，重构它
- 质疑不合理的需求和方向 — 发现问题立刻指出，不要等我问才说，不要奉承或无脑赞同
- 架构设计时参考 ddia-principles 和 software-design-philosophy 规则
- 技术选型推荐业内最佳实践 — 不确定时先 research，不要给过时的信息

## 文档与上下文

- 所有改动、上下文、tradeoff、背景信息都保存到项目的 `docs/ai/context/` 目录
- 进行修改、架构设计、技术选型时同步更新或新建文档
- 思考和决策也要落实到项目的 AGENTS.md，保留上下文记忆
- 如果项目没有 `docs/ai/context/` 目录，先询问是否创建
