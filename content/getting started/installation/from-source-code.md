---
title: Installation from source code
subtitle: 
comments: false
weight: 27
---

The three .Stat Suite main modules **Data Explorer**, **Data Lifecycle Manager** and **.Stat Core** or their components can be freely re-used to compose a new topology (system architecture) by anyone in its own infrastructure.

This section describes where to find and how to install .Stat Suite framework components (applications, services, libraries) starting from the source code.

For the general purpose of the .Stat Suite framework components and technical architecture, please refer to the [.Stat Suite Open Source Framework
Introduction](https://sis-cc.gitlab.io/dotstatsuite-documentation/getting-started/framework/).

---

### Source code of the components of each .Stat Suite main module  

The technical description of each of the services can be accessed from each Gitlab's repository:<br>

.Stat Data Explorer components

- [Data Explorer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer)
- [Data Viewer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer)
- [Share service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share)
- [Proxy](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy)
- [Configuration service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config)
- [Sdmx Search service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search)

.Stat Data Lifecycle Manager components

- [Data Lifecycle Manager](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager)

.Stat Core components

- [Database](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access)
- [Sdmxri Nsi plugin](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin)
- [Transfer service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer)

---

### Example topologies  

Installations for frequent usages of the .Stat Suite platform components are described below.  
More topologies will be added in the future as needed.


#### A) Installing the .Stat Suite platform full stack with one .Stat Core Data Store
This topology contains the full stack of .Stat Suite platform, including one instance of the .Stat Core Data Store and its SDMX API.  

![.Stat Suite full stack](/images/One_Internal_Space.png)

The installation must be done in the following order:  

**I. Install the .Stat Core components (.Stat Core Data Store)**  

1. [Install the Database layer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/blob/master/docs/installation/CodeBaseApproach.md). See [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-core-rp/blob/master/qa/mssql.yaml) for a topology configuration example.
1. [Install the SDMX/NSI web service with the .Stat Suite plugin](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/blob/develop/docs/installation/CodeBaseApproach.md). See [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-core-rp/blob/master/qa/nsi.yaml) for a topology configuration example.
1. [Install the Transfer service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/blob/develop/docs/installation/CodeBaseApproach.md). See [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-core-rp/blob/master/qa/transfer.yaml) for a topology configuration example.
1. [*to come*] [Install the Authentication Management service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management)

**II. Install the .Stat Data Explorer components**  

1. [Install the Configuration service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config). See [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp/blob/master/staging/config.yaml) for a topology configuration example.
1. [Install the Search service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search). See [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp/blob/master/staging/sfs.yaml) for a topology configuration example.
1. [Install the Share service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share). See [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp/blob/master/staging/share.yaml) for a topology configuration example.
1. [Install the Share Viewer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer). See [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp/blob/master/staging/data-viewer.yml) for a topology configuration example.
1. Optional for multi-tenant architectures: [Install the Proxy service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy). See [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp/blob/master/staging/proxy.yaml) for a topology configuration example.
1. [Install the Data Explorer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer). See [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp/blob/master/staging/data-explorer.yaml) for a topology configuration example.

**III. Install the .Stat Data Lifecycle Manager components**  

1. [Install the Data Lifecycle Manager](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager). Topology configuration example [*to come*].


#### B) Installing an instance of .Stat Data Explorer plugged to a existing SDMX web service
This topology contains all .Stat Data Explorer components to be plugged to an existing SDMX web service.  
**Pre-requisite**: a fully-functioning freely accessible (CORS-enabled, anonymous access enabled) SDMX end point is required.  

![.Stat Suite client-side](/images/External_SDMX.png)

Install these .Stat Data Explorer components in this order:

1. [Install the Configuration service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config). See [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp/blob/master/staging/config.yaml) for a topology configuration example.
1. [Install the Search service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search). See [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp/blob/master/staging/sfs.yaml) for a topology configuration example.
1. [Install the Share service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share). See [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp/blob/master/staging/share.yaml) for a topology configuration example.
1. [Install the Share Viewer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer). See [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp/blob/master/staging/data-viewer.yml) for a topology configuration example.
1. Optional for multi-tenant architectures: [Install the Proxy service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy). See [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp/blob/master/staging/proxy.yaml) for a topology configuration example.
1. [Install the Data Explorer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer). See [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp/blob/master/staging/data-explorer.yaml) for a topology configuration example.

---

**(beta) from artifacts**
*slightly different than the codebase approach; git is not mandatory anymore and side-effects related to dependencies are avoided*.

**pre-requisites:**

- (reminder) an accessible (CORS-enabled, anonymous access enabled) SDMX v6.x endpoint
- nodejs and npm installed
- git installed (https://gitforwindows.org/); only to enhance cmd.exe with git bash
- solr installed and running on port 8983 (default) with a core created with `solr create -c sdmx-facet-search` from solr console
- redis downloaded and running on port 6379 (default)

*notes:*

- solr core name can be freely picked, default configuration targets sdmx-facet-search
- ports can be freely picked, if different than defaults they should be specified when launching services

**1. setup**

1. (temporary) `npm i -g cross-env`
1. create folders as follow:
```
.
├── dotstatsuite
│   ├── config
│   ├── proxy
│   ├── search
│   ├── data-explorer
```

**2. config service**

1. download artifact archives and package.json file from gitlab:

- [setup](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/jobs/artifacts/develop/download?job=setup)
- [build](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/jobs/artifacts/develop/download?job=build)
- [package.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/raw/develop/package.json?inline=false)

2. extract archives and organize folders/files as follow:
```
.
├── dotstatsuite
│   ├── config
│   │   ├── node_modules                       # from setup artifact
│   │   ├── dist                               # from build artifact
│   │   ├── configs                            # see note a
│   │   │   ├── datasources.json               # datasources definition
│   │   │   ├── tenants.json                   # tenants definition
│   │   │   │   ├── <tenant_id>
│   │   │   │   │   ├── <app_id>
│   │   │   │   │   │   ├── i18n
│   │   │   │   │   │   ├── settings.json
│   │   ├── assets                             # see note b
│   │   │   ├── <tenant_id>
│   │   │   │   ├── <app_id>
│   │   │   │   │   │   ├── images
│   │   │   │   │   │   ├── styles*
│   │   ├── package.json
```

notes:

- a: [see configs samples here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/tree/develop/data/dev/configs)
- b: [see assets samples here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/tree/develop/data/dev/assets)

3. start the service:

- `SERVER_PORT=5007 npm run dist:run`
- (windows) `set SERVER_PORT=5007&&npm run dist:run`

4. check if everything is fine: http://localhost:5007/healthcheck








