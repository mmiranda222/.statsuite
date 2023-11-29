---
title: ".Stat Search Service configuration"
subtitle: 
comments: false
weight: 87
keywords: [
 'Data sources to be indexed', '#data-sources-to-be-indexed',
 'Limit for indexing dimensions per dataflow', '#limit-for-indexing-dimensions-per-dataflow',
 'Exclude specific CategorySchemes from the search index', '#exclude-categoryschemes-from-the-search-index',
 'Relevance of free-text search results: How to tweak the weights of specific dataflow properties', '#relevance-of-free-text-search-results-how-to-tweak-the-weights-of-specific-dataflow-properties',
 'Manage synonyms', '#manage-synonyms',
 'Overwrite search-specific settings defined in the general `organisation` configuration', '#overwrite-search-specific-settings-defined-in-the-general-organisation-configuration',
]
---
<!-- This page (or a sub-page or sub-section of this page) of the documentation is referenced as an external resource in the .Stat Academy:
* https://academy.siscc.org/configuring-and-customising/
Any change affecting its URL must be communicated to the .Stat Academy content admin in advance. -->

#### Table of Content
- [Data sources to be indexed](#data-sources-to-be-indexed)
- [Limit for indexing dimensions per dataflow](#limit-for-indexing-dimensions-per-dataflow)
- [Exclude specific CategorySchemes from the search index](#exclude-categoryschemes-from-the-search-index)
- [Relevance of free-text search results: How to tweak the weights of specific dataflow properties](#relevance-of-free-text-search-results-how-to-tweak-the-weights-of-specific-dataflow-properties)
- [Manage synonyms](#manage-synonyms)
- [Overwrite search-specific settings defined in the general `organisation` configuration](#overwrite-search-specific-settings-defined-in-the-general-organisation-configuration)

For information about the location of search configuration files, please consult the documentation [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/#overview-of-the-different-configuration-files).

---

### Data sources to be indexed
Define, for an internal or external data space, the content to be indexed and retrievable by the search engine. A data source is determined by one or more CategorySchemes of an internal or external data space.   
When for a data space the parameter `"indexed"` is set to `true`, and at east one CategoryScheme triptych (version, id, agency) is provided in the `"queries"` parameter, then all dataflows categorised in the provided CategoryScheme(s) will be indexed. More functional specifcations to be found [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/indexing-data/).

* in `dotstatsuite-config-data/<env>/configs/tenants.json`

```json
"datasources": {
      "ds:staging:SIS-CC-stable": {
        "dataSpaceId": "staging:SIS-CC-stable",
        "indexed": true,
        "dataqueries": [
          {
            "version": "1.0",
            "categorySchemeId": "OECDCS1",
            "agencyId": "OECD"
          }
        ]
      },
```

---

### Limit for indexing dimensions per dataflow
> Released in [June 23, 2020 Release .Stat Suite JS 5.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#june-23-2020)  

A parameter of the `SFS` configuration at server level (docker-compose, kubernetes strategy) named `DIMENSION_VALUES_LIMIT` excludes those dimensions of a dataflow from the indexing that have more values than this limit.  
It is set by default to `1000`.  
It protects the search engine from too big codelists and prevents performance impacts.  
Dimensions are checked for this limit **after** the `Actual Content Constraint` has been applied.  
Because dimensions exceeding this limit are not indexed, the user will not find the underlying dataflow through the freetext search or facet navigation on these dimension values. However, the dimension remains available in the filters of the visualisation page.  
Because this limit is applied per dataflow per dimension:  
- there might be other dataflows using the same concept name and respecting this limit, and therefore the search facets could still display the same values;  
- the number of search facet values displayed might still be greater than this limit (because they would be composed of the **union** of all indexed dimension values for all dataflows).

---

### Exclude categoryschemes from the search index
> Available since [February 28, 2020 Release .Stat Suite JS 4.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#february-28-2020).  

Exclude some specific CategorySchemes from the search index (**by ID**). Browsing and free-text search will not return related dataflows when related Categories are used as search/browsing criteria.  
**Note:** Dataflows categorised in Categories of the CategoryScheme(s) defined for indexing of the data source will be indexed, see documentation: [What is indexed?](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/indexing-data/#what-is-indexed). If those dataflows are also categorised in other CategorySchemes not useful for the Data Explorer than those CategorySchemes can be completely excluded from the search index and thus be hidden in the Data Explorer through this environment variable.  

Technical usage:
* defined through an environment variable at sfs server instance level: `EXCLUDED_CATEGORYSCHEME_FACETS`
* expected value is an array of ids: `['OECDCS1', 'TOPICS']`

*Note:* This configuration is tenant-independent and thus applied to all tenants of an instance.

Sample:
- dataflow 1 is categorised in CS1 and CS2 and dataflow 2 is categorised in CS2
- only CS1 is defined in the data source (in tenants.json)
- dataflow 1 is indexed but dataflow 2 is not
- dataflow 1 can be found through CS1 and CS2 (CS2 is a facet)
- if `EXCLUDED_CATEGORYSCHEME_FACETS` is `['CS2']` then no result will be return upon CS2 search (and facet CS2 won't exist)

---

### Relevance of free-text search results: How to tweak the weights of specific dataflow properties

When a dataflow matches the query, each query term occurrence is scored and then combined to build the score of that dataflow.  

The score will then affect the ranking of the dataflows (higher the score, higher the rank).

Note that the scores are not probabilities in the strict sense of the mathematical definition (0\<x\>1). They can be any positive real number (0\<x) but are usually in the range between 1 and 10.   

The search result score (relevance) can be influenced through changing the weights for the different indexed dataflow properties:
- ID of the dataflow (`dataflowId`, default weight factor: 16)
- Localised name of the dataflow (`name`, default weight factor: 12)
- Localised names of dimensions (concepts) used in the dataflow (`dimensions`, default weight factor: 8)
- Localised description of the dataflow (`description`, default weight factor: 4)
- Agency of the dataflow (`agencyId`, default weight factor: 0.2)
- Version of the dataflow (`version`, default weight factor: 0.1)

A weight value should be smaller than 1 to decrease the score and higher than 1 to increase the score.

The following properties do currently not allow changing their weights (all those also used in facets):
- ID and localised name of the categories (and their parent categories) in which the dataflow was categorised
- IDs and localised names of the codes used as dimension values  

Their weight is thus equal to 1.

The following properties are not indexed:
- IDs of the related dimensions

The application defaults for the relevance weights are defined in the [`/server/init/params.js`](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/blob/master/src/server/init/params.js) file.

At boot time, the fields properties pre-defined in this [`/server/init/params.js`](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/blob/master/src/server/init/params.js) file are merged with field properties defined in the instance-specific [`/configs/sfs.json`](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/blob/master/configs/sfs.json) configuration file.

The example [`/configs/sfs.json`](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/blob/master/configs/sfs.json) configuration file contains the following weights:  
```json
{
  "fields": {
    "dataflowId": {
      "weight": 16
    },
    "name": {
      "weight": 12
    },
    "dimensions": {
      "weight": 8
    },
    "description": {
      "weight": 4
    },
    "agencyId": {
      "weight": 0.2
    },
    "version": {
      "weight": 0.1
    }
  }
}
```
Use this file to adapt the weights for the different dataflow properties to your own needs.

For more details, see the [sfs resource config readme](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search#resource-config).
   
#### Example
Use case: Make search hits within the dataflow description as relevant as the search hits with the dataflow name.  
We need to increase the weight of the `description` search field:

Considering that by default in the `/server/init/params.js` configuration the search field weight for `name` is "2", we need to set the weight of the search field `description` in the `/configs/sfs.json` file also to 2:  
```json
{
  "fields": {
    "description": {
      "weight": 2
    }
  }
}
```
The weight property will increase the score of search results with hits in the dataflow description. These scores can be seen for each result dataflow in the sfs response to search queries.  

---

### Manage synonyms
Added in [April 20, 2023 Release .Stat Suite JS unicorn](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-20-2023). 

Synonyms can now be provided in .Stat through configuration files. They are applied on the search query terms, e.g. a `the mages of the United Kingdom` query would be expanded to: `the (mages OR sorcerer OR sorceress) of the (United Kingdon OR Great Britain OR England)`. Synonyms are automatically ASCII-folded by the script.

The configuration files are located are located in the config data `/configs/<organisation>/sfs/synonyms/<language>.json` using the same convention as locale files.

Each file contains a language-specific JSON Map where the value of each entry is a set of synonyms for a term, such as "happy" has synonyms "glad" and "joyful" in the example below. Note that the mapping is one-directional. If "happy" and "joyful" are also synonyms of "glad", then that needs to be entered separately, and so on. The initial term needs to be in the list of its synonyms (A -> B should be A -> [A,B]), otherwise it will not be searched on.

```json
{
    "happy": [
        "happy",
        "glad",
        "joyful"
    ],
    "glad": [
        "glad",
        "happy",
        "joyful"
    ],
    "joyful": [
        "joyful",
        "happy",
        "glad"
    ],
    ...
```
There are two helper JS scripts to generate the `<language>.json` file:
- from a flat, non-symmetric CSV file: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/tree/master/scripts/solr-synonyms-txt-to-json.js
- from an non-symmetric `<language>.json` file to complement missing combinations: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/tree/master/scripts/solr-synonyms-symetry.js

To load the synonyms or reload updated synonyms from the `<language>.json` configuration files into SOLR, you can use the installation script ([src/server/manageSchema](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/blob/develop/README.md#script)).

---

### Overwrite search-specific settings defined in the general `organisation` configuration
The [`/configs/<organisation>/sfs/settings.json`](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/blob/master/configs/default/sfs/settings.json) file, which is defined for a specific `organisation`, allows overwriting search-specific settings in the general [`/configs/tenants.json`](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/blob/master/configs/tenants.json) configuration.

At boot time, the search-specific settings pre-defined in this [`/configs/<organisation>/sfs/settings.json`](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/blob/master/configs/default/sfs/settings.json) file are merged with related settigs defined in the instance-specific [`/configs/tenants.json`](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/blob/master/configs/tenants.json)) configuration file.

The default content of the `/configs/<organisation>/sfs/settings.json` is an empty object:  
```json
{
}
```
Use this file to set search-specific settings for this `organisation`. If left empty, then the original configuration from the `/configs/tenants.json` file is applied.

#### Example
Use case: Make the search service call a different NSI endpoint in order to bypass a request limiter:

Considering that in the `/configs/tenants.json` configuration file the `url` is set to "http://localhost:80/rest": 
```json
{
  "spaces": {
    "demo-design": {
      "label": "demo-design",
      ...
      "url": "http://localhost:80/rest"
    }
  }
}
```
we need set (only for the search service used by the `organisation`) in the `/configs/<organisation>/sfs/settings.json` configuration file the `url` from that space to a different one (e.g. "http://nsi-url/rest"):  
```json
{
  "spaces": {
    "demo-design": {
      "url": "http://nsi-url/rest"
    }
  }
}
```