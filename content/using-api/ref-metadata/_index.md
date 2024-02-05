---
title: "Referential metadata features"
subtitle: 
comments: false
weight: 4400
keywords: [
  'Introduction', '#introduction',
  'File format', '#file-format',
  'Higher-level referential metadata for dataflow or DSD', '#higher-level-referential-metadata-for-dataflow-or-dsd',
  'More details about the SDMX-CSV format', '#more-details-about-the-sdmx-csv-format',
  'Hierarchial referential metadata', '#hierarchial-referential-metadata',
  'Referential metadata upload and copy', '#referential-metadata-upload-and-copy',
  'Copy of referential metadata referencing a DSD', '#copy-of-referential-metadata-referencing-a-dsd',
  'Referential metadata download with the SDMX (restful) web service', '#referential-metadata-download-with-the-sdmx-restful-web-service',
]

---

#### Table of Content
- [Introduction](#introduction)
- [File format](#file-format)
  - [Higher-level referential metadata for dataflow or DSD](#higher-level-referential-metadata-for-dataflow-or-dsd)
  - [More details about the SDMX-CSV format](#more-details-about-the-sdmx-csv-format)
  - [Hierarchial referential metadata](#hierarchial-referential-metadata)
- [Referential metadata upload and copy](#referential-metadata-upload-and-copy)
  - [Copy of referential metadata referencing a DSD](#copy-of-referential-metadata-referencing-a-dsd)
- [Referential metadata download with the SDMX (restful) web service](#referential-metadata-download-with-the-sdmx-restful-web-service)

>*Version history:*  
> Link referential metadata to either dataflow or DSD, and copy DSD-level referential metadata since [December 6, 2023 release .Stat Suite .NET "gingerbread"](/dotstatsuite-documentation/changelog/#december-6-2023)  
> Supporting referential metadata value retrieval with SDMX-JSON 2.0 and transfer with [release .Stat Suite .NET 8.0.0 at March 23, 2022](/dotstatsuite-documentation/changelog/#march-23-2022)  
> Supporting referential metadata value upload and retrieval with SDMX-CSV 2.0 with [release .Stat Suite .NET 7.2.0 at December 3, 2021](/dotstatsuite-documentation/changelog/#december-3-2021)

---

### Introduction
.Stat Suite Core allows referential metadata to be uploaded, stored and retrieved.  
The upload is done using the transfer web service. The SDMX-CSV 2.0 file format is supported. See below. 
The download is done using the SDMX (NSI) web service. Two SDMX file formats are supported. See below.

The following features are supported:
- attach higher-level referential metadata to either a dataflow or a data structure definition (DSD)
- very long textual referential metadata (maximum 536,870,912 characters in total for all languages)
- [hierarchial referential metadata](#hierarchial-referential-metadata) attributes
- attach referential metadata to (at least) a time period value
- embargoing referential metadata in the same way as for (and together with) the data
- retrieve referential metadata attached at higher level than that of the query filter

The following features are currently not supported and might be implemented at a later stage:
- multiple values for referential metadata attributes
- upload formats other than SDMX-CSV 2.0 for referential metadata values 
- download formats other than SDMX-CSV 2.0 or SDMX-JSON 2.0 for referential metadata values 

While .Stat Suite uses the logical approach of the SDMX v3.0 Information Model for attaching referential metadata to data through an extension of the components defined in the Data Structure Definition (DSD) by referential metadata attributes defined in a Metadata Structure Definition (MSD), currently it continues to use the structures defined with the SDMX v2.1 Information Model. Therefore, instead of the in-built link between DSD and MSD in SDMX 3.0, .Stat Suite uses a specific DSD annotation.

![md-definition](/dotstatsuite-documentation/images/md-definition.png)

This DSD annotation is of `type` "Metadata" and links in its `title` to an MSD 2.1 artefact (through a URN), e.g.:

```xml
   <common:Annotations>
  	<common:Annotation>
  		<common:AnnotationTitle>urn:sdmx:org.sdmx.infomodel.metadatastructure.MetadataStructure=OECD:MSD_TEST(1.0)</common:AnnotationTitle>
  		<common:AnnotationType>Metadata</common:AnnotationType>
  	</common:Annotation>
  </common:Annotations>
```

The MSD is only used to determine the contained (hierarchical) referential metadata attributes and to add them to the DSD components as special attributes to the .Stat Core database. The metadata targets defined in the MSD are ignored. 

Referential metadata can be used in the .Stat Suite in the following way:

![md-flow](/dotstatsuite-documentation/images/md-flow.png)

---

### File format
The .Stat Suite supports the following **file formats** for referential metadata:  
- [SDMX-CSV version 2.0](https://github.com/sdmx-twg/sdmx-csv/tree/v2.0.0/data-message/docs/sdmx-csv-field-guide.md)
- [SDMX-JSON version 2.0](https://github.com/sdmx-twg/sdmx-json/tree/v2.0.0/data-message/docs/1-sdmx-json-field-guide.md) (download only)

In .Stat Suite Core, data and referential metadata cannot be up- or downloaded together (at the same time). The main reason is that the attachment of referential metadata values to specific combinations of dimension is defined in the data message itself and must be preserved. Note that in contrary to referential metadata, the attachments for normal attributes are necessarily defined in the Data Structure Definition (DSD).  

#### Higher-level referential metadata for dataflow or DSD
It is possible to upload and transfer higher-level referential metadata values either generically related to the whole DSD, or specifically to a dataflow. To upload those using the SDMX-CSV format see details in the [section below](#more-details-about-the-sdmx-csv-format)).

Depending on availability, querying higher-level referential metadata for a dataflow https://root/V2/data/dataflow/{agencyID}/{DF_ID}/{version}/ will return that attached to the dataflow and if not available instead the one attached to the datastructure.

**Current limitations:**
- Imports using SDMX-CSV 2.0 can be done either for higher-level referential metadata related to a datastructure or for any referential metadata related to a dataflow, but not both in the same file.
- In the case when the only import(s) of referential metadata are done using the DSD reference, then there will not be any initialization of mappingsets. This implies that, in this case, the referential metadata cannot be downloaded using the NSIWS. Such requests throw an error, saying that there are no mappingsets found for that dataflow. Make at least one upload referencing a dataflow.

#### More details about the SDMX-CSV format
The format of the .csv file for referential metadata must comply to the [SDMX-CSV version 2.0 format](https://github.com/sdmx-twg/sdmx-csv/tree/v2.0.0/data-message/docs/sdmx-csv-field-guide.md), which can be summarised roughtly as follow (see the original specification for detailed information):
- the first column: header row containing 'STRUCTURE' and each other row containing 'DATAFLOW' or 'DATASTRUCTURE'
- the second column: header row containing 'STRUCTURE_ID' and each other row containing the full dataflow identification 'agencyID:dataflowId(version)' e.g. 'AGENCY:DF_ID(1.0)', or the full DSD identification 'agencyID:datastructureId(version)' e.g. 'AGENCY:DSD_ID(1.0)'
- the third column (optional): header row containing 'ACTION' and each other row containing either 'I' for Information, 'A' for Append, 'M' for Merge, 'R' for Replace or 'D' for Delete. For more details see [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/ref-metadata/upload-referential-metadata/#supported-type-of-actions).
- one column for each dimension of the dataflow/datastructure: header row containing the dimension IDs and each other row containing the dimension value IDs to which the attribute values of this row are attached. It is left empty in rows where the attribute doesn't attach to that dimension.
- one column for each submitted referential metadata: header row containing the attribute ID and each other row containing the corresponding attribute values

**Example:**

```
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,DIM_3,METADATAATTR_1,METADATAATTR_2
dataflow,AGENCY:DF_ID(1.0.0),I,A,B,,N,
dataflow,AGENCY:DF_ID(1.0.0),A,A,B,,Y,
dataflow,AGENCY:DF_ID(1.0.0),R,,,2014-01,,”Value X”
dataflow,AGENCY:DF_ID(1.0.0),D,,,2014-02,,-
```
In spreadsheet format, this would look like:  
![md-csv-logical-example](/dotstatsuite-documentation/images/md-csv-logical-example.png)

The message for referential metadata values does not allow omitting dimension columns for referential metadata. All dimension columns must be present even if empty. Columns for referential metadata attributes that are not being transmitted can be omitted.

All textual values containing commas need to be encapsulated within double-quotes. All double-quotes inside these values are to be escaped using doubled double-quotes. In addition, the doubled double-quotes inside localised values using JSON syntax are escaped using a preceeding backslash '\', e.g.:

`"en: ""<a href=\""mailto:contact-en@my-org.org\"">contact-en@my-org.org</a>"",fr: ""<a href=\""mailto:contact-fr@my-org.org\"">contact-fr@my-org.org</a>"""`

As can be seen in this example, the language codes in localised JSON snippets do not need to be put into (doubled) double quotes.  
For more details about the referential metadata types supported by the data explorer display, see [this topic](/dotstatsuite-documentation/using-api/core-data-model/#referential-metadata-types).  
See [here](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/blob/master/content/OECD_SNA_TABLE1_1.0_-_AUS_metadata.csv) for an example of an SDMX-CSV file with referential metadata.

![dlm upload referential metadata csv file headers](/dotstatsuite-documentation/images/dlm-upload-referential-metadata-csv.png)

#### Hierarchial referential metadata
The referential metadata attribute hierarchy is defined in the Metadata Structure Definition (MSD) through imbricated attributes.

When referencing hierarchical metadata attributes in any data messages (whether SDMX-CSV or SDMX-JSON), the ID needs to contain all parent metadata attribute IDs separated by a dot '.', similarly to Categories in Categorisations or to sub-Agencies, e.g. `PARENT.CHILD1`.

The .Stat Suite Data Explorer currently has the following limitations for hierarchical referential metadata:
- Only one child level is supported
- Only values at child level are supported
- All parent attributes must have the isPresentational property set to true  

Example:  

![md-hierarchy-definition](/dotstatsuite-documentation/images/md-hierarchy-definition.png)

---

### Referential metadata upload and copy
The .Stat Suite Transfer web service is used to upload or copy referential metadata from one data space to another. See for more details:
- [Upload referential metadata from an SDMX-CSV 2.0 file](/dotstatsuite-documentation/using-api/ref-metadata/upload-referential-metadata/) 

Note: As the referential metadata values cannot be uploaded together with attribute and observation values at the same time (with the same SDMX-CSV 2.0 file), they need to be uploaded separately. The Transfer service automatically recognises the type of content.

The .Stat Core Transfer service also supports the transfer (copy) of data between data spaces, by using the API function `/transfer/dataflow`.  
The **`transferContent`** parameter of the `/transfer/dataflow` function allows:
- transferring both data and referential metadata (0) *- default option -*,
- transferring data only (1), or
- transferring referential metadata only (2).

Note that this method will transfer all referential metadata related to a dataflow, and not those referencing the DSD. For transferring only referential metadata referencing the DSD, see the section below.

#### Copy of referential metadata referencing a DSD
It is possible to transfer (copy) referential metadata referencing the DSD, by using the API function `/transfer/dsd`.  
Note that currently, this method is only accessible using the Swagger user interface of the transfer service (*https://transfer-env.domain.org/swagger/*). See more details [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer#post-21transferdsd-transfer-referential-metadata-changes-of-a-dsd-from-one-space-to-another) about the supported parameters of this method.

---

### Referential metadata download with the SDMX (restful) web service
Currently, referential metadata can be extracted with the SDMX service using only the SDMX-CSV 2.0 format or the SDMX-JSON 2.0 format.

The correcponding MIME-types are:
- Accept=application/vnd.sdmx.data+csv;version=2.0
- Accept=application/vnd.sdmx.data+csv;version=2.0.0
- Accept=application/vnd.sdmx.data+json;version=2.0
- Accept=application/vnd.sdmx.data+json;version=2.0.0

The SDMX (restful) web service provides a new API version that starts implementing the new SDMX API features defined for the SDMX 3.0 standard. Therefore, the URLs need to specify the new version, e.g.

https://server-root/v2/data/dataflow/[Agency]]/[dataflow-id]]/[version]]/[filter]]?[url-parameters]]

2 new query parameters are introduced that take precedence over the `detail` parameter:  

1) The `attributes` parameter allows selecting which attributes (including reference metadata) you want to retrieve, if any.
   - Values could be: all | none | **dsd** | msd | dataset | series | obs | [component id]
     - dsd: All the attributes defined in the data structure definitions (default)
     - msd: All the reference metadata attributes
     - unique: All the unique attributes 
     - series: All the attributes attached at series-level
     - obs: All the attributes attached at the observation-level
     - all: All the attributes
     - none: No attributes
     - [component id]: The ID of the attribute(s) the client is interested in
   - The parameter allows multiple values, separated by commas
   - Examples: attributes=unique,CONF_STATUS,OBS_STATUS (meaning any unique attribute, plus the confidentiality status, plus the observation status).
2) The `measures` parameters allows selecting which measures should be returned, if any. 
   - Values could be: **all** | none | [component id]
     - all: All the measures (default)
     - none: No measures
     - [component id]: The ID of the measure(s) the client is interested in

Queries using version 1 of the API with the `detail` parameter map as follow to the new parameters:
  - detail=**full** => attributes=**dsd** & measures=**all**
  - detail=dataonly => attributes=none & measures=**all**
  - detail=serieskeysonly => attributes=none & measures=none
  - detail=nodata => attributes=**dsd** & measures=none

Referential metadata are always extracted with their the original (dataflow or partial/full key) attachment for each metadata value.

The new SDMX 3.0 filter parameter in .Stat Suite SDMX web service uses the star `*` character to indicate dimensions without a filter value. This filter parameter also allows filtering by single dimension values only, e.g.

https://server-root/v2/data/dataflow/OECD/SNA_TABLE1/1.0/AUS.*.*?attributes=msd&measures=none

Because the more flexible SDMX 3.0 `c` URL parameter is not yet available in .Stat Suite SDMX web service, it is curently not possible to filter by several values of the same dimension using this API version. This will be added at a later stage.

Example:

https://server-root/v2/data/dataflow/OECD/SNA_TABLE1/1.0/AUS.*.*?attributes=msd&measures=none

By default, the .Stat Suite SDMX web service retrieves related referential metadata attached at ***higher and lower levels*** than that of the query filter.  
For instance, filtering for `AUS.*.A` would retrieve the attributes attached at the following levels:  
- AUS..A
- AUS..
- ..A
- ...
- AUS.GDP.A
- AUS.PPP.A

Using the Eurostat NSI SDMX web service, it is possible to limit the response to ***higher levels only*** by using the non-SDMX-standard HTTP request header `X-Level=upperOnly`.   
For instance, filtering for `AUS.*.A` would retrieve the attributes attached at the following levels only:  
- AUS..A
- AUS..
- ..A
- ...

This web service implementation also supports the HTTP header option `X-Level=currentOnly` to return only the ***exact level*** corresponding to the filter selection.
For instance, filtering for `AUS.*.A` would retrieve the attributes attached at the following level only:  
- AUS..A

The `updatedAfter` URL parameter is to be used with a date-time value (including the time zone) to retrieve only referential metadata that has been changed since that date-time.

**Example:**

`updatedAfter=2023-04-28T15:45:00+01:00`

For details, see [here](/dotstatsuite-documentation/using-api/data-synchronisation).

The HTTP `accept-language` header allows retrieving only specific locals.