---
title: "Publish data"
subtitle: 
comments: false
weight: 430
keywords: [
 'Categorise a data view (dataflow)', '#categorise-a-data-view-dataflow',
 'General behavior', '#general-behavior',
 'Naming convention', '#naming-convention',
 '(Re-)index a data view (dataflow)', '#re-index-a-data-view-dataflow',
]

---

#### Table of Content
- [Categorise a data view (dataflow)](#categorise-a-data-view-dataflow)
  - [General behavior](#general-behavior)
  - [Naming convention](#naming-convention)
- [(Re-)index a data view (dataflow)](#re-index-a-data-view-dataflow)

---

### Categorise a data view (dataflow)
> Released in [April 1, 2021 Release .Stat Suite JS 7.2.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-1-2021)
#### General behavior
When using the option **"Categorise structure"**, DLM users can **categorise a data view (*SDMX* dataflow)** in one or several of the categories in any of the available *SDMX* CategorySchemes of a dedicated data space. Users can thus avoid manually creating and uploading *SDMX* Categorisation artefacts in .xml files.  
**Categorising dataflows is required for their index in the Data Explorer search** (see related functional specifications of [What is indexed](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/indexing-data/#what-is-indexed) in .Stat DE).

1) A menu option to "Categorise structure" is available in the contextual menu of dataflows (as well as in the multi-selection menu for dataflows) for an **internal** data space.

![Categorise a dataflow](/dotstatsuite-documentation/images/dlm-categorise-dataflow1.png)

2) Clicking on the option opens a popup window that lists all the *SDMX* CategorySchemes and corresponding category-trees of the related data space (similarly to the content of the "Filter by category" selector).

![Categorise a dataflow](/dotstatsuite-documentation/images/dlm-categorise-dataflow2.png)

3) The user can select one or several of the categories in any CategoryScheme, and then click on "Categorise".

![Categorise a dataflow](/dotstatsuite-documentation/images/dlm-categorise-dataflow3.png)

This action will immediately generate the corresponding *SDMX* categorisation(s). The success or failure of the category creation is indicated with the appropriate icon next to the dataflow's contextual menu.

![Categorise a dataflow](/dotstatsuite-documentation/images/dlm-categorise-dataflow4.png)

In addition, the newly categorisation(s) is/are displayed in the detailed information of the corresponding dataflow:

![Categorise a dataflow](/dotstatsuite-documentation/images/dlm-categorise-dataflow5.png)

When listing the related structures of a dataflow from the left menu option, the Categorisation(s) is/are also listed as child(ren) of the dataflow:

![Categorise a dataflow](/dotstatsuite-documentation/images/dlm-categorise-dataflow6.png)

#### Naming convention
The SDMX Categorisation is created on the following naming convention:

- Id="CAT_[%DF_AGENCY_ALTER]__[%DF_ID]__[@DF_VERSION_ALTER]@[@CS_AGENCY_ALTER]__[@CS_ID]__[@CS_VERSION_ALTER]__[@CAT_ID_ALTER]"
- AgencyID="[%DF_AGENCY]"
- Version="[%DF_VERSION]"
- IsFinal="false"
- (localised)Name="[%DF_NAME_XX]"
- Source id="[%DF_ID]"
- Source version="[%DF_VERSION]"
- Source agencyID="[%DF_AGENCY]"
- Target id="[@CAT_ID]"
- Target maintainableParentID="[@CS_ID]"
- Target maintainableParentVersion="[@CS_VERSION]"
- Target agencyID="[@CS_AGENCY]"

**Where:**

- [%DF_ID]: ID of dataflow
- [%DF_AGENCY]: Agency of dataflow
- [@DF_AGENCY_ALTER]:  same as [@DF_AGENCY] with dots '.' replaced by underscore '_' 
- [%DF_VERSION]: Version of dataflow
- [@DF_VERSION_ALTER]: same as [@DF_VERSION] with dots '.' replaced by underscore '_'
- [%DF_NAME_XX]: Name of dataflow in language XX
- [@CAT_ID]: ID of category (tree)
- [@CAT_ID_ALTER]: same as [@CAT_ID] with dots '.' replaced by underscore '_' 
- [@CS_ID]: ID of CategoryScheme
- [@CS_AGENCY]: Agency of CategoryScheme
- [@CS_AGENCY_ALTER]:  same as [@CS_AGENCY] with dots '.' replaced by underscore '_' 
- [@CS_VERSION]: Agency of CategyScheme
- [@CS_VERSION_ALTER]: same as [@CS_VERSION] with dots '.' replaced by underscore '_'

**Note:** If the selected category is a child category, then the IDs of all parent categories involved in the branch are concatenated using '.', e.g. if the category with ID "THIRD" in the following category-tree was selected, then [@CAT_ID] would stand for "TOP.SECOND.THIRD":  
- TOP
  - SECOND
    - THIRD

---

### (Re-)index a data view (dataflow)
> Released in [August 3, 2022 Release .Stat Suite JS quark](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#august-3-2022)

Users can index or re-index a data view (*SDMX* dataflow) by using the option **(Re-)index dataflow** from the contextual hamburger menu from the dataflow list:

![index a dataflow](/dotstatsuite-documentation/images/DLM-index1.png)

Indexing or re-indexing a dataflow is necessary to **enable the search and browse capabilities** of a specific data view (dataflow) in the .Stat Data Explorer.  
Several **prerequisites** are necessary for a successful indexing:
- The dataflow is in a dataspace defined as a **source to be indexed** (see [configuration](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#search-data-sources-to-be-indexed));
- The dataflow has **data associated to it** (see [upload data](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/upload-data/) and [detailed specs](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/indexing-data/#conditions-and-exceptions) of data availability);
- The dataflow is **categorised** under an *SDMX* CategoryScheme (see how to [categorise a data view](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/publish-data/#categorise-a-data-view)) that is defined for indexation (see [configuration](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#search-data-sources-to-be-indexed));
- The DLM **user has the permission** at minimum to update that dataflow (structure) in the targeted dataspace (see the list of [basic permissions](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/manage-user-access/#basic-permissions)).

Clicking on '(Re-)index dataflow' for a specific dataflow triggers the request sent to the search service and displays a loading spinner: 

![index a dataflow](/dotstatsuite-documentation/images/DLM-index2.png)

Once the request is successfully sent to the search service, a green icon next to the dataflow's contextual menu appears and displays the following acknowledgement message on mouse-over:

![index a dataflow](/dotstatsuite-documentation/images/DLM-index3.png)

In order to see the outcome of the request (success or failure), the user needs to consult the logs of the search service (see [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/indexing-data/#get-search-sfs-report)).  
However, if the dataflow is not in a dataspace defined as a *source to be indexed*, or if the dataflow is not categorised in a CategoryScheme defined for indexation, then a red icon next to the dataflow's contextual menu appears and displays the following error message on mouse-over:

![index a dataflow](/dotstatsuite-documentation/images/DLM-index4.png)

**Note:** For a greater user-friendliness it is planned to enhance the DLM by contextualising the appearance of the '(Re-)index dataflow' option depending on fulfilled indexation prerequisites (see ticket [data-lifecycle-manager#281](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/281)), and by including logs from the search service directly into a new DLM menu (see ticket [data-lifecycle-manager#233](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/233)).

