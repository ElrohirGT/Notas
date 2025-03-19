# Git Tricks

Check the history of changes of a specific set of lines/file:

```bash
git log -L 41,50:store/sagas/index.ts
```

______________________________________________________________________

Check differences between two files not in a git repo:

```bash
git diff --no-index --find-renames <path> <path>
```

______________________________________________________________________

Check a file differences between two branches:

```bash
git diff mybranch myOtherBranch -- myfile.cs
```

______________________________________________________________________

Undo a git rebase using the reflog of the HEAD branch:

```bash
git reflog
```
