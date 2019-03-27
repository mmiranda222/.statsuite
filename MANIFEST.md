# Manifest

> Dashboard for dotstatsuite applications and components, gitlab `Operations` only works for public repositories.

|kind|name|status|coverage|
|---|---|---|---|
|service|[config](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/badges/develop/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/badges/develop/coverage.svg?style=flat-square)|
|webapp|[data-explorer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/badges/develop/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/badges/develop/coverage.svg?style=flat-square)|
|webapp|[data-explorer-legacy](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer-legacy)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer-legacy/badges/dev/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer-legacy/badges/dev/coverage.svg?style=flat-square)|
|webapp|[data-lifecycle-manager](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/badges/develop/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/badges/develop/coverage.svg?style=flat-square)|
|webapp|[data-viewer-legacy](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer-legacy)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer-legacy/badges/dev/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer-legacy/badges/dev/coverage.svg?style=flat-square)|
|package|[components](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-components)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-components/badges/master/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-components/badges/master/coverage.svg?style=flat-square)|
|package|[ui-components](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-components)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-components/badges/master/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-components/badges/master/coverage.svg?style=flat-square)|
|package|[d3-charts](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-d3-charts)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-d3-charts/badges/master/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-d3-charts/badges/master/coverage.svg?style=flat-square)|
|package|[ui-header](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-header)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-header/badges/master/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-header/badges/master/coverage.svg?style=flat-square)|
|package|[ui-footer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-footer)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-footer/badges/master/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-footer/badges/master/coverage.svg?style=flat-square)|

# DevOps

## git-flow

see [git-flow](http://nvie.com/posts/a-successful-git-branching-model/)

## pipelines

> pipelines are defined in `.gitlab-ci.yml`, each repository has its own pipeline definition

### webapp

```mermaid
graph LR
    subgraph CI all branches
    setup --> unit-tests
    unit-tests --> build
    end
    subgraph CD only develop & master
    build --> release
    release --> deploy
    end
```

### package

```mermaid
graph LR
    subgraph CI all branches
    setup --> unit-tests
    unit-tests --> build
    end
    subgraph CD only tags*
    build --> publish
    end
```
*tags are only on commits in master

## kanban

```mermaid
graph TB
    subgraph REVIEW
    O[brainstorm specs] -->|clear specs| P{is production?}
    end
    
    subgraph IMPLEMENT branch
    P -->|no, branch out from develop| C[code]
    C -->|push commits| Z((CI pipeline))
    Z --> X{done and pass?}
    X -->|yes| G["create/update merge request"]
    X -->|no| C
    end
    
    subgraph PEER REVIEW branch
    G -->|pull locally| L[code review]
    L --> M{acceptable?}
    M -->|yes| I[apply merge request]
    M -->|no| C
    end
    
    subgraph QA develop
    I --> Y((CI and CD pipeline))
    Y --> Q{acceptable?}
    Q -->|no| O
    end
    
    subgraph RELEASE master
    Q -->|yes, merge develop into master| W((CI and CD pipeline))
    end
```

**legend:**
- rectangle: action
- circle: automated action
- diamond: decision

**notes:**
- REVIEW by JB and/or Mike and/or Dimitri and/or Nico
- IMPLEMENT by Mike, Dimitri or Nico
- PEER REVIEW by nico
- QA by JB
- release branches are used as buffers to avoid freezing develop when the release is big