---
title: Description of .Stat Suite Docker images
subtitle: 
comments: false
weight: 52
keywords: [
  '.Stat Data Explorer components', '#stat-data-explorer-components',
  'Data Explorer app', '#data-explorer-app',
  'Share service', '#share-service',
  'Share-Viewer App', '#share-viewer-app',
  'Search service', '#search-service',
  'Proxy service', '#proxy-service',
  'Config Service', '#config-service',
  '.Stat Data Lifecycle Manager components', '#stat-data-lifecycle-manager-components',
  '.Stat Core components', '#stat-core-components',
  'Transfer service', '#transfer-service',
  'SDMX service', '#sdmx-service',
  'Authorisation service', '#authorisation-service',
  'Docker compose example(s)', '#docker-compose-examples',
  'Database configuration tool', '#database-configuration-too',
]
---

#### Table of Content
- [.Stat Data Explorer components](#stat-data-explorer-components)
  - [Data Explorer app](#data-explorer-app)
  - [Share service](#share-service)
  - [Share-Viewer App](#share-viewer-app)
  - [Search service](#search-service)
  - [Proxy service](#proxy-service)
  - [Config Service](#config-service)
- [.Stat Data Lifecycle Manager components](#stat-data-lifecycle-manager-components)
- [.Stat Core components](#stat-core-components)
  - [Transfer service](#transfer-service)
  - [SDMX service](#sdmx-service)
  - [Authorisation service](#authorisation-service)
- [Database configuration tool](#database-configuration-tool)

Using [Docker](https://www.docker.com/) technology, the three .Stat Suite main modules **Data Explorer**, **Data Lifecycle Manager** and **.Stat Core** or their components are containerised as ready-to-use Docker images, which can be freely re-used to easily compose a new topology (system architecture) by anyone in their own cloud or premises.  
This section describes where to find and how to use the .Stat Suite Docker images.

All **.Stat Suite Docker images** are located under https://hub.docker.com/u/siscc. Please see each repository for detailed information on how to use these.

> **Note**: Docker technology is a commonly used containerisation technology, and we will mainly list here our ready-to-use Docker images.

---

### .Stat Data Explorer components

#### Data Explorer app

This web app is the main GUI for (external) users to find, understand and use the statistical data stored in the SDMX end point(s).

- **demo**: https://de-qa.siscc.org/
- **docker**: https://hub.docker.com/r/siscc/dotstatsuite-data-explorer
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer

#### Share service

This service (and related database) is used to store and retrieve user-defined data tables and charts as small JSON objects containing the related configurations.  
A Redis database is used to store shared objects (tables or charts). Share server is not auth protected, so any robot can spam it. In order to avoid it, many mechanisms are in place:

- tables/charts are only temporarily stored for `redisChartTTL` seconds before being deleted unless confirmed via email link
- share server checks POST calls rates. Over `maxRatePerIP` POST calls per second, per IP, are rejected with a 419 HTTP code
- POST bodies are limited in size to `maxChartSize`

- **demo**: https://share-qa.siscc.org/api/charts/3
- **docker**: https://hub.docker.com/r/siscc/dotstatsuite-share
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share

#### Share-Viewer App

This web app is a compagnon GUI for (external) users to display user-defined, shared data tables and charts e.g. in embedded views or through shared links.

- **demo**: https://dv-qa.siscc.org/?chartId=3
- **docker**: https://hub.docker.com/r/siscc/dotstatsuite-data-viewer
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer
- server-side rendered (configuration is injected in index.html), no request required from the client to get the configuration
- client bundle expects configuration in `window.SETTINGS`, `window.I18N` and `window.CONFIG` for those who want to use directly the static files

#### Search service

This service is a .Stat-specific proxy to an SolR engine to index SDMX dataflows categorised and accessible in one or more SDMX end points and to execute faceted search queries on these SDMX dataflows. A static schema is defined in the config. A dynamic schema is derivated from the indexed SDMX dataflows.

- **demo**: https://sfs-qa.siscc.org/api/config
- **docker**: https://hub.docker.com/r/siscc/dotstatsuite-sdmx-faceted-search
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search

Limitations:

- reconciliate sdmx and search data (e.g. dataset order, facet value order) -> cache server
- datasources & config
- performance (benchmark to do)
- how to index (e.g. individual dataset = SDMX dataflow)


#### Proxy service

The Proxy service handles route requests by mapping the hostname part of URLs to tenant-application pairs. Requests with hostnames that match the defined mappings are forwarded to the matched target application, and tenant headers are set for the matched tenant.

- **docker**: https://hub.docker.com/r/siscc/dotstatsuite-kube-proxy
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy

#### Config Service

The Configuration service centralises all configuration resources used by other services. It is a web server providing requested configuration, not exposed to users. Based on git versioned configuration data.

- **docker**: https://hub.docker.com/r/siscc/dotstatsuite-config-dev
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config

---

### .Stat Data Lifecycle Manager components
#### Data Lifecycle Manager app

This web app is the main GUI for statistical data teams to efficiently produce and disseminate high-quality statistical data and metadata.

- **demo**: https://dlm-qa.siscc.org/
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager
- **docker**: https://hub.docker.com/r/siscc/dotstatsuite-data-lifecycle-manager

---

### .Stat Core components
#### Transfer service

This web service is used for statistical data (and later referential metadata) for their upload, download and transfer between different .Stat Core Data Stores: 

- Upload of SDMX data files (csv, xml) into a .Stat Core data store
- Upload of Excel data files (using a specific data mapping definition) into a .Stat Core data store
- Transfer of data between two .Stat Core data stores  

- **demo**: https://transfer-qa.siscc.org/swagger/index.html
- **docker**: https://hub.docker.com/r/siscc/dotstatsuite-core-transfer
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer

##### Configuration

Configuration values can be set using a **config** file located in the [root of application](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/tree/master/DotStatServices.Transfer/config) or by using **environment variables**.  
All files with `*.json` extension and which are located in the config folder are considered as configuration files. The name of the file is arbitrary (except for the log4net.config file) and configuration values can be loaded from a single or multiple files.

**Example configurations**

> Setting environment variables when using Docker-compose
  * [.env](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose/-/blob/master/dotnet/.env)
> Setting environment variables when using Kubernetes
* [transfer.yaml](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-core-rp/-/blob/master/qa/transfer.yaml)
> log configuration using a configuration file
* [log4net.config](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/blob/master/DotStatServices.Transfer/config/log4net.config)
> Dataspaces configuration using a configuration file with connection strings to Structure, Management & Data databases. At least 1 dataspace is required.
* [dataspaces.private.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/blob/develop/DotStatServices.Transfer/config/dataspaces.private.json.sample)
> Localized user and error messages
* [localization.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-config/-/blob/develop/DotStat.Config/config/localization.json)

    
**Sample usage of docker:**

* Docker with using configuration from file:

>Before running sample you would need to copy required configuration files to your locally mapped folder </path-to/my/config>
```yaml
docker run -it --rm -p 80:80 \
-v </path-to/my/config>:/app/config \
-v </path-to/my/logs>:/app/logs \
--name transfer \
siscc/dotstatsuite-core-transfer
```


* Docker with connection strings from environment variables:

```yaml
docker run -it --rm -p 80:80 \
-v /path-to/my/config:/app/config \
-v /path-to/my/logs:/app/logs \
--name transfer \
-e spacesInternal:0:msConnectionString=my-structure-db-connection \
-e spacesInternal:0:managementConnectionString=my-managemenet-db-connection \
-e spacesInternal:0:dataStoreConnectionStrings:0:connectionString=my-data-db-connection \
siscc/dotstatsuite-core-transfer
```

Schema:<br>

{{< mermaid align="left" >}}
graph LR

dlm((dlm))
transfer[transfer]
common-nuget[common]
access-nuget[data-access]
ms_db(structure-db)
data_db(data-db)
auth-log-db(auth-log-db)

dlm-->transfer

subgraph transfer backend
transfer--> common-nuget
transfer--> access-nuget
end

subgraph database layer
access-nuget--> ms_db
access-nuget--> auth-log-db
access-nuget --> data_db
end
{{< /mermaid >}}

#### SDMX service
(also named SDMX-RI NSI web service (c) Eurostat)

This web service is used for statistical data structures for their upload and download to and from a .Stat Core Data Store.  

- **demo**: https://nsi-demo-oecd-staging.siscc.org/
- **docker of original Eurostat SDMX-RI NSI web service**: https://cloud.docker.com/u/siscc/repository/docker/siscc/sdmxri-nsi
- **original repository of Eurostat SDMX-RI NSI web service**: https://citnet.tech.ec.europa.eu/CITnet/stash/projects/SDMXRI/repos/nsiws.net
- **mirrored repository of Eurostat SDMX-RI NSI web service**: https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored/-/tree/master/

##### Configuration
Configuration is loaded from **config** directory located in the [root of application](https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored/-/tree/master/src/NSIWebServiceCore/config).  
All files with *.json extension are considered as configuration files. The name of the file is not important (except app.config & log4net.config), and it's not important if the configuration values are loaded from 1 single file or multiple files.  

* example configuration (default config files: https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored/-/tree/master/src/NSIWebServiceCore/config)

    * containerised [app.config](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-core-rp/tree/master/qa/nsi-config/app.config) 
    > default [app.config](https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored/-/blob/master/src/NSIWebServiceCore/config/app.config), also see the [nsi web service main configuration description](https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored/-/blob/master/doc/CONFIGURATION.md)   
    * containerised [log4net.config](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-core-rp/tree/master/qa/nsi-config/log4net.config)
    > default [log4net.config](https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored/-/blob/master/src/NSIWebServiceCore/config/log4net.config)
        
* sample usage of docker (provided log4net.config instructs to write to a file in /app/logs directory):

```yaml
docker run -it --rm -p 80:80 \
-v /path-to/my/config:/app/config \
-v /path-to/my/logs:/app/logs \
--name nsi-ws \
siscc/dotstatsuite-core-sdmxri-nsi
```
 
#### Authorisation service

This web service is used for managing user access rights to data structures and data in .Stat Core Data Stores.

- **demo**: https://authz-qa.siscc.org/swagger/index.html
- **docker**: https://hub.docker.com/r/siscc/dotstatsuite-core-auth-management
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management

---

### Database configuration tool

The **Database Configuration Tool** can be used for the configuration of MS SQL server databases in situations where those databases cannot be accessed directly, e.g. in containerised environments like the SIS-CC DevOps environments.

It currently supports the following tasks:
* Set database recovery mode set to `SIMPLE` *(always executed)*
* Adjust maximum size of Data & Log files *(optional)*

Detailed information can be found [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/tree/master/DotStat.Devops.Db.Config).

---

>  See more about the **[Recommended infrastructure requirements](/dotstatsuite-documentation/getting-started/infrastructure-requirements)** for all the **.Stat Core components** listed above; Including the **Transfer service**, **SDMX service** and **Authorisation service**.
