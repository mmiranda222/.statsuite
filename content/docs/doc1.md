+++
weight = 100
date = "2023-05-03T22:37:22+01:00"
draft = true
author = "Colin Wilson"
title = ".Stat Suite Open Source Framework"
icon = "rocket_launch"
toc = true
description = "A quickstart guide to creating new content in Lotus Docs"
publishdate = "2023-05-03T22:37:22+01:00"
tags = ["Beginners"]
+++


## Component-based technical architecture

**The high-level technical architecture can be schematised as follow with a topology example (with two .Stat Suite SDMX data spaces):**
![Stat Suite Architecture](https://sis-cc.gitlab.io/dotstatsuite-documentation/images/statsuite-technical-architecture.png "Stat Suite Architecture Diagram")

Each .Stat Suite main module (as well as their components) can be used together or separately.

**In the following are a few typical use cases on how an organisation can make use of these modules:**

**A) Adding the Data Explorer to an existing fully-fledged back-end solution**

_Pre-requisites:_ A statistical database with its own data management features and with a public SDMX API (SDMX 2.1 Rest incl. SDMX-JSON); hardware (see the system requirements in the installation guides)

_Objectives:_ Add a public web application as GUI for end-users to ease to consumption of the data

_Approach:_ Use only the .Stat Data Explorer components and plug them to the public SDMX API

**B) Adding the Data Lifecycle Manager to an existing back-end solution to extend its management functionalities**

_Pre-requisites:_ A statistical database with a protected SDMX API (SDMX 2.1 Rest incl. SDMX-JSON); hardware (see the system requirements in the installation guides)

_Objectives:_ Add a protected web application as GUI for data producers to ease to management of the data

_Approach:_ Use only the .Stat Data Lifecycle Manager components and plug them to the protected SDMX API

**C) Adding the .Stat Core as a back-end solution (SDMX data store)**

_Pre-requisites:_ Management and Data portal GUIs that can connect to an SDMX end-point through SDMX API calls; SQL Server licenses; hardware (see the system requirements in the installation guides)

_Objectives:_ Add a protected SDMX datastore

_Approach:_ Use only the .Stat Core components and plug them into the existing GUIs software

**D) Adding the .Stat Suite as a full-stack statistical data management and dissemination solution**

_Pre-requisites:_ SQL Server licenses; hardware (see the system requirements in the installation guides)

_Objectives:_ Add the full .Stat Suite with one or more SDMX data stores (to handle independent data lifecycle versions)

_Approach:_ Define specific topology for your needs using all .Stat Suite components or partially


## Technical stack

The following technologies are used for the development of the .Stat Data Explorer components and the .Stat Data Lifecycle Manager components:

...