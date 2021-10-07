---
title: "Google Analytics"
subtitle: 
comments: false
weight: 78
keywords: [
  'Tracking ID', '#tracking-id',
  'Google Analytics default events', '#google-analytics-default-events',
  'Events API', '#events-api',
  'Default overviews for audiences and behaviours', '#default-overviews-for-audiences-and-behaviours',
  'How to create a custom dashboard', '#how-to-create-a-custom-dashboard',
]
---

#### Table of Content
- [Tracking ID](#tracking-id)
- [Google Analytics default events](#google-analytics-default-events)
- [Events API](#events-api)
- [Default overviews for audiences and behaviours](#default-overviews-for-audiences-and-behaviours)
- [How to create a custom dashboard](#how-to-create-a-custom-dashboard)

---

> Read the **[disclaimers](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-analytics/)** for a better understanding of the historic implementation of Google Analytics and Google Tag Managers in .Stat Suite.

---

### Tracking ID

![GA logo](/dotstatsuite-documentation/images/googleanalytics-logo.png)

You can enable [Google Analytics](https://analytics.google.com/) to receive hits on audience and usages of a .Stat Data Explorer instance.  
In order to activate the analytics functionality, you need to create your own **[Google Analytics Tracking ID](https://support.google.com/analytics/answer/1008080?hl=en)** and use the value in env variable named **`GA_TOKEN`** in the scope of compliant service (ie data-explorer).  
You can add the env variable in your **`.env`** file and start data-explorer service.  
If you are using Docker-Compose, you have to declare the env variable at the service level in the compose file (see [example](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose/-/blob/master/js/docker-compose.yml#L82))

To make sure that the tracking ID is well configured, the F12 console of your DE homepage instance should return the following:

![DE Analytics Console](/dotstatsuite-documentation/images/de-analytics-5.png)

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
Once your tracking ID is set up to a deployed instance of .Stat Data Explorer, you should be able to view all event actions, categories and labels (dataflows) under **Reports > Behaviour > Events > Overview**.

![DE Analytics Overview](/dotstatsuite-documentation/images/de-analytics-1.png)

**Event Category** lists the number of actions performed over a given period: dataflow visualisations, downloads, shared objects and views of shared objects.  
**Event action** lists the number of distinct actions performed by category of event over a given period: views of dataflows, downlaods by type, shares by type (table or chart).  
**Event label** lists the number of data visualisation by dataflow name over a given period. In order to establish the uniqueness of a dataflow, it is identified by **localised name sourceID/ID/Agency/Version**, e.g. *National Accounts (UoM) staging:SIS-CC-stable/DF_UOM/OECD/3.0*.

---

### How to create a custom dashboard
It is possible to pull all tracked events and audiences together into a single periodic dashboard. Here below is a set of examples for setting up metrics into custom dashboards, the only limitation in this example being that you can only create 12 widgets per dashboard.  
Go to **Customisation > Dashboards** and click on **Create**.

![DE Analytics Dashboard](/dotstatsuite-documentation/images/de-analytics-2.png)

Once your dashboard is named and created, you can add up to 12 widgets and customise the general layout of the dashboard.  

**+Add Widget**

![DE Analytics Widget](/dotstatsuite-documentation/images/de-analytics-3.png)

**Number of DE sessions per period**  
- Standard: "METRIC"
- Show the following metric:
  - add a metric: "Number of Sessions per User"

**Number of DE users per period**  
- Standard: "METRIC"
- Show the following metric:
  - add a metric: "Users"

**Number of DE sessions per dataflow per period**  
- Standard: "TABLE"
- Show the following metric:
  - add a Dimension: "Event Label"
  - add metric: "Sessions"
- Filter this data:
  - only show | Event Category | containing | "DATAFLOW"

**Number of DE users per dataflow per period**  
- Standard: "TABLE"
- Show the following metric:
  - add a Dimension: "Event Label"
  - add metric: "Users"
- Filter this data:
  - only show | Event Category | containing | "DATAFLOW"

**Number of DE downloads (separately by unfiltered csv, filtered csv, filtered excel, .png) per period**  
- Standard: "TABLE"
- Show the following metric:
  - add a Dimension: "Event Action"
  - add metric: "Total Events"
- Filter this data:
  - only show | Event Category | containing | "DOWNLOAD"

**Number of DE downloads (separately by unfiltered csv, filtered csv, filtered excel, .png) per dataflow per period**  
**Filtered excel**  
- Standard: "TABLE"
- Show the following metric:
  - add a Dimension: "Event Label" 
  - add metric: "Total Events"  
- Filter this data:
  - only show | Event Category | containing | "DOWNLOAD"
  - only show | Event Action | containing | "EXCEL"

**Filtered png**  
- Standard: "TABLE"
- Show the following metric: 
  - add a Dimension: "Event Label" 
  - add metric: "Total Events"
- Filter this data:
  - only show | Event Category | containing | "DOWNLOAD"
  - only show | Event Action | containing | "PNG"

**Filtered csv**  
- Standard: "TABLE"
- Show the following metric:
  - add a Dimension: "Event Label"
  - add metric: "Total Events"
- Filter this data:  
  - only show | Event Category | containing | "DOWNLOAD"
  - only show | Event Action | Exactly matching | "CSV"

**Unfiltered csv**  
- Standard: "TABLE"
- Show the following metric:
  - add a Dimension: "Event Label"
  - add metric: "Total Events"
- Filter this data:
  - only show | Event Category | containing | "DOWNLOAD"
  - only show | Event Action | containing | "CSV_FULL"

**Number of DE shared tables/charts per period**  
- Standard: "TABLE"
- Show the following metric:
  - add a Dimension: "Event Action"
  - add metric: "Total Events"
- Filter this data:
  - only show | Event Category | Exactly matching | "SHARE"

**Number of DE shared tables/charts per dataflow per period**  
- Standard: "TABLE"
- Show the following metric:
  - add a Dimension: "Event Label"
  - add metric: "Total Events"
- Filter this data:
  - only show | Event Category | Exactly matching | "SHARE"

**Number of VIEWER views of shared tables/charts per period**  
- Standard: "METRIC"
- Show the following metric:
  - add a metric: "Total Events"
- Filter this data:
  - only show | Event Category | containing | "SHARE_VIEW"

**Number of VIEWER views of shared tables/charts per dataflow per period**  
- Standard: "TABLE"
- Show the following metric:
  - add a Dimension: "Event Label"
  - add metric: "Total Events"
- Filter this data:
  - only show | Event Category | containing | "SHARE_VIEW"

**Number of VIEWER users per period**  
- Standard: "METRIC"
- Show the following metric:
  - add a metric: "Users"
- Filter this data:
  - only show | Event Category | containing | "SHARE_VIEW"

**Example of a set of widgets**  

![DE Analytics Dashboard example](/dotstatsuite-documentation/images/de-analytics-4.png)
