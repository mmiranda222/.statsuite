---
title: How to contribute (development guidelines)
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

- feature/patch branches are created from dev (after a push in dev)
- feature/patch branches must be merge back into dev when the feature is done
- release branches are created from dev (after a push in dev)
- release must be merge back into dev and master
- hotfix branches are created from master (after a push in master)
- hotfix branches must be merge back into dev and master

#### Good practices

- perform atomic commits (ie commit a lot)
>- git history is detailed
>- allows efficient time travel in past
>- branches are squashed into dev, so dev history is not flooded
- push often, like twice a day at least
>- backup your work (commits are local)
>- share your work
