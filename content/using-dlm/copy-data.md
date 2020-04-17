---
title: "Copy data"
subtitle: 
comments: false
weight: 400

---

When the user wants to make a copy of data of a dataflow from one space to another for the same dataflow (same Agency/Id/Version), then the user selects the option "transfer data" from the hamburger menu of the corresponding dataflow:  

![copy data](/using-dlm/files/dlm-copy-data-1.png)

This action opens a popup window allowing to select the destination space.  
The popup proposes two action buttons:
* "Transfer" launching the transfer with the current option
* "Cancel" cancelling the action.

![copy data](/using-dlm/files/dlm-copy-data-2.png)

### Partial data transfer
There is an option called "Partial data query" in the popup window allowing the user to customise the data copy request with *SDMX* query parameters.  
When selected, it shows an editable *SDMX* query field.  
At first usage or whenever the user completely empties the field, a default example of a query is displayed: `all/?startPeriod=2013endPeriod=2018`.

When several dataflows are selected from the list as inputs for transfer, then the partial data query option is not available.

![copy data](/using-dlm/files/dlm-copy-data-3.png)
