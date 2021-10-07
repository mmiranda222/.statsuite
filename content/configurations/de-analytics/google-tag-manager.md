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
  - [Pre-requisite](#pre-requisite)
  - [Create GTM containers](#create-gtm-containers)
  - [Container IDs for deployment process](#container-ids-for-deployment-process)
  - [Retrieve the containers default settings](#retrieve-the-containers-default-settings)
  - [Import the containers settings](#import-the-containers-settings)
- [Configure the containers](#configure-the-containers)
  - [Configure your domain](#configure-your-domain)
  - [Configure Google Analytics with Google Tag Manager](#configure-google-analytics-with-google-tag-manager)
  - [Configure your cross domains](#configure-your-cross-domains)
- [](#)

---

> Released in [October 5, 2021 Release .Stat Suite JS 10.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#october-5-2021)  
> Read the **[disclaimers](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-analytics/)** for a better understanding of the historic implementation of Google Analytics and Google Tag Managers in .Stat Suite.

---

### How to configure Google Tag Manager

![GTM logo](/dotstatsuite-documentation/images/googletagmanager-logo.png)

There are the steps to follow in order to properly **configure Google Tag Manager** (GTM).

#### Pre-requisite
  - **GTM account**
Create an account in [GTM](https://tagmanager.google.com). This account will allow you to create containers enabling to send data to analytics tools (e.g. Google Analytics).

#### Create GTM containers
What is a container?   
A **container** is a collection of tags, triggers, variables, and related configurations installed on a given website or mobile app.

We have chosen to create **one container per service** for a better maintainability and for further potential evolutions of the scope (e.g. new events to track requiring to include another .Stat Suite service).  
Hence, you need to create two containers, one for data-explorer and one for data-viewer.

![GTM - create a container](/dotstatsuite-documentation/images/gtm-create-container.png)

You can name each container "data-explorer" and "data-viewer", or add a notion of env. (e.g. "data-explorer-qa") if you plan to setup GTM on different instances for test purposes. Each container is automatically created with a **Container ID**.

#### Container IDs in the deployment process
In order to allow GTM retrieving tags from an instance of .Stat Data Explorer and .Stat Data Viewer, you need to provide each respective  **Container ID** in your deployment process as an **env variable named `GTM_TOKEN`** in the scope of compliant service (data-explorer and data-viewer). You can add the env variable in your **`.env`** file and start data-explorer and data-viewer services.  
If you are using Docker Compose, you have to declare the env variable at the service level in the compose file (see [example](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose/-/blob/master/demo/.env))

Example with Docker `.env`:

```
GTM_TOKEN_DE=GTM-XXXXXXX
GTM_TOKEN_DV=GTM-XXXXXXX
```

![GTM - container ID](/dotstatsuite-documentation/images/gtm-container-id.png)

#### Retrieve the containers default settings
The settings of the containers are configurations in .json files already prepared and maintained by our developers, and required in the next steps of GTM setup. They contain all specific tags and triggers created in advance for tracking data explorer and data viewers' usages and statistics.

Download  the two following .json files:
  - <a href="/dotstatsuite-documentation/assets/GTM-template/gtm-data-explorer.json" download>data-explorer</a>
  - <a href="/dotstatsuite-documentation/assets/GTM-template/gtm-data-viewer.json" download>data-viewer</a>

#### Import the containers settings
After having downloaded the pre-configured containers settings, you now need to import it into GTM.  
Select your container and select the 'Admin' tab. In the Container options menu, select "Import Container":

![GTM - create a container](/dotstatsuite-documentation/images/gtm-import-container.png)   

Select the respective .json file previously downloaded to import and that matches the GTM container (data-explorer or data-viewer).  
Choose your workspace (Default workspace, if it is the first time your create a container), and choose the import option between "Overwrite" or "Merge" (Overwrite, if it is the first your create a container).

![GTM - create a container next step](/dotstatsuite-documentation/images/gtm-import-container-next-1.png)  

Repeat these steps for both data-explorer and data-viewer containers.

---

### Configure the containers
In order to properly setup and complete your containers' configurations, you need to add your **domain** and a **Google Analytics Token**.

#### Configure your domain
From the Workspace of your data-explorer container, go to "Variables", then click on the "Domain" user-defined variable.

![GTM - configure your domain](/dotstatsuite-documentation/images/gtm-ga-domain.png)  

Leave the Variable type as "Constant", then change the Value to your domain URL.

![GTM - configure your domain next step](/dotstatsuite-documentation/images/gtm-ga-token-next-step0.png)  

Repeat the same steps in the data-viewer container, the Value of your domain being the URL of the Data Viwer (e.g. https://dv-qa.siscc.org).

#### Configure Google Analytics with Google Tag Manager
This variable is the way from google tag manager to send data to google analytics by your token.   

First click on **GA Token** variable  
![GTM - configure your domain](/dotstatsuite-documentation/images/gtm-ga-token.png)  

#### Configure your cross domains
This variable is usefull to know when a user click on a link inside your application. That allow us to define is think link is an outbound link or not.

First click on **Cross-domain** variable  
![GTM - configure your domain](/dotstatsuite-documentation/images/gtm-ga-cross-domain.png)  

then change the value by your cross domain hyperlinks separated by comas:

![GTM - configure your domain next step](/dotstatsuite-documentation/images/gtm-ga-cross-domain-next-step0.png)  

---

### Events tags and triggers
All events in GTM are listed under the **Tags** tab:

- data-explorer Tags

![GTM - data-explorer Tags](/dotstatsuite-documentation/images/gtm-data-explorer-tags.png)

- data-viewer Tags

![GTM - data-viewer Tags](/dotstatsuite-documentation/images/gtm-data-viewer-tags.png)

Another perspective of GTM is to view the list of triggers under the **Triggers** tab:

- data-explorer Triggers

![GTM - data-explorer Triggers](/dotstatsuite-documentation/images/gtm-data-explorer-triggers.png)

- data-viewer Triggers

![GTM - data-viewer Triggers](/dotstatsuite-documentation/images/gtm-data-viewer-triggers.png)
