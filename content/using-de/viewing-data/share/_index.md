---
title: "Share"
subtitle: 
comments: false
weight: 3600
keywords: [
 'Visualisation share request', '#visualisation-share-request',
 'Email confirmation', '#email-confirmation',
 'Shared view generation', '#shared-view-generation',
 'List of own shared visualisations', '#list-of-own-shared-visualisations',
 'Delete own shared visualisation', '#delete-own-shared-visualisation',
 'Delete all own shared visualisations', '#delete-all-own-shared-visualisations',
 'Request a new link to access own shared visualisations', '#request-a-new-link-to-access-own-shared-visualisations',
 'Cleanup feature for all outdated shared visualisations', '#cleanup-feature-for-all-outdated-shared-visualisations',
]

---

#### Table of Content
- [Visualisation share request](#visualisation-share-request)
  - [Email confirmation](#email-confirmation)
  - [Shared view generation](#shared-view-generation)
- [List of own shared visualisations](#list-of-own-shared-visualisations)
- [Delete own shared visualisation](#delete-own-shared-visualisation)
- [Delete all own shared visualisations](#delete-all-own-shared-visualisations)
- [Request a new link to access own shared visualisations](#request-a-new-link-to-access-own-shared-visualisations)
- [Cleanup feature for all outdated shared visualisations](#cleanup-feature-for-all-outdated-shared-visualisations)

---

>*Version history:*  
> Fully refactored and enhanced in order to introduce a better management of all shared objects in a single page with [December 14, 2021 Release .Stat Suite JS 11.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#december-14-2021)  
> Added the email option to list and delete with [April 1, 2021 Release .Stat Suite JS 7.2.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-1-2021)  
> Introduced in [June 4, 2019 Release](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#june-4-2019) 

### Visualisation share request
The **Share** option allows sharing the data view in table or chart mode.

![Share](/dotstatsuite-documentation/images/de-share1.png)

There are two options for sharing the data visualisation:
* 1) **Data snapshot**: The current data are saved with the data view and displayed as such.
* 2) **Latest available data** for the period defined: The current data query is saved with the data view and executed before displaying the data view. The time period is fixed to the current time span covered.

In order to obtain the URL and the embed code for sharing the visualisation, the user must provide his/her **email address** and initiate the request by clicking on the button "Request URL and embed code".  

Since [October 5, 2021 Release .Stat Suite JS 10.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#october-5-2021), the following behaviors are also applied to the email address field:
* If the user is authenticated, then it is prefilled with the email address used during the authentication. The email address is prefilled as long as the user stays authenticated during his/her DE journey;
* If not authenticated, then the email address used during the first shared request will stay prefilled, even when changing the data view selection(s), or even when viewing a different data view (dataflow).

Once clicked on "Request URL and embed code", the user gets the following message:

![DE Share request](/dotstatsuite-documentation/images/de-share2.png)

**Note** that, since [January 13, 2022 Release .Stat Suite JS 12.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#january-13-2022), when the user is authenticated and requests to share a snapshot of data that are not publicly available (e.g. a private dataflow triggered from the DLM preview), then a localised warning message indicates that those data will be publicly accessible even though potentially not yet officially and publicly released.

![DE Share warning snapshot](/dotstatsuite-documentation/images/de-share-snapshot-warning.png)

#### Email confirmation
Once the request of share object was accepted by the data explorer, the following email request is sent in order to confirm the email address:

![Share mail confirm visualisation](/dotstatsuite-documentation/images/de-share21.png)

The email contains:
- the button to click on for confirming the email;
- the URL matching the one initiated by the button action;
- a warning message explaining that the URL (and active token) are only available for a defined period of times (4 hours by default).

Once the user clicks on "Confirm your email", a new localised share page of the Data Explorer opens and requests the user to activate the shared visualisation:

![Share activate](/dotstatsuite-documentation/images/de-share22.png)

#### Shared view generation
Once the user clicks on "Activate the visualisation", the shared visualisation is *activated* and opened in a new webpage with a unique URL id.  
The shared view contains the data table or chart view, including the header (title and sub-title) and footer (copyright link and source url id):

![Share visualisation](/dotstatsuite-documentation/images/de-share4.png)

---

### List of own shared visualisations
The DE share page that lists the shared active data views of the user is accessible through a web link with a token provided to the user in the email confirmation email. Once this token is expired (by default after a 4 hours' period of time), the user must request a new web link (see the process to [request a new link](#request-a-new-link-to-access-own-shared-visualisations)). 

The DE share page is localised and lists all the active visualisations of the user with the following information:
- **ID** of the shared visualisation
- **Title** with the chart type or table icon, and its localised title (the title is wrapped when too long to fit into one line)
- **Created** for the date and time when the visualisation was activated
- **Last viewed** for the date and time when the visualisation was last viewed
- **Expire Date** for the date and time when the visualisation will be removed/deleted *(Note: For that a scheduled task needs to be set up to regularily call the [cleanup feature](#cleanup-feature-for-all-outdated-shared-visualisations), which deletes all outdated shared visualisation not being viewed for a period of time defined in the configuration (by default 1 year))*
- **Links** with two options provided to the user: the URL opening the visualisation in the same web page, and an arrow icon opening the visualisation in a new tab of the web browser. A "copy" icon option also allows to copy the URL in the user's clipboard.
- **Share options** (see below)
- **Action** to delete the visualisation

*Note* that a visualisation title is followed by a highlighted 'New' icon when it is first activated and during the entire active session of the user. 

The available "Share options" are:
- Facebook
- Linkedin
- Twitter
- Email

![Share list](/dotstatsuite-documentation/images/de-share23.png)

For each shared visualisation, when clicking on the right end down-arrow icon, an accordion opens below the title line and displays the `iframe` code format to embed of the visualisation along with a "copy" icon.

![Share list embed code](/dotstatsuite-documentation/images/de-share24.png)

---

### Delete own shared visualisation
Clicking on the "Delete" (bin) icon for a given shared visualisation opens a popup message requesting to cancel or confirm the deletion. In the background, the row corresponding to the visualisation to be deleted is highlighted.

Clicking on "Delete" permanently removes the shared visualisation from the database, the popup window closes and the row corresponding to the visualisation is automatically removed from the list.

![Share delete](/dotstatsuite-documentation/images/de-share25.png)

---

### Delete all own shared visualisations
> Introduced in [December 14, 2021 Release .Stat Suite JS 11.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#december-14-2021)

When the list of shared visualisations contains more than one element, then a "Delete all" button is displayed at the bottom of the list. Clicking on it opens a popup message requesting to cancel or confirm the deletion of all shared visualisations of the user.

![Share delete all](/dotstatsuite-documentation/images/de-share26.png)

Clicking on "Delete all" permanently removes all shared visualisations of the user from the database, the popup window closes, the list is cleared and displays only a "no data" message.

![Share empty list](/dotstatsuite-documentation/images/de-share27.png)

---

### Request a new link to access own shared visualisations
When the token of a web link to the list of visualisation(s) has expired, and safely managing the list of visualisation(s) is no longer possible, then DE share page displays a new email confirmation request:

![Share expired link](/dotstatsuite-documentation/images/de-share28.png)

Once the user enters his/her email address and clicks on "Request new link", he/she will thus receive a new email entitled "Shared visualisation(s): Confirm your email", with the same content and requested confirmation as in the usual [visualisation share request](#visualisation-share-request) process.

![Share new link request](/dotstatsuite-documentation/images/de-share29.png)

Note that the token expires (by default after 4 hours) independently from whether the user email was confirmed and/or the shared visualisation was activated or not. A shared visualisation cannot be activated after the original token validity time span, even if a new web link has been generated through a subsequent email confirmation request. In this case, the visualisation needs to be re-shared. 

---

### Cleanup feature for all outdated shared visualisations
> Introduced in [November 30, 2020 Release .Stat Suite JS 6.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#november-30-2020)

In order to keep infrastructure needs minimal and performance high, an *admin* API feature of the Share service allows manually deleting all outdated shared visualisations of any user.

e.g.  
`GET http://share-<tenant>.<organisation>.org/admin/cleanup?api-key=<secret>`

This deletion concerns all shared visualisations not being accessed during a certain period of time as defined in the configuration of the Share service during its deployment: `env.` variable: `OUT_OF_DATE` ((see full documentation in the [readme.md](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/-/tree/master#share-server) file of the share service)).

