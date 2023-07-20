---
title: "Google Analytics"
subtitle: 
comments: false
weight: 77
keywords: [
  'Measurement ID', '#measurement-id',
  'Google Analytics default events', '#google-analytics-default-events',
  'Events API', '#events-api',
  'Default overviews for audiences and behaviours', '#default-overviews-for-audiences-and-behaviours',
  'Customise reports', '#customise-reports',
]
---

#### Table of Content
- [Measurement ID](#measurement-id)
- [Google Analytics default events](#google-analytics-default-events)
- [Events API](#events-api)
- [Default overviews for audiences and behaviours](#default-overviews-for-audiences-and-behaviours)
- [Customise reports](#customise-reports)

---

> Read the **[disclaimers](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-analytics/)** for a better understanding of the historical implementations of Google Analytics and Google Tag Manager in .Stat Suite.

---

![GA logo](/dotstatsuite-documentation/images/googleanalytics-logo.png)

### Measurement ID
You can enable [Google Analytics](https://analytics.google.com/) to receive hits on audience and usages of a .Stat Data Explorer instance.  
In order to activate the analytics functionality, you need to create your own **[Google Analytics 4 (GA4) property](https://support.google.com/analytics/answer/9304153?hl=en&ref_topic=9303319&sjid=18265954499742490560-EU)**. When completing the set up by "adding a data stream", you will be given a **"Measurement ID"** to be provided in the environment variable named **`GA_TOKEN`** in the scope of the compliant service (data-explorer or data-viewer).  
You can add the env variable in your **`.env`** file and start the data-explorer or data-viewer service.  
If you are using Docker-Compose, you have to declare the env variable at the service level in the compose file (see [example](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose/-/blob/master/js/docker-compose.yml#L82))

---

### Google Analytics default events
By default, .Stat Data Explorer sends information to [Google Analytics](https://analytics.google.com/) for a defined list of Events allowing to monitor the following list of audiences and behaviours:
* Number of DE sessions per period
* Number of DE users per period
* Number of DE sessions per dataflow per period
* Number of DE users per dataflow per period
* Number of DE downloads (separately by unfiltered csv, filtered csv, filtered excel, .png) per period
* Number of DE downloads (separately by unfiltered csv, filtered csv, filtered excel, .png) per dataflow per period
* Number of DE shared tables/charts per period
* Number of DE shared tables/charts per dataflow per period
* Number of VIEWER views of shared tables/charts per period
* Number of VIEWER views of shared tables/charts per dataflow per period
* Number of VIEWER users per period

**Note** that in Google Analytics:
* a **session** is a group of user interactions with your website that take place within a given period. A single session can thus contain several page views and events.
* a **user** is a unique identified user who can initiate a single or several sessions within a given period. A user is counted once he has launched at least one session during a given time range. By extend, users can then be monitored as new users or returning users.  

**Exception:**  
*(Since [Release .Stat Suite JS 6.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#november-30-2020))* Due to the fact that Google Analytics wants to prevent breaking the privacy users through their Privacy Policies and Personally Identifiable Information (PII) best practices, then whenever the **`@` character** is found in the data source (Dataflow name, dataflow ID, AgencyID, or Source ID), then this character is **replaced by `[at]`** before it is sent to GoogleAnalytics.  
E.g. a dataflow with the ID **SDD@IDD** will be retrieved as **SDD[at]IDD** in Google Analytics.

---

### Events API
**Event label:**
* **DATAFLOW** = `name of the dataflow + sourceId/id/agenceId/version` > corresponds to the triggering of the visualisation of a dataflow in any type of representation within the Data Explorer website.
* **DOWNLOAD** = `name of the dataflow + sourceId/id/agenceId/version` > corresponds to the triggering of downloading data from a dataflow in any available format within the Data Explorer website (from a search result page or a visualisation page).
* **SHARE** = `name of the dataflow + sourceId/id/agenceId/version` > corresponds to the triggering of sharing a dataflow in any type of representation.
* **SHARE_VIEW** = `name of the dataflow + chartId` > corresponds to viewing a shared representation of a dataflow.

List of **Events** set up and applied to a Data Explorer instance:  

```
"Event Category":
  DATAFLOW
  DOWNLOAD
  SHARE
  SHARE_VIEW  
"Event Action":
  DATAFLOW
    VIEWED_DATAFLOW
  DOWNLOAD
    EXCEL
    PNG
    CSV
    CSV_FULL
  SHARE
    SHARED_TABLE
    SHARED_BARCHART
    SHARED_ROWCHART
    SHARED_SCATTERCHART
    SHARED_HORIZONTALSYMBOLCHART
    SHARED_VERTICALSYMBOLCHART
    SHARED_TIMELINECHART
    SHARED_STACKEDBARCHART
    SHARED_CHOROPLETHCHART
  SHARE_VIEW
    VIEWED_SHARED_TABLE
    VIEWED_SHARED_BARCHART
    VIEWED_SHARED_ROWCHART
    VIEWED_SHARED_SCATTERCHART
    VIEWED_SHARED_HORIZONTALSYMBOLCHART
    VIEWED_SHARED_VERTICALSYMBOLCHART
    VIEWED_SHARED_TIMELINECHART
    VIEWED_SHARED_STACKEDBARCHART
    VIEWED_SHARED_CHOROPLETHCHART
```

---

### Default overviews for audiences and behaviours
Once your Measurement ID is set up for a deployed instance of .Stat Data Explorer, you should be able to view all event actions, categories and labels (dataflows) under **Reports > Engagement > Events**.

![DE Analytics Overview](/dotstatsuite-documentation/images/de-analytics-1.png)

**Event Category** lists the number of actions performed over a given period: dataflow visualisations, downloads, shared objects and views of shared objects.  
**Event action** lists the number of distinct actions performed by category of event over a given period: views of dataflows, downlaods by type, shares by type (table or chart).  
**Event label** lists the number of data visualisation by dataflow name over a given period. In order to establish the uniqueness of a dataflow, it is identified by **localised name sourceID/ID/Agency/Version**, e.g. *National Accounts (UoM) staging:SIS-CC-stable/DF_UOM/OECD/3.0*.

---

### Customise reports
Create, customise and organise your reports under the "Library" of Google Analytics. [Learn how to](https://support.google.com/analytics/answer/10460557).
