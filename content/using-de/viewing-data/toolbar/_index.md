---
title: "Toolbar"
subtitle: 
comments: false
weight: 3500
keywords: [
  'View type', '#view-type',
  'Labels', '#labels',
  'Layout and Customise', '#layout-and-customise',
  'Share', '#share',
  'Download', '#download',
  'Table in Excel', '#table-in-excel',
  'Filtered or unfiltered data in tabular text (CSV)', '#filtered-or-unfiltered-data-in-tabular-text-csv',
  'Notification of download', '#notification-of-download',
  'Additional downloads of external resources', '#additional-downloads-of-external-resources',
  'Chart as picture (PNG)', '#chart-as-picture-png',
  'Full screen', '#full-screen',
  'Developer API', '#developer-api',
]

---

#### Table of Content
- [View type](#view-type)
- [Labels](#labels)
- [Layout and Customise](#layout-and-customise)
- [Share](#share)
- [Download](#download)
  - [Table in Excel](#table-in-excel)
  - [Filtered or unfiltered data in tabular text (CSV)](#filtered-or-unfiltered-data-in-tabular-text-csv)
  - [Notification of download](#notification-of-download)
  - [Additional downloads of external resources](#additional-downloads-of-external-resources)
  - [Chart as picture (PNG)](#chart-as-picture-png)
- [Full screen](#full-screen)
- [Developer API](#developer-api)

![Toolbar](/dotstatsuite-documentation/images/de-toolbar1.png)

---

### View type
On the left side of the toolbar, the user can select to display data in a **table view** or in **chart view**.  
The data table view is the default view when the user arrives from a search result.  

Chart types depend on the configuration of the DE instance, or on the type of data (e.g. viewing data in a timeline chart is feasible only with the appropriate time dimension). For more information about charts and chart types, go to [this documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/charts/).

![Toolbar](/dotstatsuite-documentation/images/de-toolbar-chart.jpg)

---

### Labels
The "Labels" option allows to display the information using names, identifiers (unique IDs) or both.  

![Toolbar](/dotstatsuite-documentation/images/de-toolbar3.png)

This option applies to all the table and chart contents, including their header and footer, as well as to the Excel and CSV data downloads. When the option `Both` is selected, then it shows the Identifer between brakets, then a space, followed by the name. If there is no corresponding localised name, then the identifier is shown instead and displayed between squared brackets [].  

Example with the dimension label `Reference area`:
* with option **Name**, it displays **`Reference area`**
* with option **Identifier**, it displays **`REF_AREA`**
* with option **Both**, it displays **`(REF_AREA) Reference area`** 

Since [May 19, 2021 Release .Stat Suite JS 8.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#may-19-2021), the option is also applied to all filter titles and filter values. It is also possible to spotlight search by code ID in filters, meaning searching for dimension items by their IDs, if the user has selected the Labels->ID or Labels->Both option.

---

### Layout and Customise
The **Layout/Customise** option is contextual depending on the type of data view representation.  
For the data **table preview** "Layout" option, check the documentation [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/customise-feature/).  
For the data **chart views** "Customise" option, check the docmentation [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/charts/).

---

### Share
The **Share** option allows sharing the data view in table or chart mode. For details, go to the [Share](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/share/) page.

---

### Download
There is an option to **download** data in a specific format and content according to the current data view, and accessible from both table and chart views.  
The downloaded content is contextualised by applying the **Label** option as follow:
* If the table/chart option is 'Identifier', then the data in the downloaded file is presented with the related SDMX artefact IDs.
* If the table/chart option is 'Name' or 'Both' (Name + Identifier), then the data in the downloaded file is presented with the related SDMX artefact IDs and localised names according to the current **locale** in the appplication. 

![Download](/dotstatsuite-documentation/images/de-download1.png)  

Since [April 20, 2023 Release .Stat Suite JS unicorn](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-20-2023), the rules for naming downloaded Excel and CSV files has changed to be more generic:

* for filtered Excel and CSV files:  
  [agency ID],[dataflow ID],[version],filtered,[YYYY-MM-DD HH-MM-SS].csv|xlsx
* for unfiltered CSV file:  
  [agency ID],[dataflow ID],[version],complete,[YYYY-MM-DD HH-MM-SS].csv  
  
Example: For the dataflow OECD:SNA_TABLE1(1.0), according to the selected option, the file names will be
* for **Table in Excel**: OECD,SNA_TABLE1,1.0,**filtered**,2023-02-21 17-22-55.**xlsx** 
* for **Filter data in tabular text (CSV)**: OECD,SNA_TABLE1,1.0,**filtered**,2023-02-21 17-22-55.**csv**
* for **Unfilter data in tabular text (CSV)**: OECD,SNA_TABLE1,1.0,**complete**,2023-02-21 17-22-55.**csv**

The details on the specific download formats accessible directly from within the Data Explorer are described in the sub-sections below.

#### Table in Excel  
Only the filtered data contained in the preview table (or chart) view is downloaded in **.xlsx** file format.  
As much as possible, the preview table's layout, styles, cell and text formatting, and attributes presented as flags and notes are maintained in the downloaded Excel file and presented in its first and default sheet. 

This also includes the preview **table limitation** (maximum number of observations to be returned by the *SDMX* web service, see [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/incomplete-data/)). Since [December 14, 2021 Release .Stat Suite JS 11.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#december-14-2021), this limitation is mentionned in the Excel file that includes a localised (red) warning message displayed in the first empty cell below the dataflow title or subtitle:  
> *"The data extraction used a data selection that is above the limits for the table display (maximum n data points or n table cells) resulting in an incomplete table. Using the web link below the table, all originally selected data points can still be downloaded in tabular text (CSV)."*  

The online **table header**'s title and sub-title are replicated in separate lines above the data table. The online **table footer**'s copyright is replicated in a separate line below the data table (including its hyperlink). The source link is also replicated below the table with the data view name and hyperlink to the original online view.   
  
The values of **attributes presented as flags and notes** are now stored in Excel cell comments (visible on mouse-over) and indicated through a _custom cell number format_ to display the flag and/or a star `*` (introduced with [July 20, 2023 Release .Stat Suite JS Virtual](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#july-20-2023)).  

- ![Excel download - flags and notes - 1](/dotstatsuite-documentation/images/de-excel-download-flags-and-notes-1.png)
- ![Excel download - flags and notes - 2](/dotstatsuite-documentation/images/de-excel-download-flags-and-notes-2.png)
- ![Excel download - flags and notes - 3](/dotstatsuite-documentation/images/de-excel-download-flags-and-notes-3.png)

**RTL** (Right-to-Left) mode is supported, allowing to programmatically switching the layout of a downloaded Excel data table between left-to-right and right-to-left. Depending on the version viewed online (e.g. in Arabic language) and the user's localised preferences in Excel, the downloaded Excel table will automatically be displayed in RTL mode.

![Excel download - flags and notes - rtl](/dotstatsuite-documentation/images/de-excel-download-flags-rtl1.png)

**Overview page content**  
> Introduced with [September 15, 2022 Release .Stat Suite JS radio](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#september-15-2022)

The information displayed on the **Overview tab** of the Data Explorer (except for the footer's "terms and conditions" and the source link) is downloaded into a third Excel sheet named `Overview`. The overview information is displayed word-wrapped in the 810px-wide column B, starting in the first row with the dataflow name. The same font (calibri 11) and top-left alignment is applied on all text.  
Here is a sheet with the possible information and layout that can be found on a dataflow overview:

![Download](/dotstatsuite-documentation/images/de-download-overview1.png)

Only lines (and separation lines) with available information are included. Note also that enriched text elements are not supported.

![Download](/dotstatsuite-documentation/images/de-download-overview2.png)

#### Filtered or unfiltered data in tabular text (CSV)
Data is downloaded in **.csv** file format, which is a flat tabular text format. This format does not contain the preview table header or footer. The downloaded file includes the *SDMX* dataflow identification.

- **Filtered** data: Only the data according to the current filter selection is downloaded.  
- **Unfiltered** data: The full (unfiltered) data contained in the underlying dataflow is downloaded.  

If the [Labels](#labels) option is set to **Identifier**, then the CSV download file will only contain the identifiers (ID) of nameable SDMX objects (dataflow, dimensions, measures, attributes, and their respective items/values if coded). For that purpose, the underlying SDMX HTTP `Accept` header is `application/vnd.sdmx.data+csv;file=true`.  

If the [Labels](#labels) option is set to **Name** or **Both**, then the CSV download file contains additional columns with the localised names of the nameable SDMX objects. For that purpose, the underlying SDMX HTTP `Accept` header is `application/vnd.sdmx.data+csv;version=2;file=true;labels=name`. Here is an example of a CSV file that includes separate columns for localised names:   
![Set labels to name](/dotstatsuite-documentation/images/de-toolbar-download-data-with-labels-set-to-name.png)

#### Notification of download
> Released in [December 5, 2022 Release .Stat Suite JS spin](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#december-5-2022)

Instead of using a _space-limited_ JavaScript 'memory blob', for downloads of filtered and unfiltered data in tabular text (CSV) files with the underlying SDMX web service, the Data Explorer now uses the browser's inbuilt web resource download feature, which allows the user seeing the download start and progress in the browser's standard way. Since there may be a little delay between the service call and the start of the service response (download start) depending on the request size and the server performance, the DE displays a notification message: *"Download launched. Your download will start shortly. In the meantime, you can continue browsing."* Clicking on the right aligned cross closes the notification.  

![Download notification](/dotstatsuite-documentation/images/de-download-notification.png)

The browser's inbuilt download feature is however constrained to web requests without specific HTTP header options, thus only possible for _unauthenticated_ HTTP GET requests and for data spaces with an SDMX service that supports the `format=csvfile|csvfilewithlabels` URL parameter (as alternative to the above mentioned HTTP `Accept` header options). This feature is thus not used in the following situations:
- when the SDMX web service doesn't support the `format=csvfile|csvfilewithlabels` URL parameter
- for very large filter selections, when the DE needs to use POST requests instead of GET requests (see [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration#support-of-long-urls) for more information)
- for authenticated users, when the DE needs to set the HTTP authorisation header.

**Note:** The NSI SDMX web service supports the `format=csvfile|csvfilewithlabels` URL parameter, which can be configured as described [here](https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored/-/blob/master/doc/CONFIGURATION.md#format-configuration). Any data space using an SDMX web service (version) that doesn't support this `format` URL parameter, must be indicated in the `tenants.json` configuration file with the property `"supportsCsvFile": false`, see [the related documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#non-support-of-the-format-url-parameter-by-a-data-space), because the support of the `format` URL parameter is assumed by default.

#### Additional downloads of external resources
> Released in [December 02, 2019 Release .Stat Suite JS milestone 7](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#december-02-2019)

Additional links to external resources can be defind per dataflow, which then become available in the "Download" feature of the Data Explorer visualisation page.

To do so, use localised SDMX `EXT_RESOURCE` annotations at the dataflow level to define one or several links to files (of any type) that are stored externally (outside .Stat Suite storage).

Being a localised annotation, it is possible to define a different resource per language. The Data Explorer proposes the download of the resources defined for the current locale of the Data Explorer. The annotation texts contain up to 3 strings, separated by a pipe ("|") character:  
- the to be displayed label of the link
- the valid, publicly accessible link to the external resource
- a valid, publicly accessible link to a to be displayed icon image (optional)

**Syntax**  

```
"annotations": [{
		"type": "EXT_RESOURCE",
		"text": "All data in Excel|http://www.ilo.org/ilostat-files/Documents/Excel/MBI_535_EN.xlsx|https://www.ilo.org/ilostat/dotstatsuite-documentation/images/downloadexcel-24.png",
		"texts": {
			"en": "All data in Excel|http://www.ilo.org/ilostat-files/Documents/Excel/MBI_535_EN.xlsx|https://www.ilo.org/ilostat/dotstatsuite-documentation/images/downloadexcel-24.png",
			"fr": "Toutes les données en Excel|http://www.ilo.org/ilostat-files/Documents/Excel/MBI_535_FR.xlsx|https://www.ilo.org/ilostat/dotstatsuite-documentation/images/downloadexcel-24.png"
		}
	},{
		"type": "EXT_RESOURCE",
		"text": "Explanatory information in pdf|http://www.ilo.org/ilostat-files/Documents/Metadata/Ref_MD_EN.pdf",
		"texts": {
			"en": "Explanatory information in pdf|http://www.ilo.org/ilostat-files/Documents/Metadata/Ref_MD_EN.pdf",
			"fr": "Informations explicatives en pdf|http://www.ilo.org/ilostat-files/Documents/Metadata/Ref_MD_FR.pdf"
    }
	}]
```

**Example**

In this example, the dataflow artefact contains 3 localised (English and French) `EXT_RESOURCE` annotations for 3 external resources, together with their labels and links to icons to be displayed.

![Example of EXT_RESOURCE structure annotation](/dotstatsuite-documentation/images/EXTERNAL-RESOURCES-01.png)

This will result in proposing the 3 external resources as additional dataflow download options in the DE visualisation page:

![Example of EXT_RESOURCE annotation download](/dotstatsuite-documentation/images/EXTERNAL-RESOURCES-02.png)

#### Chart as picture (PNG)
> Released in [July 23, 2020 Release .Stat Suite JS 5.2.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#july-23-2020)  

All graphical reprensentations of a data view (chart types) are available for **download as picture** in a **.png** format with high quality screenshot rendering (using the https://html2canvas.hertzen.com/ library).  

![Download chart option](/dotstatsuite-documentation/images/de-download-chart.png)

The option is only available when viewing data in a chart representation. The application downloads the screenshot of the current chart together with its header and footer in a .png format. It is using the current chart size, highlights and baseline as provided or set by the user in the chart customisation.  
The default chart's filename is consistent with the downloaded Excel's filename, being the `AgencyID.DataflowID_Version` combined with the filter selection(s) and the .png extension.

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

 Clicking on the top-right cross icon will close the panel without any action.
