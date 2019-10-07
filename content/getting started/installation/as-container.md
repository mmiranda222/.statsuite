---
title: Installation based on ready-to-use container images
subtitle: 
comments: false
weight: 27
---

# Table of Content
- [short intro to docker](#short-intro-to-docker)
- [next steps](#next-steps)
- [.stat data explorer components](#stat-data-explorer-components)
- [.stat data lifecycle manager components](#stat-data-lifecycle-manager-components)
- [.stat core components](#stat-core-components)
- [docker compose example(s)](#docker-compose-example-s)


Using [Docker](https://www.docker.com/) technology, the three .Stat Suite main modules **Data Explorer**, **Data Lifecycle Manager** [to come] and **.Stat Core** or their components are containerised as ready-to-use container images, which can be freely re-used to easily compose a new topology (system architecture) by anyone in its own cloud or premises.

This section describes where to find and how to use the .Stat Suite Docker images.

> **Note**: Docker technology is a commonly used containerisation technology, and we will mainly list here our ready-to-use Docker images.

---

## Short intro to Docker

Docker is an open platform for developers and sysadmins for developing, shipping, deploying, and running applications with containers. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly. With Docker, you can manage your infrastructure in the same ways you manage your applications. By taking advantage of Docker’s methodologies for shipping, testing, and deploying code quickly, you can significantly reduce the delay between writing code and running it in production.

A Docker **image** is a read-only template with instructions for creating a Docker container. You might create your own images or you might only use those created by others and published in a registry. To build your own image, you create a Dockerfile with a simple syntax for defining the steps needed to create the image and run it. Each instruction in a Dockerfile creates a layer in the image. When you change the Dockerfile and rebuild the image, only those layers which have changed are rebuilt. This is part of what makes images so lightweight, small, and fast, when compared to other virtualization technologies.

A Docker **container** is a runnable instance of an image. You can create, start, stop, move, or delete a container using the Docker API or CLI. You can connect a container to one or more networks, attach storage to it, or even create a new image based on its current state. By default, a container is relatively well isolated from other containers and its host machine. You can control how isolated a container’s network, storage, or other underlying subsystems are from other containers or from the host machine. A container is defined by its image as well as any configuration options you provide to it when you create or start it. When a container is removed, any changes to its state that are not stored in persistent storage disappear.

![container and docker infrastructure](/images/container-docker-infrastructure.png)

See the full Docker overview [here](https://docs.docker.com/engine/docker-overview/).

---

## Next steps

Read about installing [Docker](https://docs.docker.com/install/overview/).  
Get hands-on experience with the Getting started with [Docker tutorial](https://docs.docker.com/engine/getstarted/).  
Check out examples and deep dive topics in the [Docker Engine user guide](https://docs.docker.com/engine/userguide/).  

---

<br>
<br>

All **.Stat Suite Docker images** are located under https://hub.docker.com/u/siscc. Please see each repository for detailed information on how to use these.


## .Stat Data Explorer components

#### Data Explorer app

This web app is the main GUI for (external) users to find, understand and use the statistical data stored in the SDMX end point(s).

- **demo**: http://data-explorer.staging.oecd.redpelicans.com
- **docker**: https://hub.docker.com/r/siscc/dotstatsuite-data-explorer
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer


#### Share service

This service (and related database) is used to store and retrieve user-defined data tables and charts as small JSON objects containing the related configurations.  
A Redis database is used to store shared objects (tables or charts). Share server is not auth protected, so any robot can spam it. In order to avoid it, many mechanisms are in place:

- tables/charts are temporary stored only during `redisChartTTL` seconds before beeing deleted unless beeing confirmed
- share server check POST calls rates, over `maxRatePerIP` per second, POST calls, per IP, are rejected with a 419 HTTP code
- POST body are size limited to `maxChartSize`  

- **demo**: http://share.staging.oecd.redpelicans.com/api/charts/3
- **docker**: https://hub.docker.com/r/siscc/dotstatsuite-share
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share


#### Share-Viewer App

This web app is a compagnon GUI for (external) users to display user-defined, shared data tables and charts e.g. in embedded views or through shared links.

- **demo**: http://data-viewer.staging.oecd.redpelicans.com/?chartId=3
- **docker**: https://hub.docker.com/r/siscc/dotstatsuite-data-viewer
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer
- server-side rendered (configuration is injected in index.html), no request required from the client to get the configuration
- client bundle expects configuration in `window.SETTINGS`, `window.I18N` and `window.CONFIG` for those who want to use directly the static files


#### Search service

This service is a .Stat-specific proxy to an SolR engine to index SDMX dataflows categorised and accessible in one or more SDMX end points and to execute faceted search queries on these SDMX dataflows. A static schema is defined in the config. A dynamic schema is derivated from the indexed SDMX dataflows.

- **demo**: http://sfs.staging.oecd.redpelicans.com/api/config
- **docker**: https://hub.docker.com/r/siscc/dotstatsuite-sdmx-faceted-search
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search

Limitations:

- reconciliate sdmx and search data (e.g. dataset order, facet value order) -> cache server
- datasources & config
- perf (benchmark to do)
- how to index (e.g. individual dataset = SDMX dataflow)


#### Proxy service

The Proxy service handles route request depending on urls (`https://<app>.<env>.<tenant>.redpelicans.com`), and sets tenant headers depending on host to instruct tager application. `<tenant>.redpelicans.com` could be replaced by a dedicated DNS entry, e.g. `https://<app>.<env>.oecd.org`.

- **docker**: https://hub.docker.com/r/siscc/dotstatsuite-kube-proxy
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy


#### Config Service

The Configuration service centralises all configuration resources used by other services. It is a web server providing requested configuration, not exposed to users. Based on git versioned configuration data.

- **docker**: https://hub.docker.com/r/siscc/dotstatsuite-config-dev
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config

---


## .Stat Data Lifecycle Manager components

#### Data Lifecycle Manager app

This web app is the main GUI for statistical data teams to efficiently produce and disseminate high-quality statistical data and metadata.

- **demo**: http://data-lifecycle-manager.qa.oecd.redpelicans.com/
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager
- **docker**: https://hub.docker.com/r/siscc/dotstatsuite-data-lifecycle-manager

---

## .Stat Core components


#### Transfer service

This web service is used for statistical data (and later referential metadata) for their upload, download and transfer between different .Stat Core Data Stores: 

- Upload of SDMX data files (csv, xml) into a .Stat Core data store
- Upload of Excel data files (using a specific data mapping definition) into a .Stat Core data store
- Transfer of data between two .Stat Core data stores  

- **demo**: http://transfer.qa.core.oecd.redpelicans.com/swagger/index.html
- **docker**: https://hub.docker.com/r/siscc/dotstatsuite-core-transfer
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer

##### Configuration

Configuration is loaded from **config** directory located in the [root of application](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/tree/develop/DotStatServices.Transfer/config).
All files with *.json extension are considered as configuration files. The name of the file is not important (except log4net.config), and it's not important if the configuration values are loaded from 1 single file or multiple files.

* example configuration: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-core-rp/tree/master/qa/transfer-config

    * [log4net.config](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-core-rp/tree/master/qa/transfer-config/log4net.config)
    > log configuration
    * [dataspaces.private.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-core-rp/tree/master/qa/transfer-config/dataspaces.private.json)
    > dataspaces configuration with connection strings to Structure, Management & Data databases. At least 1 dataspace is required.
    * [localization.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-core-rp/tree/master/qa/transfer-config/localization.json)
    > Localized messages returned back to a user
    
* sample usage of docker (provided log4net.config instructs to write to a file in /app/logs directory):

```yaml
docker run -it --rm -p 80:80 \
-v /path-to/my/config:/app/config \
-v /path-to/my/logs:/app/logs \
--name transfer \
siscc/dotstatsuite-core-transfer
```

* docker with connection strings from environment variables:

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

Schema:

![transfer service architecture](/images/transfer_architecture.png)

<!---```mermaid
graph LR

dlm((dlm))
transfer[transfer]
common-nuget[common]
access-nuget[data-access]
ms_db(structure-db)
data_db(data-db)
auth-log-db(auth-log-db)

dlm->transfer

subgraph transfer backend
transfer-> common-nuget
transfer-> access-nuget
end

subgraph database layer
access-nuget-> ms_db
access-nuget-> auth-log-db
access-nuget -> data_db
end
```--->


#### SDMX service (also named SDMX-RI NSI web service (c) Eurostat)

This web service is used for statistical data structures for their upload and download to and from a .Stat Core Data Store. The docker image is using a vanilla Eurostat NSI web service image as a base image. It is enriched with a special .Stat Core plugin used to retrieve statistical data structures from a .Stat Core Data Store.

- **demo**: http://nsi.qa.core.oecd.redpelicans.com/
- **docker**: https://hub.docker.com/r/siscc/dotstatsuite-core-sdmxri-nsi
- **docker of original Eurostat SDMX-RI NSI web service**: https://cloud.docker.com/u/siscc/repository/docker/siscc/sdmxri-nsi
- **repository of .Stat Core plugin**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin
- **repository of original Eurostat SDMX-RI NSI web service**: https://webgate.ec.europa.eu/CITnet/stash/projects/SDMXRI/repos/nsiws.net

##### Configuration

Configuration is loaded from **config** directory located in the [root of application](https://webgate.ec.europa.eu/CITnet/stash/projects/SDMXRI/repos/nsiws.net/browse/src/NSIWebServiceCore/config?at=refs%2Fheads%2Fdevelop).
All files with *.json extension are considered as configuration files. The name of the file is not important (except app.config & log4net.config), and it's not important if the configuration values are loaded from 1 single file or multiple files.

* example configuration: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-core-rp/tree/master/qa/nsi-config

    * [app.config](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-core-rp/tree/master/qa/nsi-config/app.config)
    > nsi web service main configuration, more info [here](https://webgate.ec.europa.eu/CITnet/stash/projects/SDMXRI/repos/nsiws.net/browse/CONFIGURATION.md?at=refs%2Fheads%2Fdevelop)
    > In addition to default Eurostat configuration there 2 new values in the appSettings, that are needed for Data plugin
    > **DataspaceId** - what dataspace is used by NSI for data retrieval  
    > **ConfigDirectory** - where to find Plugin *.json configuration files, by default located in the same directory as NSI configs themselves.
    * [log4net.config](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-core-rp/tree/master/qa/nsi-config/log4net.config)
    > log configuration
    * [dataspaces.private.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-core-rp/tree/master/qa/nsi-config/dataspaces.private.json)
    > dataspaces configuration with connection strings to Structure, Management & Data databases. 
    * [localization.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-core-rp/tree/master/qa/nsi-config/localization.json)
    > Localized messages returned back to a user
    
* sample usage of docker (provided log4net.config instructs to write to a file in /app/logs directory):

```yaml
docker run -it --rm -p 80:80 \
-v /path-to/my/config:/app/config \
-v /path-to/my/logs:/app/logs \
--name nsi-ws \
siscc/dotstatsuite-core-sdmxri-nsi
```
 
Schema:

![sdmx/nsi service architecture](/images/nsi_architecture.png)

<!---```mermaid
graph LR

dlm((dlm))
de((data explorer))
nsi[sdmx/nsi]
plugin[sdmx/nsi plugin]
common-nuget[common]
access-nuget[data-access]
ms_db(structure-db)
data_db(data-db)
auth-log-db(auth-log-db)
dlm->nsi
de->nsi

subgraph sdmx-ri / eurostat
nsi -> plugin
end

subgraph nuget packages
plugin -> common-nuget
plugin -> access-nuget
end

subgraph database layer
access-nuget-> ms_db
access-nuget-> auth-log-db
access-nuget -> data_db
end
```--->


#### Authorisation service

This web service is used for managing user access rights to data structures and data in .Stat Core Data Stores.

- **demo**: [*to come*]
- **docker**: https://hub.docker.com/r/siscc/dotstatsuite-core-auth-management
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management

>  See more about the **[Recommended infrastructure requirements](/getting-started/installation/infrastructure_requirements)** for all the **.Stat Core components** listed above; Including the **Transfer service**, **SDMX service** and **Authorisation service**.

---

## Docker-compose example(s)

[Docker Compose](https://docs.docker.com/compose/overview/) is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application’s services. Then, with a single command, you create and start all the services from your configuration. To learn more about all the features of Compose, see [the list of features](https://docs.docker.com/compose/overview/#features).

Compose works in all environments: production, staging, development, testing, as well as CI workflows. You can learn more about each case in [Common Use Cases](https://docs.docker.com/compose/overview/#common-use-cases).

A .Stat Docker compose example for developers and contributors combining all apps and services and one .Stat Core Data Storage is currently in development and will be available soon. 

A first preview of a Docker compose yaml file with .Stat Core services is here:

```yaml
version: "3"

services:
  nsi-ws:
    image: siscc/dotstatsuite-core-sdmxri-nsi:7.2.0
    container_name: nsi-ws
    ports:
      - "85:80"
    volumes:
      - "./nsi-config:/app/config"
      - "./logs:/app/logs"
    networks:
      - back-network
    depends_on:
      - db

  transfer:
    image: siscc/dotstatsuite-core-transfer:latest
    container_name: transfer
    ports:
      - "86:80"
    volumes:
      - "./transfer-config:/app/config"
      - "./logs:/app/logs"
    networks:
      - back-network
    depends_on:
      - db

  db:
    build: ./mssql/docker
    image: siscc/mssql-with-init
    container_name: mssql
    ports:
      - "1434:1433"
    volumes:
      - "db-data:/var/opt/mssql/data"
      - "./mssql/init:/docker-entrypoint-initdb.d"
    environment:
      ACCEPT_EULA: Y
      SA_PASSWORD: My-Mssql-Pwd-123
      MSSQL_PID: Developer
    networks:
      - back-network

volumes:
  db-data:

networks:
  back-network:
```



