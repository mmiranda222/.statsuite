---
title: ".Stat DE configuration"
subtitle: 
comments: false
weight: 72
keywords: [
  'Intro', '#intro',
  'Warning', '#warning',
  'Search: Homepage facets', '#search-homepage-facets',
  'Search: Homepage facets alignment', '#search-homepage-facets-alignment',
  'Search: Auto-expanded homepage facet', '#search-auto-expanded-homepage-facet',
  'Search: Selectable second-level homepage facet values', '#search-selectable-second-level-homepage-facet-values',
  'Search: Hide facet values IDs in home and result pages', '#search-hide-facet-values-ids-in-home-and-result-pages',  
  'Search: Hide overcounting facets', '#search-hide-overcounting-facets',
  'Search: Result page pinned facets', '#search-result-page-pinned-facets',
  'Search: Result page excluded facets', '#search-result-page-excluded-facets',
  'Search: Result page: number of results per page', '#search-result-page-number-of-results-per-page',
  'Visualisation: default landing tab', '#visualisation-default-landing-tab',
  'Default time period boundaries and default time period selection', '#default-time-period-boundaries-and-default-time-period-selection',
  'Time period sort order override', '#time-period-sort-order-override',
  'Support of Last-N-Observations feature', '#support-of-last-n-observations-feature',
  'Support of Partial-References feature', '#support-of-partial-references-feature',
  'Maximum number of observations in tables and charts (deprecated)', '#maximum-number-of-observations-in-tables-and-charts-deprecated',
  'Maximum number of observations in tables and charts and of cells in tables', '#maximum-number-of-observations-in-tables-and-charts-and-of-cells-in-tables',
  'Preferred scale attribute', '#preferred-scale-attribute',
  'Decimals rule attribute', '#decimals-rule-attribute',
  'Coded attributes returned as flags', '#coded-attributes-returned-as-flags',
  'Coded and uncoded attributes returned as notes', '#coded-and-uncoded-attributes-returned-as-notes',
  'Localised observation values separators for thousands and decimals', '#localised-observation-values-separators-for-thousands-and-decimals',
  'Localised time period values for monthly frequency', '#localised-time-period-values-for-monthly-frequency',
  'Default combined concepts', '#default-combined-concepts',
  'Disabled share option', '#disabled-share-option',
  'Disabled chart views', '#disabled-chart-views',
  'Enabled download option on the search result page', '#enabled-download-option-on-the-search-result-page',
  'Non-support of the `format` URL parameter by a data space', '#non-support-of-the-format-url-parameter-by-a-data-space',
  'Display of HTML content', '#display-of-html-content',
  'Support of long URLs', '#support-of-long-urls',
  '"Contact us" form: reCAPTCHA and email settings', '#contact-us-form-recaptcha-and-email-settings',
  'Policies for external search engine crawlers', '#policies-for-external-search-engine-crawlers',
  'robots tags', '#robots-tags',
  'robots.txt file', '#robots-txt-file'
]
---
<!-- This page (or a sub-page or sub-section of this page) of the documentation is referenced as an external resource in the .Stat Academy:
* https://academy.siscc.org/configuring-and-customising/
Any change affecting its URL must be communicated to the .Stat Academy content admin in advance. -->

#### Table of Content
- [Intro](#intro)
- [Warning](#warning)
- [Search: Homepage facets](#search-homepage-facets)
- [Search: Homepage facets alignment](#search-homepage-facets-alignment)
- [Search: Auto-expanded homepage facet](#search-auto-expanded-homepage-facet)
- [Search: Selectable second-level homepage facet values](#search-selectable-second-level-homepage-facet-values)
- [Search: Hide facet values IDs in home and result pages](#search-hide-facet-values-ids-in-home-and-result-pages)
- [Search: Hide overcounting facets](#search-hide-overcounting-facets)
- [Search: Result page pinned facets](#search-result-page-pinned-facets)
- [Search: Result page excluded facets](#search-result-page-excluded-facets)
- [Search: Number of results per result page](#search-number-of-results-per-result-page)
- [Visualisation: default landing tab](#visualisation-default-landing-tab)
- [Default time period boundaries and default time period selection](#default-time-period-boundaries-and-default-time-period-selection)
- [Time period sort order override](#time-period-sort-order-override)
- [Support of Last-N-Observations feature](#support-of-last-n-observations-feature)
- [Support of Partial-References feature](#support-of-partial-references-feature)
- [Maximum number of observations in tables and charts (deprecated)](#maximum-number-of-observations-in-tables-and-charts-deprecated)
- [Maximum number of observations in tables and charts and of cells in tables](#maximum-number-of-observations-in-tables-and-charts-and-of-cells-in-tables)
- [Preferred scale attribute](#preferred-scale-attribute)
- [Decimals rule attribute](#decimals-rule-attribute)
- [Coded attributes returned as flags](#coded-attributes-returned-as-flags)
- [Coded and uncoded attributes returned as notes](#coded-and-uncoded-attributes-returned-as-notes)
- [Localised observation values separators for thousands and decimals](#localised-observation-values-separators-for-thousands-and-decimals)
- [Localised time period values for monthly frequency](#localised-time-period-values-for-monthly-frequency)
- [Default combined concepts](#default-combined-concepts)
- [Disabled share option](#disabled-share-option)
- [Disabled chart views](#disabled-chart-views)
- [Enabled download option on the search result page](#enabled-download-option-on-the-search-result-page)
- [Non-support of the `format` URL parameter by a data space](#non-support-of-the-format-url-parameter-by-a-data-space)
- [Display of HTML content](#display-of-html-content)
- [Support of long URLs](#support-of-long-urls)
- ["Contact us" form: reCAPTCHA and email settings](#contact-us-form-recaptcha-and-email-settings)
- [Policies for external search engine crawlers](#policies-for-external-search-engine-crawlers)
  - [robots tags](#robots-tags)
  - [robots.txt file](#robots-txt-file)

For the tenant and data space definitions please see [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/tenant-model).

---

### Intro
This page is a guide on how to setup, configure and interact with most of the .Stat Data Explorer client-side configurations and (sdmx) business rules.  

These configurations are tasks to be performed by Administrators with access to the .Stat DE installation files, but they should all be driven by business decisions.  
Some of the desired configurations or settings (e.g. how to add a new sdmx public endpoint) are not available from here because they must happen in a previous step or they are refering to server-side decisions, and you should therefore refer to the installation guides.

---

### Warning
When editing the configuration .json file(s) of the .Stat Suite applications, the **default encoding** on your server/system could potentially be **different than UTF-8**, e.g. **UTF-8-BOM**.  
`BOM` being an issue to handle in web client rendering, whenever editing your config. files, make sure that this is always managed in the right **UTF-8 encoding format**, in order to avoid introducing extra invisible BOM characters to your file.

---

### Search: Homepage facets
> Since the [February 28, 2020 Release .Stat Suite JS 4.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#february-28-2020), facets' names are indexed instead of their IDs. Therefore, this configuration now uses facets' names instead of IDs.  

Define the facets that are displayed on the homepage below "browse by", by their names and in the order in which you want them to appear.  
**Keep whitespace(s)** between words in your facet names.  
In the property "homeFacetIds", you must enter the localised name of an indexed CategoryScheme (e.g. "Topics") or a ConceptScheme (e.g. "Country").  
If the setting exists but is **empty**, then no facet is displayed on the homepage.  
If it is **missing**, then all available (indexed) facets are displayed on the homepage.  

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

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

### Search: Homepage facets alignment
> Released in [March 10, 2021 Release .Stat Suite JS 7.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#march-10-2021)

The homepage facets alignment is configurable to centered or left-aligned. The alignment only concerns the facet buttons within the homepage screen. The text inside the buttons is always left-aligned.

![Homepage expanded facets](/dotstatsuite-documentation/images/faq-homepage-facet-button-alignment.png) 

In order to change the alignment from left-aligned to centered, the configuration must be as such:  

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`  
  
```json
    "search": {
        "homeFacetCentered": true
    }
```

By default, the homepage facets are left-aligned: `"homeFacetCentered": false`.

---

### Search: Auto-expanded homepage facet
> Released in [January 21, 2021 Release .Stat Suite JS 7.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#january-21-2021)

Define one of the homepage facet to be opened/expanded by default, by using the property `expandedHomeFacets`.  
In the property `expandedHomeFacets`, you must provide the localised values of the facet to be expanded at page launch.  
If this property is missing or if the provided value does not match a facet localised name, then no facet is expanded at launch.

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
    "search": {  
        "expandedHomeFacets": ["Topic", "Thème"]
    }
```

![Homepage expanded facets](/dotstatsuite-documentation/images/faq-homepage-expanded.png)  
  
---

### Search: Selectable second-level homepage facet values
> Released in [August 25, 2020 Release .Stat Suite JS 5.3.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#august-25-2020)

Make the individual second-level homepage facet values clickable. When a homepage facet returns a **hierarchical** CategoryScheme or ConceptScheme, then it is possible to make the second-level values (sub-level of a root) selectable, so that the search result applies the selection when browsing.   
By default, the second-level homepage facet values are **not clickable** (`"homeFacetLevel2Clickable": false`).

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
    "search": {
        "homeFacetLevel2Clickable": true
    }
```

![Selectable second-level homepage facet values](/dotstatsuite-documentation/images/faq-homepage-select.png)

---

### Search: Hide facet values IDs in home and result pages
> Released in [March 4, 2022 Release .Stat Suite JS 13.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#march-4-2022)

Always hide IDs of the facet values for a well-defined list of facets on the homepage, or on the homepage **and** the result page. By default, IDs are always displayed, unless it is specifically defined in this configuration to hide IDs of a localised *SDMX* Categoryscheme or Concept/codelist.

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

**Hide IDs of facet values in homepage only**

```json
    "search": {
        "hideHomeFacetItemIDs": ["Topic", "Thème"]
    }
```

**Hide IDs of facet values in homepage and in search result page**

```json
    "search": {
        "hideHomeAndResultFacetItemIDs": ["Topic", "Thème"]
    }
```

![Hide facet values IDs in home and result pages](/dotstatsuite-documentation/images/de-hide-facet-ids.png)

---

### Search: Hide overcounting facets
> Released in [April 20, 2023 Release .Stat Suite JS unicorn](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-20-2023)  

Define a limited number of facets in the search result pages, after which all other facets are hidden under an expandable accordion dropdown menu called **"More filters"**.  

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
    "search": {
        "defaultFacetsNumber": 6
    }
```

![de facets - more filters collapsed](/dotstatsuite-documentation/images/de-searchingdata-facets-searchresultpage-morefilters.png) ![de facets - more filters expanded](/dotstatsuite-documentation/images/de-searchingdata-facets-searchresultpage-morefilters-expanded.png)

For more information see: [Facets on the search result page](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/facets/#facets-on-the-search-result-page).

---

### Search: Result page pinned facets
> Since the [February 28, 2020 Release .Stat Suite JS 4.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#february-28-2020), facets' names are indexed instead of their IDs. Therefore, this configuration now uses facets' names instead of IDs.  

Define the facets that are always displayed in the first position(s) in the search result page, when available.  
These facets will be displayed always at first top positions and their labels are prefixed with a [**.**]. Replace spaces in your facet names by underline `_`.  
In addition, a help [**?**] tooltip is shown right next to the Filters header title, which will display the following information (localised): *"Filters marked with **.** are, when available, always listed first."*

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

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

### Search: Result page excluded facets
> Since the [February 28, 2020 Release .Stat Suite JS 4.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#february-28-2020), facets' names are indexed instead of their IDs. Therefore, this configuration now uses facets' names instead of IDs.  

Define the facets that will always be excluded from the search result page. Replace spaces in your facet names by underline `_`.  

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

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

### Search: Number of results per result page
Define the number of results displayed per page in the search result pages.  

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
    "search": {
        "defaultRows": 10
    }
```

---

### Visualisation: default landing tab
> Introduced in [April 11, 2022 Release .Stat Suite JS 14.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-11-2022)

Define, per DE scope, the landing tab of the visualisation page to be shown by default, unless a different [`vw` parameter](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/general-layout/#url-parameters) is used in a direct visualisation URL. Any of the currently existing tabs, whether for overview, data table, micro data table or graphical representations, can be set, e.g.:
- overview (default)
- table
- microdata
- barchart
- rowchart
- scatterchart
- horizontalsymbolchart
- verticalsymbolchart
- timelinechart
- stackedbarchart
- stackedrowchart
- choroplethchart

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
    "app": {
        defaultView: "overview"
    }
```
---

### Default time period boundaries and default time period selection
> Feature updated with [July 20, 2023 Release .Stat Suite JS Virtual](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#july-20-2023)

Default time period **`boundaries`** and/or a **`default`** time period **selection** are required in the configuration for cases when an actual content constraint containing the time period range of available data cannot be retrieved from the SDMX web service, and/or when the default time period **selection** is not defined in the dataflow **annotation** of type `DEFAULT`.  
In such cases, the Time Period filter in the Data Explorer visualisation page uses the configured default time period **`boundaries`** to define which time periods should be shown in the _start and end period_ dropdowns. It uses the configured **`default`** or **`lastNPeriods`** time period **selection** to automatically pre-select the _start and end periods_, or the _last [..] period(s)_. 

Any value of the default time period boundaries and selection can be `null`ed or left empty  `""`.   

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
    "period": {
        "boundaries": [1970, 2021],
        "default": [2016, 2021]
    }
```
```json
    "period": {
        "boundaries": [1970, null],
        "default": [2016, null]
    }
```
```json
    "period": {
        "boundaries": [1970, ""],
        "default": [2016, ""]
    }
```
```json
    "period": {
        "boundaries": [1970, ""],
        "lastNPeriods": 5
    }
```

Note that the `default` time period selection is incompatible with the `lastNPeriods` configuration. In case both are present, the last one takes precedence over the first one.

---

### Time period sort order override
>Introduced in [April 20, 2023 Release .Stat Suite JS unicorn](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-20-2023)

Allow to **override the default Time Period dimension sort order** from the initial ascending order to **descending order**.

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
    "period": {
        "defaultSort": "desc"
    }
```

If `"defaultSort"` is set to `"desc"`, then all data table and chart views with a Time Period dimension will display all time period values in the descending sort order (from newest to oldest).  
If `"defaultSort"` is empty or not in the configuration file, then the default rule of ascending order applies.

---

### Support of Last-N-Observations feature
>Released in [May 18, 2020 Release .Stat Suite JS 5.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#may-18-2020)

Define, **per data space**, the support of the `LastNObservations` features from your SDMX web service.  

* in `dotstatsuite-config-data/<env>/configs/<tenant>/tenants.json`

```json
    "spaces": {
      "[space ID]": {
        "label": "[space name]",
        "hasLastNObservations": true
        }
    }
```
When set to `true`, then the [**Last [..] time series value(s)** selector](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/time-period#last-time-series-value-s) is displayed in the Data Explorer visualisation page (in the lower part of the **Time Period & Frequency** filter). By default, this setting is `false`.

---

### Support of Partial-References feature
Indicate if an internal or external data space supports the `detail=referencepartial` SDMX query parameter.  
If the data space parameter `supportsReferencePartial` is set to `true`, it means that the underlying SDMX-compliant web service allows querying for referenced item schemes that only include items used by the artefact to be returned. This feature allows increasing the performance of structure retrievals from the web service, since non-necessary items are not retrieved. See the related SDMX documentation [here](https://github.com/sdmx-twg/sdmx-rest/blob/master/doc/structures.md).

* in `dotstatsuite-config-data/<env>/configs/tenants.json`

```json
    "spaces": {
      "staging:SIS-CC-stable": {
        "label": "staging:SIS-CC-stable",
        "supportsReferencePartial": true
        }
    }
```

---

### Maximum number of observations in tables and charts (deprecated)
> The `range` parameter is **unused** since [August 3, 2022 Release .Stat Suite JS quark](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#august-3-2022). **Instead, the [`cellsLimit` parameter](#maximum-number-of-observations-in-tables-and-charts-and-of-cells-in-tables) is used to auto-generate the range header, e.g. [0, 2999] if the web service supports this header.**

0-based range of observations returned by the SDMX web service for the display in the tables and charts.  
The purpose of this configuration is to protect from too large selections and consequent unavoidable freezing of the .Stat Data Explorer application in the client's web browser.  
If set to [0, 0], then only the first observation is returned. If set to [0, 2499], then the first 2500 observations are returned.  
Standard browser performance tests revealed that numbers of observations above 8000 are likely to result in sub-optimal or insufficient user experience. Note that many client machines are not the most recent and powerful ones.  
This configuration also impacts the EXCEL download but does not impact the CSV download options.  

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
    "sdmx": {
        "range": [0, 2499]
    }
```

---

### Maximum number of observations in tables and charts and of cells in tables
Integer to limit the number of observations returned by the SDMX web service for tables and charts as well as the number of cells being displayed in the data table.  
The number of table cells required is always above the number of observations returned by the SDMX web service because additional cells are required for dimension names, dimension value names, metadata availability and sometimes also for empty cells that correspond to dimension combinations for which no data exists. In order to avoid building too large tables that could freeze the browser screen, the limit for the number of observations returned by the SDMX web service also applies to the number of cells being displayed.
Standard browser performance tests revealed that number of table cells above 8000 are likely to result in sub-optimal or insufficient user experience. Note that many client machines are not the most recent and powerful ones.  
This configuration also impacts the EXCEL download but does not impact the CSV download options.  

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
  "table": {
        "cellsLimit": 3000
  }
```

In order to limit the number of observations returned by the SDMX web service, the `cellsLimit` parameter is used by the DE to auto-generate the 0-based range header, e.g. [0, 2999], if the web service supports this header. If it doesn't then the number of observations is obtained from the response data message content.  

Note that the Data Explorer displays a special warning message whenever the limit is exceeded. For more information see [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/incomplete-data).

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

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

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

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

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

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
   "sdmx": {
        "attributes": {
            "flags": ["OBS_STATUS"], 
        },
    }
```

![Attributes flags](/dotstatsuite-documentation/images/faq-flags.png)

---

### Coded and uncoded attributes returned as notes
>*Version history:*  
> *footnotes* is replaced by *notes* in [March 4, 2022 Release .Stat Suite JS 13.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#march-4-2022)  
> Re-introduced in [February 21, 2022 Release .Stat Suite JS 12.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#february-21-2022)  
> Deprecated in [August 25, 2020 Release .Stat Suite JS 5.3.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#august-25-2020)  
> Introduced in [Release 28.09.2018](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#release-28-09-2018)

A **note** is a star '*' icon shown next to the observation value, or at a higher-level (see business rules [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/footnotes/)), and the attribute value is displayed on mouse-over in a tooltip bubble.  
You can define more than one type of attributes to be displayed as notes. In the following example, the supported coded or uncoded attributes are set for a single instance of the data explorer (DE).

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
   "sdmx": {
        "attributes": {
            "notes": ["EXPENDITURE", "ACTIVITY"], 
        },
    }
```

![Attributes footnotes](/dotstatsuite-documentation/images/faq-footnotes.png)

---

### Localised observation values separators for thousands and decimals
Define the localised thousands and decimals separators of the observation values when required in the table and chart views.<br>

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

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

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

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
      }
```

---

### Default combined concepts
> Introduced in [July 20, 2023 Release .Stat Suite JS Virtual](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#july-20-2023)

Possibility to define default rules for automatically assembling different specific dimensions and/or attributes into single combined components in the preview table. These default rules are fully superseeded by the instructions optionally provided in the DSD or dataflow annotation `COMBINED_CONCEPTS`. For more information see the [documentation here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/combined-concepts/). 

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
{
  "sdmx": {
    "defaultCombinations": {
      "concepts": "COMBINED_UNIT_MEASURE:UNIT_MEASURE,UNIT_MULT,BASE_PER;COMBINED_MEASURE:MEASURE,ADJUSTMENT,TRANSFORMATION",
      "names": {
        "en": "COMBINED_UNIT_MEASURE:Combined unit of measure;COMBINED_MEASURE:Combined measure",
        "fr": "COMBINED_UNIT_MEASURE:Unité de mesure combinée;COMBINED_MEASURE:Mesure combinée"
      } 
    }
  }
}
```

In the above configuration snippet:
* `"concepts": "[identifier of the combined component]:[assembled concept ID[,]]"`: The *identifier* is displayed when the user switches the Data Explorer visualisation page's label setting to 'Identifier' or 'Both'. The *assembled concept ID*s list those dimensions and/or attributes that are to be combined together into one virtual component.  
* Dimension and/or attribute values included in the `NOT_DISPLAYED` annotation are hidden and not displayed as part of the virtual combined concepts component value label.

**Note**: This feature replaces the previous 'Combined unit of measure' feature in a generic manner. Previous configurations for 'Combined unit of measure' are now ignored.

---

### Disabled share option
>Released in [October 7, 2020 Release .Stat Suite JS 5.4.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#october-7-2020)

The **share** option in the Data Explorer visualisation pages can be hidden from the end-user, so it is not possible to use the share table and chart features.  
This configuration simply works by removing the **share endpoint URL** from the configuration settings.json file of the application: when the **`share endpoint`** is left blank (or the `"endpoint"` entry is entirely removed), then the share option button is hidden from the DE visualisation toolbar. 

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
"share": {
    ...,
    "endpoint": ""
    ...
  }

```

---

### Disabled chart views
>Released in [March 4, 2022 Release .Stat Suite JS 13.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#march-4-2022)

The **Chart** views in the Data Explorer visualisation pages can be hidden from the end-user, for a given instance of the DE, so there is no option to display data in any of the supported chart representations.  
*Note* that the chart feature will only be hidden, and previous links that were displaying chart views will still work.

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
{
  "chart": {
    "isVisible": false,
  }
}
```

By default, the chart tab is available in the visualisation pages (`"isVisible": true`).

![chart and table button](/dotstatsuite-documentation/images/de-hidden-chart-buttons1.png)

---

### Enabled download option on the search result page
Since the [January 21, 2021 Release .Stat Suite JS 7.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#january-21-2021) release, the option to **download** the unfiltered dataflow data in tabular text (SDMX-CSV format) **from the search result page is optional**.  
When the configuration parameter `search.downloadableDataflowResults` is set to **true**, then the download option is available in the search result for each result item/dataflow.  
**Note** that, for dataflows that are externally defined/stored (see related [specifications](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/indexing-data/#indexing-externally-defined-dataflows)), this option will not work with the current verison of the DE, even though the download option in any format will work on the visualisation page for those dataflows too.

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
"search": {
    ...,
    "downloadableDataflowResults": true
    ...
  }

```

By default, the configuration is disabled **`search.downloadableDataflowResults:false`**.

### Non-support of the `format` URL parameter by a data space
Since the [July 20, 2023 Release .Stat Suite JS Virtual](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#july-20-2023), the Data Explorer [**CSV download** feature](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/toolbar#filtered-or-unfiltered-data-in-tabular-text-csv) uses the _space-unlimited_ web browser's inbuilt file-download feature for _unauthenticated_ users instead of using the _space-limited_ JavaScript 'memory blob'. This requires that the underlying SDMX web service supports the `format=csvfile|csvfilewithlabels` URL parameter as alternative to the HTTP `Accept` header. 

**Note:** In the current NSI web service version, the `format=csvfile` URL parameter resolves to the HTTP `Accept` header `application/vnd.sdmx.data+csv;file=true`. The `format=csvfilewithlabels` URL parameter resolves to `application/vnd.sdmx.data+csv;file=true;labels=both`.

If a dataspace, e.g., with an older NSI web service version, doesn't support this `format` parameter, then the property `"supportsCsvFile": false` needs to be added for the data space in the `tenants.json` configuration file, because the support of the `format` URL parameter is assumed by default.   

* in `dotstatsuite-config-data/<env>/configs/<tenant>/tenants.json`

```json
    "spaces": {
      "[space ID]": {
        "label": "[space name]",
        "supportsCsvFile": false 
        }
    }
```

### Display of HTML content
> Released with [April 11, 2022 .Stat Suite JS 14.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-11-2022)

Data of `String` type containing HTML content, descriptions as well as referential metadata of `XHTML` type are displayed by the Data Explorer according to the HTML formatting instructions. However, for security and compatibility reasons, all HTML code is sanitized before it is displayed. The following section explains how this HTML sanitization can be configured.

By default, the HTML sanitization uses the following configuration (as pre-defined by the [**sanitize-html** library](https://github.com/apostrophecms/sanitize-html#readme) being used under the hoods): 

```json
{
  "htmlSanitization": {
    "allowedTags": [
      "address", "article", "aside", "footer", "header", "h1", "h2", "h3", "h4",
      "h5", "h6", "hgroup", "main", "nav", "section", "blockquote", "dd", "div",
      "dl", "dt", "figcaption", "figure", "hr", "li", "main", "ol", "p", "pre",
      "ul", "a", "abbr", "b", "bdi", "bdo", "br", "cite", "code", "data", "dfn",
      "em", "i", "kbd", "mark", "q", "rb", "rp", "rt", "rtc", "ruby", "s", "samp",
      "small", "span", "strong", "sub", "sup", "time", "u", "var", "wbr", "caption",
      "col", "colgroup", "table", "tbody", "td", "tfoot", "th", "thead", "tr"
    ],
    "disallowedTagsMode": "discard",
    "allowedAttributes": {
      "a": [ "href", "name", "target" ],
      "img": [ "src", "srcset", "alt", "title", "width", "height", "loading" ]
    },
    "selfClosing": [ "img", "br", "hr", "area", "base", "basefont", "input", "link", "meta" ],
    "allowedSchemes": [ "http", "https", "ftp", "mailto", "tel" ],
    "allowedSchemesByTag": {},
    "allowedSchemesAppliedToAttributes": [ "href", "src", "cite" ],
    "allowProtocolRelative": true,
    "enforceHtmlBoundary": false
  }
}
```

The list of allowed/disallowed html features is configurable in the Data Explorer's `settings.json` config per DE scope using these `htmlSanitization` sub-keys: `allowedTags`, `disallowedTagsMode`, `allowedAttributes`, `selfClosing`, `allowedSchemes`, `allowedSchemesByTag`, `allowedSchemesAppliedToAttributes`, `allowProtocolRelative`, `enforceHtmlBoundary`. You can override those default settings by specifying only those keys that you want to modify. 

For instance, to allow the tag "img", you must change the `allowedTags` key. To do so, copy the default allowed tags and add "img" to the list. In the below example, only, the `allowedTags` and `allowedAttributes` keys differ from the default settings, the others remain as in the default configuration.

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
{
  "htmlSanitization": {
    "allowedTags": [
      "address", "article", "aside", "footer", "header", "h1", "h2", "h3", "h4",
      "h5", "h6", "hgroup", "main", "nav", "section", "blockquote", "dd", "div",
      "dl", "dt", "figcaption", "figure", "font", "hr", "li", "main", "ol", "p", "pre",
      "ul", "a", "abbr", "b", "bdi", "bdo", "br", "cite", "code", "data", "dfn",
      "em", "i", "kbd", "mark", "q", "rb", "rp", "rt", "rtc", "ruby", "s", "samp",
      "small", "span", "strike", "strong", "sub", "sup", "time", "u", "var", "wbr", "caption",
      "col", "colgroup", "table", "tbody", "td", "tfoot", "th", "thead", "tr", "img"
    ],
    "allowedAttributes": {
      "a": [ "href", "name", "target" ],
      "abbr": [ "title"],
      "bdo": ["dir"],
      "blockquote": ["cite"],
      "data": ["value"],
      "img": ["src","srcset","title","width","height","loading"],
      "q": ["cite"],
      "table": ["border", "cellspacing", "cellpadding"],
      "*": ["align", "alt", "center", "bgcolor", "color", "style"]
    }
  }  
}
```

For more information please consult https://github.com/apostrophecms/sanitize-html#readme.

---

### Support of long URLs
> Released with [December 5, 2022 Release .Stat Suite JS spin](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#december-5-2022)

When using the SDMX-RI NSI SDMX web service for a given data space, define the support of (NSI-specific non-SDMX-standard) `POST` requests when large filter selections lead to too long data query URLs that are not supported by the SDMX-standard `GET` requests.  

* in `dotstatsuite-config-data/<env>/configs/tenants.json`  under the "tenant" > "spaces" definition

```json
    "spaces": {
      "staging:SIS-CC-stable": {
        "supportsPostLongRequests": true,
        }
```

When the parameter **"`supportsPostLongRequests`" is set to `true`**, then if the URL of a SDMX data request is too long (exceeding what the `GET` request allows in the web browser or server), an automatic `POST` request is made in order to retrieve the data in the DE visualisation pages.

Because the DE visualisation page URL contains the filter selection, also the DE page URL gets too long in this case and cannot be bookmarked or reused. Thus, a warning message is displayed to the user: "*The current data filter requires a too long page URL making this data view impossible to bookmark or re-use. A reduced filter selection is necessary to use these features.*"

![config too long URLs](/dotstatsuite-documentation/images/de-long-urls-1.png)

Furthermore, the *SDMX* API data query generated in the "Developer API" DE feature is not displayed when the fallback `POST` method is used, and instead a warning message is displayed to the user: "*The current data filter generates a too long GET data URL impossible to use in standard SDMX API requests. Reduce the filter selection to generate a valid SDMX data query.*"

![config too long URLs](/dotstatsuite-documentation/images/de-long-urls-2.png)

If the parameter **"`supportsPostLongRequests`" is set to `false`**, then if the URL of a data request is too long, the `GET` data request will fail and an error message is shown to the user: "*Whoops, your current selection is too large to be processed. Please reduce the selection. You can also download all (unfiltered) data and make the needed selection in the downloaded data.*"

---

### "Contact us" form: reCAPTCHA and email settings 
> Released with [December 5, 2022 Release .Stat Suite JS spin](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#december-5-2022)

It is possible to enable/disable the "**Contact us**" form and the included **reCAPTCHA** feature (see [functional specs](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/general-layout/#contact-us-form)).

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

```js
{
  app: {
    contact: {
      form: false,
      captcha: false
    }
  }  
}
```

By default, both features are set to **true** and thus **enabled**.

To be able to use the Google **reCAPTCHA** feature in the "Contact us" form, the following configuration steps are required:
- Go to the [reCAPTCHA web page](https://www.google.com/recaptcha/about/)
- Click on the Admin Console button in the menu

![reCAPTCHA Admin console button](/dotstatsuite-documentation/images/de-configuration-recaptcha-menu.png)

- Enter a label for your ReCAPTCHA and select `reCAPTCHA version 2` as reCAPTCHA type

![reCAPTCHA Admin console](/dotstatsuite-documentation/images/de-configuration-recaptcha-admin-console.png)

- Add the your domain(s) in the "Domains" section, e.g. de-website.com
- Accept the reCAPTCHA Terms of Services and click on "Submit". This will generate a `site key`and a `secret key`.

![reCAPTCHA generated keys](/dotstatsuite-documentation/images/de-configuration-recaptcha-generated-keys.png)  

- Define the following DE environment variables with your generated key values:
  - `CAPTCHA_SECRET_KEY` (**private**, used by the server to verify the user captcha data)
  - `CAPTCHA_SITE_KEY` (public, used in the client e.g. data explorer)

See [here](https://help.salesforce.com/s/articleView?id=sf.workdotcom_quemgmt_set_up_captcha_googlekeys.htm&type=5) for further details.

The reCAPTCHA feature will be displayed in the "Contact us" form only if it is configured as decribed above.  

To be able to receive the emails generated through the "Contact us" form, the SMTP server and the destination email address need to be configured by defining the following environment variables:
- `MAIL_FROM`
- `MAIL_TO`
- `HFROM` (optional)
- For SMTP please see the similar [SMTP settings of the share service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share#smtp)

For more information see the [data-explorer readme](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer#how-to-use-the-contact-form).

---

### Policies for external search engine crawlers
There are two methods for configuring crawling policies for external search engines. These apply mainly to the Data Explorer and the Data Viewer, because the Data Lifecycle Manager has no public access as it requires authentication.

#### robots tags
For each application, both HTML header `<meta name="robots" />` and HTTP header `x-robots-tag` contents can be configured through an **environment variable `ROBOTS_POLICY`**. For both Data Explorer and Data Viewer, the default value is set to `all`. (Note that the value for Data Lifecycle Manager is `none`.)

Main functions for the search engine crawlers:
- `<meta name =”robots” content=”follow”>` : a command for the search engine crawler to follow the links in that webpage
- `<meta name =”robots” content=”index”>` : a command for the search engine crawler to index that webpage
- `<meta name =”robots” content=”nofollow”>` : a command for the search engine crawler NOT to follow the links in that webpage
- `<meta name =”robots” content=”noindex”>` : a command for the search engine crawler NOT to index that webpage
- `<meta name =”robots” content=”none”>` : corresponds to the combination of ”noindex,nofollow”
- `<meta name =”robots” content=”all”>` : corresponds to the combination of ”index,follow”

#### robots.txt file
For each application, a default `robots.txt` is served with the default content:

```txt
User-agent: *
Disallow: /
```

In order to configure your own robots.txt, you can, following your deployment strategy:
- For a source code installation, edit the file `src/server/robots.txt` before build
- For a docker installation, mount a volume:

```
docker run --mount type=bind,source=path/custom_robots.txt,target=/server/robots.txt -d data-explorer
```

- redirect the route url `domain/robots.txt` to your own file
