---
title: "Using .Stat DLM Excel-Addin"
subtitle: 
comments: false
weight: 800

---

#### Table of Content
- [Introduction](#introduction)
- [DLM Excel-Addin in the Excel ribbon](#dlm-excel-addin-in-the-excel-ribbon)
- [Get data: select the source](#get-data-select-the-source)
- [Get data step 1: select data](#get-data-step-1-select-data)
- [Get data step 2: specify output](#get-data-step-2-specify-output)
- [Get data: result table](#get-data-result-table)
- [Get data: change selection](#get-data-change-selection)
- [Save to database](#save-to-database)
- [Refresh](#refresh)

### Introduction

**.Stat DLM Excel-Addin** is a powerful Excel facilitator of data editing and sharing. It gives access in Excel to in-progress or published data, from internal or external SDMX data sources.

The DLM Excel-Addin is delivered as a **ClickOnce** application and is deployed using the common procedure for [deployment of ClickOnce applications](https://msdn.microsoft.com/en-us/library/t71a733d.aspx).   
The installation files are accessible from [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-excel-addin) along with more information about deployment, set up and configuration.  
A best practice is to store the files on a shared network folder, update the configuration (e.g. to reference specific SDMX data sources or update the application title), to re-sign the installation package with your organisation's own certificate, and allow users running locally the installation. Whenever the installation package on the shared folder is updated (and re-signed), the ClickOnce technology will automatically upgrade all local user installations when they open Excel the next time.  

**Demo version**  
A ready-made (.zip) **demo version** can also be downloaded from [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-excel-addin/-/blob/master/install/Stat-DLM.zip). This installation package has already be *signed with a self-signed certificate*, and can immediately be used for an isolated, local installation.  
**! This version is ONLY for demo purposes, to be executed only in a non-trusted environment such as a personal computer or outside your organisation/company's network.**  
Also included in the zipped package is a short text procedure for easing the installation.

**Main features**  
The DLM Excel-Addin allows:
- browsing through categorised dataflows in SDMX-enabled internal and external data sources
- downloading data from these sources into various flavours of Excel tables  
- refreshing the content of these Excel tables through re-downloading the data that might have been updated in these sources  
- updating or adding data in internal data sources (provided the user has sufficient permissions) through editing of these Excel tables

---

### DLM Excel-Addin in the Excel ribbon
Once installed, the .Stat DLM Excel-Addin will appear in your Excel ribbon. Click on it to access the menu.

![DLM Excel-Addin ribbon](/dotstatsuite-documentation/images/dlm-excel-addin-01.png)

---

### Get data: select the source
To start using DLM Excel-Addin, you first need to select the source of data:

![DLM Excel-Addin select source](/dotstatsuite-documentation/images/dlm-excel-addin-02.png)

---

### Get data step 1: select data
Once the source has been selected, you will be able to:
- Show all dataflows for the selected source **(1)**
- Show only your favorites dataflows **(2)**
- Search for a specific dataflows you are looking for **(3)**
- Refresh the list of dataflows by cleaning up the cache **(4)**
- Add a listed dataflow as a favorite **(5)**
- Edit your favorites **(6)**
- Filter on data by editing your filter selection **(7)**
- Check and/or modify the current filters of your selection **(8)**
- Paste a selection (SDMX Rest query) **(9)**

![DLM Excel-Addin step 1](/dotstatsuite-documentation/images/dlm-excel-addin-03.png)

**Cache clean-up**    
The DLM Excel-Addin has an in-built cache with 2 functions:
- Caching structures for the duration of 3 days,
- Caching data for the duration of the current Excel session (only for the case that the user changes the table layout but not the data selection).

In order to allow you getting fresher structures than those in the current cache, clicking the **cache clean-up** refresh button **empties the cache for all structures**.

**Edit favorites**  
Editing favorites allows you adding or removing dataflows from your favorites, clearing all previously selected dataflows as favorites, and saving back the selections. You can show all dataflows from the current data source, or only favorites.

![DLM Excel-Addin edit favorites](/dotstatsuite-documentation/images/dlm-excel-addin-04.png)

**Edit filters**  
Editing filters, after having selected a dataflow from the list, allows you:
- Modifying the default "all" selection for a given dimension filter by selecting elements one by one,
- Selecting all elements or none for a given dimension filter,
- Searching for a specific element (spotlight feature) in a dimension filter,
- Showing only selected elements per dimension filter,
- Applying your final selection(s), or cancel all (No filter, re-applying the "all" default setup).

![DLM Excel-Addin edit filters](/dotstatsuite-documentation/images/dlm-excel-addin-05.png)

The edit filters window offers advanced options for specific dimensions such as **TIME_PERIOD**, which allows selecting frequency or editing start/end periods:

![DLM Excel-Addin edit filters time period](/dotstatsuite-documentation/images/dlm-excel-addin-06.png)

**Check/modify your filters selection**  
Once you applied your filter selection(s), it is possible to view and directly modify it/them by editing the "Current filters" fields (add/remove):

![DLM Excel-Addin modify selections](/dotstatsuite-documentation/images/dlm-excel-addin-07.png)

**Paste a selection**  
Your selection is returned as an SDMX Rest query, but you can also edit this query in this field and apply the wished modifications. The filter selections will then be updated accordingly in the above data filters:

![DLM Excel-Addin paste selection](/dotstatsuite-documentation/images/dlm-excel-addin-08.png)

---

### Get data step 2: specify output
After completing step 1, you can click on "Next step". Step 2 offers the following options before lauching the data extraction:
- Choose where the output table should start (Excel sheet and cell) **(1)** 
- Specify the output table type **(2)**
- Define the available options for returning the data **(3)**
- Show the query syntax in the supported formats **(4)**
- Go back to Step 1 **(5)**
- Generate the Excel table with Step 1 and Step 2 choices **(6)**

![DLM Excel-Addin step 2](/dotstatsuite-documentation/images/dlm-excel-addin-09.png)

**Table type**  
DLM Excel-Addin is made for retrieving data as Excel tables with a simple layout. The current version supports **flat**, **time series down**, and **time series across** layouts.

![DLM Excel-Addin table type](/dotstatsuite-documentation/images/dlm-excel-addin-10.png)

**Return data options**  
You can generate the Excel table with the localised names for dimensions and dimension members, with or without excluding the underlying IDs. Localised names can be picked in the language made available in the sourced data.  
You also have the option to extract the observation values along with the attribute values. Currently, this option must be activated if you would like to use the addin later to save corresponding observation values back into the (internal) data source.

![DLM Excel-Addin return data options](/dotstatsuite-documentation/images/dlm-excel-addin-11.png)

**Query syntax**  
DLm Excel-Addin can generate your selection in various supported formats:
- SDMX Rest query
- STATA
- Eviews
- SAS
- SQL
- R

![DLM Excel-Addin query syntax](/dotstatsuite-documentation/images/dlm-excel-addin-12.png)

Clicking on **"Get data"** from Step 2 generates the flat or time-series oriented Excel table filled with all data, meaning all observation and attribute values (if you chose the option in step 2) for the given selection.  
**Note** that for attribute values defined at higher level than the observation value, those high-level attribute values are retrieved and replicated for each time-series in the 2 time-series formats, and for each observation in the flat format.

---

### Get data: result table

![DLM Excel-Addin get data result table](/dotstatsuite-documentation/images/dlm-excel-addin-13.png)

---

### Get data: change selection  
Clicking on "Change selection" will bring you back to Step 1 where you can modify your previous choices.  
Applying new options all the way through "Step 2" and "Get data" will generate a new Excel table with the new choices, and thus replacing the previous ones.

![DLM Excel-Addin get data overview](/dotstatsuite-documentation/images/dlm-excel-addin-14.png)

---

### Save to database
Based on your access permissions on the source data, **edited data can be saved back** to the (internal) source database. When you try to save data in the data source, the DLM Excel-Addin asks through a pop-up **"Login"** window for your credentials to check if you are allowed to submit data for the given dataflow. The credentials are stored in the current Excel session and are re-used when you use the save feature again. 
When data are extracted from an external datasource, the "Save to Database" buttons are not shown.

You can select a range of edited data and request for saving back only the current selection by clicking on **"Selected data"**, or request for saving all changes made on the current table by clicking on **"Entire table"**.  

![DLM Excel-Addin get data overview](/dotstatsuite-documentation/images/dlm-excel-addin-15.png)

The new data are then submitted and a pop-up notification message confirms the number of saved observation(s).  
An email is sent to the end-user once this data request is completed. See [Email notifications for data management](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/message-through-mail/) for more details.

![DLM Excel-Addin get data overview](/dotstatsuite-documentation/images/dlm-excel-addin-16.png)

---

### Refresh
Two **data refresh** options allow you fully refreshing the data table(s) with updated data from the underlying data source(s). You can request to refresh the data tables in your **"current sheet"**, or all data tables in **"all sheets"**.

![DLM Excel-Addin get data overview](/dotstatsuite-documentation/images/dlm-excel-addin-17.png)

