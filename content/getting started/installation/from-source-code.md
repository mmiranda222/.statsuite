---
title: Installation from source code
subtitle: 
comments: false
weight: 27
---

The three .Stat Suite main modules **Data Explorer**, **Data Lifecycle Manager** and **.Stat Core** or their components can be freely re-used to compose a new topology (system architecture) by anyone in its own infrastructure.

This section describes where to find and how to install .Stat Suite framework components (applications, services, libraries) starting from the source code.

For the general purpose of the .Stat Suite framework components and technical architecture, please refer to the [.Stat Suite Open Source Framework
Introduction](https://sis-cc.gitlab.io/dotstatsuite-documentation/getting-started/framework/)

### Description of the Dotstatsuite services
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


### Topologies
Installations for frequent usages of the .Stat Suite platform components are described below.  
More topologies will be added in the future as needed.


#### A) Installing the .Stat Suite platform full stack with one .Stat Core Data Store
This topology contains the full stack of .Stat Suite services, including one instance of the .Stat Core Data Store and its SDMX API.  

![.Stat Suite full stack](/images/One_Internal_Space.png)

The installation must be done in the following order:  

**I. Install the SDMX dataspace**  

1. [Install the Database layer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/blob/master/docs/installation/CodeBaseApproach.md)
2. [Install the SDMX/NSI web service with the .Stat Suite plugin](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/blob/develop/docs/installation/CodeBaseApproach.md)
3. [Install the Transfer service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/blob/develop/docs/installation/CodeBaseApproach.md)

**II. Install the client-side services**<br>

1. [Install the Configuration service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/blob/develop/README.md)
2. [Install the Search service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/blob/develop/README.md)
3. [Install the Share service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/blob/develop/README.md)
3. [Install the Data Explorer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/blob/develop/README.md)
4. [Install the Data Lifecycle Manager](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/blob/develop/README.md)

#### B) Installing an instance of .Stat Data Explorer plugged to a pre-existing sdmx webservice
This topology contains the client-side services running for the Data Explorer. As a **pre-requisite**, a pre-configured (public or internal) sdmx endpoint is available.<br>

![.Stat Suite client-side](/images/External_SDMX.png)

The installation must be done in the following order:<br>

1. [Install the Configuration service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/blob/develop/README.md)
2. [Install the Search service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/blob/develop/README.md)
3. [Install the Share service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/blob/develop/README.md)
3. [Install the Data Explorer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/blob/develop/README.md)

