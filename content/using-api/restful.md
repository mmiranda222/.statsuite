---
title: ".Stat SDMX RESTful Web Service Cheat Sheet"
subtitle: 
comments: false
weight: 6000
keywords: [
 'Introduction', '#introduction',
 'Structural metadata queries', '#structural-metadata-queries',
 'Examples of structural metadata queries', '#examples-of-structural-metadata-queries',
 'Data queries', '#data-queries',
 'Examples of data queries', '#examples-of-data-queries',
 'Supported formats', '#supported-formats',
 'Referential metadata queries', '#referential-metadata-queries',
]
---

#### Table of Content
- [Introduction](#introduction)
- [Structural metadata queries](#structural-metadata-queries)
- [Examples of structural metadata queries](#examples-of-structural-metadata-queries)
- [Data queries](#data-queries)
- [Examples of data queries](#examples-of-data-queries)
- [Supported formats](#supported-formats)
- [Referential metadata queries](#referential-metadata-queries)

---

### Introduction
This cheat sheet is a quick reference description of the most frequently used syntax and parameters for the .Stat SDMX RESTful API. It is derived from the full [SDMX cheat sheet](https://github.com/sdmx-twg/sdmx-rest/blob/v1.5.0/v2_1/ws/rest/docs/rest_cheat_sheet.pdf) of the [SDMX RESTful API 1.5 standard](https://github.com/sdmx-twg/sdmx-rest/tree/v1.5.0/v2_1/ws/rest/docs) with examples added for the .Stat context and the unsupported elements removed.  
You can also download this document as a [.docx](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/blob/9256239f1128a36174c7214c2aa316a22ffdf9e1/content/dotStat_REST_Cheat_Sheet.docx) file.

**Colour legend:**  
![API Restful](/dotstatsuite-documentation/images/api-resftul1.png)

---

### Structural metadata queries

![API Restful](/dotstatsuite-documentation/images/api-resftul2.png)

Each .Stat data space has a different web service entry point, which should replace **`http[s]://.Stat space WS`** in the above syntax.  

![API Restful](/dotstatsuite-documentation/images/api-resftul4.png)

Other features defined in the [SDMX REST API 1.5 standard](https://github.com/sdmx-twg/sdmx-rest/tree/v1.5.0/v2_1/ws/rest/docs) may not necessarily be implemented and available in the .Stat SDMX (NSI) web service.  

---

### Examples of structural metadata queries  
For demonstration purposes, these examples use the SIS-CC demo SDMX web service instance at https://nsi-demo-stable.siscc.org.

| Use case | Example querystring |
|:-------------|:-------------|
| All data structures, all versions returned as stubs | https://nsi-demo-stable.siscc.org/rest/datastructure/all/all/all?detail=allstubs |
| A data structure and its references | https://nsi-demo-stable.siscc.org/rest/datastructure/OECD.CFE/TOURISM_TRIPS/2.0?references=all |
| Full Dataflow with complete concept schemes, codelists, categorisations and constraints | https://nsi-demo-stable.siscc.org/rest/dataflow/OECD.CFE/INBOUND@TOURISM_TRIPS/2.0?references=all |
| Full Dataflow with partial concept schemes, codelists, categorisations and content constraints containing only allowed and/or actually used items | https://nsi-demo-stable.siscc.org/rest/dataflow/OECD.CFE/INBOUND@TOURISM_TRIPS/2.0?references=all&detail=referencepartial |
| Latest versions of all codelists returned as stubs | https://nsi-demo-stable.siscc.org/rest/codelist/all/all/latest?detail=allstubs |
| A Concept Scheme | https://nsi-demo-stable.siscc.org/rest/conceptscheme/OECD.CFE/CS_TOURISM/latest |
| All category schemes (there is usually one), latest version returned as stubs | https://nsi-demo-stable.siscc.org/rest/categoryscheme/all/all/latest?detail=allstubs |
| All agency schemes returned as stubs | https://nsi-demo-stable.siscc.org/rest/agencyscheme/all/all/all?detail=allstubs |

**Note** that with the `detail=referencepartial` query parameter, the server automatically applies the **allowed** content constraint on the codelists (and other ItemSchemes) and returns only partial (and thus shorter) codelists.  
Using the query for a dataflow with the `references=all`, `references=constraint`, or `references=actualconstraint` parameter (with or without the `detail=referencepartial` parameter) also returns a content constraint of type **actual** within the response if data was already uploaded or if the underlying dataflow was 'initialised'. If such a content constraint is not returned by a .Stat Suite SDMX web service, then data was not yet uploaded or the underlying dataflow has not yet been 'initialised'.

---

### Data queries

![API Restful](/dotstatsuite-documentation/images/api-resftul3.png)

Each .Stat space has a different web service entry point which should replace **`http[s]://ws-entry-point`** in the above syntax.  

![API Restful](/dotstatsuite-documentation/images/api-resftul5.png)

Other features defined in the [SDMX REST API 1.5 standard](https://github.com/sdmx-twg/sdmx-rest/tree/v1.5.0/v2_1/ws/rest/docs) may not necessarily be implemented and available in the .Stat SDMX (NSI) web service.

**Note** that in the .Stat Suite, the SDMX NSI web service is **configured to apply Allowed ContentConstraints** for both dimension values as well as attribute values to all data extractions:

config/Properties.json file:
```
{
  "applyContentConstraintsOnDataQueries": "true"
}
```

---

### Examples of data queries
For demonstration purposes, these examples use the SIS-CC demo SDMX web service instance at https://nsi-demo-stable.siscc.org.   

| Use case | Example querystring |
|:-------------|:-------------|
| All data for a Dataflow, time series view | https://nsi-demo-stable.siscc.org/rest/data/OECD.CFE,INBOUND@TOURISM_TRIPS,2.0 |
| All data for a partial key (Total Visitors measure), time series view | https://nsi-demo-stable.siscc.org/rest/data/OECD.CFE,INBOUND@TOURISM_TRIPS,2.0/..TOTAL_VISITORS........ |
| All data for a partial key (Argentina, Total Visitors measure, Annual frequency), time series view | https://nsi-demo-stable.siscc.org/rest/data/OECD.CFE,INBOUND@TOURISM_TRIPS,2.0/AU..TOTAL_VISITORS........A |
| Annual data for period 2010-2020 in a flat view | https://nsi-demo-stable.siscc.org/rest/data/OECD.CFE,INBOUND@TOURISM_TRIPS,2.0/.........A?startPeriod=2010&endPeriod=2020&dimensionAtObservation=AllDimensions |
| Dataflow with only 1 observation returned for each of the matching series, starting from the first observation | https://nsi-demo-stable.siscc.org/rest/data/OECD.CFE,INBOUND@TOURISM_TRIPS,2.0/all?firstNObservations=1 |
| Dataflow with only 1 observation returned for each of the matching series, counting back from the most recent observation | https://nsi-demo-stable.siscc.org/rest/data/OECD.CFE,INBOUND@TOURISM_TRIPS,2.0/all?lastNObservations=1 |

![API Restful](/dotstatsuite-documentation/images/api-resftul6.png)

---

### Supported formats
“Parameter” in the tables below is used with the Accept HTTP header (see the Useful HTTP headers above)**  

![API Restful](/dotstatsuite-documentation/images/api-resftul7.png)

---

### Referential metadata queries
Please see [here](/dotstatsuite-documentation/using-api/ref-metadata).
