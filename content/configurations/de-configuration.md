---
title: ".Stat DE configuration"
subtitle: 
comments: false
weight: 73
---

#### Table of Content
- [intro](#intro)
- [homepage facets](#homepage-facets)
- [search results page pinned facets](#search-results-page-pinned-facets)
- [search results page excluded facets](#search-results-page-excluded-facets)
- [search result page: number of results per page](#search-result-page-number-of-results-per-page)
- [time period boundaries](#time-period-boundaries)
- [default time period](#default-time-period)
- [maximum number of observation values](#maximum-number-of-observation-values)
- [preferred scale attribute](#preferred-scale-attribute)
- [decimals rule attribute](#decimals-rule-attribute)
- [coded attributes returned as flags](#coded-attributes-returned-as-flags)
- [coded and uncoded attributes returned as footnotes](#coded-and-uncoded-attributes-returned-as-footnotes)
- [localised observation values separators for thousands and decimals](#localised-observation-values-separators-for-thousands-and-decimals)
- [localised time period values for monthly frequency](#localised-time-period-values-for-monthly-frequency)

---

### intro
This page is a guide on how to setup, configure and interact with most of the .Stat Data Explorer client-side configurations and (sdmx) business rules.<br>

These configurations are tasks to be performed by Administrators with access to the .Stat DE installation files, but they should all be driven by business decisions.<br>
Some of the desired configurations or settings (e.g. how to add a new sdmx public endpoint) are not available from here because they must happen in a previous step or they are refering to server-side decisions, and you should therefore refer to the installation guides.

---

### Homepage facets
Define the facets that are displayed on the homepage below "browse by", by ID and in the order in which you want them to appear.  
In the property "homeFacetIds", you must enter the ID of an indexed CategoryScheme, e.g. "cas_subject", ConceptScheme, e.g. ref_area, or "datasource_id" for the Data Source facet.  
If the setting exists but is **empty**, then no facet is displayed on the homepage.  
If it is **missing**, then all available facets are displayed on the homepage.  

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```
    "search": {
        "homeFacetIds": ["datasource_id", "cas_subject","ref_area", "dsb"]
    }
```

![Homepage facets](/images/faq-homepage-facets.png)

---

### Search results page pinned facets 
Define the facets that are always displayed in the search result page.<br>
These facets will be displayed always at first top positions and their labels are prefixed with a [*].<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```
    "search": {
        "pinnedFacetIds": ["datasource_id", "cas_subject","ref_area", "dsb"]
    }
```

![Search result pinned facets](/images/faq-pinned-facets.png)

---

### Search results page excluded facets
Define the facets that will always be excluded from the search result page.<br> 

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```
    "search": {
        "excludedFacetIds": ["survey"]
    }
```

---

### Search result page: number of results per page
Define the number of results displayed per page in the search result pages.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```
    "search": {
        "defaultRows": 10
    }
```

---

### Time period boundaries
Define the minimum and maximum values of the time period range in the visualisation page views.<br> 

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```
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

```
    "period": {
        "default": [2018, 2018]
    }
```

![Time period default range](/images/faq-period-default.png)

---

### Maximum number of observation values
Limit the number of observations values returned in the table and chart views.<br>
If set to [0, 1], then only 1 observation is returned. If set to [0, 0], then nothing is returned.<br>
This configuration does not impact the full data download.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```
    "sdmx": {
        "range": [0, 1000]
    }
```

---

### Preferred scale attribute
It applies the calculation over the observation values when the Preferred Scale Attribute is used in the data source.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```
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

```
   "sdmx": {
        "attributes": {
            "decimals": "DECIMALS", 
        },
    }
```

---

### Coded attributes returned as flags
Define the supported coded attributes displayed as flags at the observation value level in the table and chart views.<br>
The code is shown next to the observation value, and the label is displayed in a mouse-over feature.<br>
You can define more than one type of attribute to be displayed as flags.<br>

> **Warning**: if the value ID of an attribute that is defined as flag is **longer than 4 characters**, then this value will not be displayed as a flag but as a **footnote**.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```
   "sdmx": {
        "attributes": {
            "flags": ["OBS_STATUS"], 
        },
    }
```

![Attributes flags](/images/faq-flags.png)

---

### Coded and uncoded attributes returned as footnotes
Define the supported coded or uncoded attributes displayed as footnotes at the observation value level in the table and chart views.<br>
An asterisk icon is shown next to the observation value, and the attribute value is displayed in a mouse-over feature.<br>
You can define more than one type of attributes to be displayed as footnotes.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```
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

```
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

```
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
        "delimiters": { "thousands": " ", "decimal": ","  },
        "timeFormat": "MMM YYYY"
      },
```

