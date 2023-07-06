---
title: "Delete data or referential metadata"
subtitle: 
comments: false
weight: 400
---

> *Version history:*  
> Support full delete actions for data and referential metadata with [July 4, 2023 Release .Stat Suite .NET 'dragonfruit'](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#july-4-2023)
> Delete values since [September 22, 2022 Release .Stat Suite .NET 'blueberry'](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#september-22-2022)

**Observation, attribute and referential metadata attribute values** can be deleted through using the ordinary file upload or copy features and with specific upload actions and values as described more in details in
- [“Delete data with an SDMX-CSV or SDMX-ML (xml) file”](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/data/upload-data-sdmx-file/#details-of-the-delete-action)
- [Delete referential metadata with an SDMX-CSV file”](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/ref-metadata/upload-referential-metadata/#details-of-the-delete-action)

It is aslo possible to "transfer" (copy) the deletion of data from one data space to another.
The following scenario does thus not work:
1) User loads data into a Space A
2) User transfer data to another space (Space B)
3) User deletes data in Space A
4) User transfers data from Space A to Space B (e.g. without filter)  
--> Deleted data is not present in Space A, and is also deleted in Space B

***Nulling* values:**  
Observation, attribute and referential metadata attribute values can be set to `null` through specifying **empty** values in import files. This feature is supported only with the SDMX-CSV version 1.0 or Excel file formats or by using the `R`(eplace) action with the SDMX-CSV version 2.0 or SDMX-ML file formats. This method does not allow completely deleting values unless all values for a specific (partial) key have been nulled.

***Deleting* values:**  
Full observations (with their measure and obs-level attribute values) or (referential metadata) attributes at partial coordinates can be deleted with the `D`(elete) action in import files. This feature is supported only with the SDMX-CSV version 2.0 or SDMX-ML file formats.

For more information see:  
- [“Delete data with an SDMX-CSV or SDMX-ML (xml) file”](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/data/upload-data-sdmx-file/#details-of-the-delete-action)
- [Delete referential metadata with an SDMX-CSV file”](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/ref-metadata/upload-referential-metadata/#details-of-the-delete-action)