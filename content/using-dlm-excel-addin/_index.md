---
title: "Using .Stat DLM Excel Add-in"
subtitle: 
comments: false
weight: 800
keywords: [
  'Introduction', '#introduction',
  'DLM Excel Add-in in the Excel ribbon', '#dlm-excel-add-in-in-the-excel-ribbon',
  'Authentication', '#authentication'
]
---
<!-- This page (or a sub-page or sub-section of this page) of the documentation is referenced as an external resource in the .Stat Academy:
* https://academy.siscc.org/using-dotstat-suite/
Any change affecting its URL must be communicated to the .Stat Academy content admin in advance. -->

![DLM logo](/dotstatsuite-documentation/images/dlm-excel-add-in_logo.png)

#### Table of Content
- [Introduction](#introduction)
- [DLM Excel Add-in in the Excel ribbon](#dlm-excel-add-in-in-the-excel-ribbon)
- [Authentication](#authentication)

---

### Introduction

![Watch this video](/dotstatsuite-documentation/images/movie-logo.png)**<a href="https://www.youtube.com/watch?v=vbDJiXTQiIs" target="_blank">Watch this video</a>** on how to get started with .Stat DLM Excel Add-in.


**.Stat DLM Excel Add-in** is an Excel facilitator for data and referential metadata retrieval and editing. Directly within Excel it gives access to in-progress or published data, from internal or external SDMX data sources, as well as from legacy .Stat V7 systems.  

The DLM Excel Add-in is packaged as a **ClickOnce** application and is deployed using the common procedure for [deployment of ClickOnce applications](https://msdn.microsoft.com/en-us/library/t71a733d.aspx).  
The installation files are accessible from [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-excel-addin) along with more information about deployment, set up and configuration.  

A best practice is to store the installation files on a shared network folder, to update the configuration to reference required SDMX data sources and to change the application title, to re-sign the installation package with an organisation's own certificate, and to allow all users running the installation locally. Whenever the installation package on the shared folder is updated (and re-signed), the ClickOnce technology will automatically upgrade all local users' installations the next time that they open Excel.

**Demo version**  
A ready-made (.zip) demo version can also be downloaded from [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-excel-addin/-/blob/master/install/Stat-DLM.zip). This installation package has already been *signed with a self-signed certificate*, and can immediately be used for an isolated, local installation.  
**! This version is ONLY for demo purposes, to be executed only in a non-trusted environment such as a personal computer or outside an organisation/company's network.**  
Also included in the zipped package is a short manual to ease the installation.

**Main features**  
The DLM Excel Add-in allows:
- [Authenticating](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm-excel-addin/#authentication) to access-restricted internal .Stat Suite data spaces
- [Browsing](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm-excel-addin/get-data/#select-data) through a list of dataflows in SDMX-enabled internal and external data spaces (and of datasets in legacy .Stat V7 systems)
- [Retrieving](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm-excel-addin/get-data/#table-contents) data or referential metadata from these spaces into various flavours of Excel tables
- [Refreshing](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm-excel-addin/get-data/#refresh) the content of the retrieved Excel tables through re-downloading the data that might have been updated in these spaces
- [Updating/adding](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm-excel-addin/edit-data/) data or referential metadata to internal data sources (provided the user has sufficient permissions)
- [Editing multi-lingual String and HTML values](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm-excel-addin/edit-data/#edit-string-and-xhtml-values) (currently only for referential metadata) including a (WYSIWYG) rich-text editor for HTML values
- [Saving](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm-excel-addin/edit-data/#save-data-to-data-space) updated and/or new data or referential metadata values back to internal data sources

---

### DLM Excel Add-in in the Excel ribbon
Once installed, the .Stat DLM Excel Add-in menu will appear in the user's Excel ribbon.

![DLM Excel-Addin ribbon](/dotstatsuite-documentation/images/dlm-excel-addin-ribbon.png)

By default, the menu contains two features:
- ["Get data": "New table"](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm-excel-addin/get-data): to retrieve data from a data space into a new Excel table 
- The version menu, indicating the semantic version number of the DLM Excel Add-in currently in use, together with a question mark icon linking to the functional specifications of the DLM Excel Add-in.

Whenever the user is currently authenticated for one or several of the related data spaces, the menu add this feature:
- ["Log out"](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm-excel-addin/#authentication) (if authenticated): to log out for a user account

In addition, whenever the Excel cursor is located on a cell within a data or referential metadata table linked to a .Stat Suite data space, the ribbon menu displays the following options:
- ["Get data": "Change Selection"](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm-excel-addin/get-data/#change-selection): to change the selection of the current table
- ["Refresh": "Current Sheet"/"All Sheets"](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm-excel-addin/get-data/#refresh): to refresh the table data
- The source information of the table data:
  - "Name" or "ID" of the data (can be switched with a dropdown on the icon): the localised name according to the language chosen in step 2 of the wizard, or the data identification (for SDMX-based data in the form `Agency:Id(Version)`),
  - "Source": the data space name,
  - "Last extraction date": Date and time of last data retrieval
  This information automatically updates accordingly whenever the user moves the cursor to a different data or referential metadata table.

![DLM Excel-Addin header info](/dotstatsuite-documentation/images/dlm-excel-addin-header-info.png)

In case, the user has appropriate data edit permissions, the menu also shows the features:
- ["Save to Database": "Selected Data"/"Entire Table"](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm-excel-addin/edit-data/#save-to-data-source): to save selected data or table to the data space
- ["Referential metadata": "Edit"](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm-excel-addin/edit-data/#editing-string-and-html-values) (if the cursor is on a relevant value cell): to ease editing multi-lingual values (including HTML)

 When the window is reduced and the menu narrowed, all ribbon groups have a defined icon with and arrow to invite the user to display the proposed information or actions.  
![DLM Excel-Addin ribbon](/dotstatsuite-documentation/images/dlm-excel-addin-ribbon-narrowed.png)

---

### Authentication

When extracting data for a new table, changing a selection, refreshing a table or saving data related to an internal .Stat Suite data space, and if the user hasn't authenticated for that data space within the current Excel session yet, then the user will be redirected to user's default web browser in order to login through the configured identity provider.  

![DLM Excel-Addin authentication](/dotstatsuite-documentation/images/dlm-excel-addin-auth1.png)

> Note that this is only required for internal .Stat Suite data spaces that are secured through authentication. For more information, see [.Stat authentication configuration](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/authentication/).

Once successfully authenticated, the user can return from the web authentication to Excel. The Excel-Addin will automatically proceed executing the currently requested action on the data space. It will also regularly and automatically update the underlying authentication access token in order to always keep it valid. The access token is used for all subsequent data retrievals as well as for all data submissions for the relevant data sources until the underlying Excel workbook is closed.  

Whenever the user is authenticated with at least one user identity, the Excel Add-in ribbon will display a "Log out" button with a dropdown menu showing the list of user's email addresses corresponding to the different user identities for which the user has authenticated. Clicking on an email address will automatically trigger the log out for the corresponding user identity. When being logged out for all user identities, then the "Log out' button is hidden again.  

![DLM Excel-Addin authentication](/dotstatsuite-documentation/images/dlm-excel-addin-auth2.png)
