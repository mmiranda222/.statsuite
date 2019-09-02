---
title: .Stat DevOps implementation
subtitle: 
comments: false
weight: 20
---

## business requirements

### quality assurance (**qa**) environment

- Automated update triggered by **Dev** branch merge (part of “peer-review” Kanban step) 
- Used by **Product Management team** to:
  -	directly test through API/Swagger candidate .Stat CORE services:
    - **NSI ws with stable content** (upgraded database) called 'stable'
    - **NSI ws with re-initialised content** (new database) called 'reset'
    - **Transfer ws**
    - **Authorisation ws**
  - test **'PM' tenant**  of candidate **DE** plugged to: 
    - SIS-CC Demo-related staging instance of NSI ws with stable content (upgraded database) called 'SIS-CC-stable' 
    - SIS-CC Demo-related staging instance of NSI ws with re-initialised content (new database) called 'SIS-CC-reset'
  - test **'PM' tenant**  of candidate **DLM** plugged to: 
    - SIS-CC Demo-related staging instance of NSI ws with stable content (upgraded database) called 'SIS-CC-stable' 
    - SIS-CC Demo-related staging instance of NSI ws with re-initialised content (new database) called 'SIS-CC-reset'
    - SIS-CC Demo-related staging instance of Transfer ws
    - SIS-CC Demo-related staging instance of Authorisation ws


### pre-production (**staging**) environment

- Automated update triggered by **Master** branch merge (part of “release” Kanban step)
- Hosting stable instances for **OECD Practice Building team** of: 
  - **NSI ws with stable content** (upgraded database) called 'OECD-design'
  - **NSI ws with stable content** (upgraded database) called 'OECD-staging'
  - **Transfer ws**
  - **Authorisation ws**
  - **'OECD' tenant** of **DE** plugged to:
    - stable NSI ws with stable content (upgraded database) called 'OECD-design'
    - stable NSI ws with stable content (upgraded database) called 'OECD-staging'
  - **'OECD' tenant** of **DLM** plugged to:
    - stable NSI ws with stable content (upgraded database) called 'OECD-design'
    - stable NSI ws with stable content (upgraded database) called 'OECD-staging'
    - stable Transfer ws
    - stable Authorisation ws
- Hosting stable instances for SIS-CC (for Demo purposes) of:
  - **NSI ws with stable content** (upgraded database) called 'SIS-CC-stable'
  - **NSI ws with re-initialised content** (new  database) called 'SIS-CC-reset'
  - **Transfer ws**
  - **Authorisation ws**
  - **'SIS-CC' tenant** of **DE** plugged to:
    - stable NSI ws with stable content (upgraded database) called 'SIS-CC-stable'
    - stable NSI ws with re-initialised content (new  database) called 'SIS-CC-reset'
  - **'SIS-CC' tenant** of **DLM** plugged to:
    - stable NSI ws with stable content (upgraded database) called 'SIS-CC-stable'
    - stable NSI ws with re-initialised content (new  database) called 'SIS-CC-reset'
    - stable Transfer ws
    - stable Authorisation ws
- Other tenants of DE and DLM for specific SIS-CC members 
  - either plugged to their own SDMX APIs (currently we have ILO and ISTAT)
  - or plugged into above mentioned SIS-CC Demo-related instances of .Stat CORE services


## technical environment (cloud)
* .Stat Data Explorer components
  - 1 cluster of 3 nodes with 2 namespaces (qa and staging) on google cloud platform
  - https
  - probes
  - kubernetes, how to update topology, not automated
  - repository: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp
    - holds kubernetes configuration files
* .Stat Core components
  - 1 cluster of 3 nodes with 2 namespaces (qa and staging) on google cloud platform
  - https
  - probes
  - kubernetes, how to update topology, not automated
  - repository: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-core-rp
    - holds kubernetes configuration files
* .Stat Data Lifecycle Manager components
  - [*to come*]


## flow
![devops flow](/images/devops_flow.png)

<!---```mermaid
graph TB
id0[gitlab repositories]
id1[gitlab pipelines]
id2[docker registry]
id4[kubernetes cluster]
id5[dotstatsuite-kube-rp]
id6[kubectl]
id7((developer))
id9((admin))

id7 -> id0
id0 ->|1. push code| id1
id1 ->|2. push image| id2
id1 ->|3. connect gcloud| id6
id6 ->|4. deploy image| id4
id9 ->|A. connect gcloud| id6
id6 ->|B. update topology| id4
id9 ->|C. push code| id5
id2 -. pull image .-> id4
id5 -. pull code .-> id4
```--->

## mapping
|env|git branch|cluster namespace|
|---|---|---|
|qa|develop|qa|
|staging|master|staging|

## git
- see [git-flow](http://nvie.com/posts/a-successful-git-branching-model/)

## gitlab
- all repositories are under https://gitlab.com/sis-cc/.stat-suite
- each repository defines its pipelines in `gitlab-ci.yml` file
- 2 types of pipeline:

![gitlab pipelines](/images/gitlab_pipelines.png)

<!---webapp/service
```mermaid
graph LR
subgraph CI all branches
setup -> unit-tests
unit-tests -> build
end
subgraph CD only develop & master
build -> release
release -> deploy
end
```

npm/nuget package
```mermaid
graph LR
subgraph CI all branches
setup -> unit-tests
unit-tests -> build
end
subgraph CD only tags*
build -> publish
end
```--->

## npm
- npm packages are published under https://www.npmjs.com/settings/sis-cc/packages
- tags are only on commits in master and trigger a publish

## nuget
- nuget packages are published under https://www.nuget.org/profiles/SIS-CC
- tags are only on commits in master and trigger a publish
- this page provides information about [Usage of semantic versioning in .Stat Suite CORE components and services](semantic-version)

## list of webapps/services/packages
|kind|name|status master|status dev|coverage|
|---|---|---|---|---|
|infra|[kubernetes de](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp)|-|-|-|
|infra|[kubernetes core](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-core-rp)|-|-|-|
|-|-|-|-|-|
|service|[config](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/badges/master/build.svg?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/badges/develop/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/badges/develop/coverage.svg?style=flat-square)|
|service|[sdmx-faceted-search](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/badges/master/build.svg?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/badges/develop/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/badges/develop/coverage.svg?style=flat-square)|
|service|[proxy](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy/badges/master/build.svg?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy/badges/develop/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy/badges/develop/coverage.svg?style=flat-square)|
|service|[share](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/badges/master/build.svg?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/badges/develop/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/badges/develop/coverage.svg?style=flat-square)|
|-|-|-|-|-|
|service|[core-auth-management](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/badges/master/build.svg?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/badges/develop/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/badges/develop/coverage.svg?style=flat-square)|
|service|[core-transfer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/badges/master/build.svg?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/badges/develop/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/badges/develop/coverage.svg?style=flat-square)|
|-|-|-|-|-|
|webapp|[data-explorer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/badges/master/build.svg?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/badges/develop/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/badges/develop/coverage.svg?style=flat-square)|
|webapp|[data-viewer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/badges/master/build.svg?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/badges/develop/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/badges/develop/coverage.svg?style=flat-square)|
|webapp|[data-lifecycle-manager](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/badges/master/build.svg?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/badges/develop/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/badges/develop/coverage.svg?style=flat-square)|
|webapp|[chart-generator-legacy](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-chart-generator-legacy)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-chart-generator-legacy/badges/master/build.svg?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-chart-generator-legacy/badges/dev/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-chart-generator-legacy/badges/dev/coverage.svg?style=flat-square)|
|-|-|-|-|-|
|package|[ui-footer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-footer)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-footer/badges/master/build.svg?style=flat-square)|-|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-footer/badges/master/coverage.svg?style=flat-square)|
|package|[ui-header](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-header)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-header/badges/master/build.svg?style=flat-square)|-|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-header/badges/master/coverage.svg?style=flat-square)|
|package|[components](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-components)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-components/badges/master/build.svg?style=flat-square)|-|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-components/badges/master/coverage.svg?style=flat-square)|
|package|[ui-components](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-components)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-components/badges/master/build.svg?style=flat-square)|-|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-components/badges/master/coverage.svg?style=flat-square)|
|package|[d3-charts](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-d3-charts)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-d3-charts/badges/master/build.svg?style=flat-square)|-|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-d3-charts/badges/master/coverage.svg?style=flat-square)|
|-|-|-|-|-|
|package|[core-data-access](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/badges/master/build.svg?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/badges/develop/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/badges/develop/coverage.svg?style=flat-square)|
|package|[core-common](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/badges/master/build.svg?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/badges/develop/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/badges/develop/coverage.svg?style=flat-square)|
|package|[core-sdmxri-nsi-plugin](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/badges/master/build.svg?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/badges/develop/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/badges/develop/coverage.svg?style=flat-square)|

