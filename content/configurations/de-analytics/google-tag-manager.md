---
title: "Google Tag Manager"
subtitle: 
comments: false
weight: 80
keywords: [
  '', '',
  '', '',
  '', '',
  '', '',
  '', '',
  '', '',
]
---

#### Table of Content
- [How to configure Google Tag Manager](#how-to-configure-google-tag-manager)
- [Pre-requisites](#pre-requisites)
- [Create GTM containers](#create-gtm-containers)
- [Retrieve the containers default settings](#retrieve-the-containers-default-settings)
- [Import the containers settings](#import-the-containers-settings)
- [Configure the containers](#configure-the-containers)
- [Configure your domain](#configure-your-domain)
- [Configure Google Analytics with Google Tag Manager](#configure-google-analytics-with-google-tag-manager)
- [Configure your cross domains](#configure-your-cross-domains)
- [](#)

---

> Released in [MMMMMMMMMMMM XX, 2021 Release .Stat Suite JS X.X.X](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#mmmmmmmmm-XX-2021)

> *Link* to disclaimer on GA --> GTM

### How to configure Google Tag Manager

![GTM logo](/dotstatsuite-documentation/images/googletagmanager-logo.png)

There are the steps to follow in order to properly **configure Google Tag Manager** (GTM).

#### Pre-requisites
  - **GTM account**
In [GTM](https://tagmanager.google.com), create an account. This account will allow you to create containers enabling sending data to analytics tools (e.g. Google Analytics).

  - **GTM Tracking ID** --> HOW?????
You can enable [Google Tag Manager](https://tagmanager.google.com) to receive hits on audience and usages of a .Stat Data Explorer and .Stat Data Viewer instance by.  In order to allow GTM xxxxxxxxx tags on an instance of .Stat Data Explorer and .Stat Data Viewer, you need to create your own **[How to configure Google Tag Manager](#how-to-configure-google-tag-manager)* and use the value in env variable named **`GTM_TOKEN`** in the scope of compliant service (ie data-explorer).  
You can add the env variable in your **`.env`** file and start data-explorer service.  
If you are using Docker-Compose, you have to declare the env variable at the service level in the compose file (see [example](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose/-/blob/master/demo/.env))


#### Create GTM containers
What is a container?   
A **container** is a collection of tags, triggers, variables, and related configurations installed on a given website or mobile app.

We have choose to create one container per application. Why???  
Hence, you need to create two containers, one for data-explorer and one for data-viewer.

![GTM - create a container](/dotstatsuite-documentation/images/gtm-create-container.png)  

#### Retrieve the containers default settings
  - <a href="/dotstatsuite-documentation/assets/GTM-template/gtm-data-explorer.json" download>data-explorer</a>
  - <a href="/dotstatsuite-documentation/assets/GTM-template/gtm-data-viewer.json" download>data-viewer</a>

The settings of the containers are configurations in .json files already prepared and maintained by our developers, and required in the next steps of GTM setup. They contain all the specific tags and triggers created for tracking data explorer and data viewers' usages and statistics.

#### Import the containers settings
After having downloaded your pre-configured container settings, you now need to import it into GTM.  
Select your application, then go to the 'Admin' tab. In the Caontainer options menu, select "Import Container".

![GTM - create a container](/dotstatsuite-documentation/images/gtm-import-container.png)   

Then select the .json file you have previously downloaded and that matches the GTm container (data-explorer or data-viewer).  
Choose your workspace (default workspace, if it is the first time your create a container), and choose import option between overwrite or merge (overwrite, if it is the first your create a container).

![GTM - create a container next step](/dotstatsuite-documentation/images/gtm-import-container-next-1.png)  

Repeat these steps for each data-explorer and data-viewer container.

#### Configure the containers

To properly setup your container, you need to add your google analytics token and your domain.  

##### Configure your domain

This variable is usefull to know when a user click on a link inside your application. That allow us to define is think link is an outbound link or not.  

First click on **Domain** variable  
![GTM - configure your domain](/dotstatsuite-documentation/images/gtm-ga-domain.png)  

then change the value by your domain  
![GTM - configure your domain next step](/dotstatsuite-documentation/images/gtm-ga-domain-next-step0.png)  

##### Configure Google Analytics with Google Tag Manager

This variable is the way from google tag manager to send data to google analytics by your token.   

First click on **GA Token** variable  
![GTM - configure your domain](/dotstatsuite-documentation/images/gtm-ga-token.png)  

then change the value by your domain  
![GTM - configure your domain next step](/dotstatsuite-documentation/images/gtm-ga-token-next-step0.png)  

##### Configure your cross domains

First click on **Cross-domain** variable  
![GTM - configure your domain](/dotstatsuite-documentation/images/gtm-ga-cross-domain.png)  

then change the value by your cross domain separate by coma  
![GTM - configure your domain next step](/dotstatsuite-documentation/images/gtm-ga-cross-domain-next-step0.png)  

---

### Events API

You can see all events on the google tag manager. Those events are listed on your workspace on trigger tab.
