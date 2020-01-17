---
title: "Infrastructure requirements"
subtitle: 
comments: false
weight: 38
---

#### Table of Content
- [.stat core data store](#stat-core-data-store)
- [.stat data explorer](#stat-data-explorer)
- [.stat data lifecycle manager](#stat-data-lifecycle-manager)

## .Stat Core Data Store
**Software requirements**

- **SQL server 2017** or higher 
    - Not all columnstore features are available in express and standard editions of MS SQL for versions older than 2017
    - SQL server 2016 contains columnstore features only on enterprise edition. 
- **IIS Web server 7\.5** or higher
- **Microsoft .NET**
- **Microsoft SQL server management studio** (Optional)
- **Visual Studio 2017**.-Used only for compiling the solutions when doing a source code installation.

**Hardware requirements**<br>
Although the requirements could vary depending on the size of your data and the amount of users, for an installation of one **.Stat Core Data Store** (*[See sample topology](/install-source-code/source-code/#example-topologies)*), we suggest as a minimum the following requirements: <br>

- **Memory:** 16 GB
- **vCPUs:** 8 CPU @ 2.4 GHz
- **Disk:** 250 GB         

## .Stat Data Explorer
**pre-requisites**

- (reminder) an accessible (CORS-enabled, anonymous access enabled) **SDMX v7.x** endpoint
- **nodejs 12.x** and **npm 6.x** installed
- **git** installed (https://gitforwindows.org/); only to use git bash instead of cmd.exe for process variables
- **solr 7.x** installed and running on port 8983 (default) with a core created with `solr create -c sdmx-facet-search` from solr console
- **redis** downloaded and running on port 6379 (default)

*notes:*

- solr core name can be freely picked, default configuration targets sdmx-facet-search
- ports can be freely picked, if different than defaults they should be specified when launching services

## .Stat Data Lifecycle Manager
**pre-requisites**

- (reminder) an accessible (CORS-enabled, anonymous access enabled) **SDMX v7.x** endpoint
- **nodejs 12.x** and **npm 6.x** installed
- **git** installed (https://gitforwindows.org/); only to use git bash instead of cmd.exe for process variables
- **keycloak 7.x** installed and running on port 8080 (default)
- **postgres 12.x** installed and running on port 5432 (default)

*notes:*

- keycloak realm name can be freely picked, default configuration targets oecd
- ports can be freely picked, if different than defaults they should be specified when launching services
