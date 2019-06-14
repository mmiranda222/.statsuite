---
title: Installation from source code
subtitle: 
comments: false
weight: 27
---

This section describes how to install .Stat Suite services from source code.

### Description of the Dotstatsuite services
The technical description of each of the services can be accessed from each Gitlab's repository:<br>

- [Database](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/blob/master/README.md)
- [Sdmxri Nsi plugin](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/blob/master/readme.md)
- [Transfer service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/blob/master/README.md)
- [Proxy](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy/blob/develop/README.md)
- [Configuration service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/blob/develop/README.md)
- [Sdmx Search service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/blob/develop/README.md)
- [Share service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/blob/develop/README.md)
- [Data Explorer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/blob/develop/README.md)
- [Data Viewer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/blob/develop/README.md)
- [Data Lifecycle Manager](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/blob/develop/README.md)


###Topologies
The most common topologies for installing the .Stat Suite services is described below.<br>
We describe the more frequent use cases for running a set of services, and we will continue contributing to this section with each of the new use cases we meet. 

#### Installing the .Stat Suite full stack with one internal database
This topology contains the full stack of .Stat Suite services, including one internal dataspace (database).<br>

![.Stat Suite full stack](/images/One_Internal_Space.png)

The installation must be done in the following order: <br>

**I. Install the SDMX dataspace**<br>

1. [Install the Database](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/blob/master/docs/installation/CodeBaseApproach.md)
2. [Install the NSI webservice with the .Stat Suite plugin](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/blob/develop/docs/installation/CodeBaseApproach.md)
3. [Install the Transfer service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/blob/develop/docs/installation/CodeBaseApproach.md)

**II. Install the client-side services**<br>

1. [Install the Configuration service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/blob/develop/README.md)
2. [Install the Search service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/blob/develop/README.md)
3. [Install the Share service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/blob/develop/README.md)
3. [Install the Data Explorer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/blob/develop/README.md)
4. [Install the Data Lifecycle Manager](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/blob/develop/README.md)

#### Installing an instance of .Stat Data Explorer plugged to a pre-existing sdmx webservice
This topology contains the client-side services running for the Data Explorer. As a **pre-requisite**, a pre-configured (public or internal) sdmx endpoint is available.<br>

![.Stat Suite client-side](/images/External_SDMX.png)

The installation must be done in the following order:<br>

1. [Install the Configuration service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/blob/develop/README.md)
2. [Install the Search service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/blob/develop/README.md)
3. [Install the Share service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/blob/develop/README.md)
3. [Install the Data Explorer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/blob/develop/README.md)

