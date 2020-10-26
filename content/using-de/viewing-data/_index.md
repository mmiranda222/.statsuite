---
title: "Viewing data"
subtitle: 
comments: false
weight: 2000

---

When the user clicks on the dataflow name (link) in the search results, the what-is-called Data Explorer **visualisation page** is displayed. Currently, it initially shows a data preview table. Using the toolbar, the user can switch to show a data chart instead, and vice-versa.

The visualisation page can also be accessed through a direct link, because the most important page **configuration options are part of the URL**, which can thus be bookmarked.  
The full configurations (with the configurations of the search result pages) included in the URL are listed and explained in the following overview table:

| key | type | definition | exemple |
| ------ | ------ | ------ | ------ |
| locale | string | locale of the app | locale=fr
| facet | string | open box in side in search results | facet=qmsoRy4r
| term | string | search term | term=people
| start | integer | page index of the search | start=0
| constraints | array | selected facets of the search | constraints[0]=SIS-CC-stable
| dataflow | object | dataflow identifiers | dataflow[datasourceId]=SIS-CC-stable&dataflow[dataflowId]=DF_AIR_EMISSIONS&dataflow[agencyId]=OECD&dataflow[version]=2.1
| filter | string | open box in side in viz | filter=COU
| dataquery | string | sdmx dataquery | dataquery=.AUS+AUT.GP.A
| hasAccessibility | boolean | a11y mode of the app | hasAccessibility=false
| hasDataAvailability | boolean | sdmx data availability mode | hasDataAvailability=false
| viewer | string | type of viewer component used | viewer=table
| period | string | period of the sdmx data request | period=2017,2020
| frequency | string | frequency of the app | frequency=Q
| layout | object | layout of the table in the vis page | layout[sections]=&layout[rows]=STO&layout[header]=TIME_PERIOD
| display | string | display mode of sdmx (label, code, both) | display=code
| time | object | order of time dimension(s) | time[TIME_PERIOD]=true

**Note** that these URL options allow using the web browser's `Going Back` option to roll back to the corresponding previous state and user selections.

The visualisation page is composed of:  
* the common Data Explorer application [**Header**](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/general-layout/#header) and [**Footer**](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/general-layout/#footer)
* a **Back to the search results** breadcrumb link on the top left side
* a [**Filters**](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/) area on the left side that allows changing the data selection
* a [**Toolbar**](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/toolbar/) on the top right side that allows switching the view type, customising the view and executing actions
* a **Data View** area on the central right side for [**preview-table**](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/) and [**chart**](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/charts/) representations

The linked sections describe in more detail the behaviors and functionalities of these components.

**Note** that the `Back to the search results` option is only available when the user is coming from a previous search result (see [this section](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/search-results/) of the documentation), and clicking on it brings the user back to any previous state of the search results. `Back to the search results` is not visible when opening a data preview from a shared URL, because in this case there will be no historical search results to go back to.  

![Viewing data](/dotstatsuite-documentation/images/de-viewing-data.png)
