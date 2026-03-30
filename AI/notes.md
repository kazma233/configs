1. 项目中 没用代码太多，容易误导AI
  - 使用提示词：“需要查找调用链路的时候，不能直接字符串搜索，需要顺着代码的调用逻辑进行精确查找”
2. AI瞎编乱造
  - 使用提示词：“如果是调用系统已存在的方法，需要明确的找到该方法，确定该方法存在，能调用才可以”
3. 使用AI也会强迫让你去思考，笑死，因为你怕出错，但是这应该是暂时的
4. AI对于java的需要打包成jar再使用，目前(我司)阶段还是挺难让AI完全接手
5. 一个Codex去写逻辑，另一个AI去review

``` claude
/plugin marketplace add anthropics/claude-code
/plugin install frontend-design@claude-code-plugins
```
