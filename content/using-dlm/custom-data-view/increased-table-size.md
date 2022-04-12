---
title: "Increased table size"
subtitle: 
comments: false
weight: 337
---

> Released in [April 11, 2022 Release .Stat Suite JS 14.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-11-2022)

Per dataflow, you can decide to increase the maximum preview table size above the DE default maximum limits for the number of observations retrieved from the SDMX web service (see config specs [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#maximum-number-of-observations-in-tables-and-charts)) and for the number of table cells (see config specs [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#maximum-number-of-cells-in-table)).  

#### Syntax and specifications
To overwrite the default DE limits for the number of observations and for the number of table cells add an SDMX `MAX_TABLE_DATA` annotation in the dataflow definition with the following syntax:
```
  "annotations": [{
    "type": "MAX_TABLE_DATA",
    "title": "15000"
 }],
```

The number specified in the annotation's `title` property is used:
- as such for the maximum number of observations through a 0-based range request: `[0, MAX_TABLE_DATA - 1]`   
- with a factor of 1.2 for the maximum number of table cells

In the above syntax example, the maximum number of observations retrieved will be 15,000, and the maximum number of table cells will be 18,000.

Because the purpose of the default DE limits is to protect the .Stat Data Explorer application from freezing in the client's web browser due to too large selections, when the default limits have been overwritten (increased) for a specific dataflow, then the (loading) spinner changes the colour from blue to orange, and a special warning text is displayed about the potential loss of performance: *"exceptionally, this page may display a larger table and might become slow or unstable"*.

![Example of EXT_RESOURCE annotation download](/dotstatsuite-documentation/images/MAX_TABLE_DATA.png)
