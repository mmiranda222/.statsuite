---
title: Product overview and roadmap
subtitle: 
comments: false
weight: 12
---
*Revised as of March 2019. Current projected roadmap open to adjustment depending on +/- change in resource capacity and Community member priorities:*<br>

![Product roadmap](/images/Product_Roadmap.png)

## .Stat Core
---
Highly performing and secure [SDMX](http://sdmx.org/) back-end based on standard protocols to store, process and retrieve statistical data, structural and referential metadata, data process information and security settings.<br>
**Store** structural artefacts (DSDs, codelists, Category Schemes, etc.), shared charts and tables configurations, data and attributes values, and referential metadata.<br>
**Secure** through strong encryption methods, choose a preffered authentication provider, manage user roles and permissions.<br>
**Localise** to enable users to browse in their prefferred language, for both content and user interface elements supporting Latin and non-Latin characters types (English, French, Arabic, Spanish, etc.).<br>
**Query** from search services allowing to expose Dataflows in a detailed (as results) and aggregated ways (facets), ordered by relevance, and responding to the user queries (free text and faceted searches).<br>
**SDMX services** ([NSI Web Service](https://ec.europa.eu/eurostat/web/sdmx-web-services) that is part of the SDMX Reference Infrastructure) exposing SDMX flows for structure, data, attributes, and referential metadata.<br>

## .Stat DLM
---
**Model** by defining SDMX data Structures:<br>

* Multi-dimensional cubes (DSDs)
* Dimension names (Concepts)
* Views on sub-cubes (Dataflows + Allowed Content Constraints)
* Ownership (Agencies)
* Topics/themes (Categories)
* Data mapping rules (Structure Sets)
* Referential Metadata (MSDs)

**Get**:<br>

* Data import, transfer, export with and without structure mappings from various sources
* Data capture (surveys/collection/scraping; online/offline)

**Edit** by grid data editing <br>

**Calculate**:<br>

* Data validations and reports
* Data calculations (conversions, aggregations, estimations, indicator calculations) with VTL

**Flow**, **Script**, **Track** <br>

**Analyse** (find, understand, reuse data (internal)) and **disseminate** (manage embargo)

## .Stat Data Explorer (DE)
---
**Landing page** with access to free-text search or to browsing by configurable concepts (e.g. browse by topic, referance area, data source).<br>
**Search result page** with access to browsing by content types and indexed concepts, instant drill-down within search results (through dynamic filtering), and direct download (e.g. full .csv data files).<br>
**Visualisation page** with automated (metadata-driven) selections of dimensions, instant data pre-view in easily comprehensive basic table formats and basic chart types, allow for continued drill-down and selection changes, configurable or automated table and chart layout options, downloads, share and Open Data API (SDMX query generator) features.<br>
**Configure** to a specific context managing various deployment modes, multiple data portals, integration with existing tools and applications, and different API endpoints.<br>
