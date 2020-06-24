---
title: "Search results"
subtitle: 
comments: false
weight: 1900

---

#### Table of Content
- [Result content](#result-content)
- [Pagination](#pagination)
- [Navigation towards the DE visualisation page](#navigation-towards-the-de-visualisation-page)

---

### Result content
The number of total search hits as well as the first set of most relevant search results are presented on the page.  

![de search result content](/images/de-result-1.png)

The following information is displayed for each result:
* The localised name
* The source (datasource ID)
* For each of the facets configured for the home page, the related localised facet value(s) and their parent hierarchy, e.g. `Topic: Health > Health Status`, `Source: ILO`
* The localised dataflow description
* The date/time of the last update of the dataflow
* The dataflow’s Agency, ID and version

All the above details are "hidden" by default, and an option (arrow on the right side of the result name) allows the user to expand/collapse the detailed information for each result.  

A **download** button allowing downloading the complete unfiltered dataflow in SDMX-CSV format using the current language.

If a free text search was made, then the relevant above information is highlighted. If the text was found in a concept name/ID or dimension codes, then also this information is added to the dataflow information. See documentation on [How free text search hits are displayed](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/free-text-search/).

### Pagination
Search results are paginated, and the number of results per page is configurable (see [Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#search-result-page-number-of-results-per-page)).  
By using the feature at the bottom right side of the search results page, the user can move to the next, first or last page by using the corresponding **arrows** `|<` `<` `>` `>|`. The user can also enter a page number in the appropriate box.

![de search result content](/images/de-result-2.png)

### Navigation towards the DE visualisation page
When the user selects a dataflow in the search result, by clicking on the search result, then she/he is forwarded to the DE data visualisation page that corresponds to that dataflow.  
The **filter selections are also kept** to the visualisation page that uses it to make the automated filter selections. For example, if the user has selected a reference area in the reference area facet of the search result page, then this selection is maintained in the reference area filter in the data visualisation page.  

