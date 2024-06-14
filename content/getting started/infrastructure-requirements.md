---
title: "Infrastructure requirements"
subtitle: 
comments: false
weight: 35
keywords: [
  '.stat core data store', '#stat-core-data-store',
  '.stat data explorer', '#stat-data-explorer',
  '.stat data lifecycle manager', '#stat-data-lifecycle-manager',
  'release compatibilities', '#release-compatibilities',
]
---
<!-- This page (or a sub-page or sub-section of this page) of the documentation is referenced as an external resource in the .Stat Academy:
* https://academy.siscc.org/installing-dotstat-suite/
Any change affecting its URL must be communicated to the .Stat Academy content admin in advance. -->

#### Table of Content
- [.Stat CORE data store](#stat-core-data-store)
- [.Stat Data Explorer](#stat-data-explorer)
- [.Stat Data Lifecycle Manager](#stat-data-lifecycle-manager)
- [Release compatibilities](#release-compatibilities)

---

### .Stat CORE data store
**Software requirements**

- **SQL Server** 
   - **Minimum required** SQL Server 2017 or above, all editions (including free SQL Express edition)
   - **Recommended** SQL Server 2019
- **IIS Web server 7\.5** or higher
- **Microsoft .NET Core 3\.1**
- **Microsoft SQL server management studio** (Optional)
- **Visual Studio 2019**.-Used only for compiling the solutions when doing a source code installation.

**Hardware requirements**  
Although the requirements could vary depending on the size of your data and the amount of users, for an installation of one **.Stat Core Data Store** (*[See sample topology](https://sis-cc.gitlab.io/dotstatsuite-documentation/install-source-code/source-code/#example-of-topologies)*), we suggest as a minimum the following requirements:  

- **Memory:** 16 GB
- **vCPUs:** 8 CPU @ 2.4 GHz
- **Disk:** 250 GB         

> As a general rule, we suggest to limit the amount of memory allocated to the MSSQL server; A maximum of 75% of the total memory should be allocated to MSSQL.
> Based on the recommended minimum requirements, MSSQL server should use at minimum 5GB, and a maximum of 10GB.

---

### .Stat Data Explorer
**pre-requisites**  

- (reminder) an accessible (CORS-enabled, anonymous access enabled) **SDMX v7.x** endpoint
- **nodejs 18.x** installed (https://nodejs.org/en/download/)
- **git** installed (https://gitforwindows.org/); only to use git bash instead of cmd.exe for process variables
- **solr** installed and running on port 8983 (default) with a core created with `solr create -c sdmx-facet-search` from solr console
- **redis** downloaded and running on port 6379 (default)
- **mongo** downloaded and running on port 27017 (default)

The latest compatible versions of Solr and Mongo are mentioned and available in the [docker compose setup file](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose/-/blob/master/demo/docker-compose-demo-js.yml?ref_type=heads) from which the release history can be retrieved.

*notes:*  
- solr core name can be freely picked, default configuration targets sdmx-facet-search
- ports can be freely picked, if different than defaults they should be specified when launching services

> Generally speaking, we would recommend 2Go allocated Solr to have safety nets, and 1Go for redis should be enough.

---

### .Stat Data Lifecycle Manager
**pre-requisites**

- (reminder) an accessible (CORS-enabled, anonymous access enabled) **SDMX v7.x** endpoint
- **nodejs 18.x** installed (https://nodejs.org/en/download/)
- **git** installed (https://gitforwindows.org/); only to use git bash instead of cmd.exe for process variables
- **keycloak v7.x (minimum) - v12.0.4 (latest tested and recommended)** installed and running on port 8080 (default)
- **postgres 12.x** installed and running on port 5432 (default) or any other relational database usable by keycloak (for more information see [here](https://www.keycloak.org/docs/4.8/server_installation/#_database))

*notes:*

- keycloak realm name can be freely picked, default configuration targets oecd
- ports can be freely picked, if different than defaults they should be specified when launching services
- postgres is used as keycloak database in the qa and staging environments as well as in the default docker images, but it can be replaced with your own keycloak comptatible relational database

---

### Release compatibilities
*Moved to the [changelog section](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/)*
