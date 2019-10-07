---
title: Installation from code base
subtitle: 
comments: false
weight: 28
---

# Table of Content
- [intro](#intro)
- [code base of the components of each .stat suite main module](#code-base-of-the-components-of-each-stat-suite-main-module)
- [example topologies](#example-topologies)

### intro

The three .Stat Suite main modules **Data Explorer**, **Data Lifecycle Manager** and **.Stat Core** or their components can be freely re-used to compose a new topology (system architecture) by anyone in its own infrastructure.

This section describes where to find and how to install .Stat Suite framework components (applications, services, libraries) starting from the code base.

For the general purpose of the .Stat Suite framework components and technical architecture, please refer to the [.Stat Suite Open Source Framework
Introduction](https://sis-cc.gitlab.io/dotstatsuite-documentation/getting-started/framework/).

---

### Code base of the components of each .Stat Suite main module  

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
- [Authorisation management](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management)

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

>  See more about the **[Recommended infrastructure requirements](/getting-started/installation/infrastructure_requirements)** for all the **.Stat Core components** listed above; Including the **Transfer service**, **SDMX service** and **Authorisation service**. 

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
