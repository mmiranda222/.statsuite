---
title: "Search results"
subtitle: 
comments: false
weight: 1900
keywords: [
  'Introduction', '#introduction',
  'Result content', '#result-content',
  'Optional download feature', #optional-download-feature',
  'Pagination', '#pagination',
  'search result URL', '#search-result-url',
  'Navigation towards the DE visualisation page', '#navigation-towards-the-de-visualisation-page',
]
---

#### Table of Content
- [Introduction](#introduction)
- [Result content](#result-content)
    - [Optional download feature](#optional-download-feature)
- [Pagination](#pagination)
- [search result URL](#search-result-url)
- [Navigation towards the DE visualisation page](#navigation-towards-the-de-visualisation-page)

---

### Introduction
When users perform a free text search or browse by a facet from the .Stat DE homepage, then a page with the results of the search is presented. The search result page displays a list of all the corresponding hits from the search, along with the associated facets depending on the current search context (see documentation on [Facets](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/facets/)). 

---

### Result content  
The total number of search hits is displayed on top of the search result page content, followed by the first set of the most relevant search results.  
The search results page is paginated and lists all result hits.   
 
Each search result is divided into three parts:   
1. The first part displays the basic information by default (in the collapsed mode);  
2. The second part displays extended information in the expanded mode;
3. third part is the set of options on the right side.   

![de search result content](/dotstatsuite-documentation/images/de-result-1.png)  

The following information is displayed for each search result:  
1. Default display of **basic information** (collapsed mode)  
* The localised dataflow name (or its ID if no localised dataflow name) which is also a link to open the table data preview; this link is a query taking the search terms into account.  
* The localised dataflow description if exists; it can be shortened if too long.
* The dataflow dimensions name when search terms are found as hits  

2. Display of **extended information** (expanded mode)  
In order to display additional information of a search result, the user can click on the `expand` option arrow on the right side of the search result area.  
The default information is still visible with the entire description (if it was shortened in the default display) and is followed by:
* The dataflow source (datasource ID)
* For each of the facets configured for the homepage, the related localised facet value(s) and their parent hierarchy, e.g. `Topic: Health > Health Status`, `Source: ILO`
* The date/time of the last update of the dataflow
* The dataflow’s Agency, ID and version

3. **Options**
* Expand/Collapse option for displaying additional information of a search result
* Download *(see the sub-section below)*

When a free text search is performed, then the search term(s) is/are highlighted in each of the above information. If the term(s) was/were found in a concept name/ID or dimension codes, then this information is also added to the dataflow information. See documentation on [How free text search hits are displayed](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/free-text-search/).  
  
![de search result content highlight](/dotstatsuite-documentation/images/de-result-highlight-1.png)

#### Optional download feature
When this option is enabled (see the [configuration documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#enabled-download-option-on-the-search-result-page)), then two options of download are made available in the search result objects:
* Download of the complete unfiltered dataflow data in tabular text (**SDMX-CSV** format) using the current language;
* (since [March 10, 2021 Release .Stat Suite JS 7.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#march-10-2021)) Download any additional files that are attached to the dataflow through the **SDMX `EXT_RESOURCE` annotation** (see the related [specifications](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/custom-data-view/external-resources/)).

![de search result content highlight](/dotstatsuite-documentation/images/de-search-result-download.png)

---

### Pagination
Search results are paginated, and the number of results per page is configurable (see [Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#search-result-page-number-of-results-per-page)).  
By using the feature at the bottom right side of the search results page, the user can move to the next, first or last page by using the corresponding **arrows** `|<` `<` `>` `>|`. The user can also enter a page number in the appropriate box.

![de search result content](/dotstatsuite-documentation/images/de-result-2.png)

---

### search result URL
The search result page(s) can also be accessed through a direct link, because some of the **user's choices and options are part of the URL**, which can thus be shared or bookmarked.  
The configurations of the search results included in the URL are listed and explained in the following table:

| key | type | definition | exemple |
| ------ | ------ | ------ | ------ |
| locale | string | locale of the app | locale=fr
| facet | string | open box in side in search results | facet=qmsoRy4r
| term | string | search term | term=people
| start | integer | page index of the search | start=0
| constraints | array | selected facets of the search | constraints[0]=SIS-CC-stable
| hasAccessibility | boolean | a11y mode of the app | hasAccessibility=false
| hasDataAvailability | boolean | sdmx data availability mode | hasDataAvailability=false

**Note** that the full set of configurations of the URL is listed in the [Viewing data](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/) topic.

---

### Navigation towards the DE visualisation page
When the user clicks on a search result name from the search result page, then she/he is forwarded to the DE [data visualisation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/) page that corresponds to the selected result.  
The **filter selections are also kept** to the visualisation page that uses it to make the automated filter selections. For example, if the user has selected a reference area in the reference area facet of the search result page, then this selection is maintained in the reference area filter in the data visualisation page.



