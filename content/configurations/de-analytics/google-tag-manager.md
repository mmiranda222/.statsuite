---
title: "Google Tag Manager"
subtitle: 
comments: false
weight: 80
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

There are few steps to follow in order to properly configure Google Tag Manager (GTM).

#### pre-requisites:
  - GTM account

In [GTM](https://tagmanager.google.com), create an account. This account will allow you to create containers and those containers will be enable sending data to your analytics tools.

#### 1. Create a container
What is a container?   
A **container** is a collection of tags, triggers, variables, and related configurations installed on a given website or mobile app.

We have choose to create one container per application. Why???  
Hence, you need to create two containers, one for data-explorer and one for data-viewer.

![GTM - create a container](/dotstatsuite-documentation/images/gtm-create-container.png)  

#### 2. Download your containers settings
  - <a href="/dotstatsuite-documentation/assets/GTM-template/data-explorer.json" download>data-explorer</a>
  - <a href="/dotstatsuite-documentation/assets/GTM-template/data-viewer.json" download>data-viewer</a>

The settings of the containers are configurations in .json files already prepared and maintained by our developers, and required in the next steps of GTM setup. They contain all the specific tags and triggers created for tracking data explorer and data viewers' usages and statistics.

#### 3. Import container
After having downloaded your pre-configured container settings, you now need to import it into GTM.  
Select your application, then go to the 'Admin' tab. In the Caontainer options menu, select "Import Container".

![GTM - create a container](/dotstatsuite-documentation/images/gtm-import-container.png)   

Then select the .json file you have previously downloaded and that matches the GTm container (data-explorer or data-viewer).  
Choose your workspace (default workspace, if it is the first time your create a container), and choose import option between overwrite or merge (overwrite, if it is the first your create a container).

![GTM - create a container next step](/dotstatsuite-documentation/images/gtm-import-container-next-1.png)  

Repeat these steps for each data-explorer and data-viewer container.

#### 4. Configuration of container

To properly setup your container, you need to add your google analytics token and your domain.  

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

You can see all events on the google tag manager. Those events are listed on your workspace on trigger tab.
