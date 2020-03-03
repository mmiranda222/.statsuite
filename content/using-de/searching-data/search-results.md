---
title: "Search results"
subtitle: 
comments: false
weight: 1900

---

### Result content
The number of total search hits as well as the first set of most relevant search results are presented on the page.  

![de search result content](/images/de-result-1.png)

The following information are displayed for each dataflow:
* The localised dataflow name
* For each of the facets configured for the home page, the according localised facet value(s) and their parent hierarchy, e.g. `Topic: Health > Health Status`, `Source: ILO`
* The localised dataflow description
* The date/time of the last update of the dataflow
* The dataflow’s Agency, ID and version
* A download button allowing downloading the complete unfiltered dataflow in SDMX-CSV format using the current language.

If a free text search was made, then the relevant above information is highlighted. If the text was found in a concept name/ID or dimension codes, then also this information is added to the dataflow information. See documentation on [How free text search hits are displayed](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/free-text-search/).

### Navigation towards the DE visualisation page
When the user selects a dataflow in the search result, by clicking on the search result, then she/he is forwarded to the DE data visualisation page that corresponds to that dataflow. The filter selections are also kept to the visualisation page that uses it to make the automated filter selections. For example, if the user has selected a reference area in the reference area facet of the search result page, then this selection is maintained in the reference area filter in the data visualisation page.  

