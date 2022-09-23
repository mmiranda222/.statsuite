---
title: "Upload data or referential metadata"
subtitle: 
comments: false
weight: 270
keywords: [
 'Introduction', '#introduction',
 'Advanced actions for data import', '#advanced-actions-for-data-import',
 'Supported upload actions', '#supported-upload-actions',
 'Rules of the Merge action', '#rules-of-the-merge-action',
 'Mixed actions', '#mixed-actions',
 'Auto-generation of Actual Content Constraints', '#auto-generation-of-actual-content-constraints',
]
---

> *Version history:*  
> Data upload supported in SDMX-CSV version 2.0 file format, and including combined actions since [September 22, 2022 Release .Stat Suite .NET 'blueberry'](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#september-22-2022)

#### Table of Content
- [Introduction](#introduction)
- [Advanced actions for data import](#advanced-actions-for-data-import)
  - [Supported upload actions](#supported-upload-actions)
  - [Rules of the Merge action](#rules-of-the-merge-action)
  - [Mixed actions](#mixed-actions)
- [Auto-generation of Actual Content Constraints](#auto-generation-of-actual-content-constraints)

---

### Introduction
**Data** or **referential metadata** can be uploaded by using the main menu feature "Upload data & referential metadata" available from the top banner of the DLM.

![dlm-upload-data-banner](/dotstatsuite-documentation/images/dlm-upload-data-sdmx-banner.png)

The upload supports the following **file formats**:  
- [SDMX data](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/upload-data/upload-data-sdmx-file/) for observation and attribute values only
   - [SDMX-CSV version 1.0](https://github.com/sdmx-twg/sdmx-csv/tree/v1.0/data-message/docs/sdmx-csv-field-guide.md)
   - [SDMX-CSV version 2.0](https://github.com/sdmx-twg/sdmx-csv/tree/v2.0.0/data-message/docs/sdmx-csv-field-guide.md)
   - [SDMX-ML](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/upload-data/upload-data-sdmx-file/) (2.1 generic and data-specific formats, 2.0 generic and compact formats)
- [Excel data](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/upload-data/upload-data-edd/) together with an "Excel data definition (EDD)" xml file that defines how to read the data from the Excel file  
 - [SDMX metadata](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/upload-data/upload-referential-metadata/) for referential metadata attribute values only
   - [SDMX-CSV version 2.0](https://github.com/sdmx-twg/sdmx-csv/tree/v2.0.0/data-message/docs/sdmx-csv-field-guide.md)

**Disclaimer:** SDMX-ML file format for Merge and Combined actions is not yet available. 

---

### Advanced actions for data import
**SDMX-CSV version 2.0** and **SDMX-ML** can contain specific actions to perform upon a data upload request.  
For SDMX-ML imports, the action is set for each dataset.  
For SDMX-CSV 2.0 imports, a new **'ACTION'** column (after the structure identification column) is created. The action is set for each individual row (observation or attribute(s)).

#### Supported upload actions
The following actions are supported by the .Stat Suite when uploading data using whether a SDMX-CSV v2.0 or SDMX-ML file format:

- **"I": Information** - Data is for information purposes. If such data messages are loaded into a data space, the action "M" (Merge) is assumed.
- **"M": Merge** *(legacy "A": Append)* -  Data is for an incremental update of existing observations or partial-key attributes or for the provision of new data formerly absent. This means that only the information provided explicitly in the message should be altered. Any measure or attribute value that is to be added or changed must be provided. However, the absence of an observation value or a data attribute at any level does not imply deletion; instead it is simply implied that the value is to remain unchanged. Therefore, it is valid and acceptable to send a data message with an action of Merge which (in addition to identifying structure columns) contains only identifying dimensions with some attribute values. In this case, whatever the attachment level of the attributes is, the values for the attributes will be updated. Note that it is not permissible to update measure or attribute values using incomplete identification information, e.g. without the structure ID or without the necessary dimensions (full key for measures, full key/partial key/none for attributes).
- **"R": Replace** - Data is for replacement. Existing observations are to be fully replaced. Existing attribute values are to be replaced. Observations or attribute values formally absent will be appended.
- **"D": Delete** - Data is to be deleted. See https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/delete-data/

*Note* that, if this column is absent, then the action "Information" is assumed.

#### Rules of the Merge action
**M: Merge** actions are assumed to take place at the lowest level of detail provided in the message, however:
- Dimensions can be **omitted** only when uploading higher-level attribute values that are not attached at these dimensions. Note that the attachment level of attributes is always predefined.
- Apart from dimensions, whenever only specific values for measures or attributes are provided, then only these values are updated/inserted. Any not specified (omitted) value is not changed.
- All observations and attributes impacted by the merge action change their **timestamp**.
- The following special measure and attribute values indicate **intentionally missing values**:

| Format | Numeric values | Textual values |
|--------|----------------|----------------|
| XML | NaN | \<empty\> |
| CSV | #N/A | #N/A |

- The following convention is used to indicate **presence and omission** of components in merge actions:

| Format | Dimension value is | Referential metadata value is |                                                 |
|--------|--------------------|-------------------------------|-------------------------------------------------|
|        | omitted            | omitted                       | present                                         |
| Behaviour | Only for higher-level attributes that are **not** attached to this dimension (SQL notion: IS NULL). | Not to be changed. | To be updated/inserted. |
| XML    | xml element/attribute is absent | xml element/attribute is absent | Any valid value or intentionally missing value (Numeric: NaN, String: \<empty\>) |
| CSV    | \<empty\> or column is absent | \<empty\> or column is absent | Any valid value or intentionally missing value (#N/A)              |

#### Mixed actions
SDMX-CSV v2.0 files can contain multiple actions ('D' delete,'M' merge,'I' information,'A' append). **However**, there cannot be multiple rows which target different actions for the same coordinate or sub-coordinate. For example, the following isn't allowed, because a Delete all action overlaps with the data merge of a specific observation value within the same scope, and it will thus return an error when trying to upload it:

```csv
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,OBS_VALUE,OBS_ATTR,TS_ATTR,GR_ATTR,DF_ATTR
dataflow,OECD:DF_TEST_DELETE(1.0),D,,,,,,,,
dataflow,OECD:DF_TEST_DELETE(1.0),M,A,A,2021,2345,B,AA,A,DF
```

---

### Auto-generation of Actual Content Constraints
When data are uploaded, then the .Stat Core system automatically (re-)generates **Actual Content Constraints** for all dataflows impacted by the upload.  
- The IDs of auto-generated Actual Content Constraints are prefixed by "`CR_A_`" or "`CR_B_`", e.g. "`CR_A_DATAFLOWID`" and "`CR_B_DATAFLOWID`".
- The names of auto-generated Actual Content Constraints are construced using "`Availability (A) for `" or "`Availability (B) for `" and the *name* of the dataflow, e.g. "`Availability (A) for Dataflow name`" and "`Availability (B) for Dataflow name`"
- Behind the scenes, the Actual Content Constraints are linked to their related fact table version (A or B) they relate to.
- The user (and client applications) will know which Actual Content Constraint is currently valid **through the (automatically updated) validity dates of the actual content constraints**. Clients can thus ignore the "A/B" info, and instead fully rely on the validity dates to decide which one is the currently valid actual content constraint.
- For Point-in-Time (PIT) releases, the following rules apply to the validity dates of the Actual Content Constraints:
   * When there is not a PIT version: There will be only one actual content constraint, for the currently active version, with *no start date* and *no end date*
   * When there is a PIT version with PIT date: The actual content constraint for the pre-PIT version will have *no start date* and ***(1 second before) the PIT date as end date***, the actual content constraint for the PIT version will have the ***PIT date as start date*** and *no end date*
   * When there is a PIT version without user PIT date: The actual content constraint for the pre-PIT version will have *no start date* and *no end date*, the actual content constraint for the PIT version will have the *max value in C# and MS SQL/Oracle/MySQL db servers (9999-12-31 23:59:59) as start date* and *no end date*.
