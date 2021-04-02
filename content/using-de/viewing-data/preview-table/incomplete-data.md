---
title: "Incomplete data table"
subtitle: 
comments: false
weight: 2700

---

>Released in [February 28, 2020 Release .Stat Suite JS 4.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#february-28-2020) and enhanced with [data-explorer#403](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/403) in [April 1, 2021 Release .Stat Suite JS 7.2.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-1-2021)

Users are informed when data in the table preview or chart views are incomplete.  
Data in table or chart views can be incomplete when the current data selections in the filters are too big to respect the maximum number of observations (see related Data Explorer configuration [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#maximum-number-of-observations-in-tables-and-charts)) or (for tables only) to fit into the maximum table size (see related Data Explorer configuration [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#maximum-number-of-cells-in-table)).  

In cases where one of these two limits is reached and the data returned in the visualisation page is incomplete, an orange text is displayed below the subtitle: `"This preview displays [X,XXX] data points and [X,XXX] table cells. Your selection is above these limits resulting in an incomplete table. All selected data points can still be downloaded in tabular text (CSV)."`

![DE incomplete data message](/dotstatsuite-documentation/images/de-incomplete-data.png)  

Note that the Excel download file will also contain the incomplete data only.   

Whenever the selection using the filters is sufficiently reduced in order to stay below the above limits, then the warning text disappears from the subtitle.
