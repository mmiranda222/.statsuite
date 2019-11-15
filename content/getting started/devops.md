---
title: ".Stat DevOps implementation"
subtitle: 
comments: false
weight: 33
---

# Table of Content
- [open-source development business requirements](#open-source-development-business-requirements)
- [technical stack](#technical-stack)
- [technical environment (cloud)](#technical-environment-cloud)
- [flow](#flow)
- [process](#process)
- [mapping](#mapping)
- [git](#git)
- [gitlab](#gitlab)
- [npm](#npm)
- [nuget](#nuget)
- [list of webapps/services/packages](#list-of-webapps-services-packages)

## open-source development business requirements

### quality assurance (**qa**) environment

- Automated update triggered by **Dev** branch merge (part of “peer-review” Kanban step) 
- Used by **Product Management team** to:  
  -	directly test through API/Swagger/Postman candidate .Stat CORE services:  
    ° [**NSI ws with stable content** (upgraded database) called 'stable'](http://nsi-stable-qa-oecd.redpelicans.com/)  
    ° [**NSI ws with re-initialised content** (new database) called 'reset'](http://nsi-reset-qa-oecd.redpelicans.com/)  
    ° [**Transfer ws**](http://transfer-qa-oecd.redpelicans.com/swagger/index.html)  
    ° [**Authorisation ws**](http://authz-qa-oecd.redpelicans.com/swagger/index.html)  
  - test [**'PM' tenant**  of candidate **DE**](http://de-qa-oecd.redpelicans.com/) plugged to:  
    ° SIS-CC Demo-related staging instance of NSI ws with stable content (upgraded database) called 'SIS-CC-stable'   
    ° SIS-CC Demo-related staging instance of NSI ws with re-initialised content (new database) called 'SIS-CC-reset'  
  - test [**'PM' tenant**  of candidate **DLM**](http://dlm-qa-oecd.redpelicans.com/) plugged to:  
    ° SIS-CC Demo-related staging instance of NSI ws with stable content (upgraded database) called 'SIS-CC-stable'   
    ° SIS-CC Demo-related staging instance of NSI ws with re-initialised content (new database) called 'SIS-CC-reset'  
    ° SIS-CC Demo-related staging instance of Transfer ws  
    ° SIS-CC Demo-related staging instance of Authorisation ws  
- Other links:
  - [User identity management](http://keycloak.qa.oecd.redpelicans.com)
  - [Share ws](http://share-qa-oecd.redpelicans.com/healthcheck)
  - [Search ws](http://sfs-qa-oecd.redpelicans.com/healthcheck)
  - [Data viewer app](http://dv-qa-oecd.redpelicans.com/)

### pre-production (**staging**) environment

- Automated update triggered by **Master** branch merge (part of “release” Kanban step)
- Hosting stable instances for **OECD Practice Building team** of: 
  - [**NSI ws with stable content** (upgraded database) called 'OECD-design'](http://nsi-design-oecd.redpelicans.com/)
  - [**NSI ws with stable content** (upgraded database) called 'OECD-staging'](http://nsi-staging-oecd.redpelicans.com/)
  - [**Transfer ws**](http://transfer-siscc.redpelicans.com/swagger)
  - [**Authorisation ws**](http://authz-siscc.redpelicans.com/swagger)
  - **'OECD' tenant** of **DE** plugged to:  
    ° stable NSI ws with stable content (upgraded database) called 'OECD-design'  
    ° stable NSI ws with stable content (upgraded database) called 'OECD-staging'  
  - **'OECD' tenant** of **DLM** plugged to:  
    ° stable NSI ws with stable content (upgraded database) called 'OECD-design'  
    ° stable NSI ws with stable content (upgraded database) called 'OECD-staging'  
    ° stable Transfer ws  
    ° stable Authorisation ws  
- Hosting stable instances for **SIS-CC (for Demo purposes)** of:
  - [**NSI ws with stable content** (upgraded database) called 'SIS-CC-stable'](http://nsi-stable-siscc.redpelicans.com/)
  - [**NSI ws with re-initialised content** (new  database) called 'SIS-CC-reset'](http://nsi-reset-siscc.redpelicans.com/)
  - [**Transfer ws**](http://transfer-siscc.redpelicans.com/swagger)
  - [**Authorisation ws**](http://authz-siscc.redpelicans.com/swagger)
  - **'SIS-CC' tenant** of **DE** plugged to:  
    ° stable NSI ws with stable content (upgraded database) called 'SIS-CC-stable'  
    ° stable NSI ws with re-initialised content (new  database) called 'SIS-CC-reset'  
  - **'SIS-CC' tenant** of **DLM** plugged to:  
    ° stable NSI ws with stable content (upgraded database) called 'SIS-CC-stable'  
    ° stable NSI ws with re-initialised content (new  database) called 'SIS-CC-reset'  
    ° stable Transfer ws  
    ° stable Authorisation ws  
- Other tenants of DE and DLM for specific SIS-CC members 
  - either plugged to their own SDMX APIs (currently we have ILO and ISTAT)
  - or plugged into above mentioned SIS-CC Demo-related instances of .Stat CORE services

## technical stack

The following technologies and cloud services are used for the DevOps implementation:

<table>
<thead>
<tr>
<td align="center" colspan=5><a href="https://docs.gitlab.com/ee/ci/pipelines.html">gitlab: open-source code repository and automation pipelines</a></td>
</tr>
<tr>
<td align="center" colspan=5><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/GitLab_Logo.svg/1108px-GitLab_Logo.svg.png" height="40" /></td>
</tr>
</thead>
<tbody>
<tr>
<td align="center"><a href="https://www.npmjs.com">npmjs: public JS libary repositories</a></td">
<td align="center"><a href="https://www.nuget.org/">nuget: public .Net Core library repositories</a></td>
<td align="center"><a href="https://www.docker.com">docker-hub: public JS & .Net Core application container image repositories</a></td>
<td align="center"><a href="https://cloud.google.com">gcp: hosting public qa & staging infrastructure</a></td>
<td align="center"><a href="https://kubernetes.io">kubernetes: container deployment orchestration</a></td>
</tr>
<tr>
<td align="center"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Npm-logo.svg/1280px-Npm-logo.svg.png" height="40" /></td>
<td align="center"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/NuGet_project_logo.svg/220px-NuGet_project_logo.svg.png" height="40" /></td>
<td align="center"><img src="https://www.usine-digitale.fr/mediatheque/5/3/8/000277835_homePageUne/docker.jpg" height="40" /></td>
<td align="center"><img src="https://www.pinclipart.com/picdir/middle/54-541486_google-cloud-platform-svg-clipart.png" height="40" /></td>
<td align="center"><img src="https://upload.wikimedia.org/wikipedia/en/0/00/Kubernetes_%28container_engine%29.png" height="40" /></td>
</tr>
</tbody>
</table>


## technical environment (cloud)

* .Stat Data Explorer components and .Stat Data Lifecycle Manager
  - 1 cluster of 3 nodes with 2 namespaces (qa and staging) on google cloud platform
  - https
  - probes
  - kubernetes, how to update topology, not automated
  - repository: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp  
    ° holds kubernetes configuration files
* .Stat Core components
  - 1 cluster of 3 nodes with 2 namespaces (qa and staging) on google cloud platform
  - https
  - probes
  - kubernetes, how to update topology, not automated
  - repository: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-core-rp  
    ° holds kubernetes configuration files

---


## flow

{{< mermaid align="left" >}}
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
{{< /mermaid >}}

## process

{{< mermaid align="left" >}}
graph TD;
id0((peer-reviewer/code guard));
id1[gitlab application repository: dev branch];
id2[gitlab application repository: master branch];
id4[gitlab library repository: master branch];
id5[gitlab application repository: pipeline];
id6[gitlab library repository: pipeline];
id7[test environment];
id8[library registry npm/nuget];
id9[docker registry];
id10[kubernetes cluster: qa environment];
id14[kubernetes cluster: staging environment];
id11[gitlab dotstatsuite-kube-rp/dotstatsuite-kube-core-rp repositories: master branch]
id12[kubectl]
id13((admin))
id0 ->|A1. merge code| id4;
id0 ->|B1. merge code| id1;
id0 ->|C1. merge code| id2;
id4 ->|A2. triggers launch| id6;
id1 ->|B2. triggers launch| id5;
id2 ->|C2. triggers launch| id5;
id6 ->|A4. create & push package| id8;
id6 ->|A3. build, test| id7;
id5 ->|BC3. build, test| id7;
id5 ->|BC4. create & push docker image| id9;
id5 ->|BC5. connect gcloud| id12
id12 ->|B6. deploy image| id10
id13 ->|1. connect gcloud| id12
id12 ->|2. update topology| id10
id13 ->|3. push code| id11
id8 -. pull package .-> id10
id9 -. pull image .-> id10
id11 -. pull code .-> id10
id12 ->|C6. deploy image| id14
id12 ->|2. update topology| id14
id8 -. pull package .-> id14
id9 -. pull image .-> id14
id11 -. pull code .-> id14
{{< /mermaid >}}


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

webapp/service<br>

{{< mermaid align="left" >}}
graph LR
subgraph CI all branches
setup -> unit-tests
unit-tests -> build
end
subgraph CD only develop & master
build -> release
release -> deploy
end
{{< /mermaid >}}

npm/nuget package<br>

{{< mermaid align="left" >}}
graph LR
subgraph CI all branches
setup -> unit-tests
unit-tests -> build
end
subgraph CD only tags*
build -> publish
end
{{< /mermaid >}}

## npm
- npm packages are published under https://www.npmjs.com/settings/sis-cc/packages
- tags are only on commits in master and trigger a publish

## nuget
- nuget packages are published under https://www.nuget.org/profiles/SIS-CC
- tags are only on commits in master and trigger a publish
- this page provides information about [Usage of semantic versioning in .Stat Suite CORE components and services](/getting-started/semantic-version)

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
|package|[sdmxjs](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmxjs)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmxjs/badges/master/build.svg?style=flat-square)|-|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmxjs/badges/master/coverage.svg?style=flat-square)|
|package|[visions](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions/badges/master/build.svg?style=flat-square)|-|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions/badges/master/coverage.svg?style=flat-square)|
|-|-|-|-|-|
|package|[core-data-access](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/badges/master/build.svg?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/badges/develop/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/badges/develop/coverage.svg?style=flat-square)|
|package|[core-common](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/badges/master/build.svg?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/badges/develop/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/badges/develop/coverage.svg?style=flat-square)|
|package|[core-sdmxri-nsi-plugin](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/badges/master/build.svg?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/badges/develop/build.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/badges/develop/coverage.svg?style=flat-square)|

