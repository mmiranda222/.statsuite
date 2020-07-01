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
- [Developer API](#developer-api)

![Toolbar](/dotstatsuite-documentation/images/de-toolbar1.png)

---

### View type
On the left side of the toolbar, the user can select to display data in a **table view** or in **chart view**.  
The data table view is the default view when the user arrives from a search result.  

Chart types depend on the configuration of the DE instance, or on the type of data (e.g. viewing data in a timeline chart is feasible only with the appropriate time dimension). For more information about charts and chart types, go to [this documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/charts/).

![Toolbar](/dotstatsuite-documentation/images/de-toolbar2.png)

---

### Labels
The "Labels" option allows to display the information using names, identifiers (unique IDs) or both.  

![Toolbar](/dotstatsuite-documentation/images/de-toolbar3.png)

This option applies to all the table and chart contents, including their header and footer. When the option `Both` is selected, then it shows the Identifer bewteen brakets, then a space, then the name.  

Example with the dimension label `Reference area`:
* with option **Name**, it displays **`Reference area`**
* with option **Identifier**, it displays **`REF_AREA`**
* with option **Both**, it displays **`(REF_AREA) Reference area`** 

---

### Customise
The **Customise** option is contextual depending on the type of data view representation.  
For the data **table preview**, check the documentation [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/customise-feature/).  
For the data **chart views**, check the docmentation [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/charts/).

---

### Share
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

---

### Download
There is an option to **download** data in a specific format and content according to the current data view, and accessible from both table and chart views.  
The download feature is contextual, therefore the **Label** option will act accordingly:
* If the table/chart option is "Identifier", then the downloaded file contains codes only;
* If the table/chart option is "Name" or "Both" (Name + Identifier), then the downloaded file contains identifiers and names.  
The **locale** used for names is the currently used language in the application.  

The download options form the dropdown button are described below.  

![Download](/dotstatsuite-documentation/images/de-download1.png)

**Table in Excel**  
Only the filtered data contained in the online table (or chart) view is downloaded in **.xlsx** file format.  
All online table's layout, styles, cell and text formatting are maintained in the downloaded Excel file.  
The online **table limitation** (maximum number of observations to be returned by the *SDMX* web service) is maintained in the downloaded file (see [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/incomplete-data/)).  
**Attributes** in flags and footnotes are also included in the downloaded Excel file, as internal links into a second sheet with exactly the same layout, but without any of the values and with flags in the cells instead of the values.  
The online **table header**'s title and sub-title are replicated in separate lines above the data table.  
The online **table footer**'s copyright is to replicated in a separate line below the data table (including its hyperlink). The source link is also replicated below the table with the data view name and hyperlink to the original online view.  
**RTL** (Right-to-Left) mode is supported, allowing to programmatically switching the layout of a downloaded Excel data table between left-to-right and right-to-left. Depending on the version viewed online (e.g. in Arabic language) and the user's localised preferences in Excel, the downloaded Excel table will automatically be displayed in RTL mode.

![Download](/dotstatsuite-documentation/images/de-download2.png)

**Filter data in tabular text (CSV)**  
Only the filtered data contained in the online table (or chart) view is downloaded in **.csv** file format, wich is a flat tabular text format.  
This format does not contains header or footer, and the downloaded data view is identified by the *SDMX* Dataflow Agency:ID(Version). 

**Unfiltered data in tabular text (CSV)**  
The full (unfiltered) data contained in the online request behind a table (or chart) view is downloaded in **.csv** file format, wich is a flat tabular text format.  
This format does not contains header or footer, and the downloaded full data view is identified by the *SDMX* Dataflow Agency:ID(Version). 

**Additional download(s) of external resources**  
Additional downloads of external resources can be added to a dataflow and be made available in the Download option. See the [Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/custom-data-view/external-resources/) related to this option.

---

### Full screen
Both table and chart views can be displayed in full screen mode.  

![Fullscreen](/dotstatsuite-documentation/images/de-fullscreen1.png)

When the user presses the **Full screen** option, a table or chart occupying the whole screen is displayed.  
The entire toolb ar is kept in the view, as well as the table/chart header (title and sub-title) and footer (copyright link and source url id).  
Clicking on **Full screen** again brings back to the normal screen.

![Fullscreen](/dotstatsuite-documentation/images/de-fullscreen2.png)

---

### Developer API
The option **Developer API** allows to generate queries through a RESTful API based on *SDMX 2.1* standard, for both **structural and data information** from a current table or chart view.  
Both Data query and structure query are generated according to the current data selection. Changing the data selection (using filters) will dynamically change the generated data and structure queries.  
There is an option for generating the data query in **"Flat"** or **"Time series"** format.  
There is an option to **copy** each query in the user's clipboard.

![Developer API](/dotstatsuite-documentation/images/de-api.png)

