[alias]
  c = commit -m
  a = add
  aa= !git add -u && git add . && git status
  cob = checkout -b
  up = !git fetch origin && git rebase origin/master
  ir = !git rebase -i origin/master
  done = !git fetch && git rebase origin/master && git checkout master && git merge @{-1} && rake && git push
