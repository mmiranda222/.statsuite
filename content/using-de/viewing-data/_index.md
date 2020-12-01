---
title: "Viewing data"
subtitle: 
comments: false
weight: 2000

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
The visualisation page can also be accessed through a direct link, because the most important page **configuration options are part of the URL**, which can thus be bookmarked.  
The full configurations (with the configurations of the search result pages) included in the URL are listed and explained in the following overview table:

| key | type | definition | exemple |
| ------ | ------ | ------ | ------ |
| lc | string | locale of the app | lc=fr
| fc | string | open box in side in search results | fc=qmsoRy4r
| tm | string | search term | tm=people
| pg | integer | page index of the search | pg=0
| fs | array | facet values selected in the search | fs[0]=SIS-CC-stable
| df[ds,id,ag,vs] | object | dataflow identifiers | df[ds]=SIS-CC-stable&df[id]=DF_AIR_EMISSIONS&df[ag]=OECD&df[vs]=2.1
| dq | string | sdmx dataquery | dq=.AUS+AUT.GP.A
| ac=true,false | boolean | accessibility mode of the app | ac=false
| av=true,false | boolean | sdmx data availability mode | av=false
| vw=tb,br,rw,sp,hs,vs,tl,sb,cp | string | type of viewer component used | vw=table
| mp[id,lv] | string | map information: ID of the map and ID of the map level | mp[id]=world_countries&mp[lv]=countries
| pd | string | period of the sdmx data request | pd=2017,2020
| lt[rs,rw,cl] | object | layout of the table in the vis page (row section, row, column) | lt[rs]=&lt[rw]=STO&lt[cl]=TIME_PERIOD
| lb=nm,id,bt | string | display mode of sdmx (name, identifier, both) | lb=id
| to[]=true,false | object | order of time dimension(s) | to[TIME_PERIOD]=true
| lo | integer | last N observations per time series | lo=1


> **Note** that, since the [November 30, 2020 Release .Stat Suite JS 6.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#november-30-2020), the keys in the above table have been shortened in order to reduce the browser url size and avoid reaching browser limitations as much as possible. Previous bookmarked urls with long keys will still work because the application converts them to their shorter match.  
As part of this refactoring work, the following keys have also been removed:
> * filter (open box in side in viz)
> * frequency (frequency of the app)

**Note** also that these URL options allow using the web browser's `Going Back` option to roll back to the corresponding previous state and user selections.

---

### Externally defined dataflows
> Released in [November 30, 2020 Release .Stat Suite JS 6.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#november-30-2020)

It is possible to display an externally defined dataflow for visualisation (table and chart views) and download options in the Data Explorer, in the case when the dataflow is stored only as stubs (without content, e.g. without the link to its DSD), meaning that the full definition and content of the corresponding dataflow is stored externally.  
Therefore, the locally stored dataflow stub includes the references (`URL link`) to the original external full dataflow definition, with the following artefact properties: `isExternalReference=true`, and link `{external structure link}`.  
In that case, the dataflow can be indexed and retrieved by search or browse in the Data Explorer context (see [indexing externally defined dataflows](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/indexing-data/#indexing-externally-defined-dataflows)), or simply displayed for data preview in the context of the DLM (see [DLM preview data](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/preview-data/)).
