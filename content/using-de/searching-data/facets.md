---
title: "Facets"
subtitle: 
comments: false
weight: 1800
keywords: [
  'What information is presented as facets', '#what-information-is-presented-as-facets',
  'Indexation content restrictions', '#indexation-content-restrictions',
  'Home page facets', '#home-page-facets',
  'Facets on the search result page', '#facets-on-the-search-result-page',
  'Facet type', '#facet-type',
  'Facet information', '#facet-information',
  'Hierarchical content', '#hierarchical-content',
  'Data availability', '#data-availability',
  'Local search', '#local-search', 
  'Facet items ordered by explicit ORDER annotation', '#facet-items-ordered-by-explicit-order-annotation',
  'Applied filters', '#applied-filters',
  'Pinned facets', '#pinned-facets',
]
---

#### Table of Content
- [What information is presented as facets](#what-information-is-presented-as-facets)
  - [Indexation content restrictions](#indexation-content-restrictions)
- [Home page facets](#home-page-facets)
- [Facets on the search result page](#facets-on-the-search-result-page)
  - [Facet type](#facet-type)
  - [Facet information](#facet-information)
  - [Hierarchical content](#hierarchical-content)
  - [Data availability](#data-availability)
  - [Local search](#local-search)
- [Facet items ordered by explicit ORDER annotation](#facet-items-ordered-by-explicit-order-annotation)
- [Applied filters](#applied-filters)
- [Pinned facets](#pinned-facets)

> *Version history:*  
> 'Applied filters' area is moved in the page header since [December 20, 2023 Release .Stat Suite JS yay](/dotstatsuite-documentation/changelog/#december-20-2023)  
> Facets values count numbers in search result also count values with no data since [December 20, 2023 Release .Stat Suite JS yay](/dotstatsuite-documentation/changelog/#december-20-2023)  
> Facets alphabetically ordered on search results since [December 20, 2023 Release .Stat Suite JS yay](/dotstatsuite-documentation/changelog/#december-20-2023)  
> Simplify datasource facet rules to make it "almost" as a normal facet with [April 20, 2023 Release .Stat Suite JS unicorn](/dotstatsuite-documentation/changelog/#april-20-2023)  
> Bypass search result page exception with [August 3, 2022 Release .Stat Suite JS quark](/dotstatsuite-documentation/changelog/#august-3-2022)  
> Improved the design of selectable second-level with [March 4, 2022 Release .Stat Suite JS 13.0.0](/dotstatsuite-documentation/changelog/#march-4-2022)  
> Selectable second-level introduced in [August 25, 2020 Release .Stat Suite JS 5.3.0](/dotstatsuite-documentation/changelog/#august-25-2020)

---

### What information is presented as facets
**Data source**: If configured so (see [*installation/configuration*](/dotstatsuite-documentation/configurations/de-configuration/#)), one facet is auto-generated for the **data source** (from SDMX endpoints used to retrieve dataflow information).  

**One facet per localised CategoryScheme**: The localised CategoryScheme(s) in which the dataflow is categorised.  
**Note** that each dataflow can be attached to one or more than one category.  
The CategoryScheme can have a simple hierarchy (each child element can have no or only one parent element defined) of an undefined depth (usually not more than 3 or 4), e.g.:

![de facet hierarchy](/dotstatsuite-documentation/images/de-facet-1.png)

**One facet per concept that is used to define dataflow dimensions**: Concepts are distinguished only by their localised concept names (per language), not by their IDs.  
**Note** that all Concepts having the same localised name (independently from their ID) are grouped into one single facet.  

**Special facet for the Frequency concept**.  
A dataflow can contain data for one or more frequencies that are normally defined through a frequency dimension. The specificity is that some dataflows with data of only one frequency might not have a frequency dimension, but it is also possible to find those dataflows through the frequency facet.  
In order to determine the frequency of data in such dataflows and add a relevant facet value for these, the search service do an additional unfiltered data query for one observation value.  
**Note** that if a dataflow has no time dimension, then it will also not have a value for the frequency facet.  

**Special facet for the Time period concept (not yet implemented)**  
Dataflows do not have a codelist for the time period dimension (time dimension). Therefore, only the actual content constraint can be used to determine the available time periods and thus the values of the time period facet.  
For practical reasons, the search only allows a filter by **ANNUAL** time periods. All non-annual time periods are converted to annual time period facet values. The time period facet is built as a range facet, because the facet filtering is done through a start year and an end year.  
**Note** that if a dataflow has no time dimension, then it will also not have values for the time period facet.  

#### Indexation content restrictions
A dataflow is indexed **only if** there is data associated to it.  
The data availability check is based on the `Actual Content Constraint` attached to the dataflow. The dataflow is indexed only if there is:
- a non-empty Actual Content Constraint
- no Actual Content Constraint (for compatibility with SDMX web services not based on .Stat Suite).

A particular dimension of a dataflow is indexed only if the dimension values with available data do not exceed the limit defined in the SFS configuration parameter `DIMENSION_VALUES_LIMIT`, which is by default set to 1000. It protects the search engine from too big codelists and prevents performance impacts. For more information see [here](/dotstatsuite-documentation/configurations/de-configuration/#limit-for-indexing-dimensions-per-dataflow).  

Dimension values of a dataflow are indexed only if there are data available for the values or, if those values are hierarchical parents in case their children values have data. For that purpose, the search indexing takes the current `Actual Content Constraint` of the dataflow, if available, into account.

---

### Home page facets
The localised .Stat DE home page presents a combination of a free text search box and a list of any few facets specifically defined in the [configuration](/dotstatsuite-documentation/configurations/de-configuration/) (in the currently chosen language) of the faceted search service. By configuration (see [here](/dotstatsuite-documentation/configurations/de-configuration/#search-auto-expanded-homepage-facet)), one facet can be automatically expanded by default at page launch.

![de homepage facet](/dotstatsuite-documentation/images/de-facet-2.png)

Each facet, when opened, presents a selectable root-level of facet values together with a non-selectable second-level facet values. The root-level and second-level facet values represent the available values for all dataflows currently being indexed.  
It is possible to make the individual second-level homepage facet values clickable by configuration (See more details [here](/dotstatsuite-documentation/configurations/de-configuration/#selectable-second-level-homepage-facet-values)). In this case, each selectable second-level facet value is presented on a new line as a bullet list.

![de homepage facet](/dotstatsuite-documentation/images/de-facet-bullet-list.png)

The free text search and the navigation through pre-defined facets are exclusive and result systematically in a new search discarding any previously made search selections.

**Order of facet values:**
- the first-level and second-level homepage facets values are ordered alphabetically and according to the current locale.
- If facet values have an *SDMX* `ORDER` annotation (see [specs](/dotstatsuite-documentation/using-de/sdmx-annotations/)), then this order takes precedence over the alphabetical one.

**Exception**  
If a facet value contains **only one single indexed dataflow**, then selecting that facet value will bypass the search result and directly display the data viualisation page. 

---

### Facets on the search result page
The facets shown in the search result page are fully dependent on the current search context. Only those facets are included, for which the dataflows listed as search results have values.   

When browsing and filtering the search result content, only one facet can be expanded at a time.  
 
Since [December 20, 2023 Release .Stat Suite JS yay](/dotstatsuite-documentation/changelog/#december-20-2023), the ‘Applied filters’ moved above the search results area. 
The 'Applied filters' panel is then always visible and can be expanded if there are more than 2 lines of applied filters. The last line always refers to the "Clear all filters" option.  

Note: The menu buttons (currently only Sort) are positioned below the thick grey line and are separated from the search results through a light line, similarly to the menu on the data visualisation page.  

![de facet result](/dotstatsuite-documentation/images/de-searchingdata-facets-searchresultpage.png) 

When refreshing the web browser, or when sharing a search result web page, the state of the currently expanded facet is kept in the URL.  

**Alphabetically ordered**  
Facets are ordered alphabetically ascending by their localised title, except for the top "pinned facets" that are ordered according to their configuration (see more details [here](#pinned-facets)).

**Completely hiding specific facets**
Facets can be removed (hidden) from the search result page when specifically defined so in the [configuration](/dotstatsuite-documentation/configurations/de-configuration/).  

**Impactless facets** (i.e. all the facet values of a facet have a number of the related search results equal to the number of currently already available search results) are automatically hidden in order to not confuse users with selections that have no immediate effect on the number of search results.  
The same rule will apply to **impactless facet values**, meaning that, when a facet value has a number of the related search results equal to the number of currently already available search results, then this value is automatically hidden in the facet.

**Hide overcounting facets**  
Since [April 20, 2023 Release .Stat Suite JS unicorn](/dotstatsuite-documentation/changelog/#april-20-2023)  
To not overwhelm the facet list, by default only a limited number of search facets (defined in the [DE configuration under the key `defaultFacetsNumber`](/dotstatsuite-documentation/configurations/de-configuration/#search-hide-lower-search-result-facets)) are displayed while the other facets are hidden under a **`More Filters`** accordion expandable on demand. The accordion title is complemented by the number of hidden facets within brackets. If a search returns less facets than the defined limit, then the accordion is not displayed.

![de facet - more filters](/dotstatsuite-documentation/images/de-searchingdata-facets-searchresultpage-morefilters.png)  

#### Facet type
All facets are **multi-selection** facets (an existing facet value selection does not prevent selecting other still available facet values). However, only one new facet value can be selected at any time, as this automatically triggers the refreshing of the search results, facets and the ['Applied filters' panel](#applied-filters). This is necessary to assure that the user doesn't combine selections of facet values for which no search result exists.   
*(since [October 5, 2021 Release .Stat Suite JS 10.0.0](/dotstatsuite-documentation/changelog/#october-5-2021))* Each item of a facet is displayed with a **checkbox** on the left side in the facet list:
- when the item is not selected, the checkbox is empty;
- when the item is not selected and the mouse hovers it, the checkbox stays empty and the background is blue;
- when the item is selected, the checkbox is changed into a tick mark.

![de facet checkbox](/dotstatsuite-documentation/images/de-facets-checkbox.png)

When a facet contains 8 items or more, then:
- a vertical scrollbar is added to the filter
- a [local search](#local-search) (spotlight feature) box is displayed

#### Facet information
The facet title contains the number of facet values available, and the number of currently selected facets (numbers surrounded by a frame). These counts also include facets values with no data (greyed out).  
Whenever there is no facet value selection, then it is indicated by "all", e.g. `"all/38"`. When all the facet values are selected, the number of selected values is displayed instead, e.g. `"38/38"`.   
When there is no facet value selection, the items are not listed in the "applied filters" area because no filtering is requested by the end-user.  

The facet values themselves show a number indicating the number of corresponding search results. Parent values contain the number of results valid for themselves and for all of their children.  

![de facet information](/dotstatsuite-documentation/images/de-searchingdata-facets-facetinformation.png)

#### Hierarchical content
New behaviour since [April 20, 2023 Release .Stat Suite JS unicorn](/dotstatsuite-documentation/changelog/#april-20-2023).

In case of a hierarchy in the items, they are shown as 'a tree', which means that the filter will display all the items with indentations according to the item level in the tree. A blue arrow next to an item indicates that this item is a parent of child item(s). Clicking this blue arrow switches its up/down direction and the related child items will respectively be hidden or become visible. By default, the tree is fully expanded so that all the items of all tree levels are visible (through scrolling if needed). 

![Hierarchical contents](/dotstatsuite-documentation/images/de-viewingdata-filters-hierarchical-arrow-behaviour.png)

#### Data availability
In hierarchical search facets, parent values, for which any of the resulting dataflows do not have data, are not selectable and are marked in light grey colour. This doesn't impact the navigation and selection features of their child items.

![Greyed parent item without data](/dotstatsuite-documentation/images/de-viewingdata-filters-hierarchicalcontent.png) 

#### Local search 
The local search (spotlight feature) helps to find specific items.

Typing some characters in the local search box dynamically reduces the displayed items to the ones containing the given set of characters. If the local search term has no hit in any item then the list is empty. 

![Local search example](/dotstatsuite-documentation/images/de-filters3.png)

Since [April 20, 2023 Release .Stat Suite JS unicorn](/dotstatsuite-documentation/changelog/#april-20-2023), whenever the content of the local search box is changed, the items in hierarchical lists are fully expanded. When a local search terms has a hit in a child item, then all its above parent items will automatically be displayed, even if the search term was not found in these parent items. 

![Local search example with hierarchy](/dotstatsuite-documentation/images/de-filters4.png)

---

### Facet items ordered by explicit ORDER annotation
> Released in [July 8, 2021 Release .Stat Suite JS 9.0.0](/dotstatsuite-documentation/changelog/#july-8-2021)

Facet items displayed on the home and search result pages can be ordered according to the **explicit order** of the codes and categories using the *SDMX* **"ORDER" annotation** of data type integer, and according to the current locale: see more information **[here](/dotstatsuite-documentation/using-dlm/manage-data/custom-data-view/implicit-explicit-order/)** about creating an ItemScheme with localised order(s).

In case an explicit "ORDER" annotation is provided for an item or items of a codelist returned as a facet of the DE, then this explicit order is applied to the home and search result facets.

**Localised and non-localised** order annotation types are both supported and applied, in the sense that the localised order value is applied first when provided, otherwise it is the non-localised order value if provided. 

In case of hierarchical facets, hierarchy always prevails over the explicit "ORDER" annotation, and explicit order is then applied in each level of the hierarchy independently from the other levels.

In case any two or more facet items have the same "ORDER" value, then these items are ordered 'naturally' based on hits. Note that the same "ORDER" values for different facet items are likely when several codelists are merged into the same facet (when the concept name is the same). Logically, the facet items are first ordered by "ORDER" and then the items with the same "ORDER" value are ordered by hits.

In case an explicit "ORDER" annotation is not provided for an item, then this item is ordered as "0" value, and thus displayed first in the facet, before the ordered items.

**Example of an item of a codleisty with a localised "ORDER" value:**

```xml
  <structure:Code id="Y5-14">
    <common:Annotations>
      <common:Annotation>
        <common:AnnotationTitle>55</common:AnnotationTitle>
        <common:AnnotationType>ORDER</common:AnnotationType>
        <common:AnnotationText xml:lang="en">55</common:AnnotationText>
        <common:AnnotationText xml:lang="es">80</common:AnnotationText>
        <common:AnnotationText xml:lang="fr">85</common:AnnotationText>
      </common:Annotation>
    </common:Annotations>
    <common:Name xml:lang="en">5 to 14</common:Name>
    <common:Name xml:lang="es">5 a 14</common:Name>
    <common:Name xml:lang="fr">5 à 14</common:Name>
    <structure:Parent>
      <Ref id="_T"/>
    </structure:Parent>
  </structure:Code>
```  

**Example of a conbination of facets items with the same "ORDER" values, and combined with search hits:**

```txt
>* Aaa, Explicit order=5, Hit: 14
>* Bbb, Explicit order=4, Hit: 4
>* Ccc, Explicit order=3, Hit: 9
>* Ddd, Explicit order=3, Hit: 8
>* Eee, Explicit order=2, Hit: 11
>* Fff, Hit: 12
>* Ggg, Explicit order=1, Hit: 10
>* Hhh, Hit: 20  
>* Iii, Explicit order=1, Hit: 15
>* Jjj, Hit: 4
>
>Display order:
>* Hhh, Assumed order=0, Hit: 20
>* Fff, Assumed order=0, Hit: 12
>* Jjj, Assumed order=0, Hit: 4
>* Iii, Explicit order=1, Hit: 15
>* Ggg, Explicit order=1, Hit: 10
>* Eee, Explicit order=2, Hit: 11
>* Ccc, Explicit order=3, Hit: 9
>* Ddd, Explicit order=3, Hit: 8
>* Bbb, Explicit order=4, Hit: 4
>* Aaa, Explicit order=5, Hit: 14
```

---

### Applied filters
The "Applied filters" panel in search results displays all current selected items, per facet.  
The top right *green* numbering feature counts the total number of selected items for all facets.  
Applied filters are ranked and displayed by facet.  
Users can unselected:
* one single item by clicking on the `x` next to the item label, or
* all items for a given filter by clicking on the `x` next to the filter label, or finally 
* all selections by clicking on `Clear all filters`. When all filters are unselected, then the user is brought back to the home page.

To ease the readibility of the applied filters when 15 or more items are selected in a facet, the display of the individual selected items is replaced by a number, the number of selected items of this facet. Here below an example in responsive mode (mobile phone view):

![Applied filters responsive](/dotstatsuite-documentation/images/de-searchingdata-facets-searchresultpage-responsive.png)


---

### Pinned facets
Facets displayed with a dot [**.**] after their localised name are called **pinned facets**. Those facets are displayed, when available, always at the first top position(s) in the facet list.  
In addition, a help [**?**] tooltip is shown right next to the Filters header title, which displays the following information (localised): "*Filters marked with **.** are, when available, always listed first.*"

![Pinned facets](/dotstatsuite-documentation/images/de-pinned-facets.png)

The list of **pinned facets** is to be configured per DE tenant. For more information see [here](/dotstatsuite-documentation/configurations/de-configuration/#search-results-page-pinned-facets).