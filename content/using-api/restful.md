---
title: ".Stat RESTful Web Service Cheat Sheet"
subtitle: 
comments: false
weight: 4500

---

This cheat sheet is a quick reference description of the syntax and parameters for the .Stat RESTful API. It is adapted from the cheat sheet for the full [SDMX RESTful API](https://github.com/sdmx-twg/sdmx-rest/blob/master/v2_1/ws/rest/docs/rest_cheat_sheet.pdf?raw=true) with examples added for the .Stat context and the unsupported elements removed.  
You can also download this document as a [.docx](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/blob/9256239f1128a36174c7214c2aa316a22ffdf9e1/content/dotStat_REST_Cheat_Sheet.docx) file.

**Legend:**  
![API Restful](/dotstatsuite-documentation/images/api-resftul1.png)

---

**Structural metadata queries:**  
![API Restful](/dotstatsuite-documentation/images/api-resftul2.png)

Each a .Stat space has a different web service entry point which should- replace **`http[s]://.Stat space WS/resource`** in the above syntax.  

More options are available in the [full SDMX REST API standard](https://github.com/sdmx-twg/sdmx-rest/blob/master/v2_1/ws/rest/docs/rest_cheat_sheet.pdf?raw=true) but are not present or have not been fully tested in the .Stat web service, and do not appear here.  

![API Restful](/dotstatsuite-documentation/images/api-resftul3.png)

**Examples of structural metadata queries**  
These examples use an entry point of http://nsi-staging-oecd.redpelicans.com/ This may be swapped out for your target space.

| Use case | Example querystring |
|:-------------|:-------------|
| All data structures, all versions | http://nsi-staging-oecd.redpelicans.com/rest/datastructure/all/all/all |
| A data structure and its references | http://nsi-staging-oecd.redpelicans.com/rest/datastructure/OECD.CFE/DSD_TOURISM_TRIPS/5.0?references=all |
| Full Dataflow with concept schemes, codelists, categorisations and constraints | http://nsi-staging-oecd.redpelicans.com/rest/dataflow/OECD.CFE/DF_DOMESTIC_TOURISM/5.0?references=all |
| Full Dataflow with partial concept schemes, codelists, categorisations and content constraints | http://nsi-staging-oecd.redpelicans.com/rest/dataflow/OECD.CFE/DF_DOMESTIC_TOURISM/5.0?references=all&detail=referencepartial |
| Latest versions of all Codelists | http://nsi-staging-oecd.redpelicans.com/rest/codelist/all/all/latest |
| Latest versions of all codelists returned as stubs | http://nsi-staging-oecd.redpelicans.com/rest/codelist/all/all/latest?detail=allstubs |
| A Concept Scheme | http://nsi-staging-oecd.redpelicans.com/rest/conceptscheme/OECD.CFE/CS_TOURISM/latest |
| All category schemes (there is usually one), latest version | http://nsi-staging-oecd.redpelicans.com/rest/categoryscheme/all/all/latest |
| All agency schemes | http://nsi-staging-oecd.redpelicans.com/rest/agencyscheme/all/all/all |

---

**Data queries:**  
![API Restful](/dotstatsuite-documentation/images/api-resftul4.png)

Each a .Stat space has a different web service entry point which should replace https://ws-entry-point in the above syntax.  

![API Restful](/dotstatsuite-documentation/images/api-resftul5.png)

**Examples of data queries**  
These examples use an entry point of http://nsi-staging-oecd.redpelicans.com. This may be swapped out for your target space.  

| Use case | Example querystring |
|:-------------|:-------------|
| All data for a Dataflow, time series view | http://nsi-staging-oecd.redpelicans.com/rest/data/OECD.CFE,DF_DOMESTIC_TOURISM,5.0 |
| All data for a partial key (Total Visitors measure), time series view | http://nsi-staging-oecd.redpelicans.com/rest/data/OECD.CFE,DF_DOMESTIC_TOURISM,5.0/..TOTAL_VISITORS........ |
| All data for a partial key (Argentina, Total Visitors measure, Annual frequency), time series view | http://nsi-staging-oecd.redpelicans.com/rest/data/OECD.CFE,DF_DOMESTIC_TOURISM,5.0/AR..TOTAL_VISITORS........A |
| Annual data for period 2010-2020 in a flat view | http://nsi-staging-oecd.redpelicans.com/rest/data/OECD.CFE,DF_DOMESTIC_TOURISM,5.0/.........A?startPeriod=2010&endPeriod=2020&dimensionAtObservation=AllDimensions |

![API Restful](/dotstatsuite-documentation/images/api-resftul6.png)

---

**Supported formats. “Parameter” in the tables below is used with the Accept HTTP header (see the Useful HTTP headers above)**  

![API Restful](/dotstatsuite-documentation/images/api-resftul7.png)
