---
title: Installation from source code
subtitle: 
comments: false
weight: 27
---

This section describes how to install .Stat Suite services from source code.

## Description of the Dotstatsuite components
The technical description of each of the components can be accessed from each Gitlab repository:<br>

- [Database](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/blob/master/README.md)
- [Sdmxri Nsi plugin](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/blob/master/readme.md)
- [Transfer service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/blob/master/README.md)
- *ToDo* [Proxy](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy/blob/master/README.md)
- *ToDo* [Configuration service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/blob/master/README.md)
- *ToDo* [Sdmx Search service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/blob/master/README.md)
- *ToDo* [Share service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/blob/master/README.md)
- *ToDo* [Data Explorer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/blob/master/README.md)
- *ToDo* [Data Viewer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/blob/master/README.md)
- *ToDo* [Data Lifecycle Manager](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/blob/master/README.md)



## Topologies
Most of the common topologies for for installing .Stat Suite services is described here.<br>
We explain the first and most frequent use cases for a set of servcies and applications, and we will continue to contribute to this section for each new use case we meet. 

### Installing the .Stat Suite full stack with one internal database
This topology contains the full .Stat Suite components' stack, including one internal dataspace (database).<br>

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

### Installing an instance of .Stat Data Explorer plugged to a pre-existing sdmx webservice
This topology contains the client-side services running the Data Explorer. As a **pre-requisite**, a pre-configured (public or internal) sdmx endpoint is available.<br>

![.Stat Suite client-side](/images/External_SDMX.png)

The installation must be done in the following order:<br>

1. [Install the Configuration service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/blob/develop/README.md)
2. [Install the Search service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/blob/develop/README.md)
3. [Install the Share service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/blob/develop/README.md)
3. [Install the Data Explorer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/blob/develop/README.md)

