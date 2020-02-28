---
title: ".Stat DE index and search API interactions"
subtitle: 
comments: false
weight: 76
---

The [SDMX Faceted Search](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search) (`sfs`) service of .Stat DE provides faceted search capabilities on SDMX dataflows.  <br>
.Stat DE and the `sfs` service use [Solr](https://lucene.apache.org/solr/) to index and search dataflows.  <br>
A sysadmin user (meaning a user having access to the installation/configuration of Solr, or someone with the authorisation to run commands over the Admin API) can lively manage the index of the endpoints for updating the dataflows that are published in .Stat DE and available for search and visualisation.  <br>
The examples provided below are made using the free version of the API platform [Postman](https://www.postman.com/).

#### API format
The API is protected by an API key (see `src/server/params/[env] apiKey`). In the following examples, the API key is `xxx`.  <br>
All requests need a header made of:
* the api URL, e.g. `http://sfs-qa-oecd.redpelicans.com/`
* a role, in all cases `/admin/`
* the target of the request, e.g. `/dataflows/`, `/dataflow/` or `/config/`
* the api key, in these example `?api-key=xxx`
* actions' variables, e.g. depending on the request `&datasourceId&dataflowId`

#### GET search sfs config.
Example:  <br>
`GET` `http://sfs-qa-oecd.redpelicans.com/admin/config?api-key=xxx`

![GET search sfs config](/images/de-index-get-config.png)

This request returns the `sfs` dynamic configuration with full details on configUrl, data source(s), fileds, RedisServer, fields and indexed dataflows.

#### GET search sfs report
Example: <br>
`GET` `http://sfs-qa-oecd.redpelicans.com/admin/report?api-key=xxx`

![GET search sfs report](/images/de-index-get-report.png)

This request returns the `sfs` in memory loadings statuses.

#### Index all dataflows
Example: <br>
`POST` `http://sfs-qa-oecd.redpelicans.com/admin/dataflows?api-key=xxx`

![Index all dataflows](/images/de-index-post-all.png)

This request indexes **all dataflows** from **all configured sdmx endpoints**. In details, it:
* requests all sdmxDataSources
* adds dataflows to Sorl Core
* updates existing dynamic sfs schema depending on added dataflows

#### Delete all dataflows
Example: <br>
`DELETE` `http://sfs-qa-oecd.redpelicans.com/admin/dataflows?api-key=xxx`

![Delete all dataflows](/images/de-index-delete-all.png)

This request results in deleting all dataflows from the index and search of Solr for all configured sdmxDataSources.

#### Delete one specific dataflow
>Released in [Mmmm DD, 2020 Release .Stat Suite JS milestone XX](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#mmmm-dd-2020)

Example: <br>
`DELETE` `http://sfs-qa-oecd.redpelicans.com/admin/dataflow?api-key=xxx&datasourceId=staging:SIS-CC-reset&dataflowId=AIR_EMISSIONS_DF`

![Delete one specific dataflow](/images/de-index-delete-dataflow.png)

This request results in deleting one specific dataflow from the index and search. It is thus no longer avaibale in .Stat DE for search and visualisation.

#### Update an already indexed dataflow
>Released in [Mmmm DD, 2020 Release .Stat Suite JS milestone XX](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#mmmm-dd-2020)

Example: <br>
`PATCH` `http://sfs-qa-oecd.redpelicans.com/admin/dataflow?api-key=xxx&datasourceId=staging:SIS-CC-stable&dataflowId=DF_SDG_ALL_SDG_A871_SEX_AGE_RT&agencyId=ILO&version=1.0`

![Update an already indexed dataflow](/images/de-index-patch-dataflow.png)

This request results in updating one single dataflow **ONLY IF** this dataflow was already indexed by Solr.
