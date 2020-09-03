---
title: "Using .Stat DLM Excel-Addin"
subtitle: 
comments: false
weight: 800

---

#### Table of Content
- [Introduction](#introduction)
- [DLM Excel-Addin in the Excel ribbon](#dlm-excel-addin-in-the-excel-ribbon)
- [New table (select the source)](#new-table-select-the-source)
- [Step 1: select data](#step-1-select-data)
- [Step 2: specify output](#step-2-specify-output)
- [Get data: overview](#get-data-overview)
- [Save to database](#save-to-database)
- [Refresh](#refresh)

### Introduction
**.Stat DLM Excel-Addin** is a powerful Excel facilitator of data editing and sharing. It gives access in Excel to in-progress or published data ,from internal or external SDMX data sources.

The DLM Excel-Addin is delivered as a **ClickOnce** application and is deployed using the common procedure for [deployment of ClickOnce applications](https://msdn.microsoft.com/en-us/library/t71a733d.aspx).  
The installation files are accessible from [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-excel-addin) along with more information about deployment, set up and configuration. A best practice is to install it on a shared network folder.

**Test version**  
A simplified and compiled (.zip) **test version** can also be downloaded from [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-excel-addin/-/blob/master/install/Stat-DLM.zip). This zipped package contains all the files necessary for an easy installation with a self-signed certificate.  
**! This version is ONLY for test and demo purposes, to be running on a non-trusted environment such as a personal computer or outside your organisation/company's network.**  
Also included in the zipped package is a short text procedure for easing the installation.

---

### DLM Excel-Addin in the Excel ribbon
Once installed, the .Stat DLM Excel-Addin will appear on top of the Excel ribbon. Click on it to access the menu.

![DLM Excel-Addin ribbon](/dotstatsuite-documentation/images/dlm-excel-addin-01.png)

---

### New table (select the source)
To start using DLM Excel-Addin, you first need to select the source of data:

![DLM Excel-Addin select source](/dotstatsuite-documentation/images/dlm-excel-addin-02.png)

---

### Step 1: select data
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

**cache clean-up**    
The DLM Excel-Addin has an in-built cache with 2 functions:
- caching structures for the duration of 3 days
- caching data for the duration of the current Excel session  
In order to allow you getting fresher structures or data than those in the current cache, clicking the **cache clean-up** refresh button **empties the cache for all structures and data.**

**Edit favorites**  
Editing favorites allows you to add or remove dataflows form your favorites, clearing all previously selected dataflows as favorites, and save back the selections. You can display all dataflows from the source, or only favorites.

![DLM Excel-Addin edit favorites](/dotstatsuite-documentation/images/dlm-excel-addin-04.png)

**Edit filters**  
Editing filters, after having selected a dataflow from the list, will allow you to:
- Reduce the default "all" selection for each dimension filter by seelcting elements one by one,
- Select all elements or none per each dimension filter,
- Search for a specific element (spotlight feature) in a dimension filter,
- Show only selected elements per dimension filter,
- Apply your final selection(s), or cancel all selection(s).

![DLM Excel-Addin edit filters](/dotstatsuite-documentation/images/dlm-excel-addin-05.png)

The edit filters window offers advanced options for specific dimensions such as **TIME_PERIOD** and allows to select frequency and start/end periods:

![DLM Excel-Addin edit filters time period](/dotstatsuite-documentation/images/dlm-excel-addin-06.png)

**Check/modify your filters selection**  
Once you applied filter(s) selection(s), it is possible to review it and modify directly from the "Current filters" list by directly editing the fields (add/remove):

![DLM Excel-Addin modify selections](/dotstatsuite-documentation/images/dlm-excel-addin-07.png)

**Paste a selection**  
You selection is returned as a SDMX Rest query, but you can also retrieve such query from another system/environment, paste it intot he bottom filed, and applied it as the wished selection. The filters selections will thus be applied to the corresponding above fields:

![DLM Excel-Addin paste selection](/dotstatsuite-documentation/images/dlm-excel-addin-08.png)

---

### Step 2: specify output
After completing step 1, you can click on "Next step". Step 2 of preparing your data extraction offers the following options:
- Choose where the output should start (Excel sheet and cell) **(1)** 
- Specify the output table type **(2)**
- Define the available options for returning the data **(3)**
- Show the query syntax in the supported formats **(4)**
- Go back to Step 1 **(5)**
- Generate the Excel table with Step 1 and Step 2 choices **(6)**

![DLM Excel-Addin step 2](/dotstatsuite-documentation/images/dlm-excel-addin-09.png)

**Table type**  
DLM Excel-Addin is made for retrieving data within Excel tables with simple layout, and the current version supports **flat**, **time series down**, and **time series across** layouts.

![DLM Excel-Addin table type](/dotstatsuite-documentation/images/dlm-excel-addin-10.png)

**Return data options**  
You can generate the Excel table with the localised labels for dimensions and dimension members, with or without excluding the codes. Localised labels can be picked in the language made available in the sourced data.  
You also have the option to generate the data with the attribute values.

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

Clicking on **"Get data"** from Step 2 generates the flat or time-series oriented Excel table filled with all data, meaning all observation and attribute values for the given selection.  
**Note** that for attribute values defined at higher level than the observaiton value, those high-level attribute values are retrieved and replicated for each time-series in the 2 time-series formats, and for each observation in the flat format.

---

### Get data: overview

![DLM Excel-Addin get data overview](/dotstatsuite-documentation/images/dlm-excel-addin-13.png)

**Change selection**  
Clicking on "Change selection" will bring you back to Step 1 where you can modify your previous choices.  
Applying new options all the way through "Step 2" and "Get data" will generate a new Ecxel table with your new choices, and thus replacing the previous ones.

![DLM Excel-Addin get data overview](/dotstatsuite-documentation/images/dlm-excel-addin-14.png)

---

### Save to database
Based on your access rights and permisisons over the sourced data, edited data can be saved back to the sourced database. The DLM Excel-Addin checks if you are allowed to submit data for the given dataflow and disable the "Save to database" buttons if you have not the required access rights.

You can select a range of edited data and request for saving back only the selection by clikcing on **"Selected data"**, or request for saving all changes made on the entire sheet/dataflow by clicking on **"Entire table"**.  
When requesting to save back edited data to Database, a pop-up **"Login"** window requests you to provide your credentials in order to check your access rights.

![DLM Excel-Addin get data overview](/dotstatsuite-documentation/images/dlm-excel-addin-15.png)

The new data are then submitted and a pop-up notification message will confirm the number of edited/saved observation(s).

![DLM Excel-Addin get data overview](/dotstatsuite-documentation/images/dlm-excel-addin-16.png)

---

### Refresh
Two **data refresh** options allow you to empty the cache of the currently concerned data before requesting fresh data from the web service. you can request to refresh your current sheet/Excel table, or all sheets/Excel table from all related databases/underlying web services.

![DLM Excel-Addin get data overview](/dotstatsuite-documentation/images/dlm-excel-addin-17.png)

