# Frontend Manifest
> Dashboard for dotstatsuite applications and components, gitlab `Operations` only works for public repositories.

> [architecture description](https://gitlab.com/snippets/1847834)

> [List of front-end repositories](https://gitlab.com/dashboard/projects?tag=front-end).

> Sandbox (only within the OECD): [data-lifecycle-manager](http://vs-dotstattest.main.oecd.org/FrontEndDemo/sandbox/data-lifecycle-manager) - [chart-generator](http://vs-dotstattest.main.oecd.org/FrontEndDemo/sandbox/chart-generator)

|kind|name|status|coverage|
|---|---|---|---|
|infra|[kubernetes](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp)|-|-|
|-|-|-|-|
|service|[config](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/badges/develop/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/badges/develop/coverage.svg?style=flat-square)|
|service|[sdmx-faceted-search](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/badges/develop/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/badges/develop/coverage.svg?style=flat-square)|
|service|[proxy](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy/badges/develop/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy/badges/develop/coverage.svg?style=flat-square)|
|service|[share](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/badges/develop/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/badges/develop/coverage.svg?style=flat-square)|
|-|-|-|-|
|webapp|[data-explorer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/badges/develop/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/badges/develop/coverage.svg?style=flat-square)|
|webapp|[data-explorer-legacy](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer-legacy)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer-legacy/badges/dev/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer-legacy/badges/dev/coverage.svg?style=flat-square)|
|webapp|[data-lifecycle-manager](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/badges/develop/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/badges/develop/coverage.svg?style=flat-square)|
|webapp|[data-viewer-legacy](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer-legacy)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer-legacy/badges/dev/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer-legacy/badges/dev/coverage.svg?style=flat-square)|
|webapp|[chart-generator-legacy](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-chart-generator-legacy)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-chart-generator-legacy/badges/dev/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-chart-generator-legacy/badges/dev/coverage.svg?style=flat-square)|
|-|-|-|-|
|package|[ui-footer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-footer)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-footer/badges/master/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-footer/badges/master/coverage.svg?style=flat-square)|
|package|[ui-header](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-header)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-header/badges/master/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-header/badges/master/coverage.svg?style=flat-square)|
|package|[components](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-components)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-components/badges/master/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-components/badges/master/coverage.svg?style=flat-square)|
|package|[ui-components](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-components)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-components/badges/master/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-components/badges/master/coverage.svg?style=flat-square)|
|package|[d3-charts](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-d3-charts)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-d3-charts/badges/master/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-d3-charts/badges/master/coverage.svg?style=flat-square)|

## kanban

### flow
```mermaid
graph TB
    subgraph 1 REVIEW
    O[brainstorm specs] -->|clear specs| P{production?}
    end
    
    subgraph 2 IMPLEMENT branch
    P -->|no, branch out from develop| C[code]
    P -->|yes, branch out from master| C[code]
    C -->|push commits| Z((CI pipeline))
    Z --> X{done and pass?}
    X -->|yes| G["create/update merge request"]
    X -->|no| C
    end
    
    subgraph 3 PEER REVIEW branch
    G -->|pull locally| L[code review]
    L --> M{acceptable?}
    M -->|yes| id4{production?}
    id4 -->|no| id5[apply merge request to develop]
    id4 -->|yes| id6[apply merge request to master]
    M -->|no| C
    end
    
    subgraph 4 QA develop
    id5 --> Y((CI and CD pipeline))
    Y --> J[feature review]
    J --> Q{acceptable?}
    Q -->|no| O
    end
    
    subgraph 5 RELEASE master
    Q -->|yes, merge develop into master| W((CI and CD pipeline))
    id6 --> W
    W --> U[monitor]
    U --> id1{acceptable?}
    id1 -->|yes| id7{production?}
    id7 -->|yes| id5
    id7 -->|no| O
    id1 -->|no| id2[rollback]
    id2 --> O
    end
```

### summary
|index|step|actions|decisions|git branch|who|
|---|---|---|---|---|---|
|1|review|brainstorm specs| is production?|-|JB+FE team|
|2|implement|code, handle merge request|is done?|feature|FE team|
|3|peer review|code review, apply merge request|is acceptable?|feature|nico|
|4|qa|feature review|is acceptable?|develop|JB|
|5|release|monitor, rollback|is acceptable?|master|JB+nico|
