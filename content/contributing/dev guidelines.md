---
title: Development guidelines
subtitle: 
comments: false
weight: 32
---

# Git-flow
## overview
Each project's repository has the following branches:<br>

- master (name=master)
    - represents the production state
    - should always be deployable
- dev (name=dev)
    - developer's hub
    - should always be developable (e.g. can be buggy as soon as it does not block developers)
- feature branches (name=feature/*)
    - new feature/experiments
    - should be synced with dev from time to time
- patch branches (name=patch/*)
    - fixing/enhancing/refactoring existing features
    - similar to feature branches flow
- release branches (name=release/*)
    - transitional snapshot between dev and master
    - should  be used for demo
    - allows dev branch to receive next release features
- hotfix branches (name=hotfix/*)
    - fixing critical bug(s) in production
    - avoid blocking dev while fixing master

## rules
- feature/patch branches are created from dev (after a merge in dev).
- feature/patch branches must be merged back into dev when the feature is done.
- release branches are created from dev (after a merge in dev).
- release must be merged back into dev and master.
- hotfix branches are created from master (after a merge in master).
- hotfix branches must be merged back into dev and master.

## good practices
- perform atomic commits (e.g. commit a lot)
    - git history is detailed
    - git history allows efficient time travel in past
    - branches are squashed into dev, so dev history is not flooded
- push often, like twice a day at least
    - backup your work (commmits are local)
    - share your work

## use cases
- [git-feature](https://github.com/cis-itn-oecd/web-components/blob/dev/doc/git-feature.md) **_to review_**
- [git-confilct](https://github.com/cis-itn-oecd/web-components/blob/dev/doc/git-conflict.md) **_to review_**

