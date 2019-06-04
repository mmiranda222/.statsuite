---
title: "Changelog"
subtitle: 
comments: false
weight: 40

---

### June 4, 2019
Major changes:

- [dotstatsuite-data-explorer#23](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/23) **Time period range selection** with annual and non-annual frequencies.<br>
This new feature of the Data Explorer visualisation page is **replacing the time range slider** and enables the end-user to select a time frequency and an corresponding range of time period values for a given dataflow view.<br>
![Time Period Selector](/images/TimePeriodSelector.png)
- [dotstatsuite-data-explorer#26](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/26) **Share API** and publication workflow.<br>
The new Share service for table and chart sharing views (including url and embedded codes) relies on a **email validation workflow** process detailed [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share#publication-workflow).<br>
The end-user needs to provide a valid email address in order to receive a validation email along with the url and embedded code of the shared table or chart view.<br>
![Share email](/images/ShareMail.png)
- [dotstatsuite-data-explorer#33](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/33) **LastNObservations** default setting allowing to define a default number of latest time series observations per time series returned for table and chart views.<br>
This is implemented as an sdmx annotation parameter, but it should then be enhanced with a UI feature allowing the end-user to change this default parameter.
- [dotstatsuite-data-explorer#15](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/15) **.CSV download includes labels/codes option**.<br>
From the search result, .csv downloads include both codes and localised labels of dimensions and dimension members.<br>
From the visualisation pages, .csv downloads include codes only when "Code" option is set on the UI, and .csv downloads include both codes and localised labels when "Name" or "Both" options are set on the UI.

Minor changes:

- [dotstatsuite-data-explorer#34](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/34) Allow sdmx Attributes with 4 letter codes to be displayed as Flags
- [dotstatsuite-data-explorer#66](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/66)Theme SETTINGS. The new configuration file settings.json can include configuration the for Data Explorer layout, search header or splash logo.<br>
If these are added to the settings.json file, then it supersedes the default configuration.<br>
See more details in the [FAQ note](https://sis-cc.gitlab.io/dotstatsuite-documentation/getting-started/faqs/de-customisation-configuration/).
- [dotstatsuite-data-explorer#38](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/38) Chart configs (new configs + chnages in the Rules Driver API)
- [dotstatsuite-data-explorer#27](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/27) **_Legacy_** Fix apiqueries links
- [dotstatsuite-data-explorer#25](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/25) **_Legacy_** Fix visualisation reset state

Bug fixes:

- [dotstatsuite-data-explorer#22](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/22) Issues and remaining adaptations in the new search, configuration services and architecture
- [dotstatsuite-data-explorer#68](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/68) Update label in scope list

---

### May 17, 2019
Major changes:

- [dotstatsuite-data-explorer#24](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/24) Internet Explorer 10 & 11 compatible DataExplorer, with gracefully downgraded compatible features
- [dotstatsuite-sdmx-faceted-search#18](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/issues/18) Pagination of the search result pages. You can also configure the number of results per pages (see how from [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/getting-started/faqs/de-customisation-configuration/))

Bug fixes:

- [dotstatsuite-data-explorer#53](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/53) When no data in visualisation page, re-request returns an error
- [dotstatsuite-data-explorer#61](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/61) Incoherent state in the visualisation breadcrumb
- Various fixes on [layout](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/30), [annotations](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/55), [charts configs](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/38) and [attributes](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/54)

---

### April 25, 2019
Major changes:

- [dotstatsuite-data-explorer#42](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/42) Sdmx Faceted Search (sfs) UI adaptation, including configuration of home facets and reject and/or handle special facets in search results
- [dotstatsuite-data-explorer#38](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/38) Chart Configs
- [dotstatsuite-data-explorer#3](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/3) Table layout variations relative to user's actions

Minor changes:

- [dotstatsuite-data-explorer#28](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/28) **_Legacy_** Sort by order / by start all dimensions values
- [dotstatsuite-data-explorer#25](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/25) **_Legacy_** Fix visualization reset state
- [dotstatsuite-data-explorer#49](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/49) Setup "ILO" tenant on new front DevOps chain
- [dotstatsuite-data-explorer#30](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/30) **_Legacy_** Get default layout from sdmx data

Bug fixes:

- [dotstatsuite-data-explorer#32](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/32) The dataflow count is not visible for too long search filter values
- [dotstatsuite-data-explorer#27](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/27) **_Legacy_** Fix apiqueries links

---

### April 17, 2019
Minor changes:

- [dotstatsuite-data-explorer#29](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/29) **_Legacy_** Feature cascading sdmx requests
- [dotstatsuite-ui-components#2](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-components/issues/2) scope list search adaptation

Bug fixes:

- [dotstatsuite-data-explorer#39](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/39) unexpected characters in the DE URL

---

### April 11, 2019
Major changes:

- [dotstatsuite-data-lifecycle-manager#37](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/issues/37) .Stat DLM list artefacts feature enhancements, including information about data and observation number for a given dataflow, data preview and dataflow categorisation under the same expand/collapse feature.

Minor changes:

- [dotstatsuite-data-explorer#1](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/1) Update translation files

Bug fixes:

- [dotstatsuite-data-explorer#6](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/6) Impossible to add dimension to Section when default codes

---

### Release v0.5 - March 2019
Release notes and known limitations in [Github](https://github.com/cis-itn-oecd/dotstat-services/tree/development/docs/Release%20v0.5%20-%20March%202019)

---

### Release v0.4 - February 2019
Release notes and known limitations in [Github](https://github.com/cis-itn-oecd/dotstat-services/tree/development/docs/Release%20v0.4%20-%20February%202019)

---

### Release 14.12.2018
Release notes and known limitations in [Github](https://github.com/cis-itn-oecd/dotstat-services/tree/development/docs/Release%2014.12.2018)

---

### Release 28.09.2018
Release notes and known limitations in [Github](https://github.com/cis-itn-oecd/dotstat-services/tree/development/docs/Release%2028.09.2018)

---

### Release 10.07.2018
Release notes and known limitations in [Github](https://github.com/cis-itn-oecd/dotstat-services/tree/development/docs/Release%2010.07.2018)

