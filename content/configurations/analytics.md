---
title: "Analytics"
subtitle: 
comments: false
weight: 74
keywords: [
  'How to configure Google Tag Manager', '#how-to-configure-google-tag-manager',
  'Tracking ID', '#tracking-id',
  'Google Analytics default events', '#google-analytics-default-events',
  'Events API', '#events-api',
  'Default overviews for audiences and behaviours', '#default-overviews-for-audiences-and-behaviours',
  'How to create a custom dashboard', '#how-to-create-a-custom-dashboard',
]
---

#### Table of Content
- [How to configure Google Tag Manager](#how-to-configure-google-tag-manager)
- [Google Analytics default events](#google-analytics-default-events)
- [Events API](#events-api)
- [Default overviews for audiences and behaviours](#default-overviews-for-audiences-and-behaviours)
- [How to create a custom dashboard](#how-to-create-a-custom-dashboard)

---

In the new release, google Analytics has been replaced by google tag manager. 

### How to configure Google Tag Manager

There are few steps to follow to properly configure google tag manager.

#### pre-requisites:
  - google tag manager account

#### 1. Create a container
What is a container?   
A container is a collection of tags, triggers, variables, and related configurations installed on a given website or mobile app is called a container.

We have choose to create one container by applications.
You have to create two containers, one for data-explorer and one for data-viewer

![GTM - create a container](/dotstatsuite-documentation/images/gtm-create-container.png)  

#### 2. Download you settings containers
  - [data-explorer](#https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/blob/master/GTM-template.json)
  - [data-viewer](#https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/-/blob/master/GTM-template.json)

Those json files are configuration already prepared by our developers needed in the next step

On [google tag manager](https://tagmanager.google.com) you have to create an account. this account will allow you to create container and those container will be able to send data to your analytics tools.

#### 3. Import container
After downloaded your pre-configured container you have to import them.
You have to select your application and then go in admin tab

![GTM - create a container](/dotstatsuite-documentation/images/gtm-import-container.png)   
Then you have to select the json file you have downloaded. 
choose your workspace (default workspace, if it is the first your create a container)
and choose between overwrite and merge. (overwrite, it is the first your create a container)

![GTM - create a container next step](/dotstatsuite-documentation/images/gtm-import-container-next-1.png)  

#### 4. Configuration of container

To properly setup your container you have to add at least your google analytics token and your domain.  

##### How to configure your domain

This variable is usefull to know when a user click on a link inside your application. That allow us to define is think link is an outbound link or not.  

First click on **Domain** variable  
![GTM - configure your domain](/dotstatsuite-documentation/images/gtm-ga-domain.png)  

then change the value by your domain  
![GTM - configure your domain next step](/dotstatsuite-documentation/images/gtm-ga-domain-next-step0.png)  

##### How to configure google analytics with google tag manager

This variable is the way from google tag manager to send data to google analytics by your token.   

First click on **GA Token** variable  
![GTM - configure your domain](/dotstatsuite-documentation/images/gtm-ga-token.png)  

then change the value by your domain  
![GTM - configure your domain next step](/dotstatsuite-documentation/images/gtm-ga-token-next-step0.png)  

##### How to configure google cross domain

First click on **GA Token** variable  
![GTM - configure your domain](/dotstatsuite-documentation/images/gtm-ga-token.png)  

then change the value by your domain  
![GTM - configure your domain next step](/dotstatsuite-documentation/images/gtm-ga-token-next-step0.png)  

#### Tracking ID
You can enable [Google Tag Manager](https://tagmanager.google.com) to receive hits on audience and usages of a .Stat Data Explorer and .Stat Data Viewer instance  .  
In order to activate the analytics functionality, you need to create your own **[How to configure Google Tag Manager](#how-to-configure-google-tag-manager)* and use the value in env variable named **`GTM_TOKEN`** in the scope of compliant service (ie data-explorer).  
You can add the env variable in your **`.env`** file and start data-explorer service.  
If you are using Docker-Compose, you have to declare the env variable at the service level in the compose file (see [example](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose/-/blob/master/demo/.env))
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
  engagement:
    "Event Action":
      downloadContent
        csv
        excel
        png
      share
        label: [dataflowId]
  navigation:
    "Event Action":
      viewDataflow:
        label: [dataflowId]
      browseBy
        label: [facetid and value id]
      internalSearchTerm
        label: [term search by a user]
      applyTableLayout
        label: [dataflow label and Id]
      changeViewer
        label: [selected viewer]
```

List of **Events** set up and applied to a Data Explorer instance:  
```
"Event Category":
  navigation:
    "Event Action":
      viewDataflow:
        label: [viewerType] - [dataflowId]
```
VIEWED_SHARED_CHOROPLETHCHART
```
---

### Default overviews for audiences and behaviours
Once your tracking ID is set up to a deployed instance of .Stat Data Explorer and you have properly configured Google Tag Manager, you should be able to view all event actions, categories and labels (dataflows) under **Reports > Behaviour > Events > Overview**.

![DE Analytics Overview](/dotstatsuite-documentation/images/de-analytics-1.png)

**dataflowId**: In order to establish the uniqueness of a dataflow, it is identified by **localised name sourceID/ID/Agency/Version**, e.g. *National Accounts (UoM) staging:SIS-CC-stable/DF_UOM/OECD/3.0*.

---

### How to create a custom dashboard
It is possible to pull all tracked events and audiences together into a single periodic dashboard. Here below is a set of examples for setting up metrics into custom dashboards, the only limitation in this example being that you can only create 12 widgets per dashboard.  
Go to **Customisation > Dashboards** and click on **Create**.

![DE Analytics Dashboard](/dotstatsuite-documentation/images/de-analytics-2.png)

Once your dashboard is named and created, you can add up to 12 widgets and customise the general layout of the dashboard.  

**+Add Widget**

![DE Analytics Widget](/dotstatsuite-documentation/images/de-analytics-3.png)
