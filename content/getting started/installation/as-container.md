---
title: Installation based on ready-to-use container images
subtitle: 
comments: false
weight: 26
---

Using [Docker](https://www.docker.com/) technology, the three .Stat Suite main modules **Data Explorer**, **Data Lifecycle Manager** [to come] and **.Stat Core** or their components are containerised as ready-to-use container images, which can be freely re-used to easily compose a new topology (system architecture) by anyone in its own cloud or premises.

This section describes where to find and how to use the .Stat Suite Docker images.

> **Note**: Docker technology is a commonly used containerisation technology, and we will mainly explain here our most common scenarios using Docker Compose and our specific services and libraries.

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

All **.Stat Suite Docker images** are located under https://cloud.docker.com/u/siscc/repository/list. Please see each repository for detailed information on how to use these.

---


## .Stat Data Explorer components

#### Data Explorer app

This web app is the main GUI for (external) users to find, understand and use the statistical data stored in the SDMX end point(s).

- **demo**: http://data-explorer.staging.oecd.redpelicans.com
- **docker**: https://cloud.docker.com/u/siscc/repository/docker/siscc/dotstatsuite-data-explorer
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer


#### Share service

This service (and related database) is used to store and retrieve user-defined data tables and charts as small JSON objects containing the related configurations.  
A Redis database is used to store shared objects (tables or charts). Share server is not auth protected, so any robot can spam it. In order to avoid it, many mechanisms are in place:

* tables/charts are temporary stored only during `redisChartTTL` seconds before beeing deleted unless beeing confirmed
* share server check POST calls rates, over `maxRatePerIP` per second, POST calls, per IP, are rejected with a 419 HTTP code
* POST body are size limited to `maxChartSize`

- **demo**: http://share.staging.oecd.redpelicans.com/api/charts/3
- **docker**: https://cloud.docker.com/u/siscc/repository/docker/siscc/dotstatsuite-share
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share


#### Share-Viewer App

This web app is a compagnon GUI for (external) users to display user-defined, shared data tables and charts e.g. in embedded views or through shared links.

- **demo**: http://data-viewer.staging.oecd.redpelicans.com/?chartId=3
- **docker**: https://cloud.docker.com/u/siscc/repository/docker/siscc/dotstatsuite-data-viewer
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer
- server-side rendered (configuration is injected in index.html), no request required from the client to get the configuration
- client bundle expects configuration in `window.SETTINGS`, `window.I18N` and `window.CONFIG` for those who want to use directly the static files


#### Search service

This service is a .Stat-specific proxy to an SolR engine to index SDMX dataflows categorised and accessible in one or more SDMX end points and to execute faceted search queries on these SDMX dataflows. A static schema is defined in the config. A dynamic schema is derivated from the indexed SDMX dataflows.

- **demo**: http://sfs.staging.oecd.redpelicans.com/api/config
- **docker**: https://cloud.docker.com/u/siscc/repository/docker/siscc/dotstatsuite-sdmx-faceted-search
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search

Limitations:

- reconciliate sdmx and search data (e.g. dataset order, facet value order) -> cache server
- datasources & config
- perf (benchmark to do)
- how to index (e.g. individual dataset = SDMX dataflow)


#### Proxy service

The Proxy service handles route request depending on urls (`https://<app>.<env>.<tenant>.redpelicans.com`), and sets tenant headers depending on host to instruct tager application. `<tenant>.redpelicans.com` could be replaced by a dedicated DNS entry, e.g. `https://<app>.<env>.oecd.org`.

- **docker**: https://cloud.docker.com/u/siscc/repository/docker/siscc/dotstatsuite-kube-proxy
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy


#### Config Service

The Configuration service centralises all configuration resources used by other services. It is a web server providing requested configuration, not exposed to users. Based on git versioned configuration data.

- **docker**: https://cloud.docker.com/u/siscc/repository/docker/siscc/dotstatsuite-config-dev
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config

---


## .Stat Data Lifecycle Manager components

#### Data Lifecycle Manager app

This web app is the main GUI for statistical data teams to efficiently produce and disseminate high-quality statistical data and metadata.

- **demo**: [*to come*]
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager
- **docker**: [*to come*]

---

## .Stat Core components


#### Transfer service

This web service is used for statistical data (and later referential metadata) for their upload, download and transfer between different .Stat Core Data Stores: 

* Upload of SDMX data files (csv, xml) into a .Stat Core data store
* Upload of Excel data files (using a specific data mapping definition) into a .Stat Core data store
* Transfer of data between two .Stat Core data stores

- **demo**: http://transfer.qa.core.oecd.redpelicans.com/swagger/index.html
- **docker**: https://cloud.docker.com/u/siscc/repository/docker/siscc/dotstatsuite-core-transfer
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer

*Configuration* see details [here](https://gitlab.com/snippets/1851148#configuration-1)


#### SDMX service (also named SDMX-RI NSI web service (c) Eurostat)

This web service is used for statistical data structures for their upload and download to and from a .Stat Core Data Store. The docker image is using a vanilla Eurostat NSI web service image as a base image. It is enriched with a special .Stat Core plugin used to retrieve statistical data structures from a .Stat Core Data Store.

- **demo**: http://nsi.qa.core.oecd.redpelicans.com/
- **docker**: https://cloud.docker.com/u/siscc/repository/docker/siscc/dotstatsuite-core-sdmxri-nsi
- **docker of original Eurostat SDMX-RI NSI web service**: https://cloud.docker.com/u/siscc/repository/docker/siscc/sdmxri-nsi
- **repository of .Stat Core plugin**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin
- **repository of original Eurostat SDMX-RI NSI web service**: https://webgate.ec.europa.eu/CITnet/stash/projects/SDMXRI/repos/nsiws.net

*Configuration* see details [here](https://gitlab.com/snippets/1851148#configuration)


#### Authorisation service

This web service is used for managing user access rights to data structures and data in .Stat Core Data Stores.

- **demo**: [*to come*]
- **docker**: https://cloud.docker.com/u/siscc/repository/docker/siscc/dotstatsuite-core-auth-management
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management



