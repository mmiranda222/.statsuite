---
title: "Incomplete data table"
subtitle: 
comments: false
weight: 2700

---

>Released in [February 28, 2020 Release .Stat Suite JS 4.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#february-28-2020)  

Users are informed when data, in table or chart views, are truncated.  
Data in table or chart views can be truncated for performance reasons and due to the configuration of the Data Explorer instance: see [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#maximum-number-of-observation-values).  

In these cases where the data returned in the visualisation page are incomplete, an orange text in the table/chart's subtitle indicates that `"This preview displays [xxxx] data points..."`. All data are still available for download in .csv file.  
If the user reduces for instance his filter selection and thus the query returns less data than the mentionned limit, then the text dispapears.  

![DE incomplete data message](/images/de-incomplete-data.png)
