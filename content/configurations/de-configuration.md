---
title: ".Stat DE configuration"
subtitle: 
comments: false
weight: 72
---

#### Table of Content
- [Intro](#intro)
- [Homepage facets](#homepage-facets)
- [Selectable second-level homepage facet values](#selectable-second-level-homepage-facet-values)
- [Limit for indexing dimensions per dataflow](#limit-for-indexing-dimensions-per-dataflow)
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
- [Unit of measure support](#unit-of-measure-support)

---

### Intro
This page is a guide on how to setup, configure and interact with most of the .Stat Data Explorer client-side configurations and (sdmx) business rules.  

These configurations are tasks to be performed by Administrators with access to the .Stat DE installation files, but they should all be driven by business decisions.  
Some of the desired configurations or settings (e.g. how to add a new sdmx public endpoint) are not available from here because they must happen in a previous step or they are refering to server-side decisions, and you should therefore refer to the installation guides.

---

### Homepage facets
> Since the [February 28, 2020 Release .Stat Suite JS 4.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#february-28-2020), facets' names are indexed instead of their IDs. Therefore, this configuration now uses facets' names instead of IDs.  

Define the facets that are displayed on the homepage below "browse by", by their names and in the order in which you want them to appear.  
**Keep whitespace(s)** between words in your facet names.  
In the property "homeFacetIds", you must enter the localised name of an indexed CategoryScheme (e.g. "Topics") or a ConceptScheme (e.g. "Country").  
If the setting exists but is **empty**, then no facet is displayed on the homepage.  
If it is **missing**, then all available (indexed) facets are displayed on the homepage.  

* in `dotstatsuite-config/data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
    "search": {
        "homeFacetIds": ["Topics", "Country", "Disability status"]
    }
```

![Homepage facets](/dotstatsuite-documentation/images/faq-homepage-facets.png)

Facets are **localised**, thus you must add the translated name of the chosen facet if your instance of .Stat DE is configured with several languages.  
Keep whitespace(s) between words in your facet names.  
For instance, if you configure an instance of .Stat DE in both English and French languages, and the localised name of your CategoryScheme "Topic" in French is "Thème", and the localised name of your Concept "Country" in French is "Pays", then the configuration must be as such:

```json
    "search": {
        "homeFacetIds": ["Topics", "Thème", "Country", "Pays", "Disability status", "Statut d'invalidité"]
    }
```

---

### Selectable second-level homepage facet values
> Released in [August 25, 2020 Release .Stat Suite JS 5.3.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#august-25-2020)

Make the individual second-level homepage facet values clickable. When a homepage facet returns a **hierarchical** CategoryScheme or ConceptScheme, then it is possible to make the second-level values (sub-level of a root) selectable, so that the search result applies the selection when browsing.   
By default, the second-level homepage facet values are **not clickable** (`"homeFacetLevel2Clickable": false`).

* in `dotstatsuite-config/data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
    "search": {
        "homeFacetLevel2Clickable": true
    }
```

![Selectable second-level homepage facet values](/dotstatsuite-documentation/images/faq-homepage-select.png)

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

### Search results page pinned facets
> Since the [February 28, 2020 Release .Stat Suite JS 4.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#february-28-2020), facets' names are indexed instead of their IDs. Therefore, this configuration now uses facets' names instead of IDs.  

Define the facets that are always displayed in the first position(s) in the search result page, when available.  
These facets will be displayed always at first top positions and their labels are prefixed with a [**.**]. Replace spaces in your facet names by underline `_`.  
In addition, a help [**?**] tooltip is shown right next to the Filters header title, which will display the following information (localised): *"Filters marked with **.** are, when available, always listed first."*

* in `dotstatsuite-config/data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
    "search": {
        "pinnedFacetIds": ["Browse_Indicators_by_subject","Reference_area"]
    }
```

![Search result pinned facets](/dotstatsuite-documentation/images/faq-pinned-facets.png)

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

* in `dotstatsuite-config/data/<env>/configs/<tenant>/data-explorer/settings.json`

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

* in `dotstatsuite-config/data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
    "search": {
        "defaultRows": 10
    }
```

---

### Time period boundaries
Define the minimum and maximum values of the time period range in the visualisation page views.<br> 

* in `dotstatsuite-config/data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
    "period": {
        "boundaries": [1970, 2020]
    }
```

![Time period boundaries](/dotstatsuite-documentation/images/faq-period-boundaries.png)

---

### Default time period
Define the default time period selection of the visualisation page views, according to data availability.<br>

> **Warning** Sometimes business rules (e.g. sdmx annotations) can supersede the default selection.<br>

* in `dotstatsuite-config/data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
    "period": {
        "default": [2018, 2018]
    }
```

![Time period default range](/dotstatsuite-documentation/images/faq-period-default.png)

---

### LastNObservations support
>Released in [May 18, 2020 Release .Stat Suite JS 5.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#may-18-2020)

Define, **per datasource**, the support of the `LastNObservations` features from your SDMX web service.  

in `dotstatsuite-config/data/<env>/configs/<tenant>/datasources.json`

```json
{
  "prod:[ORG]-[stable]": {
       "hasLastNObservations": true,
 },
 ```
When set to `true`, then the **LastNPeriod** feature is displayed in the DataExplorer visualisation page (under the Time Period & Frequency filter). See the functional specifications of the feature described [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/#last-n-periods). 
The feature is set to `false` by default.

![Time period default range](/dotstatsuite-documentation/images/lastnobs-config.png)

---

### Maximum number of observations in tables and charts
0-based range of observations returned by the SDMX web service for the display in the tables and charts.  
The purpose of this configuration is to protect from too large selections and consequent unavoidable freezing of the .Stat Data Explorer application in the client's web browser.  
If set to [0, 0], then only the first observation is returned. If set to [0, 2499], then the first 2500 observations are returned.  
Standard browser performance tests revealed that numbers of observations above 8000 are likely to result in sub-optimal or insufficient user experience. Note that many client machines are not the most recent and powerful ones.  
This configuration also impacts the EXCEL download but does not impact the CSV download options.  

* in `dotstatsuite-config/data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
    "sdmx": {
        "range": [0, 2499]
    }
```

---

### Maximum number of cells in table
Integer to limit the number of cells being displayed in the data table.  
Even though the number of observations returned by the *SDMX* web service is already limited, in an unfortunate extreme layout all observations could be placed on the table's diagonal, and the final table cell number would be the square of the number of observations.  
E.g. if the number of observations was limited to 2500, then the resulting maximum table size would be 6 250 000, which is far too much for the web browsers to digest. The purpose of this configuration is thus to protect from too large tables and consequent unavoidable freezing of the .Stat Data Explorer application in the client's web browser.  
Standard browser performance tests revealed that number of table cells above 8000 are likely to result in sub-optimal or insufficient user experience. Note that many client machines are not the most recent and powerful ones.  
This configuration also impacts the EXCEL download but does not impact the CSV download options.  

* in `dotstatsuite-config/data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
  "table": {
        "cellsLimit": 6000
  }
```

---

### Preferred scale attribute
**Specifications**  
The Preferred scale attribute (with the Concept ID or Attribute ID `PREF_SCALE`) is an attribute which implies calculations. Each observation value, as long as it represents a number to be displayed, is therefore the original observation value multiplied by ten to the power of the negation of the Scale code ID.  

| Scale code ID | Original observation value | Displayed observation value |
| ------------- | ------------- | ------------- |
| 6 | 10 | 0.000 01 |
| -6 | 10 | 10 000 000 |
| 6 | 1 000 000 | 1 |

**Configurable parameter**  
It applies the calculation over the observation values when the Preferred scale attribute is used in the data source.<br>

* in `dotstatsuite-config/data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
   "sdmx": {
        "attributes": {
            "prefscale": "PREF_SCALE", 
        },
    }
```

---

### Decimals rule attribute
**Specifications**  
The Decimals attribute (with the Concept ID or Attribute ID `DECIMALS`) is used to adapt the observation value display: the number of decimal points provided in the Decimals attribute should be displayed for the corresponding data points.  
**For example**, the value for the Decimals attribute is 2. All observation values to which this attribute value is attached will be adapted to two decimal points. If the value in the table has more than two decimal points, then it should be rounded.  

**Configurable parameter**  
It applies the Decimals attribute value when defined in the data source, and thus adapts the observation value display.<br>

* in `dotstatsuite-config/data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
   "sdmx": {
        "attributes": {
            "decimals": "DECIMALS", 
        },
    }
```

---

### Coded attributes returned as flags
**Specifications**  
Flags are coded attributes, for which the code Identifier (`ID` property of the attribute value), under the condition that the ID has not more than 4 characters, is displayed within brackets directly left-aligned to the observation value in the table cells.  
If several flags need to be displayed in the same cell, then they are separated by comma and all are enclosed in the same brackets, e.g. `(B,E)`. Their order is defined by the order in which they are returned in the *SDMX-JSON* data message.  
On cell mouse-over, the code Identifier and localised code name are displayed in a tooltip, e.g. `B: Break`. The mouse-over event does not work separately for each attribute but for the whole cell. If several attributes need to be displayed in the tooltip, then they are separated by a line break.  

**Configurable parameter**  
Define the supported coded attributes displayed as flags at the observation value level in the table and chart views.  
The code is shown next to the observation value, and the label is displayed in a mouse-over feature.  
You can define more than one type of attribute to be displayed as flags.<br>

> **Warning**: if the value ID of an attribute that is defined as flag is **longer than 4 characters**, then this value will not be displayed as a flag but as a **footnote**.<br>

* in `dotstatsuite-config/data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
   "sdmx": {
        "attributes": {
            "flags": ["OBS_STATUS"], 
        },
    }
```

![Attributes flags](/dotstatsuite-documentation/images/faq-flags.png)

---

### Coded and uncoded attributes returned as footnotes
> Since the [August 25, 2020 Release .Stat Suite JS 5.3.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#august-25-2020), the **`footnotes`** parameter is **removed from the DE configuration**.

If a coded or uncoded attribute is not defined to be returned as **`flags`** in the DE configuration (see [above](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#coded-attributes-returned-as-flags)), then it is displayed as a **`footnote`**.  
A **footnote** is an asterisk icon shown next to the observation value, or at a higher-level (see business rules [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/footnotes/)), and the attribute value is displayed in a mouse-over feature.  
More than one type of attributes can be displayed as footnotes.<br>

![Attributes footnotes](/dotstatsuite-documentation/images/faq-footnotes.png)

---

### Localised observation values separators for thousands and decimals
Define the localised thousands and decimals separators of the observation values when required in the table and chart views.<br>

* in `dotstatsuite-config/data/<env>/configs/<tenant>/data-explorer/settings.json`

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

* in `dotstatsuite-config/data/<env>/configs/<tenant>/data-explorer/settings.json`

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

---

### Unit of measure support
Define the rules of the (optional) dataflow-level *SDMX* annotation **UNIT_MEASURE_CONCEPTS**: see the [documentation here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/unit-of-measure/) about the Special display for 'Unit of measure' in preview table.  
The pre-defined `UNIT_MEASURE_CONCEPTS` annotation lists the dimensions and/or attributes (by ID) to be used for display in data table views.  
In case this annotation is not given, then the following concepts are used: “UNIT_MEASURE,UNIT_MULT,BASE_PER” (provided that these concepts are used as dimensions or attributes in the DSD of the displayed data).  
If the annotation is present but empty, then there is no special display of the Units of measure.

* in `dotstatsuite-config/data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
    "units": {
      "id": "UNIT",
      "annotationsDefinitionCodes": {
        "concepts": ["UNIT_MEASURE_CONCEPTS"]
      },
      "defaultCodes": ["UNIT_MEASURE", "UNIT_MULT", "BASE_PER"],
      "rejectedValueIds": ["_L", "_T", "_Z"]
    },
```

In the above template:
* `"id": "UNIT"` is used when the user switches the display of the Data Explorer visualisation page's label to Name, Identifier or Both;
* `"concepts": ["UNIT_MEASURE_CONCEPTS"]` is an array of the possible IDs of the *SDMX* annotation;
* `"defaultCodes": ["UNIT_MEASURE", "UNIT_MULT", "BASE_PER"]` is the list of attributes/dimensions to retrieve if no annotation is found;
* `"rejectedValueIds": ["_L", "_T", "_Z"]` is the list of values to not display if they belong to dimensions or attributes defined in the Unit of Measure.

