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
- [List of artefacts](#list-of-artefacts)


![dlm overview](/dotstatsuite-documentation/images/dlm-overview-1.png)

---

### Common navigation header

The header of the .Stat DLM application is set to be common to all pages. It is composed of:
* A logo of the organisation;
* A list of features and buttons for navigating through the pages.  

When the user is on any page in the application, the button for that page is inactive (light blue tint by default).

![dlm overview](/dotstatsuite-documentation/images/dlm-overview-1bis.png)

**Logo**  
There is a placeholder on the left side for the logo of the organisation *(configurable!)*.  

**Navigation buttons**  
There is a list of buttons triggering the navigation through all pages of the application:
* [Upload structures](/dotstatsuite-documentation/using-dlm/upload-structure/)
* [Upload data](/dotstatsuite-documentation/using-dlm/upload-data/)
* Dump
* Home

**Features**  
There is a section on the right side (after the home icon) with:
* Information about the authenticated user: once the user is authenticated and accesses the .Stat DLM, the feature automatically displays the first name and last name of the user. The drop-down allows the user to log out of the DLM (see [documentation](/dotstatsuite-documentation/using-dlm/log-in-dlm/)).
* Localisation: it displays the list of available translations of the application. The list of available languages is defined during the installation of the application *(configurable!)*.

---

### Business logic of filters

The business logic of the filters "filter by spaces" (also known as internal sources), "filter by external sources" and "filter by types" leads to blank results when no space, source nor artefact are selected. In order to display results, at least one source (being a space or external source) and at least one type of object must be selected.

In the case that the above selections aren't made, the following messages are displayed to the user, depending on which selection is required:
* If no source is selected AND no type is selected, then the message is: "Please select at least one source (space or external source) and at least one type of object".
* If at least one source is selected AND no type is selected, then the message is: "Please select at least one type of object".
* If no source is selected AND at least one type is selected, then the message is: "Please select at least one source (space or external source)".

![dlm overview](/dotstatsuite-documentation/images/dlm-overview-2.png)

---

### Filters
**spaces** and **external sources**  
A DLM user is able to manage the information independently in different **data spaces** that can contain different sets of *SDMX* artefacts and data. For example, they could correspond to the different steps of a statistical production process: e.g. Collect, Process (data preparation) and Disseminate.  
The *SDMX* artefacts and data are thus manageable independently in the different spaces, in other words, structure and data are managed in only one of the above spaces, while it should be easy for the user to replicate structures in the other spaces.  
The number of data spaces is not restricted to the example use case mentioned above *(configurable!)*. Therefore, it is possible to configure (during the installation of the application) one or more data spaces with a type (for example "Collect", "Process" or "Disseminate") as well as a name and a colour scheme.  
When using the DLM, users always need to be very aware of the data space they're managing structures and data for. Therefore, a color code is associated to each space, so that each artefact, structure, dataflow and space environment has a unique color identification in all components and views of the DLM.  
Note also that the filter by spaces is a multi-selection filter.  
**External sources** are configurable (during installation) *SDMX* public endpoints that can also return lists of available structures and data for consultation and reuse, depending on the user permissions.  
The filter by external sources behaves like the filter by spaces.

![dlm overview](/dotstatsuite-documentation/images/dlm-overview-3.png)

**Category**  
The filter by Category can display multiple *SDMX* Category Schemes.  
This filter works as a scope list, meaning that only roots levels are listed and once the user clicks on one of the roots, it displays it and all its children.
Each Category Scheme is listed, and once a user clicks on one, it expands to display all of its immediate child Categories. Users can continue to expand the hierarchy using the arrows to the left of Categories with children.
All Category Schemes are listed at the root level of this filter. Only once a Category or Categories in a Category Scheme is selected is this filter applied.

![dlm overview](/dotstatsuite-documentation/images/dlm-overview-4.png)

**Owner** and **My artefacts**  
The **Owner filter** is a hierarchical filter that is *built* by grouping all *SDMX* Agency Schemes (maintenance agencies) into one single tree.  
Note that each Agency Scheme is a flat list of agencies, but the *SDMX* system can offer a hierarchy of agencies. Therefore, the system offers a hierarchical structure of agencies with the common *SDMX* root level. This *SDMX* root level is hidden and not displayed in the filter.  
The **"My artefacts"** option, when it is selected, filters the list with all artefacts with a Maintenance Agency of which the user is a member.

![dlm overview](/dotstatsuite-documentation/images/dlm-overview-5.png)

**Types**  
A multi-selection filter allows the user to select one or more types of *SDMX* artefacts, such as Data Structure Definition, Dataflow, Concept Scheme, Codelist or any other potential artefact configured (during the installation) to be returned in the list.  

![dlm overview](/dotstatsuite-documentation/images/dlm-overview-6.png)

**Version**  
The user may select between two values: Latest (if selected, then only the latest version of the artefacts is shown in the table) or All (all versions of the artefacts are shown in the table).  
The user may additionally select the "Only final" option to view only artefacts marked as "final". In combination, there are four different selections for the user:
* Latest
* Latest + Only Final
* All
* All + Only Final

![dlm overview](/dotstatsuite-documentation/images/dlm-overview-7.png)

---

### List of artefacts
Authenticated DLM users see in the list all structural *SDMX* artefacts available in all selected DLM spaces or external sources.  

**Display Options**  
*  Spotlight: the user can reduce the list of artefacts based on the text he enters in the spotlight box. An additional option of the spotlight applies the text filter to one, several or all of the following: "Label", "Code", and "Description".
When he enters some text, it searches for all artefacts "Name", "Code" or "Description" that contain the entered text.
* Sorting: the user can sort the whole list by "Type", "Label”, "Code", "Version", "Final" or "Owner”. The list is sorted by “Type” and "Name" ascending by default.
* Pagination: pagination allows for navigating from page to page, and to jump to the next, previous, first or last page. The number of results on each page is configurable during the set up of the application ([documentation](/dotstatsuite-documentation/configurations/dlm-configuration/)).

![dlm overview](/dotstatsuite-documentation/images/dlm-overview-8.png)

**Contents of the list**  
For each artefact, the following details are shown:
* Artefact type (e.g. Data Structure Definition, Dataflow, Codelist)
* Artefact Name (e.g. Health Status) in the first available language
* Artefact Code (e.g. HEALTH_STAT)
* Artefact version (e.g. 1.0, 0.2, 1.0.3)
* Final: A Yes/No value, with a *tick* icon if Yes
* Owner: Maintenance agency of the artefact
* Action: Hamburger menu button that offers a context-aware list of specific actions to perform over the artefact (see related documentation for each action: [Transfer artefact](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/copy-data-structures), [Transfer data](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/copy-data), [Delete structure](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/delete-data-structures), Export structure and Export data)  

![dlm overview](/dotsuite-documentation/images/dlm-overview-10.png)  

For Dataflows **only**, The user can view the following additional information:
* Preview: the eye icon opens the data table preview of a dataflow in a new tab of the application, by using the Data Explorer data view (see more in [this section](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/preview-data/) of the documentation)
* Categories with information about thematic categorisation. Note that a Dataflow can be categorised into one or more Categories
* Number of observation values

![dlm overview](/dotstatsuite-documentation/images/dlm-overview-9.png)
