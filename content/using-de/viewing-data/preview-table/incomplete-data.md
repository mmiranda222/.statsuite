---
title: "Incomplete data table"
subtitle: 
comments: false
weight: 2700

---

>Released in [February 28, 2020 Release .Stat Suite JS 4.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#february-28-2020)  

Users are informed when data in the table preview or chart views are incomplete.  
Data in table or chart views can be incomplete when the current data selections in the filters are too big to respect the maximum number of observations (see related Data Explorer configuration [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#maximum-number-of-observations-in-tables-and-charts)) or to fit into the maximum table size (see related Data Explorer configuration [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#maximum-number-of-cells-in-table)).  

In these cases where the data returned in the visualisation page are incomplete, and an orange text in the table/chart's subtitle indicates that `"This preview displays [xxxx] data points. Your selection is above this limit resulting in an incomplete table. All selected data points can still be downloaded in tabular text (CSV)."`.  

![DE incomplete data message](/dotstatsuite-documentation/images/de-incomplete-data.png)  

Also the Excel download will contain only the incomplete data.   

Whenever the selection using the filters is sufficiently reduced in order to stay below the above limits, the alert text disappears again.  
