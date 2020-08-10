---
title: "Viewing data"
subtitle: 
comments: false
weight: 2000

---

When the user clicks on the dataflow name (link) in the search results then the what-is-called Data Explorer **visualisation page** is displayed. It currently initially shows a data preview table. Using the toolbar, the user can switch to show a data chart instead, and vice-versa.

The visualisation page can also be accessed through a direct link because the most important page configuration options are part of the URL, which can thus be bookmarked. The configurations included in the URL are:  
- data space ID
- dataflow identification
- display type: table or chart type
- current data selection
- current language selection
- curent setting for application of actual content constraints
- current filter focus  

The URL configurations do not yet include:
- current name customisation 
- current layout customisation
- current chart customisation
- current full-screen customisation

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
