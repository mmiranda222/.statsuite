---
title: "Google Tag Manager"
subtitle: 
comments: false
weight: 74
keywords: [
  'How to configure Google Tag Manager', '#how-to-configure-google-tag-manager',
  'Events API', '#events-api',
]
---

#### Table of Content
- [How to configure Google Tag Manager](#how-to-configure-google-tag-manager)
- [Events API](#events-api)
---

In the new release, google Analytics has been replaced by google tag manager. You are still able to use Google Analytics but we will not add event from our applications directly to Google Analytics.

### How to configure Google Tag Manager

There are few steps to follow to properly configure google tag manager.

#### pre-requisites:
  - google tag manager account

#### 1. Create a container
What is a container?   
A container is a collection of tags, triggers, variables, and related configurations installed on a given website or mobile app is called a container.

We have choose to create one container by applications.
First, you have to create two containers, one for data-explorer and one for data-viewer

![GTM - create a container](/dotstatsuite-documentation/images/gtm-create-container.png)  

#### 2. Download your settings containers
  - <a href="/dotstatsuite-documentation/assets/GTM-template/data-explorer.json" download>data-explorer</a>
  - <a href="/dotstatsuite-documentation/assets/GTM-template/data-viewer.json" download>data-viewer</a>

Those json files are configuration files. They are already prepared by our developers and they are needed in the next step. please download them.

On [google tag manager](https://tagmanager.google.com) you have to create an account. this account will allow you to create container and those container will be able to send data to your analytics tools.

#### 3. Import container
After downloaded your pre-configured container you have to import them.
You have to select your application and then go in admin tab

![GTM - create a container](/dotstatsuite-documentation/images/gtm-import-container.png)   
Then you have to select the json file you have downloaded corresponding to your application. 
choose your workspace (default workspace, if it is the first time you are creating a container)
and then, choose between overwrite and merge. (overwrite, if it is the first your are creating a container)

![GTM - create a container next step](/dotstatsuite-documentation/images/gtm-import-container-next-1.png)  

#### 4. Configuration of container

To properly setup your container you have to add at least your google analytics token and your domain.  

##### How to configure your domain

This variable is usefull to know when a user click on a link inside your application. That allow us to define is think link is an outbound link or not.  

First click on **Domain** variable  
![GTM - configure your domain](/dotstatsuite-documentation/images/gtm-ga-domain.png)  

Then change the value by your domain  
![GTM - configure your domain next step](/dotstatsuite-documentation/images/gtm-ga-domain-next-step0.png)  

##### How to configure google analytics with google tag manager

This variable is the way from google tag manager to send data to google analytics by your token.   

First click on **GA Token** variable  
![GTM - configure your domain](/dotstatsuite-documentation/images/gtm-ga-token.png)  

Then change the value by your domain  
![GTM - configure your domain next step](/dotstatsuite-documentation/images/gtm-ga-token-next-step0.png)  

##### How to configure google cross domain

First click on **Cross-domain** variable  
![GTM - configure your domain](/dotstatsuite-documentation/images/gtm-ga-cross-domain.png)  

then change the value by your cross domain separate by coma  
![GTM - configure your domain next step](/dotstatsuite-documentation/images/gtm-ga-cross-domain-next-step0.png)  

#### Tracking ID
You can enable [Google Tag Manager](https://tagmanager.google.com) to receive hits on audience and usages of a .Stat Data Explorer and .Stat Data Viewer instance  .  
In order to activate the analytics functionality, you need to create your own **[How to configure Google Tag Manager](#how-to-configure-google-tag-manager)* and use the value in env variable named **`GTM_TOKEN`** in the scope of compliant service (ie data-explorer).  
You can add the env variable in your **`.env`** file and start data-explorer service.  
If you are using Docker-Compose, you have to declare the env variable at the service level in the compose file (see [example](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose/-/blob/master/demo/.env))

---

### Events API

You can see all events on the google tag manager. Those events are listed on your workspace on trigger tab.