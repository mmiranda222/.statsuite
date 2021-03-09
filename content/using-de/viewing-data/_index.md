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

When the user clicks on the dataflow name (link) in the search results, the what-is-called Data Explorer **visualisation page** is displayed. Currently, it initially shows a data preview table. By using the toolbar, the user can switch to show a data chart instead, and vice-versa.

### Content overview
The visualisation page is composed of:  
* the common Data Explorer application [**Header**](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/general-layout/#header) and [**Footer**](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/general-layout/#footer)
* a **Back to the search results** breadcrumb link on the top left side
* a [**Filters**](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/) area on the left side that allows changing the data selection
* a [**Toolbar**](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/toolbar/) on the top right side that allows switching the view type, customising the view and executing actions
* a **Data View** area on the central right side for [**preview-table**](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/) and [**chart**](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/charts/) representations

The linked sections describe in more detail the behaviors and functionalities of these components.

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
