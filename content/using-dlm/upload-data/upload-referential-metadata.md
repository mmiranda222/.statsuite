---
title: "Upload referential metadata from a csv file"
subtitle: 
comments: false
weight: 292
keywords: [
 'Prerequisite', '#prerequisite',
 'File format', '#file-format',
]
---

> Introduced in [February 21, 2022 Release .Stat Suite JS 12.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#february-21-2022)

#### Table of Content
- [Prerequisite](#prerequisite)
- [File format](file-format)

---

### Prerequisite
Referantial metadata can be uploaded when the related *SDMX* Data Structure Defintion (DSD) has already been uploaded in a given dataspace, and when this DSD contains an annotation of type **`METADATA`** indicating the URN of the related Metadata Structure Definition (MSD), e.g.

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

As for the DSD, the concepts used in the MSD to name the metadata attributes are previously defined in a Concept Scheme. The concepts and/or the MSD also define the types of the metadata attributes (html, string, number, coded value, etc.).

[Here attached](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/blob/master/content/OECD_SNA_TABLE1_1.0_structures.xml) is an example of a full *SDMX* structure file allowing to upload referential metadata, and containing
- a dataflow
- a list of codelists
- a list of concept schemes
- a metadata structure definition (MSD)
- a data strcuture definition (MSD) with the `METADATA` annotation

---

### File format
Referential metadata can be uploaded by using the main menu feature "Upload data" available from the top banner of the DLM, and similar to [upload data](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/upload-data/upload-data-sdmx-file/).

The format of the .csv file for referential metadata must comply to the SDMX-CSV 2.0 format, which is as follow:
- the first column: header row containing 'STRUCTURE' and each other row containing 'dataflow'
- the second column: header row containing 'STRUCTURE_ID' and each other row containing the full dataflow identification 'agencyID:dataflowId(version)' e.g. 'AGENCY:DF_ID(1.0)'
- the third column (optional): header row containing 'ACTION' and each other row containing either 'I' for Information or 'A' for Append. Actions are however *(not yet implemented)*.
- one column for each dimension of the dataflow: header row containing the dimension ID and each other row containing the dimension value ID to which the attribute values of this row are attached. It is left empty in rows where the attribute doesn't attach to that dimension.
- one column for each referential metadata: header row containing the attribute ID and each other row containing the corresponding attribute values

All textual values containing commas need to be encapsulated within double-quotes. All double-quotes inside the (metadata) attribute values themselves are to be escaped using doubled double-quotes. In addition, double-quotes inside localised values using JSON syntax are escaped using a preceeding backslash '\', e.g.:

`"en: ""<a href=\""mailto:contact-en@my-org.org\"">contact-en@my-org.org</a>"",fr: ""<a href=\""mailto:contact-fr@my-org.org\"">contact-fr@my-org.org</a>"""`

As can be seen in this example, the language codes in localised JSON snippets do not need to be put into (doubled) double quotes.

For more detailed information see the functional specification of the [SDMX-CSV version 2.0](https://github.com/sdmx-twg/sdmx-csv/tree/v2.0.0/data-message/docs/sdmx-csv-field-guide.md) format.  
For me details about the referential metadata types supported by the data explorer display, see [this topic](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/core-data-model/#referential-metadata-types).

[Here attached](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/blob/master/content/OECD_SNA_TABLE1_1.0_-_AUS_metadata.csv) is an example of a .csv file containing referential medata.

![dlm upload referential metadata csv file headers](/dotstatsuite-documentation/images/dlm-upload-referential-metadata-csv.png)
