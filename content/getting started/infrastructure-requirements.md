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
- **nodejs 14.x** and **npm 6.14.x** installed
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
- **nodejs 14.x** and **npm 6.14.x** installed
- **git** installed (https://gitforwindows.org/); only to use git bash instead of cmd.exe for process variables
- **keycloak v7.x (minimum) - v12.0.4 (latest tested and recommended)** installed and running on port 8080 (default)
- **postgres 12.x** installed and running on port 5432 (default) or any other relational database usable by keycloak (for more information see [here](https://www.keycloak.org/docs/4.8/server_installation/#_database))

*notes:*

- keycloak realm name can be freely picked, default configuration targets oecd
- ports can be freely picked, if different than defaults they should be specified when launching services
- postgres is used as keycloak database in the qa and staging environments as well as in the default docker images, but it can be replaced with your own keycloak comptatible relational database

---

### Release compatibilities
Table of version compatibility of the **.Stat Suite JS** releases (Data Explorer and Data Lifecycle Manager) with **.Stat Suite CORE** releases and the underlying Eurostat **NSI Web Service** (nsiws.net [public mirrored source-code](https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored)):

<div style="display: inline-block; width: 100%; height: 31em; border: 1px solid #888; overflow-y: auto; overflow-x: auto;" markdown="block">

| Release <br/>&nbsp;<br/>&nbsp;DE/DLM | CORE<br/>NSI<br/>Date | [gingerbread](/dotstatsuite-documentation/changelog/#december-6-2023) <br/> 8.18.7 <br/> 06‑Dec‑23 | <font color="Orange">[funfetti](/dotstatsuite-documentation/changelog/#october-11-2023) <br/> 8.18.4 <br/> 11‑Oct‑23</font> | [elote](/dotstatsuite-documentation/changelog/#september-1-2023) <br/> 8.18.2 <br/> 01‑Sep‑23 | <font color="Orange">[dragonfruit](/dotstatsuite-documentation/changelog/#july-4-2023) <br/> 8.17.0 <br/> 04‑Jul‑23</font> | [cinnamon](/dotstatsuite-documentation/changelog/#june-12-2023) <br/> 8.13.0 <br/> 12‑Jun‑23 | blueberry <br/> 8.12.2 <br/> 11‑Nov‑22 | almond <br/> 8.9.2 <br/> 02‑Aug‑22 |
|:---------------------------------------------------------------------:|:-------------:|:-----------:|:---------:|:---------:|:---------:|:---------:|:---------:|:---------:|
| [**yay**](/dotstatsuite-documentation/changelog/#january-10-2024)     | **10‑Jan‑23** | ok          | (ok)      |           |           |           |           |           |
| [**xray**](/dotstatsuite-documentation/changelog/#october-18-2023)    | **18‑Oct‑23** |             |           | ok        | (ok)      |           |           |           |
| [**wave**](/dotstatsuite-documentation/changelog/#august-03-2023)     | **03‑Aug‑23** |             |           | (ok)      | ok        |           |           |           |
| [**virtual**](/dotstatsuite-documentation/changelog/#july-20-2023)    | **20‑Jul‑23** |             |           | (ok)      | ok        |           |           |           |
| [**unicorn**](/dotstatsuite-documentation/changelog/#june-28-2023)    | **28‑Jun‑23** |             |           |           |           | ok&nbsp;(NSI&nbsp;8.15.1) | (ok)      | (ok)      |
| [**tachyon**](/dotstatsuite-documentation/changelog/#january-17-2023) | **17‑Jan‑23** |             |           |           |           | ok        | (ok)      | (ok)      |
| **spin**    | **05‑Dec‑22** |             |           |           |           | (ok)      | ok        | (ok)      |
| **radio**   | **31‑Oct‑22** |             |           |           |           | (ok)      | ok        | ok        |
| **quark**   | **16‑Aug‑22** |             |           |           |           | (ok)      | (ok)      | ok        |
| **photon**  | **12‑May‑22** |             |           |           |           | (ok)      | (ok)      | ok        |

</div>

Legend:
- <font color="Orange">Orange release</font>: Includes a non-backward-compatible change
- ok: Has been tested by .Stat Suite core dev team
- (ok): Is supposed to be compatble, but has not been tested by the .Stat Suite core dev team

Note:  
According to our release policies, hotfixes for critical issues in releases made up to one year in the past maybe be requested by SIS-CC member organisations.