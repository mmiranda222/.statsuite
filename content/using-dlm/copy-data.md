---
title: "Copy data"
subtitle: 
comments: false
weight: 400

---

When the user wants to make a copy of data from one dataspace (or external source) to another for the same dataflow (same Agency/Id/Version), the user selects the option "transfer data" from the hamburger menu of the corresponding dataflow:  

![copy data](/dotstatsuite-documentation/images/dlm-copy-data-1.png)

This action opens a popup window allowing to select the destination space.  
The popup proposes two action buttons:
* "Transfer" launching the transfer with the current option
* "Cancel" cancelling the action.
  
![copy data](/dotstatsuite-documentation/images/dlm-copy-data-2.png)

### Partial data transfer
There is an option called "Partial data query" in the popup window allowing the user to customise the data copy request with *SDMX* query parameters.  
When selected, it shows an editable *SDMX* query field.  
At first usage or whenever the user completely empties the field, a default example of a query is displayed: `all/?startPeriod=2013endPeriod=2018`.

![copy data](/dotstatsuite-documentation/images/dlm-copy-data-3.png)

When several dataflows are selected from the list as inputs for transfer, then the partial data query option is not available.  

![copy data](/dotstatsuite-documentation/images/dlm-copy-data-4.png)  

---

### Visuals and messages
Once the data transfer is launched, the user is made aware by the highlighted transfer icon ![dlm transfer icon](/dotstatsuite-documentation/images/dlm-copy-data-structures-icon.png):
* green for a successful transfer,   
* red for an unsuccessful transfer.

Hovering the highlighted icon will display the acknowledgment message about the data transfer being processed, along with its request ID.

![successful copy data ](/dotstatsuite-documentation/images/dlm-copy-data-5.png)  
  
An email is sent to the end-user once the data request is completed. See [Email notifications for data management](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/message-through-mail/) for more details.
