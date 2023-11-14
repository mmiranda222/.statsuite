---
title: "Delete data or referential metadata"
subtitle: 
comments: false
weight: 400
---

> *Version history:*  
> Support full delete actions for data and referential metadata with [July 4, 2023 Release .Stat Suite .NET 'dragonfruit'](/dotstatsuite-documentation/changelog/#july-4-2023)
> Delete values since [September 22, 2022 Release .Stat Suite .NET 'blueberry'](/dotstatsuite-documentation/changelog/#september-22-2022)

**Observation, attribute and referential metadata attribute values** can be deleted through using the ordinary file upload or copy features and with specific upload actions and values as described more in details in
- [“Delete data with an SDMX-CSV or SDMX-ML (xml) file”](/dotstatsuite-documentation/using-api/data/upload-data-sdmx-file/#details-of-the-delete-action)
- [Delete referential metadata with an SDMX-CSV file”](/dotstatsuite-documentation/using-api/ref-metadata/upload-referential-metadata/#details-of-the-delete-action)

It is also possible to "transfer" (copy) the deletion of data and reference metadata from one data space to another. The following scenario does thus work:  
1) User loads data and reference metadata into a Space A  
2) User transfers all data and reference metadata from Space A to Space B (without filter)  
3) User deletes data and/or reference metadata in Space A  
4) User transfers all data and reference metadata from Space A to Space B (without filter, optionally using updatedAfter for higher performance)  

--> This will delete also all those data and/or reference metadata in Space B that have been previously deleted in Space A.

***Nulling* values:**  
The SDMX-CSV version 1.0 messages will now systematically use the `M`(erge) action, which changes its upload behaviour: Empty measure or attribute column cells will not lead anymore to deleting (nulling) the related values in the database. Observation, attribute and referential metadata attribute values can be set to `null` only by using the `R`(eplace) action with the SDMX-CSV version 2.0 or SDMX-ML file formats by leaving those values empty. This method does not allow completely deleting observations and reference metadata attachments. 

Alternatively, individual observation, attribute and referential metadata attribute values can be nulled using the `D`(elete) action with the SDMX-CSV version 2.0 or SDMX-ML file formats, see below. When all related measure and attribute values for the given (partial) key have been nulled, e.g., through successive `D`(elete) actions, then the related observation or reference metadata attachment is completely deleted.

***Intentionally missing* values:**  
After a special data structure configuration, a specific syntax can be used for intentionally missing values of numerical types float and double ()`NaN`) and of all textual types (`#N/A`). For more information see [Intentionally missing values](/dotstatsuite-documentation/using-api/data/upload-data-sdmx-file/#intentionally-missing-values).

***Deleting* values:**  
Full observations (with their measure and obs-level attribute values) as well as individual observation or attribute values can be deleted with the `D`(elete) action with SDMX-CSV version 2.0 or SDMX-ML file formats. For more information see [Delete data with an SDMX-CSV or SDMX-ML (xml) file](/dotstatsuite-documentation/using-api/data/upload-data-sdmx-file/#details-of-the-delete-action).

Referential metadata attributes at partial coordinates as well as individual referential metadata attribute values can be deleted with the `D`(elete) action with the SDMX-CSV version 2.0 file format. For more information see [Delete referential metadata with an SDMX-CSV file](/dotstatsuite-documentation/using-api/ref-metadata/upload-referential-metadata/#details-of-the-delete-action).