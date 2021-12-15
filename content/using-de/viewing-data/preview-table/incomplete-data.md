---
title: "Incomplete data table"
subtitle: 
comments: false
weight: 2700

---

>*Version history:*  
> Extended with the total number of available observations and table cells in [December 14, 2021 Release .Stat Suite JS 11.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#december-14-2021)  
> Improved in [April 1, 2021 Release .Stat Suite JS 7.2.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-1-2021)  
> Introduced in [February 28, 2020 Release .Stat Suite JS 4.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#february-28-2020)  

Users are informed when data in the table preview or chart views are incomplete.  
Data in table or chart views can be incomplete when the current data selection from the filters is too big to respect the maximum number of observations (see related Data Explorer configuration [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#maximum-number-of-observations-in-tables-and-charts)) or (for tables only) to fit into the maximum table size (see related Data Explorer configuration [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#maximum-number-of-cells-in-table)).  

In cases when one of these two limits is reached and the data returned in the visualisation page are incomplete, then an informative message is displayed behind a tooltip warning icon next to the data view title. It includes the **total number of observations available based on the current selection**, and the **current number of table cells**.  
Whenever the selection using the filters is sufficiently reduced in order to stay below the above limits, then the warning icon disappears.

Example of the default message in English:  
`"You current selection (N data points in N table cells) is above the limits for viewing data (maximum [X,XXX] data points or [X,XXX] table cells) resulting in an incomplete table. All selected data points can still be downloaded in tabular text (CSV)."`

![DE incomplete data message](/dotstatsuite-documentation/images/de-incomplete-data.png)  

**Note** that the Excel download file will also contain the incomplete data.   
