---
title: "Overview"
subtitle: 
comments: false
weight: 2300
keywords: [
  'Role of the overview', '#role-of-the-overview',
  'Overview content', '#overview-content',
  'Interactions', '#interactions',
]
---

> *Version history:*  
> List the related dataflows - same referenced DSD - since [July 20, 2023 Release .Stat Suite JS Virtual](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#july-20-2023)  
> Overview page is included in the Excel download and enhanced with an exception on displayed content with [September 15, 2022 Release .Stat Suite JS radio](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#september-15-2022)  
> Introduced in [April 11, 2022 Release .Stat Suite JS 14.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-11-2022)

#### Table of content
- [Role of the overview](#role-of-the-overview)
- [Overview content](#overview-content)
- [Interactions](#interactions)

---

### Role of the overview
The **overview** tab of the visualisaiton page provides a summary of complementary information for the data provided in table and chart views. By default, it is the landing view of the visualisation page, unless:  
- a different default behaviour has been defined in the DE configuration, see [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#visualisation-default-landing-tab)
- or a different [`vw` parameter](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/general-layout/#url-parameters) is used in a direct visualisation URL.

![DE overview tab](/dotstatsuite-documentation/images/de-viz-overview.png)

---

### Overview content
The overview provides the following localised pieces of information related to a given dataflow, which should be independent from the current data selection:

- the dataflow **name**
- the dataflow **description**
- the list of **single-fixed dimension names** with the associated value (in the same order as defined in the *SDMX* data structure definition), except in case the single-fixed dimension value is always to be hidden (`_T`, `_Z`, `_L`) or is listed in the `NOT_DISPLAYED` *SDMX* annotation of the code, DSD or dataflow (see the related [specification](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/custom-data-view/not-displayed/)).
- the list of **other dimension names** without listing the dimension value (in the same order as defined in the *SDMX* data structure definition)
- the list of **names of attributes** defined at the dataflow level with the associated value (in the same order as defined in the *SDMX* data structure definition)
- when a listed dimension or attribute has a description, then the corresponding text is displayed in a bubble tooltip.
- the list of **categories** in which the dataflow is categorised and which are configured as homepage facet with the associated category names and its (optional) parent hierarchy, e.g. *'Topic: Industry > Tourism'*
- the **data source** information (if configured as homepage facet), e.g. *'Data source: UNSD-Hub'*
- the **total number of available data points** (obtained from the Actual or Available content constraints)
- the **last updated** date (obtained from the Actual content constraint validity dates)
- the **related files** with a list of hyperlinks to (optional) external resources (as listed in the dataflow's EXTERNAL_RESOURCE annotations) and similar to the 'download' option.
- the alphabetically ordered list of localised names (current user locale) of all other dataflows that share the same DSD with the current dataflow, and that are only indexed within the same instance of the Data Explorer. The list is displayed under the title **'You might also be interested by this data'** and each link to a single corresponding data visualisation page (in new web-browser tab).

![DE overview tab with related files](/dotstatsuite-documentation/images/de-overview-related-files.png)

---

### Interactions
When displaying the overview tab:
- Making a change in a filter does not have any effect on the Overview tab or its content;
- The 'Labels' option is appropriately applied to the information in the overview, depending on the type of information to return: names, identifiers, or both;
- 'Customise' and 'Share' options are hidden.

Since [September 15, 2022 Release .Stat Suite JS radio](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#september-15-2022), the overview page content is downloaded with the table view in the [Excel download file](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/toolbar/#table-in-excel).
