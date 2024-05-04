# Git Tricks

Check the history of changes of a specific set of lines/file:
```bash
git log -L 41,50:store/sagas/index.ts
```

---

Check differences between two files not in a git repo:
```bash
git diff --no-index --find-renames <path> <path>
```
