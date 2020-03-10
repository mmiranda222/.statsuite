---
title: "Delete data"
subtitle: 
comments: false
weight: 310

---

Data can be deleted today only through specifying **empty observations in import files** (SDMX-ML, SDMX-CSV, Excel).

--------------------------------
**Current limitation**:   
It is not possible yet to "transfer" (copy) the deletion of data from one data space to another.
The following scenario does thus not work:
1) User loads data into a Space A
2) User transfer data to another space (Space B)
3) User deletes data in Space A by loading empty observations
4) User transfers data from Space A to Space B (e.g. without filter)  
--> Deleted data is not present in Space A, but still is in Space B

**Work-around**:  
Empty observations should be loaded through direct imports into the required data space. 

--------------------------------


**Future outlook**:  
It is planned to replace the current feature (except for Excel imports) by an SDMX-compatible approach, which means that observations are to be deleted through specific SDMX-ML import files using an SDMX Dataset with the action "Delete", and through specific (filtered or unfiltered) SDMX REST data queries using the HTTP DELETE verb. The "transfer" (copy) of deleted data from one space to another will be supported by the SDMX REST data query features "includeHistory" (and "lastUpdated") that will be implemented. Approximate delivery: 2020.