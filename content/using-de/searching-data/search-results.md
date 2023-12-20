---
title: "Search results"
subtitle: 
comments: false
weight: 1900
keywords: [
  'Introduction', '#introduction',
  'Result content', '#result-content',
  'Optional download feature', '#optional-download-feature',
  'Result ordering', '#result-ordering',
  'Result boosting', '#result-boosting',
  'Weight value and Solr search engine score', '#Weight-value-and-Solr-search-engine-score',
  'Result pagination', '#result-pagination',
  'Result page URL', '#result-page-url',
  'Navigation towards the DE visualisation page', '#navigation-towards-the-de-visualisation-page',
]
---

#### Table of Content
- [Introduction](#introduction)
- [Result content](#result-content)
    - [Optional download feature](#optional-download-feature)
- [Result ordering](#result-ordering)
- [Result boosting](#result-boosting)
    - [Weight value and Solr search engine score](#Weight-value-and-Solr-search-engine-score)
- [Result pagination](#result-pagination)
- [Result page URL](#result-page-url)
- [Navigation towards the DE visualisation page](#navigation-towards-the-de-visualisation-page)

---

### Introduction
When users perform a free text search or browse by a facet from the .Stat DE homepage, then a page with the results of the search is presented. The search result page displays a list of all the corresponding hits from the search, along with the associated facets depending on the current search context (see documentation on [Facets](/dotstatsuite-documentation/using-de/searching-data/facets/)). 

---

### Result content  
The total number of search hits is displayed on top of the search result page content above the thick grey line, followed by the first set of the most relevant search results. In reduced (responsive) mode, the [x] results moves right to Applied filters.

The search results page is paginated and lists all result hits.   
 
Each search result is divided into three parts:   
1. The first part displays the basic information by default (in the collapsed mode);  
2. The second part displays extended information in the expanded mode;
3. third part is the set of options on the right side.   

![de facet result](/dotstatsuite-documentation/images/de-result-1.png) 

The following information is displayed for each search result:  
1. Default display of **basic information** (collapsed mode)  
   * The localised dataflow name (or its ID if no localised dataflow name exists) linking to the table data preview. The link takes the current search terms into account.  
   * The localised dataflow description if exists. It is shortened to 3 lines if too long.
   * The localied comma-separated list of dataflow dimension names (in the order of their definition in the DSD) that have more than one dimension value with real data (according to actual data availability).
   * The localised name of values of dataflow dimensions (togther with the localised dimension name), which have search hits. One line per dimension.
   * An `Expand` icon to display extended information (see below).   
   * A `Download` icon to download the entire dataflow content in SDMX-CSV format. *(For details see the sub-section below.)*  

  - When a free text search is performed, then all the search term(s) is/are highlighted in each of the above pieces of information. See documentation on [How free text search hits are displayed](/dotstatsuite-documentation/using-de/searching-data/free-text-search/).  
  ![de search result content highlight](/dotstatsuite-documentation/images/de-result-highlight-1.png)

2. Display of additional **extended information** (expanded mode)  
   * The entire description becomes visible if it was shortened in the default display.
   * The comma-separated values for all home page facets for this dataflow prefixed with '`... > `' when a value has a parent hierarchy, and with the facet names, e.g., '`Topic: ... > Health Status, ... > Production, Environment`', unless the facet is already listed as a dimension with a free-text search hit under the **basic information**. One line per facet. All values not fitting on one line are replaced by 3 dots `...`. When there is a hierarchy, then the whole parent hierarchy is made available in a black tooltip on mouseover (similar to "Applied filters").
   * The date/time of the last update of the dataflow
   * The `Collapse` icon (instead of the `Expand` icon) in order to return to the default display (see above).   

#### Optional download feature
When this option is enabled (see the [configuration documentation](/dotstatsuite-documentation/configurations/de-configuration/#enabled-download-option-on-the-search-result-page)), then two options of download are made available in the search result objects:
* Download of the complete unfiltered dataflow data in tabular text (**SDMX-CSV** format) using the current language;
* (since [March 10, 2021 Release .Stat Suite JS 7.1.0](/dotstatsuite-documentation/changelog/#march-10-2021)) Download any additional files that are attached to the dataflow through the **SDMX `EXT_RESOURCE` annotation** (see the related [specifications](/dotstatsuite-documentation/using-dlm/manage-data/custom-data-view/external-resources/)).

![de search result content highlight](/dotstatsuite-documentation/images/de-search-result-download.png)

---

### Result ordering
> Released with [April 11, 2022 .Stat Suite JS 14.0.0](/dotstatsuite-documentation/changelog/#april-11-2022)

By default, the search result dataflows are sorted in this order:
 1. Descending relevance (where the free-text was found, dataflow boost)
 2. Ascending alphabetical (localised dataflow name)
 3. Descending "Last updated" date

In order to easier find specific dataflows, the user can change the sort order by selecting one of the predefined criteria using the dropdown menu:  

![de search result order](/dotstatsuite-documentation/images/de-search-order-menu.png)

---

### Result boosting
> Released with [April 11, 2022 .Stat Suite JS 14.0.0](/dotstatsuite-documentation/changelog/#april-11-2022)

The default relevance score used to order the search results depends on where the search term was found, which can be customised as documented [here](/dotstatsuite-documentation/configurations/search-config/#relevance-of-free-text-search-results-how-to-tweak-the-weights-of-specific-dataflow-properties).

The .Stat faceted search allows using the dataflow annotation of type `SEARCH_WEIGHT` to boost dataflows in the search result order when ordered by "Relevance".  

The `SEARCH_WEIGHT` annotation needs to be of type "SEARCH_WEIGHT". The weight value is an integer or number and should be set:
- in the localised Annotation Text, in case the boost is language-dependent, otherwise
- in the non-localised Annotation Title

```xml
<common:Annotations>
  <common:Annotation>
    <common:AnnotationTitle>2</common:AnnotationTitle>
    <common:AnnotationType>SEARCH_WEIGHT</common:AnnotationType>
    <common:AnnotationText xml:lang="en">3</common:AnnotationText>
    <common:AnnotationText xml:lang="es">4</common:AnnotationText>
    <common:AnnotationText xml:lang="fr">5</common:AnnotationText>
  </common:Annotation>
</common:Annotations>
```

The localised boost value, if available, or alternatively the non-localised boost value is used to **multiply** the dataflow score calculated by Solr and thus influences accordingly the ordering by relevance. The bigger the calculated score value, the higher is the listing of the dataflow in the search results.  
  
#### Weight value and Solr search engine score
The Solr search engine determines the score per dataflow automatically depending on the count and location of search hits in the different dataflow properties (searched fields), before it multiplies that score with the dataflow's **`SEARCH_WEIGHT`** annotation value, if present. The `SEARCH_WEIGHT` boost value should be smaller than 1 to decrease the score and higher than 1 to increase the score. The value has no limits other than the ones defined by the internal number type.  
The "developer tools" of the web browser (accessibly through the F12 key) allow seeing the current final Solr score per dataflow for a specific query in the response message of the search requests (look out for queries to https://example.org/api/search?tenant=xxxxx). This analysis can be used to determine the optimal `SEARCH_WEIGHT` boost values.  
  
 ![de search result Solr score](/dotstatsuite-documentation/images/de-serach-result-boosting-solrscore.png)  
   
---

### Result pagination
Search results are paginated, and the number of results per page is configurable (see [Documentation](/dotstatsuite-documentation/configurations/de-configuration/#search-result-page-number-of-results-per-page)).  
By using the feature at the bottom right side of the search results page, the user can move to the next, first or last page by using the corresponding **arrows** `|<` `<` `>` `>|`. The user can also enter a page number in the appropriate box.

![de search result content](/dotstatsuite-documentation/images/de-result-2.png)

---

### Result page URL
The search result page(s) can also be accessed through a direct link, because some of the **user's choices and options are part of the URL**, which can thus be shared or bookmarked.  
The configurations of the search results included in the URL are listed and explained in the following table:

| key | type | definition | exemple |
| ------ | ------ | ------ | ------ |
| locale | string | locale of the app | lc=fr
| facet | string | open box in side in search results | fc=qmsoRy4r
| term | string | search term | tm=people
| start | integer | page index of the search | pg=0
| constraints | array | selected facets of the search | constraints[0]=SIS-CC-stable
| hasAccessibility | boolean | a11y mode of the app | ac=false
| hasDataAvailability | boolean | sdmx data availability mode | hasDataAvailability=false

**Note** that the full set of configurations of the URL is listed in the [Viewing data](/dotstatsuite-documentation/using-de/viewing-data/) topic.

---

### Navigation towards the DE visualisation page
When the user clicks on a search result name from the search result page, then she/he is forwarded to the DE [data visualisation](/dotstatsuite-documentation/using-de/viewing-data/) page that corresponds to the selected result.  
The **filter selections are also kept** to the visualisation page that uses it to make the automated filter selections. For example, if the user has selected a reference area in the reference area facet of the search result page, then this selection is maintained in the reference area filter in the data visualisation page.  

*(since [May 19, 2021 Release .Stat Suite JS 8.0.0](/dotstatsuite-documentation/changelog/#may-19-2021))* If the **free-text search is used** and a "perfect match" (excluding non-alphanumeric characters) search hit is found within a dimension value, and if such dimension has no facet selection, then instead of DEFAULT selections, automatically  the (perfect match) value(s) is selected in the filter of the data visualisation page for that dimension. 

Example with searching terms "GDP current prices France":
 
![de search result content visualisation page](/dotstatsuite-documentation/images/de-search-result-free-text.png)  
  
* In the visualisations of all 3 displayed result dataflows:
  * The "Prices" dimension will only be filtered on the value "Current prices";
  * The "Reference Area" dimension will only be filtered on the value "France";
  * The DEFAULT selections -if any- will apply on the other dimensions not concerned by the hit of the free-text search.   



