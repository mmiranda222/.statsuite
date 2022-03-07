---
title: "Referential metadata features"
subtitle: 
comments: false
weight: 4900
keywords: [
  'Referential metadata implementation in the .Stat Suite', '#referential-metadata-implementation-in-the-stat-suite',
  'Referential metadata upload', '#referential-metadata-upload',
  'Referential metadata download with the SDMX (restful) web service', '#referential-metadata-download-with-the-sdmx-restful-web-service',
  'Hierarchial referential metadata', '#hierarchial-referential-metadata',
]

---

#### Table of Content
- [Referential metadata implementation in the .Stat Suite](#referential-metadata-implementation-in-the-stat-suite)
- [Referential metadata upload](#referential-metadata-upload)
- [Referential metadata download with the SDMX (restful) web service](#referential-metadata-download-with-the-sdmx-restful-web-service)
- [Hierarchial referential metadata](#hierarchial-referential-metadata)

---

### Referential metadata implementation in the .Stat Suite
The following features are supported:

- [hierarchial referential metadata](#hierarchial-referential-metadata) attributes
- attach referential metadata to (at least) a time period value
- embargoing referential metadata in the same way as for (and together with) the data
- retrieve referential metadata attached at higher level than that of the query filter

The following features are currently not supported and might be implemented at a later stage:
- multiple values for referential metadata attributes
- download formats other than SDMX-CSV for referential metadata values (Excel, xml or json) 

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

### Referential metadata upload
Currently, referential metadata can only be uploaded with the .Stat Core transfer service using the SDMX-CSV 2.0 format. For more information, see [upload referential metadata](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/upload-data/upload-refeential-metadata/).

The .Stat Suite Data Liffecycle manager also supports uploading these files.

---

### Referential metadata download with the SDMX (restful) web service
Currently, referential metadata can only be extracted with the SDMX service using the SDMX-CSV 2.0 format or the SDMX-JSON 2.0 format.

The correcponding MIME-types are:
- Accept=application/vnd.sdmx.data+csv;version=2.0
- Accept=application/vnd.sdmx.data+csv;version=2.0.0
- Accept=application/vnd.sdmx.data+json;version=2.0
- Accept=application/vnd.sdmx.data+json;version=2.0.0

The SDMX-CSV 2.0 message format is defined [here](https://github.com/sdmx-twg/sdmx-csv/tree/v2.0.0/data-message/docs/sdmx-csv-field-guide.md).  
The SDMX-JSON 2.0 message format is defined [here](https://github.com/sdmx-twg/sdmx-json/blob/v2.0.0/data-message/docs/1-sdmx-json-field-guide.md).

The SDMX (restful) web service provides a new API version that starts implementing the new SDMX API features defined for the SDMX 3.0 standard. Therefore, the URLs need to specify the new version, e.g.

https://server-root/v2/data/dataflow/[Agency]]/[dataflow-id]]/[version]]/[filter]]?[url-parameters]]

2 new query parameters are introduced (that take precedence over the `detail` parameter):  

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

By default, the .Stat Suite SDMX web service retrieves referential metadata attached at *higher and lower* levels than that of the query filter.  
For instance, filtering for `AUS.*.A` would retrieve the attributes attached at the following levels:  
- AUS..A
- AUS..
- ..A
- ...
- AUS.GDP.A
- AUS.PPP.A

It is possible to limit the response to higher levels only by using the (non SDMX standard) HTTP request header `X-Level=upperOnly`.   
For instance, filtering for `AUS.*.A` would retrieve the attributes attached at the following levels only:  
- AUS..A
- AUS..
- ..A
- ...

---

### Hierarchial referential metadata
The referential metadata attribute hierarchy is defined in the Metadata Structure Definition (MSD) through imbricated attributes.

When referencing hierarchical metadata attributes in any data messages (whether SDMX-CSV or SDMX-JSON), the ID needs to contain all parent metadata attribute IDs separated by a dot '.', similarly to Categories in Categorisations or to sub-Agencies, e.g. `PARENT.CHILD1`.

The .Stat Suite currently has the following limitations for hierarchical referential metadata:

- Only one child level is supported
- Only values at child level are supported
- All parent attributes must have the isPresentational property set to true  

Example:  

![md-hierarchy-definition](/dotstatsuite-documentation/images/md-hierarchy-definition.png)
