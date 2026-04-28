# skills池

可以或者将要纳入skills的内容

1. 项目中 没用代码太多，容易误导AI
  - 使用提示词：`需要查找调用链路的时候，不能仅使用简单的字符串搜索，需要顺着代码的调用逻辑进行精确查找亦或者借助LSP的能力`
2. AI瞎编乱造
  - 使用提示词：`如果是调用系统已存在的方法，需要明确的找到该方法，确定该方法存在，能调用才可以`

# 技巧

1. 一个Codex去写逻辑，另一个AI去review
2. 如果涉及到多个模块的更改，可以让当前的对话AI作为项目管理者，开启并管理多个subagent去完成任务；管理AI维护一个进度文件，subagent做完了通知管理AI去修改进度文件，最终实现异步完成任务
3. [rtk](https://github.com/rtk-ai/rtk) 节省某些命令的输出，达到节省token的效果

# 感受

1. 使用AI也会强迫让你去思考，因为你怕出错，但是这应该是暂时的
2. `worktree`的使用
   - 将所有项目放到单个仓库 
   - gitbutler cli + Skills 
3. 目前写代码仍然是 human in the loop，要人工让AI写设计方案，人工review代码；
   - AI的能力已经不是问题，前提是要有足够的上下文和明确的需求: 目前我们考虑维护好md文档就行，使用 Skills + 分词（jieba）搜索的py脚本 就差不多
   - 测试是让AI写完代码能够直接上线的保障：行为驱动开发（BDD）+ Gherkin 语言
4. AI的可用率和输出速率会严重影响效率，所以这个需要高优先级保证

# 调整
1. 目前我们的RPC需要先把RPC打包成Jar之后才能调用，需要触发成Jenkins，待编写skills

# calude code

```
/plugin marketplace add anthropics/claude-code
/plugin install frontend-design@claude-code-plugins
```
