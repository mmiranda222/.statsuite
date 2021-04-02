---
title: "Publish data"
subtitle: 
comments: false
weight: 430
keywords: [
 'Categorise a data view', '#categorise-a-data-view',
 'General behavior', '#general-behavior',
 'Naming convention', '#naming-convention',
]

---

#### Table of Content
- [Categorise a data view](#categorise-a-data-view)
  - [General behavior](#general-behavior)
  - [Naming convention](#naming-convention)

---

### Categorise a data view
> Released in [April 1, 2021 Release .Stat Suite JS 7.2.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-1-2021)
#### General behavior
By using the option **"Categorise structure"**, DLM users can **categorise a dataflow** in one or several of the categories in any of the available *SDMX* CategorySchemes of a dedicated data space, which avoids manually creating and uploading *SDMX* Categorisation structural artefact files.  
**Categorising dataflows is required for their indexing in the Data Explorer search** (see related functional specifications of [What is indexed](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/indexing-data/#what-is-indexed) in .Stat DE).

1) A menu option to "Categorise structure" is available in the contextual menu of dataflows (as well as in the multi-selection menu for dataflows) for an **internal** data space.

![Categorise a dataflow](/dotstatsuite-documentation/images/dlm-categorise-dataflow1.png)

2) Clicking on the option opens a popup window that lists all the *SDMX* CategorySchemes and corresponding category-trees of the related data space (similarly to the content of the "Filter by category" selector).

![Categorise a dataflow](/dotstatsuite-documentation/images/dlm-categorise-dataflow2.png)

3) The user can select one or several of the categories in any CategoryScheme and then click on "Categorise".

![Categorise a dataflow](/dotstatsuite-documentation/images/dlm-categorise-dataflow3.png)

This action will immediately generate the corresponding *SDMX* categorisation(s). The success or failure of the category creation is indicated with the appropriate icon next to the dataflow's contextual menu.

![Categorise a dataflow](/dotstatsuite-documentation/images/dlm-categorise-dataflow4.png)

In addition, the newly categorisation(s) is/are displayed in the detailed information of the corresponding dataflow:

![Categorise a dataflow](/dotstatsuite-documentation/images/dlm-categorise-dataflow5.png)

When listing the related structures of a dataflow from the left menu option, the Categorisation(s) is/are also listed as children of the dataflow:

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

**Note:** If the category selected is a child category, then the IDs of all parent categories involved in the branch are concatenated using '.', e.g. if the category with ID "THIRD" in the following category-tree was selected, then [@CAT_ID] would stand for "TOP.SECOND.THIRD":  
- TOP
  - SECOND
    - THIRD
