---
title: "DLM homepage overview"
subtitle: 
comments: false
weight: 230

---

#### Table of Content
- [Common navigation header](#common-navigation-header)
- [Business logic of filters](#business-logic-of-filters)
- [Filters](#filters)
- [List of artifacts](#list-of-artifacts)


![dlm overview](/using-dlm/files/dlm-overview-1.png)

---

### Common navigation header

The header of the .Stat DLM application is set to be common to all pages. It is composed of:
* A logo of the organisation;
* A list of features and buttons for navigating through the pages.  

When the user is on any of the pages of the application, the referred button is inactive (light blue tint).

![dlm overview](/using-dlm/files/dlm-overview-1bis.png)

**Logo**  
There is a placeholder on the left side for the logo of the organisation *(configurable!)*.  

**Navigation buttons**  
There is a list of buttons triggering the navigation through all pages of the application:
* Upload structures
* Upload data
* Dump
* Home

**Features**  
There is a placeholder on the right side (after the home icon) with:
* Information about the authenticated user: once the user is authenticated and accesses the .Stat DLM, the feature automatically displays the first name and last name of the user. The drop-down featrues allows to log out of the DLM (see [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/log-in-dlm/)).
* Localisation: it displays the list of available translations of the application. The list of available languages is defined during the installation of the application *(configurable!)*.

---

### Business logic of filters

The business logic of the filters "filter by spaces", "filter by external sources" and "filter by types" allows for blank results when no space, source nor artifact are selected.  

For the cases of internal source (spaces), external sources and types (sdmx artifacts), if nothing is selected from the lists, nothing is returned in the list:  
* If no source is selected AND no type is selected, then the message is: "Please select at least one source (space or external source) and at least one type of object".
* If at least one source is selected AND no type is selected, then the message is: "Please select at least one type of object".
* If no source is selected AND at least one type is selected, then the message is: "Please select at least one source (space or external source)".

![dlm overview](/using-dlm/files/dlm-overview-2.png)

---

### Filters
**spaces** and **external sources**  
A DLM user is able to manage the information independently in different **data spaces** that can correspond to the different steps of a statistical production process: e.g. Collect, Process (data preparation) and Disseminate.  
The SDMX artifacts and data are thus manageable independently in the different spaces, in other words, structure and data are managed in only one of the above spaces, while it should be easy for the user to replicate structures in the other spaces.  
The number of data spaces is not restricted to the use case mentioned above *(configurable!)*. Therefore, it is possible to configure (during the installation of the application) only one or several data spaces with a type "Collect", "Process" or "Disseminate" as well as their naming and colour scheme.  
When using the DLM, users always need to be very aware of the data space concerned by the managed structures and data. Therefore, a color code is associated to each space, so that each artifact, structure, dataflow and space environment has a unique color identification in all components or views of the DLM.  
Note also that the filter by spaces is a multi-selection filter.  
**External sources** are configurable (during installation) *SDMX* public endpoints that can also return lists of available structures and data for consultation and reuse, depending on the user permissions.  
The filter by external sources behave like the filter by spaces.

![dlm overview](/using-dlm/files/dlm-overview-3.png)

**Category**  
The filter by Category can have several *SDMX* CategorySchemes to display.  
This filter works as a scope list, meaning that only roots levels are listed and once the user clicks on one of the roots, it displays it and all its children.  
All CategorySchemes are listed at the root level of this filter. Only once a Category in an CategoryScheme is selected, then this filter is applied.

![dlm overview](/using-dlm/files/dlm-overview-4.png)

**Owner** and **My artifacts**  
The **Owner filter** is a hierarchical filter that is *built* by grouping all *SDMX* Agency Schemes (maintenance agencies) into one single tree.  
Note that each Agency Scheme is a flat list of agencies, but the *SDMX* system can offer a hierarchy of agencies. Therefore, the system offers a hierarchical structure of agencies with the common SDMX root level. This SDMX root level is hidden and not displayed in the filter.  
The **"My artifacts"** option, when it is selected, filters the list with all artifacts with a Maintenance Agency of which the user is a member.

![dlm overview](/using-dlm/files/dlm-overview-5.png)

**Types**  
A multi-selection filter allows the user to select one or more than one type of *SDMX* artifacts, such as DSD (Data Structure Definition), Dataflow, ConceptScheme, Codelist or any other potential artifact configured (during the installation) to be returned in the list.  

![dlm overview](/using-dlm/files/dlm-overview-6.png)

**Version**  
The user may select between two values: Latest (if selected, then only the latest version of the artifacts is shown in the table) or All (all versions of the artifacts are shown in the table).  
The user may additionally select the "Only final" option to view only the final versions of the artefacts. So, it results with four different selections for the user:
* Latest
* Latest + Only Final
* All
* All + Only Final

![dlm overview](/using-dlm/files/dlm-overview-7.png)

---

### List of artifacts
Authenticated DLM users see in the list all SDMX artifacts available in all selected DLM spaces or external sources.  

**Options of display**  
*  Spotlight: the user can reduce the list of artifacts based on the text he enters in the spotlight box. An additional option of the spotlight allows to apply the text filter to one, several or all of the following: "Label", "Code", "Description".
When he enters text, it searches for all artefacts Name and Code that contain the entered text. It should act like a simple client-side free text feature.
* Sorting: user can sort the whole list by "Type", "Label”, "Code", "Version", "Final" or "Owner”. The list is sorted by “Type” and "Name" ascending by default.
* Pagination: pagination allows for navigating from page to page, and to jump to next, previous, last or first page. the number of results by page is configurable during the set up of the application.

![dlm overview](/using-dlm/files/dlm-overview-8.png)

**Contents of the list**  
For each artifact, the following details are shown:
* Artifact type (e.g. DSD, Dataflow, Codelist)
* Artifact Name (e.g. Health Status) in the first available language
* Artifact Code (e.g. HEALTH_STAT)
* Artifact version (e.g. 1.0, 0.2, 1.0.3)
* Final (this information is a Yes/No value, with a *tick* icon is Yes)
* Owner: Maintenance agency of the artifact
* Action: hamburger menu button that offers a contextual action list to perform on an object of the list

For Dataflows ONLY, The user can view the additional information:
* Preview: the eye icon opens the data table preview of a dataflow in a new tab of the application (using the Data Explorer data view)
* Categories with information about thematic categorisation. Note that a Dataflow can be categorised into one or more Categories
* Number of observation values

![dlm overview](/using-dlm/files/dlm-overview-9.png)
