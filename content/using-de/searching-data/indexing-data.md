---
title: "Indexing data"
subtitle: 
comments: false
weight: 1600
keywords: [
  'Before indexing data', '#before-indexing-data',
  'How to create a SOLR collection', '#how-to-create-a-solr-collection',
  'What is indexed', '#what-is-indexed',
  'Conditions and exceptions', '#conditions-and-exceptions',
  'Indexing externally defined dataflows', '#indexing-externally-defined-dataflows',
  'When and how to index', '#when-and-how-to-index',
  'API format', '#api-format',
  'Index all dataflows', '#index-all-dataflows',
  'Index or update one individual dataflow', '#index-or-update-one-individual-dataflow',
  'Delete all dataflows', '#delete-all-dataflows',
  'Delete one individual dataflow', '#delete-one-individual-dataflow',
  'Other admin queries', '#other-admin-queries',
  'Get search logs', '#get-search-logs',
  'Get in-memory indexing statuses', '#get-in-memory-indexing-statuses'
]

---

> *Version history:*  
> 'GET sfs report' query is replaced by 'Get sfs logs' query with [December 5, 2022 Release .Stat Suite JS spin](/dotstatsuite-documentation/changelog/#december-5-2022)  
> Index an individual dataflow since [July 8, 2021 Release .Stat Suite JS 9.0.0](/dotstatsuite-documentation/changelog/#july-8-2021)  
> Introduction of the **Collection** concept with Solr with [May 19, 2021 Release .Stat Suite JS 8.0.0](/dotstatsuite-documentation/changelog/#may-19-2021)  
> Indexation of externally defined dataflows since [November 30, 2020 Release .Stat Suite JS 6.1.0](/dotstatsuite-documentation/changelog/#november-30-2020)  
> Rules of indexations enhanced with [June 23, 2020 Release .Stat Suite JS 5.1.0](/dotstatsuite-documentation/changelog/#june-23-2020)  
> Delete an individual dataflow since [February 28, 2020 Release .Stat Suite JS 4.0.0](/dotstatsuite-documentation/changelog/#february-28-2020)

#### Table of content
- [Before indexing data](#before-indexing-data)
  - [How to create a SOLR collection](#how-to-create-a-solr-collection)
- [What is indexed](#what-is-indexed)
  - [Conditions and exceptions](#conditions-and-exceptions)
  - [Indexing externally defined dataflows](#indexing-externally-defined-dataflows)
- [When and how to index](#when-and-how-to-index)
  - [API format](#api-format)
  - [Index all dataflows](#index-all-dataflows)
  - [Index or update one individual dataflow](#index-or-update-one-individual-dataflow)
  - [Delete all dataflows](#delete-all-dataflows)
  - [Delete one individual dataflow](#delete-one-individual-dataflow)
- [Other admin queries](#other-admin-queries)
  - [Get search logs](#get-search-logs)
  - [Get in-memory indexing statuses](#get-in-memory-indexing-statuses)

---

### Before indexing data
Before indexing your data for the first time, SOLR collection(s) need to be created. See below how to do this. 

#### How to create a SOLR collection
SFS requires **one SOLR collection per `organisation`** (see [new tenant model](/dotstatsuite-documentation/configurations/tenant-model/)). The collection names must match the `organisation` names. Those SOLR collections allow to separate the searchable data between `organisations`.

Creating your SOLR collections is easy, you just need to execute the **setup script** documented [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search#script). It will automatically create the SOLR collections for all your `organisations` as previously defined in your `tenants.json` file.

If you are in a mono-tenant installation mode using the 'default' `organisation`, then only one '**default**' collection is created.

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

If the same dataflow (same ID, whatever Agency or Version) is retrieved from different data sources, then they are indexed separately and appear in the search results as different dataflows, and the are **distinguished by the data source** which is visible when the dataflow information is expanded (according to the configuration settings).

#### Conditions and exceptions
* A dataflow is indexed **only if** there is data associated to it.  
  The data availability check is based on the `Actual Content Constraint` attached to the dataflow. The dataflow is indexed only if there is:  
  - a *non-empty currently valid* Actual Content Constraint or 
  - (if there is no Actual Content Constraint) the data query for the first observation (range 0:0) returns an observation.
* A particular dimension of a dataflow is indexed only if the dimension values *with available data* do not exceed the limit defined in the `SFS` configuration parameter `DIMENSION_VALUES_LIMIT`, which is by default set to `1000`. It protects the search engine from too big codelists and prevents performance impacts. For more information see [here](/dotstatsuite-documentation/configurations/de-configuration/#limit-for-indexing-dimensions-per-dataflow).

#### Indexing externally defined dataflows
It is possible to index externally defined dataflows for browsing and searching in .Stat DE, in the case when the dataflow is stored only as stubs (without content, e.g. without the link to its DSD), meaning that the full definition and content of the corresponding dataflow is stored externally.  
Therefore, the locally stored dataflow stub includes the references (`URL link`) to the original external full dataflow definition, with the following artefact properties: `isExternalReference=true`, and link `{external structure link}`.  
Note also that the locally stored dataflow stub must be categorised in the CategoryScheme that will be used by the index process.

Example of a dataflow stub definition with external reference:  
```
<structure:Dataflows>
  <structure:Dataflow id="DF_SDG_ALL_SDG_A871_SEX_AGE_RT" agencyID="ILO" version="1.0" isExternalReference="true" isFinal="true" structureURL="https://ilo.org/sdmx-test/rest/dataflow/ILO/DF_SDG_ALL_SDG_A871_SEX_AGE_RT/1.0">
    <common:Name xml:lang="en">SDG indicator 8.7.1 - Proportion of children engaged in economic activity</common:Name>
    <common:Description xml:lang="en">Estimates on economic activity among children aged 5-17...</common:Description>
  </structure:Dataflow>
</structure:Dataflows>
```

---

### When and how to index
Currently, the indexation is triggered manually. The following actions can be performed by a system administrator:
* (Re-)Index all currently relevant dataflows for all data sources (without removing entries for previously indexed dataflows)
* (Re-)Index one individual dataflow
* Delete all entries of previously indexed dataflows
* Delete the entry of one previously indexed dataflow

The examples provided below are made using the free version of the API platform [Postman](https://www.postman.com/).

#### API format
The API is protected by an **API key**. In Docker-Compose installation, this key is defined as an environment variable named **`API_KEY_SFS`**. See an example in [Docker compose file](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose/-/blob/master/demo/.env). In the following examples, the configured API key is supposed to be `xxx`.

API requests can be constructed as follow
* the URL root, e.g., `https://sfs.myorg.org/`
* the API name as folder, `/admin/`
* the target of the request as folder, `/dataflows/` or `/dataflow/`
* the API key as `x-api-key` HTTP header, e.g., `x-api-key=xxx`
* the tenant name as `x-tenant` HTTP header, e.g., `x-tenant=XXXXXX`
* additional parameters depending on the request in a raw JSON-formatted request body
  ```json
  {
    "spaceId": "disseminate",
    "agencyId": "XYZ",
    "id": "DF_ABC",
    "version": "1.0",
    "mode": "async"
  }
  ```

**Notes**  
- If you are using the default tenant collection, then all calls without a tenant will use the value of `DEFAULT_TENANT` as a tenant, and thus specifying the tenant becomes optional.
- Instead of HTTP headers and parameters in a raw JSON-formatted request body, it is still possible to use the corresponding URL query parameters for development of testing purposes in isolated environments, e.g., `api-key`, `tenant`, `spaceId`, `agencyId`, `id` and `version`. However, for greater security, it is recommended to use the HTTP header parameters and (encrypted) body in all other circumstances.

For more details please see [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search#admin-api-http-test-api-to-insert-update-or-delete-dataflows-in-the-search-index-or-to-get-logs).

#### (Re-)Index all dataflows

`POST /admin/dataflows`

This request re-indexes **all dataflows** from **all configured sdmx endpoints**. In details, it:
* requests all SDMX data sources
* adds dataflows to the Solr index
* updates the dynamic sfs schema depending on the added dataflows

Note that this action **does not** clean up the index, meaning that non-categorized or deleted dataflows in the data source that were previsouly indexed, will not be removed from the index. To do so, you first need to execute the [Delete all dataflows](#delete-all-dataflows) action to clean up the index, and then run this action to re-index all dataflows. 

Example:  
`POST https://sfs.myorg.org/admin/dataflows`  
`x-api-key=xxx`  
`x-tenant=XXXXXX`  

![Index all dataflows](/dotstatsuite-documentation/images/de-index-post-all.png)

For more details please see [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search#dataflows).

#### Index or update one individual dataflow

`POST /admin/dataflow`

This request re-indexes (inserts or updates) **one individual dataflow**.

Example:  
`POST https://sfs.myorg.org/admin/dataflow`  
`x-api-key=xxx`  
`tenant=XXXXXX`  
```json
{
  "spaceId": "staging:SIS-CC-reset",
  "agencyId": "OECD",
  "id": "AIR_EMISSIONS_DF",
  "version": "1.0"
}
```

![Index one dataflow](/dotstatsuite-documentation/images/de-index-individual-dataflow.png)

For more details please see [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search#dataflow).

#### Delete all dataflows

`DELETE /admin/dataflows`

This request deletes all entries for previously indexed dataflows for all configured SDMX data sources.

Example:  
`DELETE https://sfs.myorg.org/admin/dataflows`  
`x-api-key=xxx`  
`x-tenant=XXXXXX`

![Delete all dataflows](/dotstatsuite-documentation/images/de-index-delete-all.png)

For more details please see [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search#dataflows).

#### Delete one individual dataflow

`DELETE /admin/dataflow`

This request deletes one specific dataflow from the index and search. It is thus no longer avaibale in .Stat DE for search and visualisation.

Example:  
`DELETE https://sfs.myorg.org/admin/dataflow`  
`x-api-key=xxx`  
`tenant=XXXXXX`  
```json
{
  "spaceId": "staging:SIS-CC-reset",
  "agencyId": "OECD",
  "id": "AIR_EMISSIONS_DF",
  "version": "1.0"
}
```

![Delete one specific dataflow](/dotstatsuite-documentation/images/de-index-delete-dataflow.png)

For more details please see [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search#dataflow).

---

### Other admin queries
API requests for logs and reports can be constructed as explained in [API format](#api-format), with the following changes:
* the target of the request as folder, `/logs/`, `/report/` or `/config/`
* additional parameters depending on the request in a raw JSON-formatted request body
  ```json
  {
    "id": 1669717223969,
    "userEmail": "test@siscc.org",
    "spaceId": "disseminate",
    "agencyId": "XYZ",
    "submissionStart": "2021-11-29T10:20:23.985Z",
    "submissionEnd": "2023-11-29T10:20:23.985Z",
    "executionStatus": "completed",
    "executionOutcome": "success",
    "artefact": {
      "resourceType": "dataflow",
      "agencyID": "XYZ",
      "id": "DF_ABC",
      "version": "1.0"
    }
  }
  ```

For more details please see [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search#logs) and [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search#others).

#### Get search logs

`GET /admin/logs` or `POST /admin/logs`

Without filter parameters, this request returns all the search index management logs for all datasources and dataspaces. A number of filter parameters allow restricting the returned logs. See the full [API documentation](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search#logs) for details about those query parameters.

Examples:  

1) Get all logs  
   `GET https://sfs.myorg.org/admin/logs`  
   `x-api-key=xxx`
   
   ![GET all search sfs logs](/dotstatsuite-documentation/images/de-index-get-logs-all.png)

2) Get the logs for a specific index management action, identified by id  
   `POST https://sfs.myorg.org/admin/logs`   
   `x-api-key=xxx`  
  ```json
  {
    "id": 1652792463242
  }
  ```  
    
  ![GET search sfs logs by log id](/dotstatsuite-documentation/images/de-index-get-logs-id.png)

#### Get in-memory indexing statuses

`GET /admin/report`

This request returns the in-memory indexing statuses

Example:  
`GET https://sfs.myorg.org/admin/report`  
`x-api-key=xxx`

