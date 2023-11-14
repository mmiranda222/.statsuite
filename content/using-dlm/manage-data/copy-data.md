
---
title: "Copy data"
subtitle: 
comments: false
weight: 530
keywords: [
  'Transfer data option', '#transfer-data-option',
  'Partial data transfer', '#partial-data-transfer',
  'Data validations', '#data-validations',
  'Point in Time release', '#point-in-time-release',
  'Notifications', '#notifications',
]

---

#### Table of Content
- [Transfer data option](#transfer-data-option)
- [Partial data transfer](#partial-data-transfer)
- [Content type](#content-type)
- [Data validations](#data-validations)
- [Point in Time release](#point-in-time-release)
- [Notifications](#notifications)

---

### Transfer data option
When the user wants to make a copy of data from one dataspace (or external source) to another for the same dataflow (same Agency/Id/Version), the user selects the option "transfer data" from the hamburger menu of the corresponding dataflow:  

![copy data](/dotstatsuite-documentation/images/dlm-copy-data-1.png)

This action opens a popup window allowing to select the destination space.  
The popup proposes two action buttons:
* "Transfer" launching the transfer with the current option
* "Cancel" cancelling the action.
  
![copy data](/dotstatsuite-documentation/images/dlm-copy-data-2.png)

---

### Partial data transfer
There is an option called "Partial data query" in the popup window allowing the user to customise the data copy request with *SDMX* query parameters.  
When selected, it shows an editable *SDMX* query field.  
At first usage or whenever the user completely empties the field, a default example of a query is displayed: `all/?startPeriod=2013endPeriod=2018`.

![copy data](/dotstatsuite-documentation/images/dlm-copy-data-3.png)

When copying data between data spaces make intensive usage of the `updatedAfter=[date-time]` parameter with a (non-URL-encoded) date-time value, e.g., `all/?updatedAfter=2023-11-30T12:00:00+01:00`. Only those observations (or reference metadata) will be transferred that were inserted, updated or deleted in the source data space since that point in time. This will significantly reduce the amount of information to be transferred.

In case several dataflows were selected in the source data space, then the partial data query option is not available.  

![copy data](/dotstatsuite-documentation/images/dlm-copy-data-4.png)  

---

### Content type
> Released with [April 11, 2022 .Stat Suite JS 14.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-11-2022)

When requesting to initiate a transfer between data spaces, it is possible to either transfer data only, referential metadata only or both. Therefore, one of the following options can be selected:  
- Both data and referential metadata (default)
- Data only
- Referential metadata only

![dlm copy data validation ](/dotstatsuite-documentation/images/dlm-copydata-content-type1.png)

---

### Data validations
> *Version history:*  
> Data validations option always visible and default selection made configurable since [December 5, 2022 Release .Stat Suite JS spin](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#december-5-2022)  
> Released with [October 5, 2021 .Stat Suite JS 10.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#october-5-2021)

Advanced options allow the user to choose the validation process type for data copy. The user is given with three options:  
a) **Favour speed with basic validations**: basic validations are performed upon data copy for *SDMX* compliance, allowed/complete dimensions values, or representation requirements. It provides simplified error explanations.

b) **Apply advanced validations**: advanced validations are performed upon data copy for duplicated coordinates, consistent non-observational values, or mandatory attribute values. It provides detailed error explanations.

c) **Only run advanced validations without changing data**: this option will only perform an "analysis" of the data compliancy without updating the target, and a report by email will be sent with the result.

The default selection, whether basic or advanced validations option, is configurable by DLM instance: see how to [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/dlm-configuration/#default-data-validations-option).

![dlm copy data validation ](/dotstatsuite-documentation/images/dlm-copydata-validation1.png)

In summary, basic validation allows to:
- report multiple values for group and series attributes;
- report null values to mandatory attributes;
- when there are duplicates in the import, a single error message (about duplicates) will be included in the report.
Full validation allows to:
- validate that the outcome of an import will result in consistency of values for group and series attributes;
- validate that the outcome of an import will result in all mandatory attributes to have a value;
- when there are duplicates in the import, every duplicate issue will be included in the report.

The full details of the validation process methods can be found [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/api-main-features/#data-validation-process). The documentation is also available from the DLM UI question mark icon.

---

### Point in Time release
> Released with [October 5, 2021 .Stat Suite JS 10.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#october-5-2021)

Advanced transfer options allow the user to use the **"Embargo (point-in-time) release management"** features.  
Using a **Point-in-Time (PIT)** date, the copied data can be kept under embargo in parallel to the previously available data until the embargo date is reached and the embargo data fully replace the previously available data. The following scenarios are supported:
- Source version –> Target version
  - Live data –> Live data
  - Live data –> Embargo data
  - Embargo data –> Live data
  - Embargo data –> Embargo data  
By default, the "Live data –> Live data" scenario is selected.

![dlm copy data pit1](/dotstatsuite-documentation/images/dlm-copydata-pit1.png)

When the users select "Embargo" as the Target version, then the "Release date-time" date picker is activated and the user can define a date and time in the future. Note that behind the scene, the users' timezone is automatically taken into account.  
If the user doesn't (yet) define a release date and time, then it is left as *undetermined* and the user can subsequently update/copy new data targetting the Embargo version.

Note also that the release data and the release date-time can be set or changed subsequently.  
Also note that, if there is an existing Embargo of data for a dataflow/DSD, then it is not possible to update the Live version of the data (due to potential conflict when the Embargo version is copied to the Live one).

![dlm copy data pit2](/dotstatsuite-documentation/images/dlm-copydata-pit2.png)

The optional feature "Allow for later emergency restoration of the current live data" allows to keep a restoration copy of the data in the Target dataspace. Read more about [how to restore Live data](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/embargo-management/#rollback-and-restoration).

*All "point in time" release management (supported by the data API) is fully described in [this section](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/embargo-management).*

---

### Notifications
Once the data transfer is launched, the user is made aware by the highlighted transfer icon ![dlm transfer icon](/dotstatsuite-documentation/images/dlm-copy-data-structures-icon.png):
* green for a successful transfer,   
* red for an unsuccessful transfer.

Hovering the highlighted icon will display the acknowledgment message about the data transfer being processed, along with its request ID.

![successful copy data ](/dotstatsuite-documentation/images/dlm-copy-data-5.png)  
  
An email is sent to the end-user once the data request is completed. See [Email notifications for data management](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/message-through-mail/) for more details.
