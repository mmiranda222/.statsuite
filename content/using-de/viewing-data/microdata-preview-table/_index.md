---
title: "Preview microdata"
subtitle: 
comments: false
weight: 2975
keywords: [
  'Microdata in the .Stat Suite', '#microdata-in-the-stat-suite',
  'Microdata preview-table', '#microdata-preview-table',
]

---

#### Table of Content
- [Microdata in the .Stat Suite](#microdata-in-the-stat-suite)
- [Microdata preview-table](#microdata-preview-table)

---

> Released in [March 10, 2021 Release .Stat Suite JS 7.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#march-10-2021)

### Microdata in the .Stat Suite

The .Stat Suite supports the storage and dissemination of microdata based on SDMX, with the current limitation that the microdata ID dimension needs to be coded.  
Microdata and their aggregations are stored together in the same DSD and are exposed through the same dataflow.

In order to distinguish microdata from their aggregated data, there need to be 2 dimensions present in the DSD:
- a microdata identification dimension allowing to uniquely identify each microdata observation
- an additional hidden microdata *DRILLDOWN* dimension (e.g. "MD_DIM") to be defined by an annotation of type "**DRILLDOWN**" at dataflow level, e.g.:
  ```json
  "annotations": [{  
      "type": "DRILLDOWN"  
      "title": "MD_DIM"  
    }]
  ```  
  This dimension is used to indicate if an observation is an aggregated (*DRILLDOWN* = "**_T**") or disaggregated (*DRILLDOWN* = "**DD**") value: this allows for separate filtering for aggregated data in primary preview-table or microdata in microdata preview-table  

It is also necessary that the data owner:
- hides the microdata identification dimension as well as the microdata *DRILLDOWN* dimension in the (primary) data table using the dataflow's "NOT_DISPLAYED" annotation.
- set the default selection value of the microdata *DRILLDOWN* dimension to "**_T**" using the dataflow's "DEFAULT" annotation.

For any DSD and dataflow respecting these conditions, the Data Explorer will automatically:
- hide the microdata in the default (primary) data table and only show aggregated data
- hide the microdata-related dimensions not necessary in the (primary) data table
- add a hyperlink to each table value cell that allows (through clicking the link) opening the microdata viewer tab which displays those microdata that are linked to that aggregated data value
- add a muted (greyed out) microdata menu item (tab). The microdata tab is only visible when the dataflow has microdata.

![de-microdata-1](/dotstatsuite-documentation/images/de-microdata-1.png)

Note that the .Stat Suite microdata feature does not perform any dynamic aggregation calculations and that thus all microdata are displayed as loaded by the data owner.  
Also note that in a future version of the .Stat Suite, it is intended to allow the usage of one single microdata dimension that does not impose the value "**DD**" for the disaggregated metadata. This can be implemented once the SDMX 3.0 API feature to filter data using "not equal to" (e.g. *DRILLDOWN* != "_T") is available.

---

### Microdata preview-table

The microdata preview-table is displayed first when the user clicks on an aggregated data value which has a link. By clicking the link, the microdata tab becomes 'active', and the microdata preview-table is constructed out of the data resulting from the SDMX query that corresponds to the data selection (**including also all respective child dimension values**) of the related aggregated data value, but by replacing the selection "**_T**" for the *DRILLDOWN* dimension by "**DD**". It thus only displays microdata, and no aggregated data.

Note: The microdata preview-table is only meant to provide a quick mean for users to validate that they have found the microdata that they were looking for.  

![de-microdata-2](/dotstatsuite-documentation/images/de-microdata-2.png)

The microdata preview-table:
- uses the same functional and graphical approaches than the (primary) data table, except if stated here otherwise 
- automatically collapses the filter panel through *transition* to avoid filter changes during the microdata display and to allow the microdata preview-table taking a maximum screen width
- shows dataflow title in the table title (like in the (primary) data table) but prefixed with "Microdata for"
- shows all selected dimension values (corresponding to the cell clicked in the DE) - except hidden dimensions - in the table subtitle in the usual way (dimensions separated by a dot) 
- is always a **flat** table with all dimensions, the observation value (as "Value") and the attributes presented in columns and each row presenting a microdata observation (the "Customise" menu item is hidden)
- does thus not allow for layout changes
- automatically hides all hidden dimensions (through annotation "NOT_DISPLAYED") incl. the *DRILLDOWN* dimension  
- automatically shows also **all** attributes even those being listed in the annotation "NOT_DISPLAYED"
- alternatively to the above 2 default behaviours, it displays only those components of which the concepts are being listed in the dataflow's "DRILLDOWN_CONCEPTS" annotation, e.g.  
  ```json
  "annotations": [{
      "type": "DRILLDOWN_CONCEPTS"
      "title": "DONOR,RECIPIENT,YEAR,PROJECT_ID,OBS_VALUE,DESCRIPTION,OWNER"   <-- These are the IDs of the only concepts to be displayed in the microdata preview-table
  }]
  ```
- uses localised labels (according to the setting of the user's "Labels" configuration)
- leverages horizontal and vertical scrolling as needed
- highlights rows with mouse-over
- displays the total number of microdata observations corresponding to the query (total in content-range header) above the top grey line (as done in the search result page)
- paginates the microdata observations by groups of 100 or 1000. The page selector is located below the microdata preview-table (as done in the search result page)   
- allows exporting all microdata corresponding to current query as SDMX-CSV file
- allows switching to 'full screen' reading mode
- allows bookmarking the page through appropriate URL parameters

Additional rules:
- If the user goes back to any other tab, then the filter panel appears again.  
- The microdata tab is muted (greyed out) and inaccessible whenever there is currently no active microdata selection. This is the case when the visualisation page opens or whenever the user changes the filter selection. Thus whenever the user changes the filter selection, then the microdata tab becomes muted as the previous microdata selection is not valid anymore.
- As long as the selection is not changed and thus the microdata tab is not muted, the user can (using the menu tabs) navigate forth and back between the original data table and the last displayed microdata table.


