---
title: Development guidelines
subtitle: 
comments: false
weight: 33
---

### Git-flow

#### Overview

The [.Stat Suite gitlab repositories](https://gitlab.com/sis-cc/.stat-suite) have the following branches:

- master (name=master)
    - represents the production state
    - should always be deployable
- dev (name=dev)
    - developer's hub
    - should always be developable (ie can be buggy as soons as it does not block developers)
- feature branches (name=feature/*)
    - new features/experiments
    - should be synced with dev from time to time
- patch branches (name=patch/*)
    - fixing/enhancing/refactoring existing features
    - similar to feature branches flow
- release branches (name=release/*)
    - transitional snapshot between dev and master
    - should be used for demo
    - allows dev branch to receive next release features
- hotfix branches (name=hotfix/*)
    - fixing critical bug(s) in production
    - avoid blocking dev while fxing master

#### Rules

- feature/patch branches are created from dev (after a merge in dev)
- feature/patch branches must be merged back into dev when the feature is done
- release branches are created from dev (after a merge in dev)
- release must be merged back into dev and master
- hotfix branches are created from master (after a merge in master)
- hotfix branches must be merged back into dev and master

#### Good practices

- perform atomic commits (ie commit a lot)
    - git history is detailed
    - allows efficient time travel in past
    - branches are squashed into dev, so dev history is not flooded
- push often, like twice a day at least
    - backup your work (commits are local)
    - share your work

#### Use case of a git-feature
lifecycle of a feature (morebanana).<br>

```
$ git checkout dev
$ git pull
$ git checkout -b feature/morebanana
$ git push origin feature/morebanana
```
At this point, a new feature branch has been created from dev and pushed to origin.
```
$ git commit -m 'add a banana'
$ git commit -m 'add another banana'
$ git push
```
It is important, to commit and push code to backup it.  
If you are not working alone on a feature, do a `git pull` before pushing.  
If the feature is big, keep it up to date with dev to limit conflicts:
```
$ git checkout dev
$ git pull dev
$ git checkout feature/morebanana
$ git merge dev
```
Once the feature is done, squash it into dev:
```
$ git commit -m 'last commit!'
$ git push
$ git checkout dev
$ git pull
$ git merge --no-ff feature/morebanana
```
The merge option `--no-ff` allows to squash all the commits of the feature branch into a single commit in dev branch to let the history clean and clear.   
Last thing to do is removing the local feature branch and let the world know about the new feature:
```
$ git branch -d feature/morebanana
$ git push
```

#### Use case of a git-conflict
I am working on a new feature, while updating my feature branch with dev, I get a conflict.<br>

```
$ git checkout dev
$ git pull dev
$ git checkout feature/morebanana
$ git merge dev
```
The merge failed because there is a conflict.<br>
```
$ git mergetool
```
The above command will launch your default editor in a diffing mode with 3 versions of the conflicted file:

- the remote version
- the reconciliated version
- the local version

The essence of resolving a conflict is to help git by writing the reconciliated version from the remote and the local versions.<br>
A merge can have more than one conflict. <br>
A conflict generally does not concern a whole file but only a chunk of it.<br>
Once all conflicts are solved, let git know about it:
```
$ git commit
```
No need to enter a message neither to add reconciliated (and thus updated) files to the stage, git does automatically (conflicted state).


