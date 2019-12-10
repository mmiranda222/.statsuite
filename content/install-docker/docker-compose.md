---
title: "Installation using Docker Compose"
subtitle: 
comments: false
weight: 53

---

> The prerequities of installing .Stat Suite with Docker Compose is to install Docker and Docker Compose.
See the following references for addition information about these installations:
* [docker install manual](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
* [docker-compose install manual](https://docs.docker.com/compose/install/)

As a first stage of documentation, we are providing here links to **.Stat Suite Docker-Compose example files**.
Installing .Stat Suite by using Docker Compose files eases the deployments for development environments, or tests, pilots and demos. This can also serve the setup of Production environments as a starting point, but for this purpose you will also need to complement with scaling, archiving, etc.

**Docker Compose for .NET services**
Example files and instructions: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose/tree/master/dotnet
Related services/applications:
* Transfer service
* Authorization service
* Nsi webservice
* Keycloak (for local setup)


**Docker Compose example files and instructions for JS servcies**
Example files and instructions: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose/tree/master/js
Related services/applications:
* Data Explorer (and related config. and data-viewer services)
* Data Lifecycle Manager
