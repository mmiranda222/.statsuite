---
title: "Full installation from source code"
subtitle: 
comments: false
weight: 43
---

#### Table of Content
- [intro](#intro)
- [Source code of each component of the main .Stat Suite modules](#source-code-of-each-component-of-the-main-stat-suite-modules)
- [example of topologies](#example-of-topologies)

---

## Intro

The three main .Stat Suite modules **Data Explorer**, **Data Lifecycle Manager** and **.Stat Core** or their components can be freely re-used to compose a new topology (system architecture) by anyone on their own infrastructure.

This section describes where to find and how to install .Stat Suite framework components (applications, services, libraries) starting from the source code.

For the general purpose of the .Stat Suite framework components and technical architecture, please refer to the [.Stat Suite Open Source Framework
Introduction](https://sis-cc.gitlab.io/dotstatsuite-documentation/getting-started/framework/).

---
## Source code of each component of the main .Stat Suite modules  

The technical description of each service can be accessed from each Gitlab's repository:<br>

JavaScript components
- [Data Explorer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer)
- [Data Lifecycle Manager](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager)
- [Data Viewer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer)
- [Share service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share)
- [Proxy](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy)
- [Configuration service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config)
- [Sdmx Search service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search)

.NET/SQL (Core) components
- [Database](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access)
- [Sdmxri Nsi plugin](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin)
- [Transfer service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer)
- [Authorisation management](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management)
---

## Example of topologies  

Installations for frequent usages of the .Stat Suite are described below.  
More topologies will be added in the future.


### Installing the .Stat Suite full stack with one tenant
This topology contains the full stack of .Stat Suite.

![.Stat Suite full stack](/images/full_architecture.png)

The installation must performed in the following order:  

#### **I. Install the .Stat Core components (.Stat Core Data Store)**  

1. [Install the Database layer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/blob/master/docs/installation/CodeBaseApproach.md). See [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-core-rp/blob/master/qa/mssql.yaml) for a topology configuration example.
1. [Install the SDMX/NSI web service with the .Stat Suite plugin](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/blob/develop/docs/installation/CodeBaseApproach.md). See [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-core-rp/blob/master/qa/nsi.yaml) for a topology configuration example.
1. [Install the Transfer service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/blob/develop/docs/installation/CodeBaseApproach.md). See [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-core-rp/blob/master/qa/transfer.yaml) for a topology configuration example.
1. [*to come*] [Install the Authentication Management service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management)

>  See more about the **[Recommended infrastructure requirements](/getting-started/infrastructure-requirements)** for all the **.Stat Core components** listed above; Including the **Transfer service**, **SDMX service** and **Authorisation service**. 

#### **II. Install the .Stat Data Suite components**  

1. [Install the Configuration service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config). See [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp/blob/master/staging/config.yaml) for a topology configuration example.
1. [Install the Search service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search). See [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp/blob/master/staging/sfs.yaml) for a topology configuration example.
1. [Install the Share service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share). See [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp/blob/master/staging/share.yaml) for a topology configuration example.
1. [Install the Share Viewer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer). See [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp/blob/master/staging/data-viewer.yml) for a topology configuration example.
1. Optional for multi-tenant architectures: [Install the Proxy service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy). See [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp/blob/master/staging/proxy.yaml) for a topology configuration example.
1. [Install the Data Explorer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer). See [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp/blob/master/staging/data-explorer.yaml) for a topology configuration example.
1. [Install the Data LifeCycle Manager](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager). See [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp/blob/master/staging/data-lifecycle-manager.yaml) for a topology configuration example.


