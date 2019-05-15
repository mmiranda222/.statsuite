---
title: .Stat DE customisation and configuration
subtitle: 
comments: false
weight: 29
---

This page is a guide on how to setup, configure, customise and interact with most of the .Stat Data Explorer client-side configurations and (sdmx) business rules.<br>

These configurations are tasks to be performed by Administrators with access to the .Stat DE installation files, but they should all be driven by business decisions.<br>
Some of the whished configurations or settings (e.g. how to add a new sdmx public endpoint) are not available from here because they must happen in a previous step or they are refering to server-side decisions, and you should therfore refer to the [installation guides](https://sis-cc.gitlab.io/dotstatsuite-documentation/getting-started/installation/).

### Site title and logo
Define your website name and logo.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```
"app": {
  "title": "OECD Data Explorer",
  "favicon": "/assets/siscc/data-explorer/images/favicon.ico"
}
```

![Site title and logo](faqs/images/faq-site-title-logo.png)

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
![Site logo header](/image/faq-site-logo-header.png)

* subheader:<br>
![Site logo subheader](/image/faq-site-logo-subheader.png)

* footer:<br>
![Site logo footer](/image/faq-site-logo-footer.png)

* splash:<br>
![Site logo splash](/image/faq-site-logo-splash.png)

### Homepage facets
Define the IDs and number of facets that are returned under the homepage "browse by".<br>
You must enter the ID of an indexed ConcepScheme, e.g. ref_area.<br>
**If none**, then all indexed ConceptSchemes are returned as facets.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```
"homeFacetIds": ["datasource_id", "cas_subject","ref_area", "dsb"]
```

![Homepage facets](/image/faq-homepage-facets.png)

### Search results page pinned facets 
Define the facets that are always displayed in the search result page.<br>
These facets will be displayed always at first top positions and their labels are prefixed with a [*].<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```
"pinnedFacetIds": ["datasource_id", "cas_subject","ref_area", "dsb"]
```

![Search result pinned facets](/image/faq-pinned-facets.png)

### Search results page excluded facets
Define the facets that will always be excluded from the search result page.<br> 

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```
"excludedFacetIds": ["survey"]
```

### Search result page: number of results per page
Define the number of result displayed per page in the search result pages.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```
"defaultRows": 10
```

### Time period boundaries
Define the minimum and maximum values of the time period range in the visualisation page views.<br> 

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```
"period": {
  "boundaries": [1970, 2020]
}
```

![Time period boundaries](/image/faq-period-boundaries.png)

### Default time period
Define the default time period selection of the visualisation page views, according to data availability.<br>
**Warning** Sometimes business rules (e.g. sdmx annotations) can supersede the default selection.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```
"period": {
  "default": [2018, 2018]
}
```

!Time period default range](/image/faq-period-default.png)

### Maximum number of observation values


### Preferred scale attribute


### Decimals rule attribute


### Coded attributes returned as flags


### Coded and uncoded attributes returned as footnotes


### Table and chart footer logo


### Table and chart footer terms and conditions


### API documentation hyperlink


### Contact us hyperlink


### Privacy Policy hyperlink


### Charts default look and feel settings


### Localised observation values separators for thousands and decimals

