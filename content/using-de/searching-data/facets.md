---
title: "Facets"
subtitle: 
comments: false
weight: 1800

---

#### Table of Content
- [What information is presented as facets](#what-information-is-presented-as-facets)
- [How facets are used](#how-facets-are-used)

### What information is presented as facets
**Data source**: If configured so (relates to *installation/configuration*), one facet is returned for the **data source** (SDMX endpoint used to retrieve dataflow information).  

**One facet per localised CategoryScheme**: The localised CategoryScheme(s) in which the dataflow is categorised.  
**Note** that each dataflow can be attached to one or more than one category.  
The CategoryScheme can have a simple hierarchy (each child element can have no or only one parent element defined) of an undefined depth (usually not more than 3 or 4), e.g.:

![de facet hierarchy](/images/de-facet-1.png)

**One facet per concept that is used to define dataflow dimensions**: Concepts are distinguished only by their localised concept names (per language), not by their IDs.  
**Note** that all Concepts having the same localised name (independently from their ID) are grouped into one single facet.  

**Special concept facet for Frequency**.  
A dataflow can contain data for one or more frequencies that are normally defined through a frequency dimension. The specificity is that some dataflows with data of only one frequency might not have a frequency dimension, but it is also possible to find those dataflows through the frequency facet.  
In order to determine the frequency of data in such dataflows and add a relevant facet value for these, the search service do an additional unfiltered data query for one observation value.  
**Note** that if a dataflow has no time dimension, then it will also not have a value for the frequency facet.  

**Special concept facet for Time period**  
Dataflows do not have a codelist for the time period dimension (time dimension). Therefore, only the actual content constraint can be used to determine the available time periods and thus the values of the time period facet.  
For practical reasons, the search only allows a filter by **ANNUAL** time periods. All non-annual time periods are converted to annual time period facet values. The time period facet is built as a range facet, because the facet filtering is done through a start year and an end year.  
**Note** that if a dataflow has no time dimension, then it will also not have values for the time period facet.  

### How facets are used
#### Home page facets
The localised .Stat DE home page presents a combination of a free text search box and a list of any few facets specifically defined in the [configuration](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/) (in the currently chosen language) of the faceted search service.  

![de homepage facet](/images/de-facet-2.png)

Each facet, when opened, presents a selectable root-level of facet values together with a non-selectable second-level facet values. The root-level and second-level facet values represent the available values for all dataflows currently being indexed.  

The free text search and the navigation through pre-defined facets are exclusive and result systematically in a new search discarding any previously made search selections.

#### Facets on the search result page
The facets shown in the search result page are fully dependent on the current search context.  
Common facet dimensions can be automatically removed (hidden) from the saerch result page when specifically defined in the [configuration](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/).

![de facet result](/images/de-facet-3.png)

#### Facet types
All facets are **multi-selection** facets (an existing facet value selection does not prevent selecting other still available facet values) **except** for the **Time Period** facet. The Time Period facet is a range selection facet that shows a start year and end year independently from the currently selected frequency.  

![de facet types](/images/de-facet-4.png)

#### Facet information
The facet header contains the number of facet values available, and the number of currently selected facets (green numbers). The facet values show a number indicating the number of corresponding search results. Parent values contain the number of results valid for themselves and for all of their children.  

![de facet information](/images/de-facet-5.png)

