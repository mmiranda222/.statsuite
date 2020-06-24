---
title: "Preview data"
subtitle: 
comments: false
weight: 320

---

It is possible to **preview the structure and data of a dataflow** using the Data Explorer's table and chart representations. For that, the **eye icon** in the list of dataflows opens the dataflow preview in a new tab of the browser.    

![DLM preview](/images/dlm-preview1.png)

**Note** that if related observations have not yet been uploaded, then the preview will only display the filled dimension filters but no data.  

Please refer to the full functional specifications of the data table and chart views in the [**Viewing data**](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/) section of the documentation.

#### Data availability
When called from the DLM, the DE shows an additional filter for **Data availability**, which is (through the inbuilt addition of the `dataAvailability=on` URL parameter) by default switched 'On'. 

When this filter is switched 'On' then the dimension filters only show:
- values for which data exist or 
- hierarchical parent values for which their children values have data.

This will apply the data availability information on the other dimension filters, as is done in the DE by default when the `dataAvailability` URL parameter is not used. For that, the DE takes the currently valid Actual Content Constraint of the dataflow, if available, into account.

![DLM preview data avaibility on](/images/DE-data-availability-filter-on.png)

By switching the “Data availability” to 'Off', or by setting the `dataAvailability=off`parameter in the URL, data availability information is not applied. All valid dimension values will be shown in this case.

![DLM preview data avaibility off](/images/DE-data-availability-filter-off.png)

When the user switches the filter check box, the `dataAvailability` URL parameter automatically updates accordingly.
