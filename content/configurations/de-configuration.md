---
title: ".Stat DE configuration"
subtitle: 
comments: false
weight: 72
---

#### Table of Content
- [Intro](#intro)
- [Homepage facets](#homepage-facets)
- [Search results page pinned facets](#search-results-page-pinned-facets)
- [Search results page excluded facets](#search-results-page-excluded-facets)
- [Exclude specific CategorySchemes from the search index](#search-exclude-categoryschemes)
- [Search result page: number of results per page](#search-result-page-number-of-results-per-page)
- [Time period boundaries](#time-period-boundaries)
- [Default time period](#default-time-period)
- [LastNObservations support](#lastnobservations-support)
- [Maximum number of observations in tables and charts](#maximum-number-of-observations-in-tables-and-charts)
- [Maximum number of cells in table](#maximum-number-of-cells-in-table)
- [Preferred scale attribute](#preferred-scale-attribute)
- [Decimals rule attribute](#decimals-rule-attribute)
- [Coded attributes returned as flags](#coded-attributes-returned-as-flags)
- [Coded and uncoded attributes returned as footnotes](#coded-and-uncoded-attributes-returned-as-footnotes)
- [Localised observation values separators for thousands and decimals](#localised-observation-values-separators-for-thousands-and-decimals)
- [Localised time period values for monthly frequency](#localised-time-period-values-for-monthly-frequency)

---

### Intro
This page is a guide on how to setup, configure and interact with most of the .Stat Data Explorer client-side configurations and (sdmx) business rules.  

These configurations are tasks to be performed by Administrators with access to the .Stat DE installation files, but they should all be driven by business decisions.  
Some of the desired configurations or settings (e.g. how to add a new sdmx public endpoint) are not available from here because they must happen in a previous step or they are refering to server-side decisions, and you should therefore refer to the installation guides.

---

### Homepage facets
> Since the [February 28, 2020 Release .Stat Suite JS 4.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#february-28-2020), facets' names are indexed instead of their IDs. Therefore, this configuration now uses facets' names instead of IDs.  

Define the facets that are displayed on the homepage below "browse by", by their names and in the order in which you want them to appear. Keep whitespace(s) between words in your facet names.  
In the property "homeFacetIds", you must enter the localised name of an indexed CategoryScheme (e.g. "Topics") or a ConceptScheme (e.g. "Country").  
If the setting exists but is **empty**, then no facet is displayed on the homepage.  
If it is **missing**, then all available (indexed) facets are displayed on the homepage.  

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```json
    "search": {
        "homeFacetIds": ["Topics", "Country",]
    }
```

![Homepage facets](/images/faq-homepage-facets.png)

Facets are **localised**, thus you must add the translated name of the chosen facet if your instance of .Stat DE is configured with several languages.  
Replace spaces in your facet names by underline `_`.  
For instance, if you configure an instance of .Stat DE in both English and French languages, and the localised name of your CategoryScheme "Topic" in French is "Thème", and the localised name of your Concept "Country" in French is "Pays", then the configuration must be as such:

```json
    "search": {
        "homeFacetIds": ["Topics", "Thème", "Country", "Pays"]
    }
```

---

### Search results page pinned facets
> Since the [February 28, 2020 Release .Stat Suite JS 4.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#february-28-2020), facets' names are indexed instead of their IDs. Therefore, this configuration now uses facets' names instead of IDs.  

Define the facets that are always displayed in the search result page.  
These facets will be displayed always at first top positions and their labels are prefixed with a [*]. Replace spaces in your facet names by underline `_`.  

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```json
    "search": {
        "pinnedFacetIds": ["Browse_Indicators_by_subject","Reference_area"]
    }
```

![Search result pinned facets](/images/faq-pinned-facets.png)

Facets are **localised**, thus you must add the translated name of the pinned facet(s) if your instance of .Stat DE is configured with several languages, e.g.:  
```json
    "search": {
        "pinnedFacetIds": ["Browse_Indicators_by_subject","Parcourir_les_indicateurs_par_sujet","Reference_area","Aire_de_référence"]
    }
```

---

### Search results page excluded facets
> Since the [February 28, 2020 Release .Stat Suite JS 4.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#february-28-2020), facets' names are indexed instead of their IDs. Therefore, this configuration now uses facets' names instead of IDs.  

Define the facets that will always be excluded from the search result page. Replace spaces in your facet names by underline `_`.  

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```json
    "search": {
        "excludedFacetIds": ["survey"]
    }
```

Facets are **localised**, thus you must add the translated name of the excluded facet(s) if your instance of .Stat DE is configured with several languages, e.g.:  
```json
    "search": {
        "excludedFacetIds": ["survey","sondage"]
    }
```   

---

### Search: exclude categoryschemes
> Available since [February 28, 2020 Release .Stat Suite JS 4.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#february-28-2020).  

Exclude some specific CategorySchemes from the search index (**by ID**). Browsing and free-text search will not return related dataflows when related Categories are used as search/browsing criteria.  
**Note:** Always all dataflows categorised in Categories of the CategoryScheme(s) defined for indexing of the data source will be indexed, see documentation: [What is indexed?](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/indexing-data/#what-is-indexed). If those dataflows are also categorised in other CategorySchemes not useful for the Data Explorer than those CategorySchemes can be completely excluded from the search index and thus be hidden in the Data Explorer.  

* in source code of dotstatsuite-sdmx-faceted-search `src/server/params/default.js`

```json
    module.exports = {
        ...
        excludedCategorySchemeFacets: ["categoryschemeID"],
        ...
    };
```  

**Note:** This configuration is tenant-independent and thus applied to all tenants of an instance. It is currently configured within the source code. Implementers who wish to modify this setting, need to maintain their own source code branch or inject this setting before building the application.    


---

### Search result page: number of results per page
Define the number of results displayed per page in the search result pages.  

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```json
    "search": {
        "defaultRows": 10
    }
```

---

### Time period boundaries
Define the minimum and maximum values of the time period range in the visualisation page views.<br> 

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```json
    "period": {
        "boundaries": [1970, 2020]
    }
```

![Time period boundaries](/images/faq-period-boundaries.png)

---

### Default time period
Define the default time period selection of the visualisation page views, according to data availability.<br>

> **Warning** Sometimes business rules (e.g. sdmx annotations) can supersede the default selection.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```json
    "period": {
        "default": [2018, 2018]
    }
```

![Time period default range](/images/faq-period-default.png)

---

### LastNObservations support
>Released in [May 18, 2020 Release .Stat Suite JS 5.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#may-18-2020)

Define, **per datasource**, the support of the `LastNObservations` features from your SDMX web service.  

in `dotstatsuite/data/<env>/configs/<tenant>/datasources.json`

```json
{
  "prod:[ORG]-[stable]": {
       "hasLastNObservations": true,
 },
 ```
When set to `true`, then the **LastNPeriod** feature is displayed in the DataExplorer visualisation page (under the Time Period & Frequency filter). See the functional specifications of the feature described [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/#last-n-periods). 
The feature is set to `false` by default.

![Time period default range](/images/lastnobs-config.png)

---

### Maximum number of observations in tables and charts
0-based range of observations returned by the SDMX web service for the display in the tables and charts.  
The purpose of this configuration is to protect from too large selections and consequent unavoidable freezing of the .Stat Data Explorer application in the client's web browser.  
If set to [0, 0], then only the first observation is returned. If set to [0, 2499], then the first 2500 observations are returned.  
Standard browser performance tests revealed that numbers of observations above 8000 are likely to result in sub-optimal or insufficient user experience. Note that many client machines are not the most recent and powerful ones.  
This configuration also impacts the EXCEL download but does not impact the CSV download options.  

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```json
    "sdmx": {
        "range": [0, 2499]
    }
```

---

### Maximum number of cells in table
Integer to limit the number of cells being displayed in the data table.  
Even though the number of observations returned by the SDMX web service is already limited, in an unfortunate extreme layout all observations could be placed on the table's diagonal, and the final table cell number would be the square of the number of observations. E.g. if the number of observations was limited to 2500, then the resulting maximum table size would be 6250000, which is far too much for the web browsers to digest. The purpose of this configuration is thus to protect from too large tables and consequent unavoidable freezing of the .Stat Data Explorer application in the client's web browser.  
Standard browser performance tests revealed that number of table cells above 8000 are likely to result in sub-optimal or insufficient user experience. Note that many client machines are not the most recent and powerful ones.  
This configuration also impacts the EXCEL download but does not impact the CSV download options.  

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```json
  "table": {
        "cellsLimit": 6000
  }
```

---

### Preferred scale attribute
It applies the calculation over the observation values when the Preferred Scale Attribute is used in the data source.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```json
   "sdmx": {
        "attributes": {
            "prefscale": "PREF_SCALE", 
        },
    }
```

---

### Decimals rule attribute
It applies the Decimal Attribute value when defined in the data source, and thus adapts the observation value display.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```json
   "sdmx": {
        "attributes": {
            "decimals": "DECIMALS", 
        },
    }
```

---

### Coded attributes returned as flags
Define the supported coded attributes displayed as flags at the observation value level in the table and chart views.  
The code is shown next to the observation value, and the label is displayed in a mouse-over feature.  
You can define more than one type of attribute to be displayed as flags.<br>

> **Warning**: if the value ID of an attribute that is defined as flag is **longer than 4 characters**, then this value will not be displayed as a flag but as a **footnote**.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```json
   "sdmx": {
        "attributes": {
            "flags": ["OBS_STATUS"], 
        },
    }
```

![Attributes flags](/images/faq-flags.png)

---

### Coded and uncoded attributes returned as footnotes
Define the supported coded or uncoded attributes displayed as footnotes at the observation value level in the table and chart views.  
An asterisk icon is shown next to the observation value, and the attribute value is displayed in a mouse-over feature.  
You can define more than one type of attributes to be displayed as footnotes.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```json
   "sdmx": {
        "attributes": {
            "footnotes": ["TIME_FORMAT"], 
        },
    }
```

![Attributes footnotes](/images/faq-footnotes.png)

---

### Localised observation values separators for thousands and decimals
Define the localised thousands and decimals separators of the observation values when required in the table and chart views.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```json
    "i18n": {
        "localeId": "en",
        "locales": {
            "en": {
                "id": "en",
                "delimiters": { "thousands": ",", "decimal": "."  }
            },
            "fr": {
                "id": "fr",
                "delimiters": { "thousands": " ", "decimal": ","  }
            },
        }
    }
```

> Since the [May 18, 2020 Release .Stat Suite JS 5.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#may-18-2020), the default thousand separator is set to non-breaking space for all locales:
```json
    "i18n": {
        "localeId": "en",
        "locales": {
            "en": {
                "id": "en",
                "delimiters": { "thousands": " ", "decimal": "."  }
            },
        }
    }
```

---

### Localised time period values for monthly frequency
Define the localised date format and labels for monthly frequency, and replacing the original SDMX codes (SDMX objects for Monthly frequencies do not have labels).  
The formatted dates are using the v1.9.0 of the [date-fns](https://date-fns.org/v1.9.0/docs/format) library, in which all supported languages and related labels are stored, and it displays the localised labels according to the following table:

| Unit | Token | Result examples |
|---|---|---|
| Month | M | 1, 2, ..., 12 | 
|  | Mo | 1st, 2nd, ..., 12th | 
|  | MM | 01, 02, ..., 12 | 
|  | MMM | Jan, Feb, ..., Dec | 
|  | MMMM | January, February, ..., December | 

Examples:  

* 'YYYY MMM' displays '2010 Jan'  
* 'YYYY-MMM'displays '2010-Jan'  
* 'MMMM-YYYY' displays 'January-2010'  

By default, if no configuration for a given localised format is added, then the default applied date format is 'YYYY MMM', e.g. in English '2010 Jan'.

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```json
  "i18n": {
    "localeId": "en",
    "locales": {
      "en": {
        "id": "en",
        "delimiters": { "thousands": ",", "decimal": "."  },
        "timeFormat": "YYYY-MMM"
      },
      "fr": {
        "id": "fr",
        "delimiters": { "thousands": " ", "decimal": ","  },
        "timeFormat": "MMM YYYY"
      },
```

