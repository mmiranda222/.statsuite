---
title: "DLM homepage overview"
subtitle: 
comments: false
weight: 230
keywords: [
  'Common navigation header', '#common-navigation-header',
  'Logo', '#logo',
  'Menu buttons', '#menu-buttons',
  'Selectors & Filters', '#selectors-filters',
  'Required selections', '#required-selections',
  'Spaces and external sources', '#spaces-and-external-sources',
  'Types', '#types',
  'Category', '#category',
  'Owner', '#owner',
  'Version', '#version',
  'List of artefacts', '#list-of-artefacts',
  'Display Options', '#display-options',
  'Content of the list', '#content-of-the-list',
  'Export', '#export',
]
---

#### Table of Content
- [Common navigation header](#common-navigation-header)
  - [Logo](#logo)
  - [Menu buttons](#menu-buttons)
- [Selectors & Filters](#selectors-filters)
  - [Required selections](#required-selections)
  - [Spaces and external sources](#spaces-and-external-sources)
  - [Types](#types)
  - [Category](#category)
  - [Owner](#owner)
  - [Version](#version)
- [List of artefacts](#list-of-artefacts)
  - [Display Options](#display-options)
  - [Content of the list](#content-of-the-list)
- [Export](#export)

![dlm overview](/dotstatsuite-documentation/images/dlm-overview-1.png)

---

### Common navigation header

The header of the .Stat DLM application is set to be common to all pages. It is composed of:
* A logo of the organisation;
* A list of menu buttons for accessing specific features in separate pages.  

When the user is on any page in the application, the button for that page is highlighted.

![dlm overview](/dotstatsuite-documentation/images/dlm-overview-1bis.png)

#### Logo
There is a placeholder on the left side for the logo of the organisation *(configurable!)*.  

#### Menu buttons  
There is a list of menu buttons to access pages with specific features or to configure the application:
* [Upload structures](/dotstatsuite-documentation/using-dlm/upload-structure/): page to upload ready-made SDMX structure files
* [Upload data](/dotstatsuite-documentation/using-dlm/upload-data/): page to upload ready-made Excel+XML or SDMX data files
* Dump: page to execute a dump download of the content of a data space
* Home: page for browsing the content of data spaces and structure-specific actions 
* Authentication status: Shows information on currently logged user (first name and last name) and feature to logout, permitting a new login (see [documentation](/dotstatsuite-documentation/using-dlm/log-in-dlm/)).
* Localisation: Feature to select and show current application language. The list of available languages is defined during the installation of the application *(configurable!)*.

---

### Selectors & Filters

All selectors and filters (except for version) can be collapsed or expanded. 

#### Required selections

A selection within "**Filter by space**" (internal sources) or "**Filter by external source**" (see below: [Spaces and external sources](#spaces-and-external-sources)) and within "**Filter by type**" (see: [Types](#types)) is required in order to display the selected artefacts.

In the case that the above minimal selections aren't made, the following messages are displayed to the user, depending on which selection is missing:
* If no source is selected AND no type is selected, then the message is: "_Please select at least one source (space or external source) and at least one type of artefact_".
* If at least one source is selected AND no type is selected, then the message is: "_Please select at least one type of artefact_".
* If no source is selected AND at least one type is selected, then the message is: "_Please select at least one source (space or external source)_".

![dlm overview](/dotstatsuite-documentation/images/dlm-overview-2.png)

#### Spaces and external sources
A DLM user is able to manage the information independently in different **data spaces** that can contain different sets of *SDMX* artefacts and data. For example, they could store different data versions corresponding to the different steps of a statistical production process: e.g. Collect, Process (data preparation), Disseminate-Staging and Disseminate-Live.  
The *SDMX* artefacts and data are thus manageable independently in the different spaces, in other words, structure and data are managed in only one of the above spaces, while it should be easy for the user to replicate structures in the other spaces.  

The multi-selection filter "**Filter by space**" allows selecting the space(s) (internal source(s)) for which the contained artefacts and data are to be displayed and managed, depending on user permissions.  
The multi-selection filter "**Filter by external source**" allows selecting the any *SDMX* public endpoints for which the available structures and data are to be displayed for consultation and reuse, depending on the user permissions.

The data spaces and their number is not restricted to the example use cases mentioned above *since they are configurable!* Therefore, it is possible to configure (during the installation of the application) one or more data spaces and external sources as well as a name and a colour scheme (text colour and background colour) for each of them. A color scheme is associated to each space because when using the DLM, users always need to be very aware of the data space they're managing structures and data for. Therefore, each space and their artefacts have a unique color identification in all components and views of the DLM.  

![dlm overview](/dotstatsuite-documentation/images/dlm-overview-3.png)

#### Types 
A multi-selection filter "**Filter by type**" allows the user to select one or more types of "maintainable" *SDMX* artefacts, such as Data Structure Definition, Dataflow, Concept Scheme, Codelist or any other potential artefact configured (during the installation) contained in the currently selected data space(s) to be listed. "Maintainable" artefacts are those that include in their unique identification the ID of a Maintenance Agency.  

This filter allows for a spotlight search if there is a sufficient number of types listed.

![dlm overview](/dotstatsuite-documentation/images/dlm-overview-6.png)

#### Category
The multi-selection filter "**Filter by category**" displays all (hierarchical) *SDMX* Category Schemes contained in the currently selected data space(s).  
This filter displays the Category Schemes as hierarchical trees, meaning that the user first sees roots levels (the Category Schemes), and a click on one of the Catgory Scheme links additionally displays the root Categories of that Category Scheme: Once a user clicks on a Category, it expands to display all of its immediate child Categories. Users can continue in this way to navigate through the full hierarchy.  
For each selected Category Scheme or Category, only those artefacts are listed that have been categorised in any of the selected Category Schemes and Categories.

![dlm overview](/dotstatsuite-documentation/images/dlm-overview-4.png)

#### Owner
The multi-selection filter "**Filter by owner**" displays all *SDMX* Agency Schemes contained in the currently selected data space(s) in hierarchical trees, meaning that the Agencies listed in the **_top SDMX_** Agency Scheme are listed first and once the user clicks on one of these Agencies, it additionally displays the Agencies contained in the related **_sub_** Agency Scheme. Users can continue in this way to navigate through the full hierarchy of sub Agencies.  
For each selected Agency, only those artefacts are listed that are maintained by any of the selected Agencies (Means: The Agency ID is used as the Maintenance Agency in the unique identification of the maintainable artefact).  

Note that even though each Agency Scheme is a flat list of agencies, the SDMX standard allows building a hierachical organisation of agencies through referencing Agency Schemes as Agencies in a higher level Agency Scheme. The Agency Scheme name of the **_top SDMX_** Agency Scheme is not included in the filter tree.  

This filter allows for a spotlight search if there is a sufficient number of agencies listed.  

Note:  
- Agencies are uniqually identified by their concatenated "agencyID" which includes all perent agencies except the top SDMX agency, e.g. "OECD.ECO". These concatenanted agencyIDs are used when defining an agency as a maintenance agency of an artefact.
- Agencies are not versioned and always have a version "1.0"
- Agencies are always non-final (with "isFinal=false")

![dlm overview](/dotstatsuite-documentation/images/dlm-overview-5.png)

The filter option **My artefact** was deprecated and has been removed as this was unused *([November 30, 2020 Release .Stat Suite JS 6.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#november-30-2020))*.

#### Version
The filter "**Filter by version**" allows users selecting:  
* Latest: only the latest version of the artefacts is shown in the table (either final or non-final)
* Latest & Only final: only the latest final version of the artefacts is shown in the table
* All: all versions of the artefacts are shown in the table (either final or non-final)
* All & Only final: all final versions of the artefacts are shown in the table

![dlm overview](/dotstatsuite-documentation/images/dlm-overview-7.png)

---

### List of artefacts
The main applical panel displayes the list all structural *SDMX* artefacts available in all selected DLM spaces or external sources, depending on the user's read permissions.  
The above mentioned selections and filters are dynamically applied to the table, meaning that when the user changes the selection, then the table is automatically updated. A spinner feature informs the user of the processing.

#### Display Options
*  Spotlight: the user can reduce the list of artefacts based on the text he enters in the spotlight box. An additional option of the spotlight applies the text filter to one or both of the following: "Label" and "Code".  
When he enters some text, it searches for all artefacts "Name" or "ID" that contain the entered text.
* Sorting: the user can sort the whole list by "Type", "Label”, "Code", "Version", "Final" or "Owner”. The list is sorted by “Type” and "Name" ascending by default.
* Pagination: pagination allows for navigating from page to page, and to jump to the next, previous, first or last page. The number of results on each page is configurable during the set up of the application ([documentation](/dotstatsuite-documentation/configurations/dlm-configuration/)).

![dlm overview](/dotstatsuite-documentation/images/dlm-overview-8.png)

#### Content of the list
For each artefact, the following details are shown:
* Artefact type (e.g. Data Structure Definition, Dataflow, Codelist)
* Artefact name (e.g. Health Status) in the first available language
* Artefact id (e.g. HEALTH_STAT)
* Artefact version (e.g. 1.0, 0.2, 1.0.3)
* Final: A Yes/No value, with a *tick* icon if Yes
* Artefact owner (maintenance agency of the artefact)
* Action: Hamburger menu button that offers a context-aware list of specific actions to perform over the artefact (see related documentation for each action: [Transfer artefact](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/copy-data-structures), [Transfer data](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/copy-data), [Delete structure](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/delete-data-structures), Export structure and Export data)  

![dlm overview](/dotstatsuite-documentation/images/dlm-overview-10.png)

For Dataflows **only**, The user can view the following additional information:
* **Preview:** the eye icon opens the data table preview of a dataflow in a new tab of the application, by using the Data Explorer data view (see more in [this section](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/preview-data/) of the documentation)
* **Number** of observation values.
* **Categories** with information about thematic categorisation. Note that a Dataflow can be categorised into one or more Categories
* **Space** name
* **ID flavours** with 2 alternative dataflow identification flavours: `AGENCY_ID:DATAFLOW_ID(VERSION)` and `AGENCY_ID/DATAFLOW_ID/VERSION`

![dlm overview](/dotstatsuite-documentation/images/dlm-overview-9.png)

**Note** that *(since [October 5, 2021 Release .Stat Suite JS 10.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#october-5-2021))* for some external data sources (e.g. using MT Fusion Registry), the *SDMX* annotation of type `sdmx_metrics` has no id `obs_count`, but the id **`series_count`** instead.  
In this case, the DLM will display the **number of series** instead of observation values.

![dlm overview](/dotstatsuite-documentation/images/dlm-overview-21.png)

---

### Export
Each result from the list can be exported/downloaded using the corresponding hamburger menu feature.

**Export data structure artefact**  
A data structure artefact can be downloaded in .xml format:
* without referenced structures, or
* with all referenced structures *(e.g. a DSD with all its referenced codelists, content constraint, dataflow, category scheme, etc)*.

![dlm overview](/dotstatsuite-documentation/images/dlm-overview-11.png)

**Export data**  
Data associated to a dataflow can be downloaded, from the list of dataflows, in .xml or in .csv format.

![dlm overview](/dotstatsuite-documentation/images/dlm-overview-12.png)
