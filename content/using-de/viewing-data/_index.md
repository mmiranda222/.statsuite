---
title: "Viewing data"
subtitle: 
comments: false
weight: 2000
keywords: [
  'Content overview', '#content-overview',
  'Visualisation page URL', '#visualisation-page-url',
  'Externally defined dataflows', '#externally-defined-dataflows',
]

---

#### Table of Content
- [Content overview](#content-overview)
- [Visualisation page URL](#visualisation-page-url)
- [Externally defined dataflows](#externally-defined-dataflows)

--- 

When the user clicks on the dataflow name (link) in the search results or is navigating through a direct URL, the what-is-called Data Explorer **visualisation page** is displayed.

### Content overview
The visualisation page is composed of:  
* the common Data Explorer application [**Header**](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/general-layout/#header) and [**Footer**](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/general-layout/#footer)
* a **Back to the search results** breadcrumb link on the top left (rtl: right) side
* a [**Filters**](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/) area on the left (rtl: right) side that allows changing the data selection
* a [**Toolbar**](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/toolbar/) on the top right (rtl: left) side that allows switching the view type, customising the view and executing actions
* a **Main View** area on the central right (rtl: left) side for the different view types, such as an [**overview**](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/overview.md) of the information of the data, a data [**preview-table**](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/), a [micro data table](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/microdata-preview-table/) or any of the available [**chart**](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/charts/) representations, which can be switched through a tab menu in the toolbar

The linked sections describe in more detail the behaviors and functionalities of these components.

By default, the landing tab of the **visualisation page** is the overview, unless:  
- a different default behaviour has been defined in the DE configuration, see [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#visualisation-default-landing-tab)
- or a different [`vw` parameter](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/general-layout/#url-parameters) is used in a direct visualisation URL.

**Note** that the `Back to the search results` option is only available when the user is coming from a previous search result (see [this section](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/search-results/) of the documentation), and clicking on it brings the user back to any previous state of the search results. `Back to the search results` is not visible when opening a data preview from a shared URL, because in this case there will be no historical search results to go back to.  

![Viewing data](/dotstatsuite-documentation/images/de-viewing-data.png)

---

### Visualisation page URL
*Moved to the main upper-topic [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/general-layout/#url-parameters).*

---

### Externally defined dataflows
> Released in [November 30, 2020 Release .Stat Suite JS 6.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#november-30-2020)

It is possible to display an externally defined dataflow for visualisation (table and chart views) and download options in the Data Explorer, in the case when the dataflow is stored only as stubs (without content, e.g. without the link to its DSD), meaning that the full definition and content of the corresponding dataflow is stored externally.  
Therefore, the locally stored dataflow stub includes the references (`URL link`) to the original external full dataflow definition, with the following artefact properties: `isExternalReference=true`, and link `{external structure link}`.  
In that case, the dataflow can be indexed and retrieved by search or browse in the Data Explorer context (see [indexing externally defined dataflows](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/indexing-data/#indexing-externally-defined-dataflows)), or simply displayed for data preview in the context of the DLM (see [DLM preview data](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/preview-data/)).
