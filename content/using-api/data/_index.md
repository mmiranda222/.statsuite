---
title: "Data features"
subtitle: 
comments: false
weight: 4300
keywords: [
  'Introduction', '#introduction',
  'File formats', '#file-formats',
  'More details about the SDMX-CSV format', '#more-details-about-the-sdmx-csv-format',
  'Data upload and copy', '#data-upload-and-copy',
  'Auto-generation of Actual Content Constraints', '#auto-generation-of-actual-content-constraints',
  'Data download with the SDMX (restful) web service', '#data-download-with-the-sdmx-restful-web-service',
  'Time-machine features', '#time-machine-features',
]
---

#### Table of Content
- [Introduction](#introduction)
- [File formats](#file-formats)
  - [More details about the SDMX-CSV format](#more-details-about-the-sdmx-csv-format)
- [Data upload and copy](#data-upload-and-copy)
  - [Auto-generation of Actual Content Constraints](#auto-generation-of-actual-content-constraints)
- [Data download with the SDMX (restful) web service](#data-download-with-the-sdmx-restful-web-service)
  - [Time-machine features](#time-machine-features)

> *Version history:*  
> 'asOf' and 'includeHistory' parameters introduced with [December 6, 2023 Release .Stat Suite .NET "gingerbread"](/dotstatsuite-documentation/changelog/#december-6-2023)  
> Data upload supported in SDMX-CSV version 2.0 file format, and including combined actions (Information, Append, Merge, Replace, Delete) since [September 22, 2022 Release .Stat Suite .NET 'blueberry'](/dotstatsuite-documentation/changelog/#september-22-2022)

---

### Introduction
.Stat Suite Core allows Data (measure and attribute values) to be uploaded, stored and retrieved.  
The upload is done using the transfer web service. SDMX and Excel file formats are supported. See below.  
The download is done using the SDMX (NSI) web service. SDMX file formats are supported. See below.

The following features are supported:

- the data types are defined in the DSD. Measure values (observation values) can be of any SDMX type, e.g. float, double or string. String types allow for up to 536,870,912 characters, unless further restricted by an SDMX string max length.
- by default, textual attribute values of up to 150 (configurable in Transfer service) characters are supported. However, a DSD annotation MAXTEXTATTRIBUTELENGTH can be used to increase this support. When this values is 0 or greater than 4000, then the attribute values can have up to 536,870,912 characters.
- data can be embargoed. Only 1 active embargo per DSD is supported. All data uploaded while the embargo is active are addded to the embargo scope.

---

### File formats
The .Stat Suite supports the following **file formats** for data:  
- [SDMX-CSV version 1.0](https://github.com/sdmx-twg/sdmx-csv/tree/v1.0/data-message/docs/sdmx-csv-field-guide.md)
- [SDMX-CSV version 2.0](https://github.com/sdmx-twg/sdmx-csv/tree/v2.0.0/data-message/docs/sdmx-csv-field-guide.md)
- [SDMX-ML version 2.0 and 2.1](https://github.com/sdmx-twg/sdmx-ml) (2.1 generic and data-specific formats, 2.0 generic and compact formats)
- [SDMX-JSON version 1.0](https://github.com/sdmx-twg/sdmx-json/tree/v1.0/data-message) (download only)
- [SDMX-JSON version 2.0](https://github.com/sdmx-twg/sdmx-json/tree/v2.0.0/data-message) (download only)
- [Excel file & Excel-Data-Definition (EDD) file](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/data/upload-data-edd/) (upload only)  

In .Stat Suite Core, data and referential metadata cannot be up- or downloaded together (at the same time). The main reason is that the attachment of referential metadata values to specific combinations of dimension is defined in the data message itself and must be preserved. Note that in contrary to referential metadata, the attachments for normal attributes are necessarily defined in the Data Structure Definition (DSD).  

#### More details about the SDMX-CSV format
The [SDMX-CSV version 1.0](https://github.com/sdmx-twg/sdmx-csv/tree/v1.0/data-message/docs/sdmx-csv-field-guide.md) format can be summarised roughtly as follow:
- the first column: header row containing 'DATAFLOW' and each other row containing the full dataflow identification 'agencyID:dataflowId(version)' e.g. 'AGENCY:DF_ID(1.0)'
- one column for each dimension of the dataflow: header row containing the dimension IDs and each other row containing the dimension value IDs to which the measure and attribute values of this row are attached.
- one column for each measure and attribute: header row containing the measure or attribute ID and each other row containing the corresponding values.

**Example:**

```txt
DATAFLOW,DIM_1,DIM_2,DIM_3,OBS_VALUE,DATAATTR_1,DATAATTR_1
AGENCY:DF_ID(1.0.0),A,B,2014-01,12345,N,”Value X”
AGENCY:DF_ID(1.0.0),A,B,2014-02,67890,Y,”Value Y"
```

The [SDMX-CSV version 2.0](https://github.com/sdmx-twg/sdmx-csv/tree/v2.0.0/data-message/docs/sdmx-csv-field-guide.md) format can be summarised roughtly as follow:
- the first column: header row containing 'STRUCTURE' and each other row containing 'dataflow'
- the second column: header row containing 'STRUCTURE_ID' and each other row containing the full dataflow identification 'agencyID:dataflowId(version)' e.g. 'AGENCY:DF_ID(1.0)'
- the third column (optional): header row containing 'ACTION' and each other row containing either 'I' for Information, 'A' for Append, 'M' for Merge, 'R' for Replace or 'D' for Delete. For more details see [here](/dotstatsuite-documentation/using-api/ref-metadata/upload-referential-metadata/#supported-type-of-actions).
- one column for each dimension of the dataflow: header row containing the dimension IDs and each other row containing the dimension value IDs to which the measure and attribute values of this row are attached. Dimension values can be left empty when only submitting higher-level attributes and the attribute is not attached to that dimension.
- one column for each measure and attribute: header row containing the measure or attribute ID and each other row containing the corresponding values.

**Example:**

```txt
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,DIM_3,OBS_VALUE,DATAATTR_1,DATAATTR_1
dataflow,AGENCY:DF_ID(1.0.0),I,A,B,2014-01,12345,N,”Value X”     <--Merge supplied data
dataflow,AGENCY:DF_ID(1.0.0),A,A,B,2014-02,67890,Y,”Value Y"     <--Merge supplied data
dataflow,AGENCY:DF_ID(1.0.0),M,A,B,2014-01,23456,,               <--Merge supplied data
dataflow,AGENCY:DF_ID(1.0.0),R,A,B,2014-01,12345,Y,”Value X”     <--Replace time series
dataflow,AGENCY:DF_ID(1.0.0),D,,,2014-02,,-                      <--Wildcard deletion of specified measures and/or attributes
```

The message for data values allows omitting columns for dimensions, measures and attributes that are not needed. However:
- There needs to be **at least one column for measures and/or attributes** or **at least one column for reference metadata attributes**. This allows the transfer service to know if data or reference metadata are concerned.
- The columns for all dimensions used in the attachment of any of the presented measure, attribute or reference metadata columns need to be present. E.g., if the OBS_VALUE column is present then all dimension columns are required. If only a time-series-level attribute is present then the TIME_PERIOD dimension column doesn't need to be present. If only a dataflow-level attribute column is present then none of the dimension columns are required. 

All textual values containing commas need to be encapsulated within double-quotes. All double-quotes inside these values are to be escaped using doubled double-quotes, e.g.:  
`"This is an ""example"", and this one ""too"""`

---

### Data upload and copy
The .Stat Suite Transfer web service is used to upload data or copy data from one data space to another. See for more details:
- [Upload data from an SDMX file](/dotstatsuite-documentation/using-api/data/upload-data-sdmx-file/)
- [Upload data from an Excel file](/dotstatsuite-documentation/using-api/data/upload-data-edd/)

Note: As the attribute and observation values cannot be uploaded together with referential metadata at the same time (with the same SDMX-CSV 2.0 file), they need to be uploaded separately. The Transfer service automatically recognises the type of content.

The .Stat Core Transfer service also supports the transfer (copy) of data between data spaces, by using the API function `/transfer/dataflow`.  
The **`transferContent`** parameter of the `/transfer/dataflow` function allows:
- transferring both data and referential metadata (0) *- default option -*,
- transferring data only (1), or
- transferring referential metadata only (2).

#### Auto-generation of Actual Content Constraints
When data are uploaded or copied, then the .Stat Core system automatically (re-)generates **Actual Content Constraints** for all dataflows impacted by the upload or copy.  
- The IDs of auto-generated Actual Content Constraints are prefixed by "`CR_A_`" or "`CR_B_`", e.g. "`CR_A_DATAFLOWID`" and "`CR_B_DATAFLOWID`".
- The names of auto-generated Actual Content Constraints are construced using "`Availability (A) for `" or "`Availability (B) for `" and the *name* of the dataflow, e.g. "`Availability (A) for Dataflow name`" and "`Availability (B) for Dataflow name`"
- Behind the scenes, the Actual Content Constraints are linked to their related fact table version (A or B) they relate to.
- The user (and client applications) will know which Actual Content Constraint is currently valid **through the (automatically updated) validity dates of the actual content constraints**. Clients can thus ignore the "A/B" info, and instead fully rely on the validity dates to decide which one is the currently valid actual content constraint.
- For Point-in-Time (PIT) releases, the following rules apply to the validity dates of the Actual Content Constraints:
   * When there is not a PIT version: There will be only one actual content constraint, for the currently active version, with *no start date* and *no end date*
   * When there is a PIT version with PIT date: The actual content constraint for the pre-PIT version will have *no start date* and ***(1 second before) the PIT date as end date***, the actual content constraint for the PIT version will have the ***PIT date as start date*** and *no end date*
   * When there is a PIT version without user PIT date: The actual content constraint for the pre-PIT version will have *no start date* and *no end date*, the actual content constraint for the PIT version will have the *max value in C# and MS SQL/Oracle/MySQL db servers (9999-12-31 23:59:59) as start date* and *no end date*.

---

### Data download with the SDMX (restful) web service
Currently, data can be extracted with the SDMX service using only the SDMX formats.  
The **SDMX (restful) web service** provides a new API version that starts implementing the new SDMX API features defined for the SDMX 3.0 standard. Therefore, the URLs need to specify the new version, e.g.

**https://server-root/v2/data/dataflow/[Agency]]/[dataflow-id]]/[version]]/[filter]]?[url-parameters]]**

2 new query parameters are introduced that take precedence over the **`detail`** parameter:  

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

Queries using version 1 of the API with the `detail` parameter maps as follow to the new parameters:
  - detail=**full** => attributes=**dsd** & measures=**all**
  - detail=dataonly => attributes=none & measures=**all**
  - detail=serieskeysonly => attributes=none & measures=none
  - detail=nodata => attributes=**dsd** & measures=none

The new SDMX 3.0 filter parameter in .Stat Suite SDMX web service uses the star `*` character to indicate dimensions without a filter value. This filter parameter also allows filtering by single dimension values only, e.g. `https://server-root/v2/data/dataflow/OECD/SNA_TABLE1/1.0/AUS.*.*`

**NOTE:** Because the more flexible SDMX 3.0 `c` URL parameter is not yet available in .Stat Suite SDMX web service, it is curently not possible to filter by several values of the same dimension using this API version. This will be added at a later stage.

#### Time-machine features
##### updatedAfter
The **`updatedAfter`** URL parameter is to be used with a date-time value (including the time zone) to retrieve only data that has been changed since that date-time.

**Example:**

`updatedAfter=2023-04-28T15:45:00+01:00`

For details, see [here](/dotstatsuite-documentation/using-api/data-synchronisation).

The SDMX web service implementation also supports the HTTP header option `X-Range` to return only a sub-range of data. 
For instance, filtering for `X-Range: values=0-2999` would retrieve the first 3000 observations.

For message formats with localised elements, the HTTP `accept-language` header allows retrieving only specific locals.

##### asOf
The `asOf` URL paramater is used with a date-time value to retrive a specific version of the matching data, as it was disseminated at a specific point in time in the past.

The properties `validFromDate` and `validToDate` of the returned queries are both set to the value of `asOf` to indicate the period of validity for the data contained in each data set. The dataset action property is set to "Information".  
This is supported in SDMX-CSV version 2.0, SDMX-ML and SDMX-Json formats.

**Example:**

When querying with URL paramater  

`asOf=2023-27-11T15:45:00Z`

Then data message in SDMX-CSV version 2.0 format can contain the following:

```txt
STRUCTURE,STRUCTURE_ID,ACTION,DIM_1,DIM_2,TIME_PERIOD,OBS_VALUE,OBS_ATTR,TS_ATTR,GR_ATTR,DF_ATTR,VALID_FROM,VALID_TO
DATAFLOW,OECD.SDD.SDPS:DF_TEST_TIME_MACHINE(1.0),I,,,,,,,,DF,2023-27-11T15:45:00Z,2023-27-11T15:45:00Z
DATAFLOW,OECD.SDD.SDPS:DF_TEST_TIME_MACHINE(1.0),I,C,C,,,,CC,C,DF,2023-27-11T15:45:00Z,2023-27-11T15:45:00Z
DATAFLOW,OECD.SDD.SDPS:DF_TEST_TIME_MACHINE(1.0),I,C,C,2022,4367,C,,,DF,2023-27-11T15:45:00Z,2023-27-11T15:45:00Z
DATAFLOW,OECD.SDD.SDPS:DF_TEST_TIME_MACHINE(1.0),I,B,C,,,,BC,C,DF,2023-27-11T15:45:00Z,2023-27-11T15:45:00Z
DATAFLOW,OECD.SDD.SDPS:DF_TEST_TIME_MACHINE(1.0),I,B,C,2022,7689,C,,,DF,2023-27-11T15:45:00Z,2023-27-11T15:45:00Z
```

##### includeHistory
The **`includeHistory`** URL parameter is used to retrieve previous versions of the matching data, as they were disseminated in the past. This is useful to see how the data has evolved over time, i.e. when new data has been released or when data has been revised or deleted.  
When `includeHistory` is set to true (false by default), then the returned data message can contain many datasets, depending on the number of data updates and deletions. The DataSet properties `validFromDate` and/or `validToDate` are used to indicate the period of validity for the data contained in each data set. The dataset action property is set to Information.  
This is supported in SDMX-CSV version 2.0, SDMX-ML and SDMX-Json formats.

**Example:**

Querying with URL paramater 

`includeHistory=true`

Note also that the `includeHistory` parameter can be combined with the `updatedAfter` parameter in order to return only the history between the point in time specified in `updatedAfter` and today.