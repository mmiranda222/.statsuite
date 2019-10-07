---
title: .Stat DE customisation and configuration
subtitle: 
comments: false
weight: 30
---

# Table of Content
- [intro](#intro)
- [main theme](#main-theme)
- [site title and logo](#site-title-and-logo)
- [common site logos](#common-site-logos)
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
- [table and chart footer logo](#table-and-chart-footer-logo)
- [table and chart footer terms and conditions](#table-and-chart-footer-terms-and-conditions)
- [api documentation hyperlink](#api-documentation-hyperlink)
- [contact us hyperlink](#contact-us-hyperlink)
- [localised observation values separators for thousands and decimals](#localised-observation-values-separators-for-thousands-and-decimals)
- [localised time period values for monthly frequency](#localised-time-period-values-for-monthly-frequency)


### intro
This page is a guide on how to setup, configure, customise and interact with most of the .Stat Data Explorer client-side configurations, look and feel and (sdmx) business rules.<br>

These configurations are tasks to be performed by Administrators with access to the .Stat DE installation files, but they should all be driven by business decisions.<br>
Some of the whished configurations or settings (e.g. how to add a new sdmx public endpoint) are not available from here because they must happen in a previous step or they are refering to server-side decisions, and you should therefore refer to the [installation guides](https://sis-cc.gitlab.io/dotstatsuite-documentation/getting-started/installation/).

---

### Main Theme
It is possible to change the default layout theme of the application, including four properties.<br>
You can add new entries in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json` and it will replace the default customisation. <br>
The default theme is applied if there is no theme added to the settings.json file.<br>

* "theme":"layout" corresponds to the homepage background color and default font
* "theme":"searchHeader" corresponds to colored header banner of the search and visualisation pages
* "theme":"splash" corresponds to the text color under the homepage splash logo
* "theme":"searchDataflow" corresponds to the text color of Dataflow titles in the list of the search result page

```
    "theme":  {
        "layout": {
            "fontFamily": "Arial, 'sans-serif'",
            "background": "#c5e0dc"
        },
        "searchHeader": {
            "background": "#c5e0dc"
        },
        "splash": {
            "color": "black"
        },
        "searchDataflow": {
            "colorTitle": "#0088cc !important"
        }
      }
```

---

### Site title and logo
Define your website name and logo.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```
    "app": {
          "title": "OECD Data Explorer",
          "favicon": "/assets/siscc/data-explorer/images/favicon.ico"
    }
```

![Site title and logo](/images/faq-site-title-logo.png)

---

### Common site logos
Define the common logos in the header, subheader, footer and homepage of the website.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```
    "assets": {
        "header": "/assets/siscc/data-explorer/images/sis-cc-logo.png",
        "subheader": "/assets/siscc/data-explorer/images/dotstat-data-explorer-logo.png",
        "footer": "/assets/siscc/data-explorer/images/sis-cc-icon.png",
        "splash": "/assets/siscc/data-explorer/images/dotstat-data-explorer-logo.png"
    }
```

* header:<br>
![Site logo header](/images/faq-site-logo-header.png)

* subheader:<br>
![Site logo subheader](/images/faq-site-logo-subheader.png)

* footer:<br>
![Site logo footer](/images/faq-site-logo-footer.png)

* splash:<br>
![Site logo splash](/images/faq-site-logo-splash.png)

---

### Homepage facets
Define the facets, that are displayed on the homepage below "browse by", by ID and in the appropriate order.  
In the property "homeFacetIds", you must enter the ID of an indexed CategoryScheme, e.g. "cas_subject", ConceptScheme, e.g. ref_area, or "datasource_id" for the Data Source facet.  
If it is **empty**, then no facet is displayed on the homepage.  
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
Define the number of result displayed per page in the search result pages.<br>

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
**Warning** Sometimes business rules (e.g. sdmx annotations) can supersede the default selection.<br>

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
The code is shown next to the observaiton value, and the label is displayed in a mouse-over feature.<br>
You can define more than one type of attributes to be displayed as flags.<br>
**Warning**: if the value ID of an attribute that is defined as flag is **longer than 4 characters**, then this value will not be displayed as flag but as **footnote**.<br>

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
Define the supported coded or uncoded attributes displayed as footnotes at the observaiton value level in the table and chart views.<br>
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

### Table and chart footer logo
Define the logo of the organisation in the footer of the table and chart views.<br>
The source can be a binary image or a link.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```
    "viewer": {
        "logo": "dotstat-suite-config/data/prod/assets/oecd-logo.png",
    }
```

![viewer footer logo](/images/faq-viewer-logo.png)

---

### Table and chart footer terms and conditions
Define the name and hyperlink in the footer of the table and chart views behind the "c" copyright icon.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```
    "viewer": {
        "terms": {
            "label": "Terms & Conditions",
            "link": "http://www.oecd.org/termsandconditions/",
    }
    }
```

![Terms and Conditions](/images/faq-terms-conditions.png)

---

### API documentation hyperlink
Define the hyperlink for the API documentation.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```
    "viewer": {
        "api": {
            "doc": "https://data.oecd.org/api/sdmx-json-documentation/",
    }
    }
```

![API documentation](/images/faq-api-documentation.png)

---

### Contact us hyperlink
Define the hyperlink for the "Contact us" feature.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```
    "viewer": {
        "api": {
            "contact": "https://stats.oecd.org/FAQAndContact.aspx",
    }
    }
```

![Contact us](/images/faq-contact-us.png)

---

### Localised observation values separators for thousands and decimals
Define the localised thousands and decimals separators of the observaiton values when required in the table and chart views.<br>

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

