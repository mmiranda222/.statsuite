---
title: "Upload data"
subtitle: 
comments: false
weight: 270

---

Data can be uploaded using the main menu function "upload data".  

The upload supports the following **file formats**:  
 - [SDMX-CSV](https://github.com/sdmx-twg/sdmx-csv/blob/master/data-message/docs/sdmx-csv-field-guide.md)
 - [SDMX-ML](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/upload-data/upload-data-sdmx-file/) (2.1 generic and data-specific formats, 2.0 generic and compact formats)
 - [Excel](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/upload-data/upload-data-edd/) together with an "Excel data definition (EDD)" xml file that defined how to read the data from the Excel file  

More detailed information can be found for each of these formats.  

Using a **Point-in-Time (PIT)** date, the uploaded data can be kept under embargo in parallel to the previously available data until the embargo date is reached and the embargo data fully replace the previously available data. 

When data are uploaded, then the .Stat Core system automatically (re-)generates Actual Content Constraints for all dataflows impacted by the upload.  
- The IDs of auto-generated Actual Content Constraints are prefixed by "`CR_A_`" or "`CR_B_`", e.g. "`CR_A_DATAFLOWID`" and "`CR_B_DATAFLOWID`".
- The names of auto-generated Actual Content Constraints are construced using "`Availability (A) for `" or "`Availability (B) for `" and the *name* of the dataflow, e.g. "`Availability (A) for Dataflow name`" and "`Availability (B) for Dataflow name`"
- Behind the scenes, the Actual Content Constraints are linked to their related fact table version (A or B) they relate to.
- The user (and client applications) will know which Actual Content Constraint is currently valid **through the (automatically updated) validity dates of the actual content constraints**. Clients can thus ignore the "A/B" info, and instead fully rely on the validity dates to decide which one is the currently valid actual content constraint.
- For Point-in-Time (PIT) releases, the following rules apply to the validity dates of the Actual Content Constraints:
   * When there is not a PIT version: There will be only one actual content constraint, for the currently active version, with *no start date* and *no end date*
   * When there is a PIT version with PIT date: The actual content constraint for the pre-PIT version will have *no start date* and ***(1 second before) the PIT date as end date***, the actual content constraint for the PIT version will have the ***PIT date as start date*** and *no end date*
   * When there is a PIT version without user PIT date: The actual content constraint for the pre-PIT version will have *no start date* and *no end date*, the actual content constraint for the PIT version will have the *max value in C# and MS SQL/Oracle/MySQL db servers (9999-12-31 23:59:59) as start date* and *no end date*.