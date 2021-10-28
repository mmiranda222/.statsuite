---
title: ".Stat RESTful Web Service Cheat Sheet"
subtitle: 
comments: false
weight: 6000
 'Introduction', '#introduction',
 'Structural metadata queries', '#structural-metadata-queries',
 'Examples of structural metadata queries', '#examples-of-structural-metadata-queries',
 'Data queries', '#data-queries',
 'Examples of data queries', '#examples-of-data-queries',
 'Supported formats', '#supported-formats',
---

#### Table of Content
- [Introduction](#introduction)
- [Structural metadata queries](#structural-metadata-queries)
- [Examples of structural metadata queries](#examples-of-structural-metadata-queries)
- [Data queries](#data-queries)
- [Examples of data queries](#examples-of-data-queries)
- [Supported formats](#supported-formats)

---

### Introduction
This cheat sheet is a quick reference description of the syntax and parameters for the .Stat RESTful API. It is adapted from the cheat sheet for the full [SDMX RESTful API](https://github.com/sdmx-twg/sdmx-rest/blob/master/doc/rest_cheat_sheet.pdf) with examples added for the .Stat context and the unsupported elements removed.  
You can also download this document as a [.docx](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/blob/9256239f1128a36174c7214c2aa316a22ffdf9e1/content/dotStat_REST_Cheat_Sheet.docx) file.

**Legend:**  
![API Restful](/dotstatsuite-documentation/images/api-resftul1.png)

---

### Structural metadata queries

![API Restful](/dotstatsuite-documentation/images/api-resftul2.png)

Each .Stat space has a different web service entry point which should- replace **`http[s]://.Stat space WS/resource`** in the above syntax.  
More options are available in the [full SDMX REST API standard](https://github.com/sdmx-twg/sdmx-rest/blob/master/v2_1/ws/rest/docs/rest_cheat_sheet.pdf?raw=true) but are not present or have not been fully tested in the .Stat web service, and do not appear here.  

![API Restful](/dotstatsuite-documentation/images/api-resftul3.png)

---

### Examples of structural metadata queries  
These examples use an entry point of https://nsi-demo-oecd-staging.siscc.org This may be swapped out for your target space.

| Use case | Example querystring |
|:-------------|:-------------|
| All data structures, all versions | https://nsi-demo-oecd-staging.siscc.org/rest/datastructure/all/all/all |
| A data structure and its references | https://nsi-demo-oecd-staging.siscc.org/rest/datastructure/OECD.CFE/TOURISM_TRIPS/2.0?references=all |
| Full Dataflow with complete concept schemes, codelists, categorisations and constraints | https://nsi-demo-oecd-staging.siscc.org/rest/dataflow/OECD.CFE/DOMESTIC@TOURISM_TRIPS/2.0?references=all |
| Full Dataflow with partial concept schemes, codelists, categorisations and content constraints containing only allowed and/or actually used items | https://nsi-demo-oecd-staging.siscc.org/rest/dataflow/OECD.CFE/DOMESTIC@TOURISM_TRIPS/2.0?references=all&detail=referencepartial |
| Latest versions of all Codelists | https://nsi-demo-oecd-staging.siscc.org/rest/codelist/all/all/latest |
| Latest versions of all codelists returned as stubs | https://nsi-demo-oecd-staging.siscc.org/rest/codelist/all/all/latest?detail=allstubs |
| A Concept Scheme | https://nsi-demo-oecd-staging.siscc.org/rest/conceptscheme/OECD.CFE/CS_TOURISM/latest |
| All category schemes (there is usually one), latest version | https://nsi-demo-oecd-staging.siscc.org/rest/categoryscheme/all/all/latest |
| All agency schemes | https://nsi-demo-oecd-staging.siscc.org/rest/agencyscheme/all/all/all |

**Note** that with the `detail=referencepartial` query parameter, the server automatically applies the **allowed** content constraint on the codelists (and other ItemSchemes) and returns only partial (and thus shorter) codelists.  
Using the query with the `references=all`, `references=constraint`, or `references=actualconstraint` parameter (with or without the `detail=referencepartial` parameter) returns a content constraint of type **actual** within the response if data was already uploaded. If such a content constraint is not returned by a .Stat Suite SDMX web service, then data was not yet uploaded or the underlying dataflow has not yetr been initialised.

---

### Data queries

![API Restful](/dotstatsuite-documentation/images/api-resftul4.png)

Each .Stat space has a different web service entry point which should replace https://ws-entry-point in the above syntax.  

![API Restful](/dotstatsuite-documentation/images/api-resftul5.png)

**Note** that in the .Stat Suite, the SDMX NSI web service is **configured to apply Allowed ContentConstraints** for both dimension values as well as attribute values to all data extractions:

config/Properties.json file:
```
{
  "applyContentConstraintsOnDataQueries": "true"
}
```

---

### Examples of data queries
These examples use an entry point of https://nsi-demo-oecd-staging.siscc.org. This may be swapped out for your target space.  

| Use case | Example querystring |
|:-------------|:-------------|
| All data for a Dataflow, time series view | https://nsi-demo-oecd-staging.siscc.org/rest/data/OECD.CFE,DOMESTIC@TOURISM_TRIPS,2.0 |
| All data for a partial key (Total Visitors measure), time series view | https://nsi-demo-oecd-staging.siscc.org/rest/data/OECD.CFE,DOMESTIC@TOURISM_TRIPS,2.0/..TOTAL_VISITORS........ |
| All data for a partial key (Argentina, Total Visitors measure, Annual frequency), time series view | https://nsi-demo-oecd-staging.siscc.org/rest/data/OECD.CFE,DOMESTIC@TOURISM_TRIPS,2.0/AU..TOTAL_VISITORS........A |
| Annual data for period 2010-2020 in a flat view | https://nsi-demo-oecd-staging.siscc.org/rest/data/OECD.CFE,DOMESTIC@TOURISM_TRIPS,2.0/.........A?startPeriod=2010&endPeriod=2020&dimensionAtObservation=AllDimensions |
| Dataflow with only 1 observation returned for each of the matching series, starting from the first observation | https://nsi-qa-stable.siscc.org/rest/data/OECD.CFE,DOMESTIC@TOURISM_TRIPS,2.0/all?firstNObservations=1 |
| Dataflow with only 1 observation returned for each of the matching series, counting back from the most recent observation | https://nsi-qa-stable.siscc.org/rest/data/OECD.CFE,DOMESTIC@TOURISM_TRIPS,2.0/all?lastNObservations=1 |

![API Restful](/dotstatsuite-documentation/images/api-resftul6.png)

---

### Supported formats
“Parameter” in the tables below is used with the Accept HTTP header (see the Useful HTTP headers above)**  

![API Restful](/dotstatsuite-documentation/images/api-resftul7.png)
