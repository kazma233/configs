# git log

``` sh
git log --graph --decorate --oneline --first-parent --no-merges --all
# --graph：以 ASCII 图形显示分支合并历史，形成树状结构。
# --oneline：每个提交显示为一行（简短的哈希值和标题）。
# --decorate：显示指向提交的引用（分支、标签等），会直接标在每个提交旁边。
# --all：显示所有分支（默认只显示当前分支的历史）。
# --no-merges：过滤掉所有合并提交（即拥有至少两个父提交的提交）。
# --first-parent：在遍历提交历史时，只跟随每个提交的第一个父提交，忽略其他父提交（即忽略合并提交引入的旁支）。

# --branches
# 显示所有本地分支的提交（相当于 --all 但排除远程跟踪分支）。

# --remotes
# 显示所有远程跟踪分支的提交。
 
git log --graph --oneline --decorate --all --since="1 week ago" --simplify-by-decoration
```
