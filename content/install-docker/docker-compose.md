---
title: "Installation using Docker-Compose"
subtitle: 
comments: false
weight: 53
keywords: [
  'Introduction and prerequisites', '#introduction-and-prerequisites',
  'Complete, ready-made demo example of a Docker-Compose setup of .Stat Suite', '#complete-ready-made-demo-example-of-a-docker-compose-setup-of-stat-suite',
  'Hints for optional Docker-Compose setup customisations and usage', '#hints-for-optional-docker-compose-setup-customisations-and-usage',
]
---

#### Table of Content
- [Introduction and prerequisites](#introduction-and-prerequisites)
- [Complete, ready-made demo example of a Docker-Compose setup of .Stat Suite](#complete-ready-made-demo-example-of-a-docker-compose-setup-of-stat-suite)
- [Hints for optional Docker-Compose setup customisations and usage](#hints-for-optional-docker-compose-setup-customisations-and-usage)

---

### Introduction and prerequisites
Using the ready-made Docker-Compose example eases the installation of the .Stat Suite for developments, tests, pilots or demos. This can also serve the setup of production environments as a starting point, but for this purpose you will need to complement it with scaling, backup and archiving, etc.  

The **prerequisites** for installing the .Stat Suite using Docker-Compose are to install **Docker** and **Docker-Compose**.  
See the following references for additional information about these installations:
* [docker install manual](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
* [docker-compose install manual](https://docs.docker.com/compose/install/)

The installation has been tested in the following host operating systems:  
* Linux: Ubuntu Server 18.04 LTS
* Windows: MS Windows 10 Pro 1809  

Further installation prerequisites are listed [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose/-/blob/master/README.md#initialization-steps). [This repository](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose) contains all necessary Docker-Compose .Stat Suite example files.

---

### Complete, ready-made demo example of a Docker-Compose setup of .Stat Suite
Using simply the Docker-Compose `start` and `stop` instructions as detailed **[here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose/-/blob/master/README.md#quick-start)**, the out-of-the-box demo example allows very quickly and easily running a complete mono-tenant, local .Stat Suite demo instance with one Data Explorer, one Data Lifecycle Manager, two default SDMX-based data spaces (named "Design" and "Release") and a KeyCloak service for authentication. The installation is based on the currently latest released source code (MASTER docker images).   

This demo instance can be used for developments, test, pilots or demos. Please see the next chapter for information on how to customise the Docker-Compose setup for typical use cases. 

**Important note**: In order to make uploaded structures and data publically (anonymously) available, which is a pre-requisite for the search indexation and the direct display in the Data Explorer, the [AuthorisationManagement web service (swagger interface)](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/manage-user-access/) is to be used to define appropriate public access rights to those structures and data.  

---

### Hints for optional Docker-Compose setup customisations and usage
**[This documentation](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose/-/blob/master/README.md#basic-docker-customization-options)** destinated for more advanced developers and implementers provides a reference manual for frequently needed additional customisations and for a typical usage starting from the ready-made demo example of the Docker-Compose setup of the .Stat Suite.  
