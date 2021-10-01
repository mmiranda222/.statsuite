---
title: "Parameterisable shared views"
subtitle:
comments: false
weight: 3650

---

> Released in [July 8, 2021 Release .Stat Suite JS 9.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#july-8-2021)

The .Stat DE Viewer for shared views of table or chart allows specifying one or more filter selections in the URL.

**Use case:**  
Today, I share a data view from the DE with a selection of 'Australia' country. Once the shared view is generated and activated, I can display it in the viewer (web browser page) and change the data query (URL) to request the display of 'Belgium' data instead of the original share selection (e.g. using a new URL parameter `&dq=BE....A`).  
Furthermore, I can then easily create a dashboard with one or more shared data tables/charts of a fixed list of indicators and fixed layout, but with a selector for country (and/or other dimensions).

The supported **filter selection parameters** are:
- data query (e.g. `&dq=BE....A`)
- time period (e.g. `&pd=2016%2C2019`)
- lastNObservations (e.g. `&lo=1`)
- locale (e.g. `&lc=en`)

**Limitations:**  
This feature **only applies to shared views from the "Latest available data for the period defined" share option**, not the "Snapshot of data for the period defined".  
This feature **only concerns the filter selections**, and not the layout of the representations. In other terms, the shared view URL only allows injecting a different filter selection. As today in the DE visualisation page, the data visualisation layout will automatically adapt to the modified data query according to the business rules for layouts. The result layout of the shared view is thus not static and may thus vary depending on the filter selection.

If a combination of selections added to the URL doesn't match with the data query, or if a parameter added to the URL is somehow wrong or in confilct with the supported parameters, then the Viewer will return an error 'No data': `404 Not Found`.  
If a combination of selections added to the URL is conflicting with the business rules of the visualisation layout, then the Viewer will return an error 'layout.incompatible'.


**Example:**  
An original shared view (generated form the DE with option *"Latest available data for the period defined"*).

![share param](/dotstatsuite-documentation/images/de-share-param1.png)

The same shared view with adidtional filter selecitons added to the URL for 'Subject', 'Country', 'Frequency', and 'Language'.

![share param](/dotstatsuite-documentation/images/de-share-param2.png)

