---
title: "Google Tag Manager"
subtitle: 
comments: false
weight: 76
keywords: [
'How to configure Google Tag Manager', '#how-to-configure-google-tag-manager',
'Pre-requisite', '#pre-requisite',
'Create GTM containers', '#create-gtm-containers',
'Container IDs in the deployment process', '#container-ids-in-the-deployment-process',
'Retrieve the containers default settings', '#retrieve-the-containers-default-settings',
'Import the containers settings', '#import-the-containers-settings',
'Configure the containers', '#configure-the-containers',
'Configure your domains', '#configure-your-domains',
'Configure Google Analytics with Google Tag Manager', '#configure-google-analytics-with-google-tag-manager',
'Configure your cross domains', '#configure-your-cross-domains',
'Add optional static data inside your dataLayer', '#add-optional-static-data-inside-your-datalayer',
'Events tags and triggers', '#events-tags-and-triggers',
]

---

#### Table of Content
- [How to configure Google Tag Manager](#how-to-configure-google-tag-manager)
  - [Pre-requisite](#pre-requisite)
  - [Create GTM containers](#create-gtm-containers)
  - [Container IDs in the deployment process](#container-ids-in-the-deployment-process)
  - [Retrieve the containers default settings](#retrieve-the-containers-default-settings)
  - [Import the containers settings](#import-the-containers-settings)
- [Configure the containers](#configure-the-containers)
  - [Configure your domains](#configure-your-domains)
  - [Configure Google Analytics with Google Tag Manager](#configure-google-analytics-with-google-tag-manager)
  - [Configure your cross domains](#configure-your-cross-domains)
  - [Add optional static data inside your dataLayer](#add-optional-static-data-inside-your-datalayer)
- [Events tags and triggers](#events-tags-and-triggers)

> *Version history:*  
> Migrating from UA to GA4 property with [July 20, 2023 Release .Stat Suite JS Virtual](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#july-20-2023)  
> Released in [October 5, 2021 Release .Stat Suite JS 10.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#october-5-2021)  
> Read the **[disclaimers](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-analytics/)** for a better understanding of the historical implementations of Google Analytics and Google Tag Manager in .Stat Suite.

---

![GTM logo](/dotstatsuite-documentation/images/googletagmanager-logo.png)

### How to configure Google Tag Manager
These are the steps to follow in order to properly **configure Google Tag Manager** (GTM).

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
In order to allow GTM retrieving tags from an instance of .Stat Data Explorer and .Stat Data Viewer, you need to provide each respective  **Container ID** in your deployment process as an **env variable named `GTM_TOKEN`** in the scope of the compliant service (data-explorer and data-viewer). You can add the env variable in your **`.env`** file and start data-explorer and data-viewer services.  
If you are using Docker Compose, you have to declare the env variable in the compose file (see [example](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose/-/blob/master/demo/.env))

Example with Docker `.env`:

```
# ---------------------------------------- Analytics
GTM_TOKEN_DE=GTM-XXXXXXX
GTM_TOKEN_DV=GTM-XXXXXXX
```

![GTM - container ID](/dotstatsuite-documentation/images/gtm-container-id.png)

#### Retrieve the containers default settings
The settings of the containers are configurations in .json files already prepared and maintained by our developers, and required in the next steps of GTM setup. They contain all specific tags, triggers and variables created in advance for tracking data explorer and data viewers' usages and statistics.

Download  the two following .json files:
  - <a href="/dotstatsuite-documentation/assets/GTM-template/gtm-data-explorer.json" download>data-explorer</a>
  - <a href="/dotstatsuite-documentation/assets/GTM-template/gtm-data-viewer.json" download>data-viewer</a>

**Note**  that it is also possible to change, for compatibility with a previous version of your usage of GTM or GA, or for business reasons, to modify the names and definitions of these tags, triggers and variables before importing them into the containers.

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

#### Configure your domains
From the "Workspace" of your data-explorer container, go to "Variables", then click on the **"Domain"** user-defined variable.

![GTM - configure your domain](/dotstatsuite-documentation/images/gtm-ga-domain.png)  

Keep the Variable type as "Constant", and change the Value to your domain URL (e.g., https://de-qa.siscc.org/).  
Repeat the same steps in the data-viewer container, the Value of your domain being the URL of the Data Viewer (e.g. https://dv-qa.siscc.org).

#### Configure Google Analytics with Google Tag Manager
**Disclamier:** Since July 1st 2023, Universal Analytics (UA) standard has stopped processing data in Google Analytics and is being replaced by **Google Analytics 4 (GA4)** properties (see [more](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-analytics/#disclaimers)).

The **"Google Analytics: GA4 configuration"** variable, where to define the **GA4 Google tag ID**, is necessary if you want Google Tag Manager to send data to Google Analytics.

**Pre-requisites**:
1) Set up a Google Analytics account (see [how to](https://support.google.com/analytics/answer/1008080?hl=en#zippy=%2Cin-this-article))
2) Define and retrieve your GA4 Google tag ID (see [how to](https://support.google.com/analytics/answer/9539598?sjid=17311917297012063958-EU#find-G-ID))

From the "Workspace" of your data-explorer container, go to "Tags", then click on **"New"**, select **"Tag Configuration"** and then **"Google Analytics: GA4 Configuration"**.

![GTM - configure your GA4 ID](/dotstatsuite-documentation/images/gtm-ga4-configuration1.png)

Copy your **GA4 Google tag ID** in the "Measurement ID" field.

![GTM - configure your GA4 ID](/dotstatsuite-documentation/images/gtm-ga4-configuration2.png)

Click on the **"Triggering"** area below, and select **"All Pages"**, then save.

![GTM - configure your GA4 ID](/dotstatsuite-documentation/images/gtm-ga4-configuration3.png)

Repeat the same steps in your data-viewer container.

#### Configure your cross domains
The **Cross-domain** variable is necessary if you want to track events when a user clicks on a hyperlink from your website to another target (outbound links).

From the "Workspace" of your data-explorer container, go to "Variables", then click on the **"Cross-domain"** user-defined variable.

![GTM - configure your domain](/dotstatsuite-documentation/images/gtm-ga-cross-domain.png)  

Keep "Variable Type" to "Element URL", "Component Type" to "Is Outbound", and then change "Affiliated Domains" value by the comma-separated list your cross-domain hyperlink, then save.

![GTM - configure your domain next step](/dotstatsuite-documentation/images/gtm-ga-cross-domain-next-step0.png)  


#### Add optional static data inside your dataLayer
You can add custom static values inside your dataLayer (optional), in order to send additional events to be trakced by GTM.

**Example:**  
> in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json` under a key entry named `"analytics"`

```json
{
  "analytics": {
    "dataLayer": {
      "is_global": "yes",
      "is_directorates": "no",
      "is_satellite": "no",
      "template_name": "data explorer"
    }
  }
}
```

---

### Events tags and triggers
All events in GTM are listed under the **Tags** tab of the Workspace. Each tag is defined by a name and a one or several **Triggers**.

- data-explorer Tags

![GTM - data-explorer Tags](/dotstatsuite-documentation/images/gtm-data-explorer-tags.png)

- data-viewer Tags

![GTM - data-viewer Tags](/dotstatsuite-documentation/images/gtm-data-viewer-tags.png)

Another useful detailed view of GTM tags is the list of triggers under the **Triggers** tab. Triggers names should be enough self-explenatory for the user to understand what action it refers to in the DE for example: "Browse by", "Download Excel", etc.

- data-explorer Triggers

![GTM - data-explorer Triggers](/dotstatsuite-documentation/images/gtm-data-explorer-triggers.png)

- data-viewer Triggers

![GTM - data-viewer Triggers](/dotstatsuite-documentation/images/gtm-data-viewer-triggers.png)

---

### Example of a Google Analytics monitoring dashboard
*to be completed*
