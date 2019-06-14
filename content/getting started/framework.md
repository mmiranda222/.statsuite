---
title: .Stat Suite Open Source Framework
subtitle: 
comments: false
weight: 22
---

## Introduction

The .Stat Suite is a standard-based, componentised, open source platform for the efficient production and dissemination of high-quality statistical data. The product is based on the General Statistical Business Process Model (GSBPM) and the Statistical Data and Metadata eXchange (SDMX) standards and is driven by the Statistical Information System Collaboration Community (SIS-CC).

The .Stat Suite has three main components: 
*  **.Stat Core**: A highly performing, secure SDMX back-end based on standard protocols, to store, process and retrieve statistical data, structural and referential metadata, data process information and security settings.
* **.Stat Data Lifecycle Manager**: A set of adaptive back-office modules to efficiently and timely produce and (re-)use high quality statistical data by defining, running, automating, controlling and evaluating the underlying data processes.
* **.Stat Data Explorer**: A front-office application for easy finding, understanding and using of data through an efficient well-tuned navigation and search approach, appropriate data previews and contextual metadata, and download in standard formats, APIs or share features.

![homepage splash](/images/home_splash.png)

Each main component (as well as their sub-components) can be used together or separately.
In the following are a few typical use cases on how an organisation can make use of these components:


**A) Adding the Data Explorer to an existing fully-fledshed back-end solution**

*Pre-requisites*: A statistical database with its own data management features and with a public SDMX API (SDMX 2.1 Rest incl. SDMX-JSON); hardware (see the system requirements in the installation guides)

*Objectives*: Add a public web application as GUI for end-users to ease to consumption of the data

*Approach*: Use only the .Stat Data Explorer components and plug them to the public SDMX API


**B) Adding the Data Lifecycle Manager to an existing back-end solution to extend its management functionalities**

*Pre-requisites*: A statistical database with a protected SDMX API (SDMX 2.1 Rest incl. SDMX-JSON); hardware (see the system requirements in the installation guides)

*Objectives*: Add a protected web application as GUI for data producers to ease to management of the data

*Approach*: Use only the .Stat Data Lifecycle Manager components and plug them to the protected SDMX API


**C) Adding the .Stat Core as a back-end solution (SDMX data store)**

*Pre-requisites*: Management and Data portal GUIs that can connect to an SDMX end-point through SDMX API calls; SQL Server licenses; hardware (see the system requirements in the installation guides)

*Objectives*: Add a protected SDMX datastore

*Approach*: Use only the .Stat Core components and plug them into the existing GUIs software


**D) Adding the .Stat Suite as a full-stack statistical data management and dissemination solution**

*Pre-requisites*: SQL Server licenses; hardware (see the system requirements in the installation guides)

*Objectives*: Add the full .Stat Suite with one or more SDMX data stores (to handle independent data lifecycle versions)

*Approach*: Define specific topology for your needs using all .Stat Suite components or partially


## Technical stack


The following technologies are used for the development of the .Stat Data Explorer components and the .Stat Data Lifecycle Manager:

<table>
<thead>
<tr>
<td align="center"><a href="https://kubernetes.io">kubernetes</a></td>
<td align="center"><a href="https://cloud.google.com">gcp</a></td>
<td align="center"><a href="https://www.docker.com">docker</a></td>
<td align="center"><a href="http://lucene.apache.org/solr">solr</a></td>
<td align="center"><a href="https://redis.io">redis</a></td>
<td align="center"><a href="https://developer.mozilla.org/fr/docs/Web/JavaScript">es6</a></td>
<td align="center"><a href="https://nodejs.org">nodejs</a></td>
<td align="center"><a href="https://www.npmjs.com">npmjs</a></td">
<td align="center"><a href="https://git-scm.com">git</a></td>
<td align="center"><a href="https://docs.gitlab.com/ee/ci/pipelines.html">gitlab</a></td>
</tr>
</thead>
<tbody>
<tr>
<td align="center"><img src="https://upload.wikimedia.org/wikipedia/en/0/00/Kubernetes_%28container_engine%29.png" height="40" /></td>
<td align="center"><img src="https://www.pinclipart.com/picdir/middle/54-541486_google-cloud-platform-svg-clipart.png" height="40" /></td>
<td align="center"><img src="https://www.usine-digitale.fr/mediatheque/5/3/8/000277835_homePageUne/docker.jpg" height="40" /></td>
<td align="center"><img src="https://upload.wikimedia.org/wikipedia/commons/c/cd/Surface1.png" height="40" /></td>
<td align="center"><img src="https://cdn-images-1.medium.com/max/1200/1*ngGAAMf8Sw4jCJ_nP2Qt5A.png" height="40" /></td>
<td align="center"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Unofficial_JavaScript_logo_2.svg/480px-Unofficial_JavaScript_logo_2.svg.png" height="40" /></td>
<td align="center"><img src="https://nodejs.org/static/images/logos/nodejs-new-pantone-black.png" height="40" /></td>
<td align="center"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Npm-logo.svg/1280px-Npm-logo.svg.png" height="40" /></td>
<td align="center"><img src="https://git-scm.com/images/logos/downloads/Git-Icon-1788C.png" height="40" /></td>
<td align="center"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/GitLab_Logo.svg/1108px-GitLab_Logo.svg.png" height="40" /></td>
</tr>
</tbody>
</table>

The following technologies are used for the development of the .Stat Core:

<table>
<thead>
<tr>
<td align="center"><a href="https://kubernetes.io">kubernetes</a></td>
<td align="center"><a href="https://cloud.google.com">gcp</a></td>
<td align="center"><a href="https://www.docker.com">docker</a></td>
<td align="center"><a href="https://git-scm.com">git</a></td>
<td align="center"><a href="https://docs.gitlab.com/ee/ci/pipelines.html">gitlab</a></td>
<td align="center"><a href="https://www.microsoft.com/en-us/sql-server/sql-server-2017">sql server</a></td>
</tr>
</thead>
<tbody>
<tr>
<td align="center"><img src="https://upload.wikimedia.org/wikipedia/en/0/00/Kubernetes_%28container_engine%29.png" height="40" /></td>
<td align="center"><img src="https://www.pinclipart.com/picdir/middle/54-541486_google-cloud-platform-svg-clipart.png" height="40" /></td>
<td align="center"><img src="https://www.usine-digitale.fr/mediatheque/5/3/8/000277835_homePageUne/docker.jpg" height="40" /></td>
<td align="center"><img src="https://git-scm.com/images/logos/downloads/Git-Icon-1788C.png" height="40" /></td>
<td align="center"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/GitLab_Logo.svg/1108px-GitLab_Logo.svg.png" height="40" /></td>
<td align="center"><img src="https://user-images.githubusercontent.com/4249331/52232852-e2c4f780-28bd-11e9-835d-1e3cf3e43888.png" height="40" /></td>




</tr>
</tbody>
</table>


