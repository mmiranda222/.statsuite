---
title: "Data synchronisation between data spaces"
subtitle: 
comments: false
weight: 7000
keywords: [
  'SDMX updatedAfter feature', '#sdmx-updatedafter-feature',
]

---

#### Table of Content
- [SDMX updatedAfter feature](#sdmx-updatedafter-feature)

This section describes the implementation of the SDMX `updatedAfter` feature for data space synchronisations in the .Stat Suite.

> *Version history:*  
> `updatedAfter` feature introduced with [July 4, 2023 Release .Stat Suite dragonfruit](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#july-4-2023)

---

### SDMX updatedAfter feature
This feature covers the use case when the data and referential metadata content of a target data space is to be kept synchronised in an efficient manner with the content of a source data space. To avoid regularly retransferring the complete content, the `updatedAfter` feature allows transferring only the content that has been changed (inserted, updated, deleted) since the previous synchronisation execution, and so to minimise the content to be extracted from the source data space and re-uploaded in the target data space. The content transferred with the `updatedAfter` feature thus also includes the information about the deleted content in the source data space. This content may be specified differently from the way the data has been first uploaded into the source data space. However, uploading this content on the target data space assures a fully synchronised state. 

The `updatedAfter` feature is supported in the SDMX (NSI) web service for content downloads from a source data space and by the Transfer service for the copy of content between data spaces. 

The response message of the SDMX (NSI) web service to a query with the `updatedAfter` parameter contains one or more SDMX datasets with the actions `Delete` and `Replace`. Like for other content downloads, also the content download using the `updatedAfter` feature needs separate calls for measure and attribute values and for referential metadata values.

See [here](https://github.com/sdmx-twg/sdmx-rest/blob/master/doc/data.md#syntax) the SDMX definition of the `updatedAfter` URL parameter in the SDMX restful web service. The parameter takes an [xs:dateTime](https://www.w3.org/TR/xmlschema-2/#dateTime) value that should correspond to the last time the synchronisation query was performed by the client. **It is strongly recommended to specify the time zone of the client, e.g., `+01:00`, in the `updatedAfter` parameter value.** If the time zone offset is not specified, then the NSI SDMX web service uses its local time instead.

**Example:**

`updatedAfter=2023-04-28T15:45:00+01:00`

**Important notes:** 

1) Developers who update their local databases should make use of the `updatedAfter` parameter as it is likely to significantly improve performance. Instead of systematically downloading data that may not have changed, only the consolidated changes to be made in your database since the last time your client performed the same query would be received.

2) The `updatedAfter` feature only fully synchronises the content that has been uploaded in the source data space for a specific dataflow, even if other dataflows overlap in their scope. This applies especially for deleted content. In order to assure a full synchronisation between two data spaces for a Data Structure Definition always use a dataflow that has no allowed content constraint. Alternatively, execute the synchronisation for all of the related dataflows.   

3) URL parsers, as the one used in the NSI SDMX web service, may need the time zone prefix `+` to be provided in encoded format as `%2B`, e.g.,:  
  [https://nsi-demo-stable.siscc.org/rest/data/TN1,MILLED_RICE,1.0/all?updatedAfter=2023-04-26T00:13:42%2B01:00](https://nsi-demo-stable.siscc.org/rest/data/TN1,MILLED_RICE,1.0/all?updatedAfter=2023-04-26T00:13:42%2B01:00)  
  For full details about URL encoding, see the Uniform Resource Locators (URL) Specification at the following location: http://www.rfc-editor.org/rfc/rfc1738.txt