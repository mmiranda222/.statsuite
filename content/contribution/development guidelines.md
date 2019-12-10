---
title: "Development guidelines"
subtitle: 
comments: false
weight: 93
---

#### Table of Content
- [git-flow](#git-flow)
- [process](#process)
- [coding standards](#coding-standards)
- [linting utilities](#linting-utilities)
- [contributing to an open source repository](#contributing-to-an-open-source-repository)

---

> **NOTE**: these guidelines describe how the .Stat Suite developer team members are applying the git-flow process and what coding standards are followed. <br>
**As an external contributor** of the project, you can directly jump in the very well described [contributing to an open source repository](https://www.selketjah.com/oss/2018/02/06/flow-of-open-source/), where it is explained how to contribute to an open-source project by submitting Merge Requests to the project maintainers.

### Git-flow

**Overview** <br>
The [.Stat Suite gitlab repositories](https://gitlab.com/sis-cc/.stat-suite) have the following branches:

- master (name=master)
    - represents the production state
    - should always be deployable
- dev (name=dev)
    - developer's hub
    - should always be developable (ie can be buggy as long as it does not block developers)
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
    - avoid blocking dev while fixing master

**Rules**<br>

- feature/patch branches are created from dev (after a merge in dev) <br>
- feature/patch branches must be merged back into dev when the feature is done <br>
- release branches are created from dev (after a merge in dev) <br>
- release must be merged back into dev and master <br>
- hotfix branches are created from master (after a merge in master) <br>
- hotfix branches must be merged back into dev and master <br>

**Good practices**<br>

- perform atomic commits (ie commit a lot) <br>
    - git history is detailed <br>
    - allows efficient time travel in past <br>
    - branches are squashed into dev, so dev history is not flooded <br>
- push often, like twice a day at least <br>
    - backup your work (commits are local) <br>
    - share your work <br>

**Use case of a git-feature**<br>
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
It is important to commit and push code to back it up.  
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

**Use case of a git-conflict**<br>
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

---

### Process

- All changes to the code are done via merge requests. No one ever pushes directly to master. This applies to all core developers and community contributors.
    - All changes to code need to be approved by a member of the core technical team. A member cannot approve their own code.
- All changes to code must meet the published guidelines on code style and version control practices.
- Merge requests are configured with CI/CD for all required security checks. If any check fails, then the core team must request fixes to the merge request. 

---

### Coding standards

We are using JavaScript (Node.js), SQL and C# (on .NET Core).<br>

- [ECMAScript 6](https://en.wikipedia.org/wiki/ECMAScript#6th_Edition_-_ECMAScript_2015) is used to standardise JavaScript (Node.js) code.
- [Jetbrains' Resharper](https://www.jetbrains.com/resharper/features/code_analysis.html) is a plugin used on SQL and C# (on .NET Core) code checking in real-time standardisation and common practices.

---

### Linting utilities

- [ESlint](https://eslint.org/) is used on JavaScript (Node.js) for checking code's consistency and reporting on security patterns.<br>
- [Checkmarx](https://www.checkmarx.com/) is used for SQL and C# (on .NET Core) code.

---

### Contributing to an open source repository

See here for the process to be followed: https://www.selketjah.com/oss/2018/02/06/flow-of-open-source/

