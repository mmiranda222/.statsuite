---
title: "Infrastructure requirements"
subtitle: 
comments: false
weight: 35
keywords: [
  '.stat core data store', '#stat-core-data-store',
  '.stat data explorer', '#stat-data-explorer',
  '.stat data lifecycle manager', '#stat-data-lifecycle-manager',
  'ESTAT NSIWS version compatibility', '#estat-nsiws-version-compatibility',
]
---

#### Table of Content
- [.stat core data store](#stat-core-data-store)
- [.stat data explorer](#stat-data-explorer)
- [.stat data lifecycle manager](#stat-data-lifecycle-manager)
- [ESTAT NSIWS version compatibility](#estat-nsiws-version-compatibility)

---

### .Stat Core Data Store
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
- **nodejs 14.x** and **npm 6.14.x** installed
- **git** installed (https://gitforwindows.org/); only to use git bash instead of cmd.exe for process variables
- **solr 7.x** to **solr 8.7** (since [May 19, 2021 Release .Stat Suite JS 8.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#may-19-2021)) installed and running on port 8983 (default) with a core created with `solr create -c sdmx-facet-search` from solr console
- **redis 5.x** downloaded and running on port 6379 (default)
- **mongo 5.x** downloaded and running on port 27017 (default)

*notes:*  
- solr core name can be freely picked, default configuration targets sdmx-facet-search
- ports can be freely picked, if different than defaults they should be specified when launching services

> Generally speaking, we would recommend 2Go allocated Solr to have safety nets, and 1Go for redis should be enough.

---

### .Stat Data Lifecycle Manager
**pre-requisites**

- (reminder) an accessible (CORS-enabled, anonymous access enabled) **SDMX v7.x** endpoint
- **nodejs 14.x** and **npm 6.14.x** installed
- **git** installed (https://gitforwindows.org/); only to use git bash instead of cmd.exe for process variables
- **keycloak v7.x (minimum) - v12.0.4 (latest tested and recommended)** installed and running on port 8080 (default)
- **postgres 12.x** installed and running on port 5432 (default) or any other relational database usable by keycloak (for more information see [here](https://www.keycloak.org/docs/4.8/server_installation/#_database))

*notes:*

- keycloak realm name can be freely picked, default configuration targets oecd
- ports can be freely picked, if different than defaults they should be specified when launching services
- postgres is used as keycloak database in the qa and staging environments as well as in the default docker images, but it can be replaced with your own keycloak comptatible relational database

---

### ESTAT NSIWS version compatibility
Table of version compatibility of the Eurostat **NSI Web Service** (nsiws.net [public mirrored source-code](https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored)) with the **.Stat Suite** .NET and JavaScript services, and the **ISTAT Data and Meta Manager DMM** *- previously MDM -* ([public mirrored source-code](https://gitlab.com/sis-cc/istat-dmm)):

| ESTAT nsiws | .Stat Suite .NET | .Stat Suite JS | ISTAT DMM | 
|:-------------|:-------------|:-------------|:-------------|
| nsiws.net v8.12.2 | .NET "blueberry" | . | . |
| nsiws.net v8.9.2 | .NET 8.0.0, .NET 8.0.1, .NET 8.1.0, .NET "almond" | JS 13.0.0, JS 13.0.1, JS 14.0.0, JS "photon", JS "quark", JS "radio" | . |
| nsiws.net v8.8.0 | .NET 7.2.0 | JS 11.0.0, JS 12.0.0 | . |
| nsiws.net v8.7.1 | .NET 7.1.0 | . | . |
| nsiws.net v8.5.0 | .NET 7.0.0 | JS 9.0.2, JS 10.0.0 | . |
| nsiws.net v8.4.1 | . | . | MDM v.1.7.3 |
| nsiws.net v8.3.0 | . | JS 9.0.0 | . |
| nsiws.net v8.2.0 | .NET 6.4.0 | JS 8.0.0, JS 8.0.1 | . |
| nsiws.net v8.1.3 | .NET 6.3.0 | JS 8.0.0 | . |
| nsiws.net v8.1.2 | .NET 5.0.0, .NET 6.0.0,.NET 6.1.0, .NET 6.2.0 | JS 7.0.0, JS 7.1.0, JS 7.1.1, JS 7.2.0, JS 7.2.1, JS 8.0.0 | . |
| nsiws.net v7.13.2 | .NET 4.4.0 | JS 6.0.0, JS 6.1.0 | MDM v.1.4.0, MDM v.1.4.1, MDM v.1.5.0, MDM v.1.5.1, MDM v.1.5.6 |
| nsiws.net v7.13.1 | .NET 4.3.0  | JS 5.4.0 | . |

---

> **Disclaimer on ISTAT DMM**: This table is filled with information publicly available regarding the ISTAT DMM application (see source [here](https://github.com/SDMXISTATTOOLKIT/META-DATA.MANAGER)). No test has taken place, especially for checking compatibility in the configurations of the nsiws in .Stat Suite and DMM. These additional tests to take place under the aegis of the SIS-CC DMM User Group (see corresponding kanban board *- to be created soon -* to follow issues or file requests).
