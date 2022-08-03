---
title: "Toolbar"
subtitle: 
comments: false
weight: 3500
keywords: [
  'View type', '#view-type',
  'Labels', '#labels',
  'Customise', '#customise',
  'Share', '#share',
  'Download', '#download',
  'Table in Excel', '#table-in-excel',
  'Filter data in tabular text (CSV)', '#filter-data-in-tabular-text-csv',
  'Unfiltered data in tabular text (CSV)', '#unfiltered-data-in-tabular-text-csv',
  'Additional downloads of external resources', '#additional-downloads-of-external-resources',
  'Chart as picture (PNG)', '#chart-as-picture-png',
  'Full screen', '#full-screen',
  'Developer API', '#developer-api',
]

---

#### Table of Content
- [View type](#view-type)
- [Labels](#labels)
- [Customise](#customise)
- [Share](#share)
- [Download](#download)
  - [Table in Excel](#table-in-excel)
  - [Filter data in tabular text (CSV)](#filter-data-in-tabular-text-csv)
  - [Unfiltered data in tabular text (CSV)](#unfiltered-data-in-tabular-text-csv)
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

![Toolbar](/dotstatsuite-documentation/images/de-toolbar-chart.png)

---

### Labels
The "Labels" option allows to display the information using names, identifiers (unique IDs) or both.  

![Toolbar](/dotstatsuite-documentation/images/de-toolbar3.png)

This option applies to all the table and chart contents, including their header and footer. When the option `Both` is selected, then it shows the Identifer bewteen brakets, then a space, then the name. If there is no corresponding localised name, then the identifier is shown instead and displayed between squared brackets [].  

Example with the dimension label `Reference area`:
* with option **Name**, it displays **`Reference area`**
* with option **Identifier**, it displays **`REF_AREA`**
* with option **Both**, it displays **`(REF_AREA) Reference area`** 

Since [May 19, 2021 Release .Stat Suite JS 8.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#may-19-2021), the option is also applied to all filter titles and filter values. It is also possible to spotlight search by code ID in filters, meaning searching for dimension items by their IDs, if the user has selected the Labels->ID or Labels->Both option.

---

### Customise
The **Customise** option is contextual depending on the type of data view representation.  
For the data **table preview**, check the documentation [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/customise-feature/).  
For the data **chart views**, check the docmentation [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/charts/).

---

### Share
The **Share** option allows sharing the data view in table or chart mode. For details, go to the [Share](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/share/) page.

---

### Download
There is an option to **download** data in a specific format and content according to the current data view, and accessible from both table and chart views.  
The download feature is contextual, therefore the **Label** option will act accordingly:
* If the table/chart option is "Identifier", then the downloaded file contains codes only;
* If the table/chart option is "Name" or "Both" (Name + Identifier), then the downloaded file contains identifiers and names.  
The **locale** used for names is the currently used language in the application.  

The download options form the dropdown button are described below.  

![Download](/dotstatsuite-documentation/images/de-download1.png)

#### Table in Excel  
Only the filtered data contained in the online table (or chart) view is downloaded in **.xlsx** file format.  
All online table's layout, styles, cell and text formatting are maintained in the downloaded Excel file.  
The online **table limitation** (maximum number of observations to be returned by the *SDMX* web service) is maintained in the downloaded file (see [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/incomplete-data/)). Since [December 14, 2021 Release .Stat Suite JS 11.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#december-14-2021), this limitation is mentionned in the Excel file that includes a localised (red) warning message displayed in the first empty cell below the dataflow title or subtitle:  
> *"The data extraction used a data selection that is above the limits for the table display (maximum n data points or n table cells) resulting in an incomplete table. Using the web link below the table, all originally selected data points can still be downloaded in tabular text (CSV)."*  

**Attributes** in flags and footnotes are also included in the downloaded Excel file, as internal links into a second sheet with exactly the same layout, but without any of the values and with flags in the cells instead of the values.  
The online **table header**'s title and sub-title are replicated in separate lines above the data table. The online **table footer**'s copyright is replicated in a separate line below the data table (including its hyperlink). The source link is also replicated below the table with the data view name and hyperlink to the original online view.  
**RTL** (Right-to-Left) mode is supported, allowing to programmatically switching the layout of a downloaded Excel data table between left-to-right and right-to-left. Depending on the version viewed online (e.g. in Arabic language) and the user's localised preferences in Excel, the downloaded Excel table will automatically be displayed in RTL mode.

![Download](/dotstatsuite-documentation/images/de-download2.png)

#### Filter data in tabular text (CSV)
Only the filtered data contained in the online table (or chart) view is downloaded in **.csv** file format, wich is a flat tabular text format.  
This format does not contains header or footer, and the downloaded data view is identified by the *SDMX* Dataflow Agency:ID(Version). 

#### Unfiltered data in tabular text (CSV)
The full (unfiltered) data contained in the online request behind a table (or chart) view is downloaded in **.csv** file format, wich is a flat tabular text format.  
This format does not contains header or footer, and the downloaded full data view is identified by the *SDMX* Dataflow Agency:ID(Version). 

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

See the [DLM documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/custom-data-view/external-resources/) how to interactively define new external resources.

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

