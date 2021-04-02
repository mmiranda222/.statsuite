---
title: "Share"
subtitle: 
comments: false
weight: 3600
keywords: [
 'General behavior', '#general-behavior',
 'List of shared objects', '#list-of-shared-objects',
 'Delete shared objects', '#delete-shared-objects',
 'Cleanup feature for outdated shared objects', '#cleanup-feature-for-outdated-shared-objects',
]

---

#### Table of Content
- [General behavior](#general-behavior)
- [List of shared objects](#list-of-shared-objects)
- [Delete shared objects](#delete-shared-objects)
- [Cleanup feature for outdated shared objects](#cleanup-feature-for-outdated-shared-objects)

---

### General behavior
The **Share** option allows sharing the data view in table or chart mode.

![Share](/dotstatsuite-documentation/images/de-share1.png)

There are two options for sharing the data view:
* 1) **Data snapshot**: The current data is to be saved with the data view and redisplayed as such.
* 2) **Latest available data** for the period defined: The current data query is saved with the data view and re-executed before the data view is redisplayed. The time period is fixed to the current time span covered.

Before having the expected URL and the code to embed for sharing the information, the user must fill up his/her **email address** to make the request by clicking on the button "Request URL and embed code".  
Once clicked, the user receives the following message:

![Share](/dotstatsuite-documentation/images/de-share2.png)

... Then the following email:

![Share](/dotstatsuite-documentation/images/de-share3.png)

The email contains two parts, the first one to let the user validating its email and so its requested of sharing table or chart view. In the second part, the email displays the URL and the embedded code for sharing the table or the chart previously requested.  
There is also a warning message that the URL and the embedded code are only available once the user has validated its email.

Once the user clicks on "Validate your email address", the shared content is *activated* and opened in a new webpage with a unique URL id.  
The shared view contains the data table or chart view, including the header (title and sub-title) and footer (copyright link and source url id):

![Share](/dotstatsuite-documentation/images/de-share4.png)

### List of shared objects
> Released in [April 1, 2021 Release .Stat Suite JS 7.2.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-1-2021)

The user can request the full list of shared objects (shared views) that are related to a single email address.  
When requesting for sharing a Data Explorer view, the user receives the "Please allow us to verify your email address" email. The footer of this email contains an hyperlink called **"Manage your shared objects"**.

![Share](/dotstatsuite-documentation/images/de-share5.png)

Cliking on this link automatically triggers the generation of the full list of shared objects that have been requested for the same email address and that are still stored in the share databse. An automatic message is displayed in a new webpage: "An email was sent to xxxx@xxxx.org with the full list of shared objects".

The end then receives a new email containing the full list of (active) shared objects with the following details:
* Id : `Dataflow ID`
* Created : `Date/Time of the shared view creation`
* Last viewed : `Date/Time of the last time the shared object was viewed`
* Expires/d : `Date/Time when the shared object was or will be automatically deleted` *(Note: by configuration, the automatic deletion happens after 1 year during which the shared object was not viewed)*
* View : `Link to open the shared object in a new webpage`
* Delete : `Link to request the deletion of the shared object`

![Share](/dotstatsuite-documentation/images/de-share6.png)

*Limitation:* The current state of this feature allows only to request for the full list of shared object from the hyperlink in the footer of a "Validate your email address" email. An enhancement should allow in the future to request the same list directly from the Data Explorer UI.

### Delete shared objects
> Released in [April 1, 2021 Release .Stat Suite JS 7.2.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-1-2021)

Users can delete their own shared objects that are related to a specific email address. Two triggering options are available:
* The "Please allow us to verify your email address" email footer contains an hyperlink called **"Delete the shared object"**
* The "List of your shared objects" email contains a **Delete option** link for each of the listed shared object.

When the user requests for the deletion of a shared object from any of the above options, then the request is sent to the share service, and an automatic message is displayed in a new webpage: "An email was sent to xxxx@xxxx.org to delete your shared object".  
The end will then receive a new email "Confirm your deletion request" with a final validation that will trigger the deletion:

![Share](/dotstatsuite-documentation/images/de-share7.png)

Once validated, the shared object is deleted and permanently removed from the database, and the user receives the automatic confirmation message in a new webpage: "The shared object [ChartId=XX] was successfully deleted".

### Cleanup feature for outdated shared objects
> Released in [November 30, 2020 Release .Stat Suite JS 6.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#november-30-2020)

In order to keep infrastructure needs minimal and performance high, an *admin* API feature of the Share service allows to manually delete all outdated shared views.

e.g.  
`GET http://share-<tenant>.<organisation>.org/admin/cleanup?api-key=<secret>`

The deletion of these shared charts/tables views (uniquely identified by their unique URLs) will concern all shared views generated before a date this is defined and set up in the configuration of the share servcie during its deployment: `env.` viarable: `OUT_OF_DATE` ((see full documentation in the [readme.md](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/-/tree/master#share-server) file of the share service)).
