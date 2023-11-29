---
title: "Upload data from an SDMX-CSV or SDMX-ML (xml) file"
subtitle: 
comments: false
weight: 4320
keywords: [
 'Prerequisites', '#prerequisites',
 'Supported type of actions', '#supported-type-of-actions',
 'Details of the Merge action', '#details-of-the-merge-action',
 'Details of the Replace action', '#details-of-the-replace-action',
 'Details of the Delete action', '#details-of-the-delete-action',
 'Conventions to indicate the state of components', '#conventions-to-indicate-the-state-of-components',
 'Intentionally missing values', '#intentionally-missing-values',
 'Mixed actions and examples', '#mixed-actions-and-examples',
 'File upload request', '#file-upload-request',
 'Maximum upload file size', '#maximum-upload-file-size'
]
---

#### Table of Content
- [Prerequisites](#prerequisites)
- [Supported type of actions](#supported-type-of-actions)
  - [Details of the **Merge** action](#details-of-the-merge-action)
  - [Details of the **Replace** action](#details-of-the-replace-action)
  - [Details of the **Delete** action](#details-of-the-delete-action)
  - [Conventions to indicate the state of components](#conventions-to-indicate-the-state-of-components)
  - [Intentionally missing values](#intentionally-missing-values)
  - [Mixed actions and examples](#mixed-actions-and-examples)
- [File upload request](#file-upload-request)
- [Maximum upload file size](#maximum-upload-file-size)

> *Version history:*  
> SDMX-CSV version 2.0 and XML formats supporting new action types with [July 4, 2023 Release .Stat Suite dragonfruit](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#july-4-2023)

---

### Prerequisites
In .Stat Suite Core, data and referential metadata cannot be uploaded together (at the same time). They have to be uploaded through separate import files.  

Data can be uploaded **only after** having uploaded the targeted dataflow in the same data space.  

According to the SDMX standard formats, the data file must contain the full identification of the dataflow (agency, id, version) for which data are uploaded. Therefore it is not necessary to indicate the target dataflow in the DLM. Only the target data space needs to be selected.

### Supported type of actions
**SDMX-CSV version 2.0** and **SDMX-ML** can contain specific actions to perform upon a data upload request.  
For SDMX-ML imports, the action is provided per dataset.  
For SDMX-CSV 2.0 imports, an **'ACTION'** column (after the structure identification column) is used to define the upload action for each individual row (observation or attribute(s)).

The following SDMX actions are supported by the .Stat Suite when uploading data using whether a SDMX-CSV v2.0 or SDMX-ML file format:

- **"I": Information** - Data is for information purposes. If such data messages are loaded into a data space, currently in .Stat Suite (for backward-compatibility reasons) the action `M`(erge) is assumed. This might change in the future to instead use `R`(eplace). 
- **"M": Merge** *(legacy "A": Append)* -  Data is for an incremental update of existing observations or partial-key attributes or for the provision of new data formerly absent. This means that **only the information provided explicitly in the message should be altered**. Any measure or attribute value that is to be added or changed must be provided. However, the absence of an observation value or a data attribute at any level does not imply deletion; instead it is simply implied that the value is to remain unchanged. Therefore, it is valid and acceptable to send a data message with an action of `M`(erge), which (in addition to identifying structure columns) contains only identifying dimensions with some attribute values. In this case, whatever the attachment level of the attributes is, the values for the attributes will be updated. Note that it is not permissible to update measure or attribute values using incomplete identification information, e.g. without the structure ID or without the necessary dimensions (full key for measures, full key/partial key/none for attributes).  
- **"R": Replace** -  Data is for replacement. Existing observations (with all their measure and observation-level attribute values) are to be fully replaced with the provided information. Existing higher level attribute values - when provided - are to be updated or appended. Observations or attribute values formerly absent will be appended.  
- **"D": Delete** - Data is to be deleted. `D`(elete) is assumed to be an incremental deletion. The deletion is to take place at the lowest level of detail provided. Concretely, if a `D`(elete) set/row only contains the identification information of the structural artefact (dataflow, data structure definition or data provision agreement) without any dimension, measure and attribute values then all data for the given artefact will be deleted. If the set/row contains only the structure identification and partial dimension values then all observations and all attribute values relating to those dimension values will be deleted. If the set/row contains only the structure identification, partial dimension values as well as values for some of the related attributes then only these attribute values will be deleted. If the set/row contains only the structure identification and full dimension values then the related observation and all its observation-level attribute values will be deleted. Finally, if the set/row contains only the structure identification, full dimension values as well as values for some of the related measures and attributes then only these measure and observation-level attribute values will be deleted. **The to be deleted measure and attribute values must be non-empty or alternatively all measure and attribute values must be empty**. 

*Note* that, if this column is absent then the action `M`(erge) is assumed.

**Important note about a non-backward-compatible change**: The **SDMX-CSV version 1.0** messages will now systematically use the `M`(erge) action, which changes its upload behaviour: Empty measure or attribute column cells will not lead anymore to deleting the related values in the database.

#### Details of the Merge action
- **`M`(erge)** actions are assumed to take place at the lowest level of detail provided in the message.
- Dimension values cannot be omitted but they can be **switched-off** when uploading higher-level attribute values that are not attached at these dimensions. Note that the attachment level of attributes is always predefined.
- Apart from dimensions, whenever only specific values for measures or attributes are provided, then only these values are updated/inserted. Any not specified (omitted) value is not changed.
- All observations and attributes effectively impacted by the `M`(erge) action change their **time stamp**.
- The `M`(erge) action requires `CanImportData` **or** `CanUpdateData` permissions.

**Important note: In the current release and until [this ticket](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/491) is implemented, it is still allowed and required to _omit_ dimension values instead of _switching_ them _off_ with '`~`' in order to merge higher-level attribute values.**

#### Details of the Replace action
- **`R`(eplace)** actions are assumed to take place at the observation level.
- All measure and observation-level attributes values of a specified observation are fully replaced with whatever the message contains for this observation.
- Dimension values cannot be omitted but they can be **switched-off** when uploading higher-level attribute values that are not attached at these dimensions. Note that the attachment level of attributes is always predefined.
- Higher level attribute values are updated or added only when present, like is done in the `M`(erge).
- For each replaced observation, if none of the measure or observation-level attribute values is present then the whole observation will be deleted (and be marked as such).
- All observations and partial coordinates effectively impacted by the `R`(eplace) action change their **time stamp**.
- The `R`(eplace) action requires `CanImportData` or `CanUpdateData` permissions.

**Important note: In the current release and until [this ticket](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/491) is implemented, it is still allowed and required to _omit_ dimension values instead of _switching_ them _off_ with '`~`' in order to replace higher-level attribute values.**

#### Details of the Delete action
**`D`(elete)** actions are assumed to take place at the lowest level of detail provided in the message.
- When dimension values are **omitted** then the values of those dimensions don't matter (SQL notion: any incl. NULL) to define the scope of the deletion. With this, a whole dataset, any slice of whole observations for dimension groups such as time series or individual whole observations can be deleted.
- Dimension values can be **switched-off** when deleting higher-level attribute values that are not attached at these dimensions. Note that the attachment level of attributes is always predefined.
- Measure and attribute values can be **omitted**: Apart from dimensions, whenever only specific values for measures or attributes are provided then only these values are deleted (within the given dimensional scope), otherwise (=when all non-dimension components are omitted) all non-dimension component values related to the given dimensional scope are deleted. Instead of real values for non-dimensional components, it is sufficient to use any valid place-holder value or an intentionally missing value. **The .Stat Suite also accepts the star character '\*' as a place-holder for to be deleted measure and attribute values**.
- When all measure or observation-level attribute values of an onservation have been set to NULL through multiple partial `D`(elete) actions, then the full observation is deleted.
- When all higher-level attribute values of a specific partial key have been set to NULL through multiple partial `D`(elete) actions, then the partial key is deleted.
- Deleting a non-existing observation or attribute is not resulting in an error.
- All observations and attributes impacted by the `D`(elete) action change their **time stamp**.
- The `D`(elete) action requires `CanDeleteData` permissions.

\***Important note: In the current release and until [this ticket](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/491) is implemented, it is still allowed and required to _omit_ dimension values instead of _switching_ them _off_ with '`~`' in order to delete higher-level attribute values.**

### Conventions to indicate the state of components

|  | Format | Dimension value is                                           | | Measure or attribute value is   |                                          |
|--|--------|--------------------------------------------------------------|-|--------------------------------|------------------------------------------|
|  |        | omitted                                                      | switched-off<upper>\*</upper> | omitted                         | present                                  |
| Action | `M`(erge) | Bulk merge is not permitted | Only for higher-level attributes that are **not** attached to this dimension (SQL notion: IS NULL).<upper>\*</upper> | Not to be changed. | To be updated/inserted. |
| | `R`(eplace) | Bulk replace is not permitted | Only for higher-level attributes that are **not** attached to this dimension (SQL notion: IS NULL).<upper>\*</upper> | Obs.value/attr: To be *nulled*. Higher-level attr.: Not to be changed. | To be updated/inserted. |
| | `D`(elete) | Dimension value doesn't matter (SQL notion: any incl. NULL). | Only for higher-level attributes that are **not** attached to this dimension (SQL notion: IS NULL).<upper>\*</upper> | To be deleted only if **all** non-dimension component values related to the given dimensional scope are omitted. | To be deleted. |
| Format | XML    | xml element/attribute is absent | Higher-level attributes presented at dataflow, group or time-series level<upper>\*</upper> | xml element/attribute is absent | Any valid or intentionally missing value |
| | JSON (in extractions only) | \<empty\>                              | Higher-level attributes presented at dataflow, group or time-series level<upper>\*</upper> | NULL or absent | Any valid or intentionally missing value |
| | CSV    | \<empty\> or column is absent                                | `~` |\<empty\> or column is absent   | Any valid (incl. empty string enclosed in double quotation marks "") or intentionally missing value |

<upper>\*</upper>**Important note: In the current release and until [this ticket](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/491) is implemented, it is still allowed and required to _omit_ dimension values instead of _switching_ them _off_ with '`~`' in order to merge, replace or delete higher-level attribute values.**

#### Intentionally missing values
Intentionally missing values are currently actively supported only for **observation** values (measure).  
This support is enabled in the .Stat Suite per DSD. Each DSD that requires this feature must have an annotation of type **"SUPPORT_INTENT_MISS_VALUES"** before any related dataflow is initialised or related data are loaded. This is to prevent performance loss for DSDs that do not have this need. 

According to the SDMX standard, the following special values indicate an **intentionally missing value** in uploads and downloads:  
| format | for numerical types **`float`** and **`double`** | for all textual types |
|--------|-----------------------------|-----------------------------|
| XML    | `NaN` | `#N/A` | 
| CSV    | `NaN` | `#N/A` |
| JSON (supported only in extractions) | `NaN` | `#N/A` | 

Note: **Attribute** values are always stored as text including the intentionally missing values.

#### Mixed actions and examples
SDMX-ML and SDMX-CSV v2.0 files can contain (datasets or rows with) varying actions (`D`(elete),`M`(erge),`I`(nformation),`A`(ppend),`R`(eplace)) including for overlapping scopes (full or partial coordinates).

**Examples:**

```csv
SDMX-CSV v1.0:
DATAFLOW,DIM_1,DIM_2,TIME_PERIOD,OBS_VALUE,OBS_ATTR,TS_ATTR,GR_ATTR,DF_ATTR
OECD:DF_TEST_DELETE(1.0),A,A,2020,,A,AA,,DF                     --> Skip OBS_VALUE and GR_ATTR
OECD:DF_TEST_DELETE(1.0),A,A,2021,NaN,B,AA,#N/A,DF              --> Set OBS_VALUE (double) and GR_ATTR (string) to intentionally missing value

DATAFLOW,DIM_1,DIM_2,TIME_PERIOD,OBS_ATTR,TS_ATTR,DF_ATTR
OECD:DF_TEST_DELETE(1.0),A,A,2020,A,AA,DF                       --> Skip OBS_VALUE and GR_ATTR 

SDMX-CSV v2.0:
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,OBS_VALUE,OBS_ATTR,TS_ATTR,GR_ATTR,DF_ATTR
dataflow,OECD:DF_TEST_DELETE(1.0),D,,,,,,,,                     --> Delete all data of that dataflow
dataflow,OECD:DF_TEST_DELETE(1.0),I,A,A,2020,,A,AA,,DF          --> Skip OBS_VALUE and GR_ATTR
dataflow,OECD:DF_TEST_DELETE(1.0),A,A,A,2020,,A,AA,,DF          --> Skip OBS_VALUE and GR_ATTR
dataflow,OECD:DF_TEST_DELETE(1.0),M,A,A,2020,,A,AA,,DF          --> Skip OBS_VALUE and GR_ATTR
dataflow,OECD:DF_TEST_DELETE(1.0),M,A,A,2021,NaN,A,AA,#N/A,DF   --> Set OBS_VALUE (double) and GR_ATTR (string) to intentionally missing value
dataflow,OECD:DF_TEST_DELETE(1.0),R,A,A,2021,,A,AA,,DF          --> Set OBS_VALUE and GR_ATTR to NULL 
dataflow,OECD:DF_TEST_DELETE(1.0),R,A,A,2021,,,AA,A,DF          --> Set OBS_VALUE and OBS_ATTR to NULL

STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,OBS_ATTR,TS_ATTR,DF_ATTR
dataflow,OECD:DF_TEST_DELETE(1.0),D,,,,,,\*                     --> Delete DF_ATTR
dataflow,OECD:DF_TEST_DELETE(1.0),A,A,A,2020,A,AA,DF            --> Skip OBS_VALUE and GR_ATTR
```

<details><summary>Examples for `D`(elete) operations</summary>

DSD+MSD components:  <br/>
- dimensions: DIM_1,DIM_2,TIME_PERIOD   <br/>
- measures: OBS_VALUE (double)  <br/>
- attributes: DF_ATTR (defined at dataflow level), GR_ATTR, (defined at group level: DIM_2), TS_ATTR (defined at time series level), OBS_ATTR (defined at observation level)   <br/>

Files:    <br/>
- structures: [OECD-DF_TEST_DELETE-1.0-all_structures.xml](/https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/uploads/f75130ef03435b9229c63b5f0d013724/OECD-DF_TEST_DELETE-1.0-all_structures.xml)  <br/>
- all data: [OECD-DF_TEST_DELETE-1.0-all_data.csv](/https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/uploads/bcb0d564baecaf28806865214709eadf/OECD-DF_TEST_DELETE-1.0-all_data.csv)  <br/>

**Note:** As the .Stat Suite also accepts the star character '\*' as a place-holder for to be deleted measure and attribute values, this approach is used in this example.

| Delete                                                                                             | STRUCTURE | STRUCTURE_ID     | ACTION | DIM_1 | DIM_2 | TIME_PERIOD | OBS_VALUE | OBS_ATTR | TS_ATTR | GR_ATTR | DF_ATTR |
|----------------------------------------------------------------------------------------------------|-----------|------------------|--------|-------|-------|-------------|-----------|----------|---------|---------|---------|
| - whole content of the dataflow                                                                    | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      |       |       |             |           |          |         |         |         |
| - all observations of the dataflow and the observation-level attributes                            | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      |       |       |             | \*         | \*        |         |         |         |
| - all observation values of the dataflow                                                           | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      |       |       |             | \*         |          |         |         |         |
| - all attributes of the dataflow                                                                   | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      |       |       |             |           | \*        | \*       | \*       | \*       |
| - attributes attached at dataflow level                                                            | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      |       |       |             |           |          |         |         | \*       |
| - everything related to DIM_2=B                                                                    | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      |       | B     |             |           |          |         |         |         |
|                                                                                                    | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      |       | B     |             | \*         | \*        | \*       | \*       |         |
| - everything attached to DIM_2=B                                                                   | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      |       | B     |             |           |          |         | \*       |         |
| - all observations (and its observation-level attributes) related to DIM_2=B                       | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      |       | B     |             | \*         | \*        |         |         |         |
| - all time series attributes                                                                       | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      |       |       |             |           |          | \*       |         |         |
| - whole time series DIM_1=A,DIM_2=B                                                                | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      | A     | B     |             |           |          |         |         |         |
| - the attributes attached to time series DIM_1=A,DIM_2=B                                               | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      | A     | B     |             |           |          | \*       |         |         |
| - observation values & observation-level attributes for time series DIM_1=A,DIM_2=B                | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      | A     | B     |             | \*         | \*        |         |         |         |
| - observation (and its observation-level attributes) attached to key DIM_1=A,DIM_2=B,TIME_PERIOD=2021 - approach 1 | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      | A     | B     | 2021     |           |          |         |         |         |
| - observation (and its observation-level attributes) attached to key DIM_1=A,DIM_2=B,TIME_PERIOD=2021 - approach 2 | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      | A     | B     | 2021     | \*         | \*        |         |         |         |
| - observation value attached to key DIM_1=A,DIM_2=B,TIME_PERIOD=2021                                  | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      | A     | B     | 2021     | \*         |          |         |         |         |

Excel version: [Delete_action_examples.xlsx](/https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/uploads/9b35d5972474f354e6fdc9e86cd1f402/Delete_action_examples.xlsx)

##### 1) delete whole content of the dataflow
```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,OBS_VALUE,OBS_ATTR,TS_ATTR,GR_ATTR,DF_ATTR
dataflow,OECD:DF_TEST_DELETE(1.0),D,,,,,,,,
```
CSV File: [OECD-DF_TEST_DELETE-1.0-case_1__delete_whole_content_of_the_dataflow.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_1__delete_whole_content_of_the_dataflow.csv?inline=false)  <br/> 
XML File: [OECD-DF_TEST_DELETE-1.0-case_1__delete_whole_content_of_the_dataflow.xml](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_1__delete_whole_content_of_the_dataflow.xml?inline=false)  <br/> 

##### 2) delete all observations (obs.value and observation-level attribute) of the dataflow
```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,OBS_VALUE,OBS_ATTR,TS_ATTR,GR_ATTR,DF_ATTR
dataflow,OECD:DF_TEST_DELETE(1.0),D,,,,\*,\*,,,
```
CSV File: [OECD-DF_TEST_DELETE-1.0-case_2__delete_all_observations_of_the_dataflow_and_the_observation-level_attributes.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_2__delete_all_observations_of_the_dataflow_and_the_observation-level_attributes.csv?inline=false)  <br/>
XML File: NOT POSSIBLE  <br/>

##### 3) delete all observation values of the dataflow
```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,OBS_VALUE,OBS_ATTR,TS_ATTR,GR_ATTR,DF_ATTR
dataflow,OECD:DF_TEST_DELETE(1.0),D,,,,\*,,,,
```
CSV File: [OECD-DF_TEST_DELETE-1.0-case_3__delete_all_observation_values_of_the_dataflow.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_3__delete_all_observation_values_of_the_dataflow.csv?inline=false)  <br/>
XML File: NOT POSSIBLE  <br/>

##### 4) delete all attributes of the dataflow
```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,OBS_VALUE,OBS_ATTR,TS_ATTR,GR_ATTR,DF_ATTR
dataflow,OECD:DF_TEST_DELETE(1.0),D,,,,,\*,\*,\*,\*
```
CSV File: [OECD-DF_TEST_DELETE-1.0-case_4__delete_all_attributes_of_the_dataflow.csv](/https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_4__delete_all_attributes_of_the_dataflow.csv?inline=false)  <br/>
XML File: NOT POSSIBLE  <br/>

##### 5) delete attributes attached at dataflow level
```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,OBS_VALUE,OBS_ATTR,TS_ATTR,GR_ATTR,DF_ATTR
dataflow,OECD:DF_TEST_DELETE(1.0),D,,,,,,,,\*
```
CSV File: [OECD-DF_TEST_DELETE-1.0-case_5__delete_attributes_attached_at_dataflow_level.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_5__delete_attributes_attached_at_dataflow_level.csv?inline=false)  <br/>
XML File: [OECD-DF_TEST_DELETE-1.0-case_5__delete_attributes_attached_at_dataflow_level.xml](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_5__delete_attributes_attached_at_dataflow_level.xml?inline=false)  <br/>

##### 6) delete everything related to DIM_2=B
```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,OBS_VALUE,OBS_ATTR,TS_ATTR,GR_ATTR,DF_ATTR
dataflow,OECD:DF_TEST_DELETE(1.0),D,,B,,,,,,
```
CSV File: [OECD-DF_TEST_DELETE-1.0-case_6-1__delete_everything_related_to_DIM_2_B_way1.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_6-1__delete_everything_related_to_DIM_2_B_way1.csv?inline=false)  <br/>
XML File: [OECD-DF_TEST_DELETE-1.0-case_6-1__delete_everything_related_to_DIM_2_B_way1.xml](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_6-1__delete_everything_related_to_DIM_2_B_way1.xml?inline=false)  <br/>
or
```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,OBS_VALUE,OBS_ATTR,TS_ATTR,GR_ATTR,DF_ATTR
dataflow,OECD:DF_TEST_DELETE(1.0),D,,B,,\*,\*,\*,\*,
```
CSV File: [OECD-DF_TEST_DELETE-1.0-case_6-2__delete_everything_related_to_DIM_2_B_way2.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_6-2__delete_everything_related_to_DIM_2_B_way2.csv?inline=false)  <br/>
XML File: [OECD-DF_TEST_DELETE-1.0-case_6-2__delete_everything_related_to_DIM_2_B_way2.xml](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_6-2__delete_everything_related_to_DIM_2_B_way2.xml?inline=false)  <br/>

##### 7) delete everything attached to DIM_2=B
```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,OBS_VALUE,OBS_ATTR,TS_ATTR,GR_ATTR,DF_ATTR
dataflow,OECD:DF_TEST_DELETE(1.0),D,,B,,,,,\*,
```
CSV File: [OECD-DF_TEST_DELETE-1.0-case_7__delete_everything_attached_to_DIM_2_B.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_7__delete_everything_attached_to_DIM_2_B.csv?inline=false)  <br/>
XML File: [OECD-DF_TEST_DELETE-1.0-case_7__delete_everything_attached_to_DIM_2_B.xml](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_7__delete_everything_attached_to_DIM_2_B.xml?inline=false)  <br/>

##### 8) delete all observations (and its observation-level attributes) related to DIM_2=B
```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,OBS_VALUE,OBS_ATTR,TS_ATTR,GR_ATTR,DF_ATTR
dataflow,OECD:DF_TEST_DELETE(1.0),D,,B,,\*,\*,,,
```
CSV File: [OECD-DF_TEST_DELETE-1.0-case_8__delete_all_observations__and_its_observation-level_attributes__related_to_DIM_2_B.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_8__delete_all_observations__and_its_observation-level_attributes__related_to_DIM_2_B.csv?inline=false)  <br/>
XML File: [OECD-DF_TEST_DELETE-1.0-case_8__delete_all_observations__and_its_observation-level_attributes__related_to_DIM_2_B.xml](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_8__delete_all_observations__and_its_observation-level_attributes__related_to_DIM_2_B.xml?inline=false)  <br/>

##### 9) delete all time series attributes
```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,OBS_VALUE,OBS_ATTR,TS_ATTR,GR_ATTR,DF_ATTR
dataflow,OECD:DF_TEST_DELETE(1.0),D,,,,,,\*,,
```
CSV File: [OECD-DF_TEST_DELETE-1.0-case_9__delete_all_time_series_attributes.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_9__delete_all_time_series_attributes.csv?inline=false)  <br/>
XML File: NOT POSSIBLE  <br/>

##### 10) delete whole time series DIM_1=A,DIM_2=B
```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,OBS_VALUE,OBS_ATTR,TS_ATTR,GR_ATTR,DF_ATTR
dataflow,OECD:DF_TEST_DELETE(1.0),D,A,B,,,,,,
```
CSV File: [OECD-DF_TEST_DELETE-1.0-case_10__delete_whole_time_series_DIM_1_A_DIM_2_B.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_10__delete_whole_time_series_DIM_1_A_DIM_2_B.csv?inline=false)  <br/>
XML File: [OECD-DF_TEST_DELETE-1.0-case_10__delete_whole_time_series_DIM_1_A_DIM_2_B.xml](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_10__delete_whole_time_series_DIM_1_A_DIM_2_B.xml?inline=false)  <br/>

##### 11) delete the attributes attached to time series DIM_1=A,DIM_2=B
```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,OBS_VALUE,OBS_ATTR,TS_ATTR,GR_ATTR,DF_ATTR
dataflow,OECD:DF_TEST_DELETE(1.0),D,A,B,,,,\*,,
```
CSV File: [OECD-DF_TEST_DELETE-1.0-case_11__delete_the_attributes_attached_to_time_series_DIM_1_A_DIM_2_B.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_11__delete_the_attributes_attached_to_time_series_DIM_1_A_DIM_2_B.csv?inline=false)  <br/>
XML File: [OECD-DF_TEST_DELETE-1.0-case_11__delete_the_attributes_attached_to_time_series_DIM_1_A_DIM_2_B.xml](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_11__delete_the_attributes_attached_to_time_series_DIM_1_A_DIM_2_B.xml?inline=false)  <br/>

##### 12) delete observation values & observation-level attributes for time series DIM_1=A,DIM_2=B
```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,OBS_VALUE,OBS_ATTR,TS_ATTR,GR_ATTR,DF_ATTR
dataflow,OECD:DF_TEST_DELETE(1.0),D,A,B,,\*,\*,,,
```
CSV File: [OECD-DF_TEST_DELETE-1.0-case_12__delete_observation_values___observation-level_attributes_for_time_series_DIM_1_A_DIM_2_B.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_12__delete_observation_values___observation-level_attributes_for_time_series_DIM_1_A_DIM_2_B.csv?inline=false)  <br/>
XML File: [OECD-DF_TEST_DELETE-1.0-case_12__delete_observation_values___observation-level_attributes_for_time_series_DIM_1_A_DIM_2_B.xml](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_12__delete_observation_values___observation-level_attributes_for_time_series_DIM_1_A_DIM_2_B.xml?inline=false)  <br/>

##### 13 A) delete observation (and its observation-level attributes) attached to key DIM_1=A,DIM_2=B,TIME_PERIOD=2021
```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,OBS_VALUE,OBS_ATTR,TS_ATTR,GR_ATTR,DF_ATTR
dataflow,OECD:DF_TEST_DELETE(1.0),D,A,B,2021,,,,,
```
CSV File: [OECD-DF_TEST_DELETE-1.0-case_13__delete_observation__and_its_observation-level_attributes__attached_to_key_DIM_1_A_DIM_2_B_TIME_PERIOD_2021.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_13__delete_observation__and_its_observation-level_attributes__attached_to_key_DIM_1_A_DIM_2_B_TIME_PERIOD_2021.csv?inline=false)  <br/>
XML File: [OECD-DF_TEST_DELETE-1.0-case_13__delete_observation__and_its_observation-level_attributes__attached_to_key_DIM_1_A_DIM_2_B_TIME_PERIOD_2021.xml](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_13__delete_observation__and_its_observation-level_attributes__attached_to_key_DIM_1_A_DIM_2_B_TIME_PERIOD_2021.xml?inline=false)  <br/>

##### 13 B) delete observation (and its observation-level attributes) attached to key DIM_1=A,DIM_2=B,TIME_PERIOD=2021
```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,OBS_VALUE,OBS_ATTR,TS_ATTR,GR_ATTR,DF_ATTR
dataflow,OECD:DF_TEST_DELETE(1.0),D,A,B,2021,\*,\*,,,
```
CSV File: [OECD-DF_TEST_DELETE-1.0-case_13B__delete_observation__and_its_observation-level_attributes__attached_to_key_DIM_1_A_DIM_2_B_TIME_PERIOD_2021.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_13B__delete_observation__and_its_observation-level_attributes__attached_to_key_DIM_1_A_DIM_2_B_TIME_PERIOD_2021.csv?inline=false)  <br/>
XML File: [OECD-DF_TEST_DELETE-1.0-case_13__delete_observation__and_its_observation-level_attributes__attached_to_key_DIM_1_A_DIM_2_B_TIME_PERIOD_2021.xml](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_13__delete_observation__and_its_observation-level_attributes__attached_to_key_DIM_1_A_DIM_2_B_TIME_PERIOD_2021.xml?inline=false)  <br/>

##### 14) delete observation value attached to key DIM_1=A,DIM_2=B,TIME_PERIOD=2021
```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,OBS_VALUE,OBS_ATTR,TS_ATTR,GR_ATTR,DF_ATTR
dataflow,OECD:DF_TEST_DELETE(1.0),D,A,B,2021,\*,,,,
```
CSV File: [OECD-DF_TEST_DELETE-1.0-case_14__delete_observation_value_attached_to_key_DIM_1_A_DIM_2_B_TIME_PERIOD_2021.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_14__delete_observation_value_attached_to_key_DIM_1_A_DIM_2_B_TIME_PERIOD_2021.csv?inline=false)  <br/>
XML File: [OECD-DF_TEST_DELETE-1.0-case_14__delete_observation_value_attached_to_key_DIM_1_A_DIM_2_B_TIME_PERIOD_2021.xml](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_14__delete_observation_value_attached_to_key_DIM_1_A_DIM_2_B_TIME_PERIOD_2021.xml?inline=false)  <br/>

##### And last, here is an example file with mixed actions  
- [OECD-DF_TEST_DELETE-1.0-case_X_mixed_actions.xml](/https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/uploads/747eafb86b9972f87f22de0fa6cddbe6/OECD-DF_TEST_DELETE-1.0-case_X_mixed_actions.xml)  <br/>

</details>

---

### File upload request
Data files can be uploaded either within the request message body (see [Maximum upload file size](#maximum-upload-file-size)) or by specifying the path or URL to a file that is **accessible** by the data upload engine through this path or URL. Technically spoken, the service account under which the transfer service runs must have read access permissions to the file on the shared folder or web URL.   

The data upload requests are executed in **2 subsequent phases**:  
1) The file or its path/URL is submitted to the data upload engine. The data upload engine makes a preliminary file content consistency check. If the check is successful then the file upload request gets attributed a request ID, is added to a queue and treated when there are sufficient server resources available. If the check fails, the data upload is cancelled. In both cases the user is informed about the outcome in the message response.
2) When the queued file upload request has been executed, the user is informed via logs and by an e-mail about the progress and outcome of the file upload, which could again be successful or failing. For more details see [E-mail notifications for data management](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/message-through-mail/). The e-mail address being used is the one linked to the account under which the user has logged in the DLM.  

---

### Maximum upload file size
The size of files uploaded through the request message body is limited by default to **30MB**. 

It is possible also to compress the data file using the 'zip' format, and submit the compressed file in the message body. In this case the limitation applies on the zipped file size.

The file size limit is configurable by an administrator. Please see [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/dlm-configuration/#upload-size-limit) for more information.

Files submitted through their path or URL do not have a specific size limit. However, the data upload engine always has internal hardware-related limitations.
