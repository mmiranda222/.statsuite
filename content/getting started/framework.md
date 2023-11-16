---
title: ".Stat Suite Open Source Framework"
subtitle: 
comments: false
weight: 25
keywords: [
  'Component-based technical architecture', '#component-based-technical-architecture',
  'Technical stack', '#technical-stack',
  '.Stat Data Explorer module', '#stat-data-explorer-module',
  'Non-technical overview', '#non-technical-overview',
  'Data Explorer app', '#data-explorer-app',
  'Share service', '#share-service',
  'Share-Viewer App', '#share-viewer-app',
  'Search service', '#search-service',
  'Proxy Service', '#proxy-service',
  'Config Service', '#config-service',
  'Dependencies', '#dependencies',
  'Multi-tenant architecture', '#multi-tenant-architecture',
  '.Stat Data Lifecycle Manager module', '#stat-data-lifecycle-manager-module',
  '.Stat Core module', '#stat-core-module',
  'Transfer service', '#transfer-service',
  'SDMX service', '#sdmx-service',
  'Plugin for SDMX service', '#plugin-for-sdmx-service',
  'Authorisation service', '#authorisation-service',
  'Dependencies', '#dependencies',
  'DevOps implementation', '#devops-implementation',
  'Component list and dependency matrix', '#component-list-and-dependency-matrix',
  'Contributing to an open source repository', '#contributing-to-an-open-source-repository',
]
---
<!-- This page (or a sub-page or sub-section of this page) of the documentation is referenced as an external resource in the .Stat Academy:
* https://academy.siscc.org/courses/introduction-to-the-stat-suite-open-source-framework/
* https://academy.siscc.org/contribute/
Any change affecting its URL must be communicated to the .Stat Academy content admin in advance. -->

#### Table of Content
- [Component-based technical architecture](#component-based-technical-architecture)
- [Technical stack](#technical-stack)
- [.Stat Data Explorer module](#stat-data-explorer-module)
  - [Non-technical overview](#non-technical-overview)
  - [Data Explorer app](#data-explorer-app)
  - [Share service](#share-service)
  - [Share-Viewer App](#share-viewer-app)
  - [Search service](#search-service)
  - [Proxy Service](#proxy-service)
  - [Config Service](#config-service)
  - [Dependencies](#dependencies)
  - [Multi-tenant architecture](#multi-tenant-architecture)
- [.Stat Data Lifecycle Manager module](#stat-data-lifecycle-manager-module)
- [.Stat Core module](#stat-core-module)
  - [Transfer service](#transfer-service)
  - [SDMX service](#sdmx-service)
  - [Plugin for SDMX service](#plugin-for-sdmx-service)
  - [Authorisation service](#authorisation-service)
  - [Dependencies](#dependencies)
- [DevOps implementation](#devops-implementation)
- [Component list and dependency matrix](#component-list-and-dependency-matrix)
- [Contributing to an open source repository](#contributing-to-an-open-source-repository)

---

### Component-based technical architecture

**The high-level technical architecture can be schematised as follow with a topology example (with two .Stat Suite SDMX data spaces):**

![Stat Suite high-level architecture](/dotstatsuite-documentation/images/statsuite-technical-architecture.png)

Each .Stat Suite main module (as well as their components) can be used together or separately.

**In the following are a few **typical use cases** on how an organisation can make use of these modules:**

**A) Adding the Data Explorer to an existing fully-fledged back-end solution**

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

---

### Technical stack
The following technologies are used for the development of the **.Stat Data Explorer** components and the **.Stat Data Lifecycle Manager** components:

<table>
<thead>
<tr>
<td align="center"><a href="https://kubernetes.io">kubernetes</a></td>
<td align="center"><a href="https://cloud.google.com">gcp</a></td>
<td align="center"><a href="https://www.docker.com">docker</a></td>
<td align="center"><a href="http://lucene.apache.org/solr">solr</a></td>
<td align="center"><a href="https://redis.io">redis</a></td>
<td align="center"><a href="https://www.mongodb.com/">mongo</a></td>
<td align="center"><a href="https://developer.mozilla.org/fr/docs/Web/JavaScript">es6</a></td>
<td align="center"><a href="https://nodejs.org">nodejs</a></td>
<td align="center"><a href="https://www.npmjs.com">npmjs</a></td">
<td align="center"><a href="https://git-scm.com">git</a></td>
<td align="center"><a href="https://docs.gitlab.com/ee/ci/pipelines.html">gitlab</a></td>
</tr>
</thead>
<tbody>
<tr>
<td align="center"><img src="https://upload.wikimedia.org/wikipedia/commons/0/00/Kubernetes_%28container_engine%29.png" style="height: 40px;" /></td>
<td align="center"><img src="https://www.pinclipart.com/picdir/middle/54-541486_google-cloud-platform-svg-clipart.png" style="height: 40px;" /></td>
<td align="center"><img src="https://www.usine-digitale.fr/mediatheque/5/3/8/000277835_homePageUne/docker.jpg" style="height: 40px;" /></td>
<td align="center"><img src="https://upload.wikimedia.org/wikipedia/commons/c/cd/Surface1.png" style="height: 40px;" /></td>
<td align="center"><img src="https://cdn-images-1.medium.com/max/1200/1*ngGAAMf8Sw4jCJ_nP2Qt5A.png" style="height: 40px;" /></td>
<td align="center"><img src="https://webimages.mongodb.com/_com_assets/cms/kuyjf3vea2hg34taa-horizontal_default_slate_blue.svg?auto=format%252Ccompress" style="height: 40px;" /></td>
<td align="center"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Unofficial_JavaScript_logo_2.svg/480px-Unofficial_JavaScript_logo_2.svg.png" style="height: 40px;" /></td>
<td align="center"><img src="https://nodejs.org/static/images/logos/nodejs-new-pantone-black.svg" style="height: 40px;" /></td>
<td align="center"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Npm-logo.svg/1280px-Npm-logo.svg.png" style="height: 40px;" /></td>
<td align="center"><img src="https://git-scm.com/images/logos/downloads/Git-Icon-1788C.png" style="height: 40px;" /></td>
<td align="center"><img src="/dotstatsuite-documentation/images/gitlab-logo-gray-rgb.png" style="height: 40px;" /></td>
</tr>
</tbody>
</table>

The following technologies are used for the development of the **.Stat Core** components:

<table>
<thead>
<tr>
<td align="center"><a href="https://kubernetes.io">kubernetes</a></td>
<td align="center"><a href="https://cloud.google.com">gcp</a></td>
<td align="center"><a href="https://www.docker.com">docker</a></td>
<td align="center"><a href="https://git-scm.com">git</a></td>
<td align="center"><a href="https://docs.gitlab.com/ee/ci/pipelines.html">gitlab</a></td>
<td align="center"><a href="https://www.microsoft.com/en-us/sql-server/sql-server-2017">sql server</a></td>
<td align="center"><a href="https://dotnet.microsoft.com/download/dotnet-core">.net core</a></td>
<td align="center"><a href="https://visualstudio.microsoft.com/">visual studio</a></td>
<td align="center"><a href="https://www.nuget.org/">nuget</a></td>
</tr>
</thead>
<tbody>
<tr>
<td align="center"><img src="https://upload.wikimedia.org/wikipedia/commons/0/00/Kubernetes_%28container_engine%29.png" style="height: 40px;" /></td>
<td align="center"><img src="https://www.pinclipart.com/picdir/middle/54-541486_google-cloud-platform-svg-clipart.png" style="height: 40px;" /></td>
<td align="center"><img src="https://www.usine-digitale.fr/mediatheque/5/3/8/000277835_homePageUne/docker.jpg" style="height: 40px;" /></td>
<td align="center"><img src="https://git-scm.com/images/logos/downloads/Git-Icon-1788C.png" style="height: 40px;" /></td>
<td align="center"><img src="/dotstatsuite-documentation/images/gitlab-logo-gray-rgb.png" style="height: 40px;" /></td>
<td align="center"><img src="https://fr-wiki.ikoula.com/images/5/55/Sqlserver.png" style="height: 40px;" /></td>
<td align="center"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/.NET_Core_Logo.svg/150px-.NET_Core_Logo.svg.png" style="height: 40px;" /></td>
<td align="center"><img src="https://visualstudio.microsoft.com/wp-content/uploads/2019/04/BrandVisualStudioWin2019.png" style="height: 40px;" /></td>
<td align="center"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/NuGet_project_logo.svg/220px-NuGet_project_logo.svg.png" style="height: 40px;" /></td>
</tr>
</tbody>
</table>

---

### .Stat Data Explorer module

<div>
    <img decoding="async" loading="lazy" src="/.stat-suite/design/demo/logos-svg/images/dotstat-de-base.svg" alt=".Stat Suite Data Explorer logo" style="width:285px;height:97px" width="285" height="97">
</div>
<p></p>

#### Non-technical overview

{{< mermaid align="left" >}}
graph LR;
  id0{user};
  id1((data-explorer));
  id6((share-viewer));
  id2[share service];
  id3[config service];
  id4[search service];
  id5(sdmx public endpoint);
  id0-->id1;
  id2-->id6;
  id0-->id6;
  id1-->id2;
  id1-->id3;
  id1-->id4;
  id4-->id3;
  id2-->id3;
  id6-->id3;
  id1-->id5;
{{< /mermaid >}}


#### Data Explorer app

##### short description
This web app is the main GUI for (external) users to find, understand and use the statistical data stored in the SDMX end point(s).

##### demo (light)
1. go to https://de-qa.siscc.org (tenant: oecd, env: staging)
1. home page
1. search by facets (click on a facet)
1. fine-tune search results (play with facet selection)
1. data view with search params as data query (click on a dataflow)
1. fine-tune data selection (play with filter selection)
1. fine-tune data view (play with customize)

##### technical aspects
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer
- **docker**: https://cloud.docker.com/u/siscc/repository/docker/siscc/dotstatsuite-data-explorer
- forked from https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-webapp (boilerplate to help crafting web application fully integrated within dotstat-data-explorer-suite)
- server-side rendered (configuration is injected in index.html), no request required from the client to get the configuration
- client bundle expects configuration in `window.SETTINGS`, `window.I18N` and `window.CONFIG` for those who want to use directly the static files


#### Share service

##### short description
This service (and related database) is used to store and retrieve user-defined data tables and charts as small JSON objects containing the related configurations.
A Redis database is used to store shared objects (tables or charts). Share server is not auth protected, so any robot can spam it. In order to avoid it, many mechanisms are in place:

* tables/charts are only temporarily stored for `redisChartTTL` seconds before being deleted unless confirmed via email link
* share server checks POST calls rates. Over `maxRatePerIP` POST calls per second, per IP, are rejected with a 419 HTTP code
* POST bodies are limited in size to `maxChartSize`

##### demo
1. go to any visualisation page (table view or chart view) of https://de-demo.siscc.org/ 
1. click on share button
1. fill the form (email adress)
1. click on publish 'Request URL and embed code'
1. check email
1. follow the confirmation link
1. check the shared view

##### flow

{{< mermaid align="left" >}}
graph LR
id0[user]
id1((share-requester))
id2[share service]
id3(share db)
id4((share-viewer))

id0 --- id1
id1 -->|1. share chart request| id2
id2 -->|2. returns id and chart url| id1
id2 -->|3. chart temporary stored| id3
id2 -->|4. confirmation email| id0
id0 -->|5. user confirmation| id2
id2 -->|6. chart confirmed| id3
id2 -->|7. redirect user|id4
{{< /mermaid >}}


##### technical aspects
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share
- **docker**: https://cloud.docker.com/u/siscc/repository/docker/siscc/dotstatsuite-share
- a redis database is used to store shared charts
- share server is not auth protected, so any robot can spam it; to avoid that, many mechanisms are in place:
  - charts are only temporarily stored for `redisChartTTL` seconds before being deleted unless confirmed via email link
  - share server checks POST calls rates. Over `maxRatePerIP` POST calls per second, per IP, are rejected with a 419 HTTP code
  - POST bodies are limited in size to `maxChartSize`

#### Share-Viewer App

##### short description
This web app is a companion GUI for (external) users to display user-defined, shared data tables and charts e.g. in embedded views or through shared links.

##### demo (light)
1. Go to https://dv-demo.siscc.org/ (to get a dedicated viewer representation, follow the Share demo)

##### technical aspects
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer
- **docker**: https://cloud.docker.com/u/siscc/repository/docker/siscc/dotstatsuite-data-viewer
- ? forked from https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-webapp (boilerplate to help crafting web application fully integrated within dotstat-data-explorer-suite)
- ? server-side rendered (configuration is injected in index.html), no request required from the client to get the configuration
- ? client bundle expects configuration in `window.SETTINGS`, `window.I18N` and `window.CONFIG` for those who want to use directly the static files

#### Search service

##### short description
This service is a .Stat-specific proxy to an SolR engine to index SDMX dataflows categorised and accessible in one or more SDMX end points and to execute faceted search queries on these SDMX dataflows.

##### features/demos
- free-text faceted search
- results are sorted by relevance and paginated
- free-text search hit: highlight the first occurance of all search terms 
- handles hierarchical facet content (from SDMX codelists)
- multi-language enabled
- [single term search](https://de-demo.siscc.org/?locale=en&term=Unemployment%20rate%20by%20sex%20and%20disability%20status): `Unemployment rate by sex and disability status` 1 result
- [phrase term search](https://de-demo.siscc.org/?locale=en&term=Unemployment%20rate%20by%20sex%20and%20disability%20status?locale=en&term=%22Unemployment%20rate%20by%20sex%20and%20disability%20status%22): `"Unemployment rate by sex and disability status"` 1 result
- [tagged search](https://de-demo.siscc.org/?locale=en&term=name%3Aenterprises): `name:enterprises`
- [multiple tagged search with phrase](https://de-demo.siscc.org/?locale=en&term=name%3Aenterprises%20description%3A%22tourism%22): `name:enterprises description:"tourism"`
- [negate search](https://de-demo.siscc.org/?locale=en&term=-seasonally): `-seasonally` 25/33 results ([witness](https://de-demo.siscc.org/?locale=en&term=seasonally): `seasonally` 8/33 results)
- synonyms
- stemming
- ASCII-folding

##### architecture
{{< mermaid align="left" >}}
graph LR
  id0[ExpressJS + evtX]
  id2[SolR]
  id4(mongo)
  id5[config]
  id7((user))
  id9((admin))

  id0 -->|GET| id7
  id9 -->|POST| id0
  id0 --- id4
  id0 --- id5
  id0 --- id2
  subgraph sdmx-faceted-search
    id0
  end
{{< /mermaid >}}


##### technical aspects
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search
- **docker**: https://cloud.docker.com/u/siscc/repository/docker/siscc/dotstatsuite-sdmx-faceted-search
- schema auto-generation using dynamic fields

#### Proxy Service
##### short description
The Proxy service handles route request depending on urls (`https://<app>.<env>.<tenant>.siscc.org`), and sets tenant headers depending on host to instruct target application. `<tenant>.siscc.org` could be replaced by a dedicated DNS entry, e.g. `https://<app>.<env>.oecd.org`.

##### technical aspects
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy
- **docker**: https://cloud.docker.com/u/siscc/repository/docker/siscc/dotstatsuite-kube-proxy
- handles route request depending on urls (`https://<app>.<env>.<tenant>.siscc.org`)
- set tenant headers depending on host to instruct target application
- `<tenant>.siscc.org` could be replaced by a dedicated DNS entry, ie `https://<app>.<env>.oecd.org`

#### Config Service

##### short description

The Configuration service centralises all configuration resources used by other services. It is a web server providing requested configuration, not exposed to users. Based on git versioned configuration data.

##### technical aspects
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config
- **docker**: https://cloud.docker.com/u/siscc/repository/docker/siscc/dotstatsuite-config-dev
- centralize all configuration resources used by other services
- web server to provide requested configuration, not exposed to users
- git versioned configuration data

#### Dependencies

##### (Dependency) sis-footer

##### short description
A footer view component for Table and Charts.

##### technical aspects
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-footer
- **package**: https://www.npmjs.com/package/@sis-cc/dotstatsuite-ui-footer

##### (Dependency) rcw-charts

##### short description
Set of configurable charts based on d3.

##### technical aspects
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-d3-charts
- **package**: https://www.npmjs.com/package/@sis-cc/dotstatsuite-d3-charts

##### (Dependency) visions

##### short description
Visions is a library of React components. The goal is to handle interfaces and very limited logic.

##### technical aspects
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-components
- **package**: https://www.npmjs.com/package/@sis-cc/dotstatsuite-ui-components

##### (Dependency) sis-header

##### short description
A header view component for Tables and Charts.

##### technical aspects
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-header
- **package**: https://www.npmjs.com/package/@sis-cc/dotstatsuite-ui-header

##### (Dependency) dotstatsuite components

##### short description
Is a library of components. [*more discription to come*]

##### technical aspects
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-components
- **package**: https://www.npmjs.com/package/@sis-cc/dotstatsuite-components

##### (Dependency) dotstatsuite-sdmxjs

##### short description
Is a library of components for the parsing of SDMX-JSON messages. [*more discription to come*]

##### technical aspects
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmxjs
- **package**: https://www.npmjs.com/package/@sis-cc/dotstatsuite-sdmxjs


#### Multi-tenant architecture

##### demo (staging)

|tenant|specs|url|
|---|---|---|
|oecd|own sdmx oecd staging endpoint, OECD-staging|https://de-demo.siscc.org/|


##### technical overview

{{< mermaid align="left" >}}
graph LR
id1(browser)
id2((internet))
id3[proxy]
id4((data-explorer))
id12((share-viewer))
id5[search]
id6[share]
id7[config]
id8[solr]
id9(mongo)
id10(redis)
id11((x))
id13[sdmx/nsi]
id14[transfer]
id15(mssql)

id1 --> id2
id2 --> id3
subgraph oecd cluster on GCP
id3 -->|app & tenant| id11
id3 -->|assets| id7
id11 --> id4
id11 --> id5
id11 --> id6
id11 --> id12
id4 --> id7
id5 --> id7
id5 --> id8
id5 --> id9
id6 --> id7
id6 --> id10
id12 --> id7
end
id2 --> id13
id2 --> id14
subgraph oecd cluster on GCP
id13 --> id15
id14 --> id15
end
{{< /mermaid >}}


##### demo: add/update a tenant
1. update list of tenants: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/blob/develop/configs/tenants.json
1. add tenant config (data-explorer & sdmx): https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/tree/develop/data/dev/configs
1. add tenant referenced assets (data-explorer): https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/tree/develop/assets/
1. check the tenant at http://de-staging-tenant=<tenant>.siscc.org/
1. update something in the configuration and check the update

##### demo: add/update an app for the tenant (siscc workshop hands-on)
1. fork from wepapp
1. inject pre-coded app (to create)
1. declare it somewhere
1. check the app at `http://<app>.staging.<tenant>.siscc.org`
1. update the app
1. check the app at `http://<app>.staging.<tenant>.siscc.org`

---

### .Stat Data Lifecycle Manager module

<div>
    <img decoding="async" loading="lazy" src="/.stat-suite/design/demo/logos-svg/images/dotstat-dlm-base.svg" alt=".Stat Suite Data Lifecycle Manager logo" style="width:285px;height:98px" width="285" height="98">
</div>
<p></p>

#### Data Data Lifecycle Manager app

##### short description
This web app is the main GUI for statistical data teams to efficiently produce and prepare high-quality statistical data and metadata for dissemination.

##### demo (light)
1. go to https://dlm-qa.siscc.org/

##### technical aspects
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager
- **docker**: https://hub.docker.com/r/siscc/dotstatsuite-data-lifecycle-manager

---

### .Stat Core module

<div >
    <img decoding="async" loading="lazy" src="/.stat-suite/design/demo/logos-svg/images/dotstat-core-base.svg" alt=".Stat Suite CORE logo" style="width:285px;height:97px" width="285" height="97">
</div>
<p></p>

#### technical overview

{{< mermaid align="left" >}}
graph LR
id1((de & share-viewer))
id2((dlm))
id3[sdmx/nsi]
id4[sdmx/nsi plugin]
id5[transfer]
id6[data-access]
id7[common]
id8(structure-db)
id9(data-db)
id10[auth-management]
id11(auth-log-db)

id1 --> id3
id2 --> id3
id2 --> id5
id2 --> id10
subgraph sdmx-ri / eurostat
  id3 --> id8
end
subgraph .stat core
  id3 --> id4
  id4 --> id6
  id4 --> id7
  id5 --> id6
  id5 --> id7
  id6 --> id9
  id6 --> id11
  id10 --> id11
end
id6 --> id8
{{< /mermaid >}}


#### Transfer service

##### short description
This web service allows uploading statistical data and their referential metadata to a .Stat Core data space as well as transfering them between different .Stat Core data spaces.

##### demo (light)
1. go to https://transfer-qa.siscc.org/swagger (tenant: oecd, env: qa)

##### technical aspects
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer
- **docker**: https://cloud.docker.com/u/siscc/repository/docker/siscc/dotstatsuite-core-transfer


#### SDMX service
(also named SDMX-RI NSI web service (c) Eurostat)

##### short description
This web service allows uploading data structures to a .Stat Core data space as well as retrieving data structures, data and their referential metadata from a .Stat Core data space.  
This RESTful web service is developed by Eurostat and is fully SDMX compliant.

##### demo (light)
1. go to http://nsi-stable-qa.siscc.org/ (tenant: oecd, env: qa)

##### technical aspects
- **repository**: https://citnet.tech.ec.europa.eu/CITnet/stash/projects/SDMXRI/repos/nsiws.net
- **docker**: https://hub.docker.com/r/siscc/sdmxri-nsi-maapi
- **docker of original Eurostat SDMX-RI NSI web service**: https://cloud.docker.com/u/siscc/repository/docker/siscc/sdmxri-nsi


#### Authorisation service

##### short description
This web service allows managing user access rights for data structures and data/referential metadata in .Stat Core data spaces.

##### demo (light)
1. go to http://authz-qa.siscc.org/swagger (tenant: oecd, env: qa)

##### technical aspects
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management
- **docker**: https://cloud.docker.com/u/siscc/repository/docker/siscc/dotstatsuite-core-auth-management

#### Dependencies

##### (Dependency) Data Access library to access the .Stat Core Data Store

##### short description
This library is used by the Transfer service to upload and transfer statistical data structures to and between .Stat Core data spaces.

##### technical aspects
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access
- **package**: https://www.nuget.org/packages/DotStat.DataAccess.NuGet

##### (Dependency) Core Common library

##### short description
This library is used for shared code in the .Stat Core components. These inlude logs, localisation and configuration.

##### technical aspects
- **repository**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common
- **package**: https://www.nuget.org/packages/DotStat.Common

---

### DevOps implementation
See: [.Stat DevOps implementation](https://sis-cc.gitlab.io/dotstatsuite-documentation/getting-started/devops/) 

---

### Component list and dependency matrix
[FlowMatrixInfo__1_.xlsx](/uploads/27643af0f690545d46d897fe1935d8a1/FlowMatrixInfo__1_.xlsx)

---

### Contributing to an open source repository
https://www.gienverschatse.com/oss/2018/02/06/flow-of-open-source/