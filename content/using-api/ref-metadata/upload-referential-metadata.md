---
title: "Upload referential metadata from an SDMX-CSV file"
subtitle: 
comments: false
weight: 4440
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
> SDMX-CSV version 2.0 format to support new action types with [July 4, 2023 Release .Stat Suite dragonfruit](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#july-4-2023)

---

### Prerequisites
In .Stat Suite Core, data and referential metadata cannot be uploaded together (at the same time). They have to be uploaded through separate import files.  

Referential metadata can be uploaded **only after** having uploaded the targeted dataflow in the same data space.  

According to the SDMX standard formats, the referential metadata file must contain the full identification of the dataflow (agency, id, version) for which referential metadata are uploaded. Therefore it is not necessary to indicate the target dataflow in the DLM. Only the target data space needs to be selected.

Referential metadata can be uploaded **only after** having uploaded the related Metadata Structure Definition (MSD) and its concepts (in one or more Concept Schemes) in the same data space and having linked the underlying Data Structure Definition (DSD) to that MSD by adding the annotation of type **`METADATA`** with the appropriate MSD-URN to the DSD, e.g.

```xml
<structure:DataStructure agencyID=“XXX“ id=“XXX" version=“1.0">
   <common:Annotations>
  	<common:Annotation>
  		 <common:AnnotationTitle>urn:sdmx:org.sdmx.infomodel.metadatastructure.MetadataStructure=AGENCY:MSD_ID(1.0)</common:AnnotationTitle>
  		<common:AnnotationType>METADATA</common:AnnotationType>
  	</common:Annotation>
  </common:Annotations>
  <common:Name xml:lang="en">XXX</common:Name>
  <structure:DataStructureComponents>
  	...
  </structure:DataStructureComponents>
</structure:DataStructure>
```

Note that, as for measures and attributes in the DSD, the concepts used for the MSD define the name and types of the metadata attributes (html, string, number, coded value, etc.).

[Here attached](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/blob/master/content/OECD_SNA_TABLE1_1.0_structures.xml) is an example of a full *SDMX* structure file allowing to upload referential metadata, and containing
- a dataflow
- a list of codelists
- a list of concept schemes
- a metadata structure definition (MSD)
- a data strcuture definition (MSD) with the `METADATA` annotation

---

### Supported type of actions
**SDMX-CSV version 2.0** can contain specific actions to perform upon a referential metadata upload request.  
An **'ACTION'** column (after the structure identification column) is used to define the upload action for each individual row (partial coordinate).

The following SDMX actions are supported by the .Stat Suite when uploading referential metadata:

- **"I": Information** - Referential metadata is for information purposes. If such referential metadata messages are loaded into a data space, currently in .Stat Suite (for backward-compatibility reasons) the action `M`(erge) is assumed. This might change in the future to instead use `R`(eplace). 
- **"M": Merge** *(legacy "A": Append)* -  Referential metadata is for an incremental update of existing metadata attributes or for the provision of new referential metadata formerly absent. This means that **only the information provided explicitly in the message should be altered**. Any metadata attribute value that is to be added or changed must be provided. However, the absence of a metadata attribute at any level does not imply deletion; instead it is simply implied that the value is to remain unchanged. Therefore, it is valid and acceptable to send a referential metadata message with an action of `M`(erge), which (in addition to identifying structure columns) contains only the identifying dimensions with some referential metadata attribute values. In this case, whatever the attachment level of the referential metadata attributes is, the values for the metadata attributes will be updated. Note that it is not permissible to update referential metadata attribute values using incomplete identification information, e.g. without the structure ID or without the necessary dimensions (full key/partial key/none).  
- **"R": Replace** -  Referential metadata is for replacement. Existing referential metadata at the given partial coordinate (with all the related metadata attribute values) are to be fully replaced with the provided information. Referential metadata attribute values formerly absent will be appended.  
- **"D": Delete** - Referential metadata is to be deleted. `D`(elete) is assumed to be an incremental deletion. The deletion is to take place at the lowest level of detail provided. Concretely, if a `D`(elete) set/row only contains the identification information of the structural artefact (dataflow, data structure definition or data provision agreement) without any dimension or referential metadata attribute values then all referential metadata for the given artefact will be deleted. If the set/row contains only the structure identification and partial dimension values then all concerned partial coordinates and all related referential metadata attribute values will be deleted. If the set/row contains only the structure identification, partial dimension values as well as values for some of the related referential metadata attributes then only these referential metadata attribute values will be deleted. If the set/row contains only the structure identification and a specific partial coordinate then the related referential metadata attribute values will be deleted. Finally, if the set/row contains only the structure identification, a specific partial coordinate as well as values for some of the related referential metadata attributes then only these referential metadata attribute values will be deleted. **To be deleted referential metadata attribute values must be non-empty**. 

*Note* that, if this column is absent then the action `M`(erge) is assumed.

**Important note**: Because assuring backward-compatibility in the upload behaviour for **SDMX-CSV version 1.0** messages represented a too big technical burden, these messages will now systematically apply the new **`R`(eplace)** action as described in this documentation.

#### Details of the Merge action
- **`M`(erge)** actions are assumed to take place at the lowest level of detail provided in the message.
- Dimension values **cannot be omitted or wild-carded** because the attachment level of referential metadata attributes is not (necessarily) predefined (especially not in our work-around solution based on SDMX 2.1 structures).
- Instead, dimension values can be **switched off** using the dash character **`~`**. This is meant to specifically target referential metadata attributes that are not attached to this dimension (SQL notion: IS NULL).
- Apart from dimension values, whenever only specific values for referential metadata attributes are provided then only these values are updated/inserted (within the given dimensional scope). Any not specified (omitted) value is not changed.
- All referential metadata attributes impacted by the `M`(erge) action change their **time stamp**.
- The `M`(erge) action requires `CanImportData` **or** `CanUpdateData` permissions.

#### Details of the Replace action
- **`R`(eplace)** actions are assumed to take place at a specific ref. metadata attachment (empty/partial/full key/coordinate).
- Dimension values **cannot be omitted or wild-carded** because the attachment level of referential metadata attributes is not (necessarily) predefined (especially not in our work-around solution based on SDMX 2.1 structures).
- Instead, dimension values can be **switched off** using the dash character **`~`**. This is meant to specifically target referential metadata attributes that are not attached to this dimension (SQL notion: IS NULL).
- All ref. metadata attribute values of a specific attachment (empty/partial/full key/coordinate) are fully replaced with whatever the message contains for this attachment.
- For each replaced ref. metadata attachment, if none of the ref. metadata attribute values is present then the whole ref. metadata attachment will be deleted (and be marked as such).
- All ref. metadata attribute coordinates effectively impacted by the `R`(eplace) action change their **time stamp**.
- The `R`(eplace) action requires `CanImportData` or `CanUpdateData` permissions.

#### Details of the Delete action
**`D`(elete)** actions are assumed to take place at the lowest level of detail provided in the message.
- When dimension values are **omitted** then the values of those dimensions don't matter (SQL notion: any incl. NULL) to define the scope of the deletion. With this, referential metadata for whole datasets, for any slices of partial coordinates such as time series or for individual observations can be deleted.
- Ref. metadata attribute values can be **omitted**: Apart from dimensions, whenever only specific values for referential metadata attributes are provided then only these values are deleted (within the given dimensional scope), otherwise (=when all non-dimension components are omitted) the values of all referential metadata attributes related to the given dimensional scope are deleted. Instead of real values for ref. metadata attributes, it is sufficient to use any valid place-holder or intentionally missing value.
- Dimension values **wildcarded** using the star character **`*`** stand for any valid dimension item (SQL notion: IS NOT NULL). The dimension wildcard only represents present dimensions. It is thus a placeholder only for those non-fixed dimensions that are part of a partial or full key.
- Dimension values **switched off** using the dash character **`~`** target referential metadata attributes that are not attached to this dimension (SQL notion: IS NULL).
- When all ref. metadata attribute values of a specific partial or full key have been set to NULL through multiple partial `D`(elete) actions, then the full ref. metadata partial or full key is deleted.
- Deleting a non-existing referential metadata value is not resulting in an error.
- All referential metadata impacted by the `D`(elete) action change their **time stamp**.
- The `D`(elete) action requires `CanDeleteData` permissions.

### Conventions to indicate the state of components

- The following convention is used to indicate **presence, omission, switching off and wildcarding** of components :

| | Format    | Dimension value is              |             |              | Referential metadata value is |                                          |
|---|-----------|---------------------------------|-------------|--------------|-------------------------------|------------------------------------------|
|  |           | omitted                         | wild-carded | switched-off | omitted                       | present                                  |
| Action | `M`(erge) | Bulk merge is not permitted | Bulk merge is not permitted | For referential metadata attributes **not** attached to this dimension (SQL notion: IS NULL). | Not to be changed.            | To be updated/inserted.                  |
|  | `R`(eplace) | Bulk replace is not permitted | Bulk replace is not permitted | For referential metadata attributes **not** attached to this dimension (SQL notion: IS NULL). | To be *nulled*.               | To be updated/inserted.                  |
|  | `D`(elete) | The dimension value doesn't matter (SQL notion: any incl. NULL). | Any valid dimension value (SQL notion: IS NOT NULL). | For referential metadata attributes **not** attached to this dimension (SQL notion: IS NULL). | To be deleted only if all ref metadata attributes are omitted | To be deleted. |
| Format | CSV       | \<empty\> or column is absent   | `*`         | `~`          | \<empty\> or column is absent | Any valid or intentionally missing value |

#### Intentionally missing values
**Referential metadata** values are always stored as text including the **intentionally missing values**.  
As defined by the SDMX standard, we recommend for this purpose using `NaN` for numerical types (float, double) and the term `#N/A` for textual types.

#### Mixed actions and examples
SDMX-ML and SDMX-CSV v2.0 files can contain (datasets or rows with) varying actions (`D`(elete),`M`(erge),`I`(nformation),`A`(ppend),`R`(eplace)) including for overlapping scopes (full or partial coordinates).

**Examples:**

<details><summary>Examples for `D`(elete) operations</summary>

DSD+MSD components:  <br/>
- dimensions: DIM_1,DIM_2,TIME_PERIOD   <br/>
- metadata attributes: MD_ATTR_1, MD_ATTR_2 (attachment level is defined at runtime)  <br/>

**Note:** in the following examples, 'n' represents any (valid) value for the given column (observation or attribute)

| Delete                                                                         | STRUCTURE | STRUCTURE_ID     | ACTION | DIM_1 | DIM_2 | TIME_PERIOD | MD_ATTR_1 | MD_ATTR_2 |
|--------------------------------------------------------------------------------|-----------|------------------|--------|-------|-------|-------------|-----------|-----------|
| - all ref metadata of the dataflow                                             | dataflow  | AGENCY:ID(1.0.0) | D      |       |       |             |           |           |
| - all ref metadata for MD_ATTR_1                                               | dataflow  | AGENCY:ID(1.0.0) | D      |       |       |             | n         |           |
| - ref metadata attached at dataflow level                                      | dataflow  | AGENCY:ID(1.0.0) | D      | ~     | ~     | ~           |           |           |
| - everything related to DIM_2=B                                                | dataflow  | AGENCY:ID(1.0.0) | D      |       | B     |             |           |           |
| - everything attached to DIM_2=B                                               | dataflow  | AGENCY:ID(1.0.0) | D      | ~     | B     | ~           |           |           |
| - ref metadata related to time series DIM_1=A,DIM_2=B                          | dataflow  | AGENCY:ID(1.0.0) | D      | A     | B     |             |           |           |
| - ref metadata attached to time series DIM_1=A,DIM_2=B                         | dataflow  | AGENCY:ID(1.0.0) | D      | A     | B     | ~           |           |           |
| - observation-level ref metadata attached to key DIM_1=A,DIM_2=B,DIM_3=2014-01 | dataflow  | AGENCY:ID(1.0.0) | D      | A     | B     | 2014-01     |           |           |
| - all observation-level ref. metadata                                          | dataflow  | AGENCY:ID(1.0.0) | D      | *     | *     | *           |           |           |
| - all observation-level ref metadata related to DIM_2=B                        | dataflow  | AGENCY:ID(1.0.0) | D      | *     | B     | *           |           |           |
| - all time series & observation-level ref metadata                             | dataflow  | AGENCY:ID(1.0.0) | D      | *     | *     |             |           |           |
| - all time series ref metadata                                                 | dataflow  | AGENCY:ID(1.0.0) | D      | *     | *     | ~           |           |           |
| - observation-level ref metadata for time series DIM_1=A,DIM_2=B               | dataflow  | AGENCY:ID(1.0.0) | D      | A     | B     | *           |           |           |

Excel version: [Delete_action_examples_ref_metadata.xlsx](/uploads/56ebf0cd1d79b6b60d6feebface7f0ac/Delete_action_examples_ref_metadata.xlsx)

##### 1) delete all ref metadata of the dataflow
```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,MD_ATTR_1,MD_ATTR_2
dataflow,AGENCY:ID(1.0.0),D,,,,,
```

##### 2) delete all ref metadata for MD_ATTR_1
```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,MD_ATTR_1,MD_ATTR_2
dataflow,AGENCY:ID(1.0.0),D,,,,n,
```

##### 3) delete ref metadata attached at dataflow level
```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,MD_ATTR_1,MD_ATTR_2
dataflow,AGENCY:ID(1.0.0),D,~,~,~,,
```

##### 4) delete everything related to DIM_2=B
```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,MD_ATTR_1,MD_ATTR_2
dataflow,AGENCY:ID(1.0.0),D,,B,,,
```

##### 5) delete everything attached to DIM_2=B
```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,MD_ATTR_1,MD_ATTR_2
dataflow,AGENCY:ID(1.0.0),D,~,B,~,,
```

##### 6) delete ref metadata related to time series DIM_1=A,DIM_2=B
```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,MD_ATTR_1,MD_ATTR_2
dataflow,AGENCY:ID(1.0.0),D,A,B,,,
```

##### 7) delete ref metadata attached to time series DIM_1=A,DIM_2=B
```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,MD_ATTR_1,MD_ATTR_2
dataflow,AGENCY:ID(1.0.0),D,A,B,~,,
```

##### 8) delete observation-level ref metadata attached to key DIM_1=A,DIM_2=B,DIM_3=2014-01
```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,MD_ATTR_1,MD_ATTR_2
dataflow,AGENCY:ID(1.0.0),D,A,B,2014-01,,
```

##### 9) delete all observation-level ref. metadata
```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,MD_ATTR_1,MD_ATTR_2
dataflow,AGENCY:ID(1.0.0),D,*,*,*,,
```

##### 10) delete all observation-level ref metadata related to DIM_2=B
```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,MD_ATTR_1,MD_ATTR_2
dataflow,AGENCY:ID(1.0.0),D,*,B,*,,
```

##### 11) delete all time series & observation-level ref metadata
```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,MD_ATTR_1,MD_ATTR_2
dataflow,AGENCY:ID(1.0.0),D,*,*,,,
```

##### 12) delete all time series ref metadata
```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,MD_ATTR_1,MD_ATTR_2
dataflow,AGENCY:ID(1.0.0),D,*,*,~,,
```

##### 13) delete observation-level ref metadata for time series DIM_1=A,DIM_2=B
```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,MD_ATTR_1,MD_ATTR_2
dataflow,AGENCY:ID(1.0.0),D,A,B,*,,
```

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
