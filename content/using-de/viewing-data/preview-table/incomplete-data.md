---
title: "Incomplete data table"
subtitle: 
comments: false
weight: 2700

---

>*Version history:*  
> Modified since [August 3, 2022 Release .Stat Suite JS quark](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#august-3-2022)
> Extended with the total number of available observations and table cells in [December 14, 2021 Release .Stat Suite JS 11.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#december-14-2021)  
> Improved in [April 1, 2021 Release .Stat Suite JS 7.2.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-1-2021)  
> Introduced in [February 28, 2020 Release .Stat Suite JS 4.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#february-28-2020)  

Users are informed with a warning message when data in the table preview or chart views are incomplete because 
- the number of observations that corresponds to the current selection or
- the required number of cells to display the table with the limited number of observations 

exceeds the given limit.

This limit is configured as documented [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#maximum-number-of-observations-in-tables-and-charts-and-of-cells-in-tables).  

Whenever the number of observations that corresponds to the current selection exceeds the defined limit the following warning (example in English) is displayed:

`"Your current selection (X data points) is above the defined limit (Y) resulting in an incomplete table. All selected data points can still be downloaded in tabular text (CSV)."`

X represents the number of observations and Y represents the limit.

If instead the required number of cells to display the table with the limited number of observations exceeds the defined limit then the following warning (example in English) is displayed:

`"Your current selection (X table cells) is above the defined limit (Y) resulting in an incomplete table. All selected data points can still be downloaded in tabular text (CSV)."`

X represents the number of required table cells and Y represents the limit.

Example:  

![DE incomplete data message](/dotstatsuite-documentation/images/de-incomplete-data.png)  

**Note** that the Excel download file will also contain the incomplete data.   

The filter selection may be changed to reduce the related number of observations and to stay below the limit. In this case the warning message disappears.
