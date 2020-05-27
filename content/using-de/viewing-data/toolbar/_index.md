---
title: "Toolbar"
subtitle: 
comments: false
weight: 3500

---

#### Table of Content
- [View type](#view-type)
- [Labels](#labels)
- [Customise](#customise)
- [Share](#share)
- [Download](#download)
- [Full screen](#full-screen)
- [API queries](#api-queries)

---

![Toolbar](/images/de-toolbar1.png)

---

### View type
On the left side of the toolbar, the user can select to display data in a **table view** or in **chart view**.  
The data table view is the default view when the user arrives from a search result.  

Chart types depend on the configuration of the DE instance, or on the type of data (e.g. viewing data in a timeline chart is feasible only with the appropriate time dimension). For more information about charts and chart types, go to [this documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/charts/).

![Toolbar](/images/de-toolbar2.png)

---

### Labels
The "Labels" option allows to display the information using names, identifiers (unique IDs) or both.  

![Toolbar](/images/de-toolbar3.png)

This option applies to all the table and chart contents, including their header and footer. When the option `Both` is selected, then it shows the Identifer bewteen brakets, then a space, then the name.  

Example with the dimension label `Reference area`:
* with option **Name**, it displays **`Reference area`**
* with option **Identifier**, it displays **`REF_AREA`**
* with option **Both**, it displays **`(REF_AREA) Reference area`** 

---

### Customise
*under construction...*

---

### Share
The **Share** option allows sharing the the data view in table or chart mode.

![Share](/images/de-share1.png)

There are two options for sharing the data view:
* 1) Data snapshot: The current data is to be saved with the data view and redisplayed as such.
* 2) Latest available data for the period defined: The current data query is saved with the data view and re-executed before the data view is redisplayed. The time period is fixed to the current time span covered.

Before having the expected URL and the code to embed for sharing the information, the user must fill up his/her email address to make the request by clicking on the button "Request URL and embed code".  
Once clicked, the user will receive the following message:

![Share](/images/de-share2.png)

... Then the following mail:

![Share](/images/de-share3.png)

The mail contains two parts, the first one to let the user validating its e-mail and so its requested of sharing table or chart view. In the second part, the mail displays the URL and the embedded code for sharing the table or the chart previously requested.  
There is also a warning that the URL and the embedded code are only available once the user has validated its email.

Once the user clicks on "Validate your email address", the shared content is *activated* and opened in a new webpage with a unique URL id.  
The shared view contains the data table or chart view, including the header (title and sub-title) and footer (copyright link and source url id):

![Share](/images/de-share4.png)

---

### Download
*under construction...*

---

### Full screen
*under construction...*

---

### API queries
*under construction...*
