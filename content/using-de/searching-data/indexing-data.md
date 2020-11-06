---
title: "Indexing data"
subtitle: 
comments: false
weight: 1600

---

#### Table of Content
- [What is indexed](#what-is-indexed)
  - [Conditions and exceptions](#conditions-and-exceptions)
- [When and how to index](#when-and-how-to-index)
  - [API format](#api-format)
  - [GET search sfs config.](#get-search-sfs-config)
  - [DELETE search sfs config](#delete-search-sfs-config)
  - [GET search sfs report](#get-search-sfs-report)
  - [Index all dataflows](#index-all-dataflows)
  - [Delete all dataflows](#delete-all-dataflows)
  - [Delete one specific dataflow](#delete-one-specific-dataflow)
  - [Update an already indexed dataflow](#update-an-already-indexed-dataflow)

---

### What is indexed
The languages used for the search features are configurable per Data Explorer instance (part of the installation process), and there must be at least one language defined. If the below localised elements for a defined language are not available, then they are replaced by their corresponding IDs.  

The information describing the dataflows are entirely retrieved from one or more SDMX endpoints (data sources) that need to be configured:
* ID of the data source
* Localised names of the data source (one per language defined)
* URI of the SDMX endpoint (if possible supporting https), e.g. `https://www.mywebiste.org/sdmx/rest`
* Queries to get one or more hierarchical CategorySchemes together with the dataflows (that have been categorised in these CategorySchemes) to be indexed, e.g. `["categoryscheme/Agency/AgencyID/latest/?references=dataflow","categoryscheme/Agency/CategorySchemeID/latest/?references=dataflow","categoryscheme/EXT/all/latest/?references=dataflow"]`
* The query to get the structure information, categorisations (in Categories of previous CategorySchemes) and content constraints (separately) for each dataflow can be derived from the URI adding the following: `dataflow/{agencyID}/{dataflowID}/{versionID}?references=all&detail=referencepartial`
* Note that some SDMX APIs do not yet support the `detail=referencepartial` option.

The following pieces of information are retrieved for each dataflow:
* Agency, ID, version, localised names and localised descriptions of the Dataflow
* ID and localised names of the corresponding data source
* The date/time when the Dataflow data have last been updated: **CURRENT_STATE** it is the date/time when the dataflow (re)index was triggered
* ID and localised names of the CategorySchemes in which the dataflow is categorised
* ID and localised names and hierarchy position of the categories in which the dataflow is categorised
* IDs and localised names of the concepts used as dimensions, as well as the dimension IDs
* IDs, localised names and hierarchy position of the codes used as dimension values constrained by the Actual Content Constraints defined for the dataflow. **Note** that this Content Constraint also contains information about the Time Periods (Time dimension values) available for the dataflow. It allows defining a specific “Time Period” range facet.

In SDMX, dataflows are **uniquely** identified by data source, Agency, ID and Version. However, to avoid user confusion, the **search does not distingish dataflows per Agency or per Version**. Thus if there are dataflows, categorised for search indexing, with the same ID, but with different Agencies or different Versions, then only one of them is indexed (first version retrieved through `dataflow/all/ID/latest`). In such a case, it is needed to create and categorise separate dataflows with different IDs.  

If the same dataflow (same ID, whatever Agency or Version) is retrieved from different data sources, then they are indexed separately and appear in the search results as different dataflows, and the are **distinguished by the data source** which is visible when the dataflow information is expanded.

#### Conditions and exceptions
> Released in [June 23, 2020 Release .Stat Suite JS 5.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#june-23-2020)  

* A dataflow is indexed **only if** there is data associated to it.  
  The data availability check is based on the `Actual Content Constraint` attached to the dataflow. The dataflow is indexed only if there is:  
  - a *non-empty* Actual Content Constraint
  - no Actual Content Constraint (for compatibility with SDMX web services not based on .Stat Suite).
* A particular dimension of a dataflow is indexed only if the dimension values *with available data* do not exceed the limit defined in the `SFS` configuration parameter `DIMENSION_VALUES_LIMIT`, which is by default set to `1000`. It protects the search engine from too big codelists and prevents performance impacts. For more information see [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#limit-for-indexing-dimensions-per-dataflow).

---

### When and how to index

**CURRENT_STATE** The index is a manual action usually performed by a sysadmin user, who can lively manage the index of the endpoints for updating the dataflows that are published in .Stat DE and available for search and visualisation.  
The following individual actions are currently enabled for index:
* Index all datflows for all data sources
* Delete all dataflows
* Delete one specific dataflow
* Update an already indexed dataflow

The examples provided below are made using the free version of the API platform [Postman](https://www.postman.com/).

#### API format
The API is protected by an API key (see `src/server/params/[env] apiKey`). In the following examples, the API key is `xxx`.  <br>
All requests need a header made of:
* the api URL, e.g. `http://sfs-qa.siscc.org/`
* a role, in all cases `/admin/`
* the target of the request, e.g. `/dataflows/`, `/dataflow/` or `/config/`
* the api key, in these example `?api-key=xxx`
* actions' variables, e.g. depending on the request `&datasourceId&dataflowId`

#### GET search sfs config.
Example:  
`GET` `http://sfs-qa.siscc.org/admin/config?api-key=xxx`

![GET search sfs config](/dotstatsuite-documentation/images/de-index-get-config.png)

This request returns the `sfs` dynamic configuration with full details on configUrl, data source(s), fileds, RedisServer, fields and indexed dataflows.

#### DELETE search sfs config
Example:  
`DELETE` `http://sfs-qa.siscc.org/admin/config?api-key=xxx`

#### GET search sfs report
Example:  
`GET` `http://sfs-qa.siscc.org/admin/report?api-key=xxx`

![GET search sfs report](/dotstatsuite-documentation/images/de-index-get-report.png)

This request returns the `sfs` in memory loadings statuses.

#### Index all dataflows
Example:  
`POST` `http://sfs-qa.siscc.org/admin/dataflows?api-key=xxx`

![Index all dataflows](/dotstatsuite-documentation/images/de-index-post-all.png)

This request indexes **all dataflows** from **all configured sdmx endpoints**. In details, it:
* requests all sdmxDataSources
* adds dataflows to Sorl Core
* updates existing dynamic sfs schema depending on added dataflows

#### Delete all dataflows
Example:  
`DELETE` `http://sfs-qa.siscc.org/admin/dataflows?api-key=xxx`

![Delete all dataflows](/dotstatsuite-documentation/images/de-index-delete-all.png)

This request results in deleting all dataflows from the index and search of Solr for all configured sdmxDataSources.

#### Delete one specific dataflow
>Released in [February 28, 2020 Release .Stat Suite JS 4.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#february-28-2020)

Example:  
`DELETE` `http://sfs-qa.siscc.org/admin/dataflow?api-key=xxx&datasourceId=staging:SIS-CC-reset&dataflowId=AIR_EMISSIONS_DF`

![Delete one specific dataflow](/dotstatsuite-documentation/images/de-index-delete-dataflow.png)

This request results in deleting one specific dataflow from the index and search. It is thus no longer avaibale in .Stat DE for search and visualisation.

#### Update an already indexed dataflow
>Released in [February 28, 2020 Release .Stat Suite JS 4.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#february-28-2020)

Example:  
`PATCH` `http://sfs-qa.siscc.org/admin/dataflow?api-key=xxx&datasourceId=staging:SIS-CC-stable&dataflowId=DF_SDG_ALL_SDG_A871_SEX_AGE_RT&agencyId=ILO&version=1.0`

![Update an already indexed dataflow](/dotstatsuite-documentation/images/de-index-patch-dataflow.png)

This request results in updating one single dataflow **ONLY IF** this dataflow was already indexed by Solr.


