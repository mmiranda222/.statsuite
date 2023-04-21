---
title: "Delete data structures"
subtitle: 
comments: false
weight: 250
keywords: [
  'Introduction', '#introduction',
  'Dependencies between artefacts in SDMX', '#dependencies-between-artefacts-in-sdmx',
  'Delete a single structure artefact', '#delete-a-single-structure-artefact',
  'Delete an artefact and its related structure artefacts', '#delete-an-artefact-and-its-related-structure-artefacts',
  'Delete several similar artefacts', '#delete-several-similar-artefacts',
]
---

#### Table of Content
- [Introduction](#introduction)
- [Dependencies between artefacts in SDMX](#dependencies-between-artefacts-in-sdmx)
- [Delete a single structure artefact](#delete-a-single-structure-artefact)
- [Delete an artefact and its related structure artefacts](#delete-an-artefact-and-its-related-structure-artefacts)
- [Delete several similar artefacts](#delete-several-similar-artefacts)

> *Version history:*  
> Option to select/deselect all artefacts introduced with [April 20, 2023 Release .Stat Suite JS unicorn](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-20-2023)  
> Display selected artefact in bold since [September 15, 2022 Release .Stat Suite JS radio](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#september-15-2022)  
> Check for user permissions to delete since [July 8, 2021 Release .Stat Suite JS 9.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#july-8-2021)  
> Delete related artefacts in [March 10, 2021 Release .Stat Suite JS 7.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#march-10-2021)

> Technical disclaimer / recommendation on **Dataflow deletion**: For a complete deletion of the mapping set related to a dataflow, it is necessary, when deleting a dataflow, to either use the delete option from the DLM, or manually delete the mapping set using the Transfer Swagger UI first (this process will be improved once we release [this change](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/164).

---

### Introduction
In the DLM, data structures can be deleted separately, several similar structure objects at a time, or several of different types according to their dependency(ies).  
**Note**  that data structures can also be deleted directly through the *SDMX* (NSI) web service API, for more information see [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/api-main-features/#deleting-structures).

---

### Dependencies between artefacts in SDMX
SDMX artefacts must be deleted in the appropriate order according to their dependency tree. E.g. in order to delete a Dataflow, first any possible Content Constraint that references this Dataflow must be deleted. Before deleting a Codelist, any Data Structure Definitions referencing it must also be deleted.  

**In SDMX:**  
A parent is an artefact that references another artefact.  
A child is an artefact that is being referenced by another artefact.  
Example:
* ContentConstraint
    * Dataflow
        * DSD
            * ConceptScheme
                * Codelist A
            * Codelist A
            * Codelist B

The same child can be referenced by different parents. More information on the SDMX artefact dependency can be found here: https://github.com/sdmx-twg/sdmx-rest/blob/master/doc/structures.md#applicability-and-meaning-of-references-including-referencepartial.  
**However**, in the context of the deletion of artefacts in the DLM and the need to delete referencing artefacts first, **the hierarchy tree is inverse**.

---

### Delete a single structure artefact
From the DLM list of artefacts, you can select from the left menu, the option to delete a structure artefact **without related structures**. 

![DLM delete](/dotstatsuite-documentation/images/dlm-delete1.png)

Once you click, it automatically triggers the deletion of the object. Once the deletion process is complete, the appropriate notification is returned in a green/ banner, and the deleted artefact (when successful) is automatically removed from the list.

![DLM delete](/dotstatsuite-documentation/images/dlm-delete2.png)

If the deletion fails (e.g. dependency conflict), the appropriate error message is returned through a red bin icon next to the artefact name.

![DLM delete](/dotstatsuite-documentation/images/dlm-delete3.png)

---

### Delete an artefact and its related structure artefacts
From the DLM list of artefacts, you can select from the left menu the option to delete a structure artefact **and/or related structures**.

![DLM delete](/dotstatsuite-documentation/images/dlm-delete4.png)

Once clicked, a popup window is displayed with all listed artefacts using a tree control and selectable items. It details the artefact type, name, ID, version, 'finality' and agency.  
The current selected artefact is displayed in bold, and when clicking any artefact from the list, a new tab/window opens showing the content of the artefact.

A button in the bottom left corner of the dialog box allows **selecting/deselecting all** artefacts at once:
- 'Deselect all' is shown whenever at least one checkbox at any level is checked;
- If no checkbox is checked at all, then 'Select all' is shown;
- 'Select all' selects all (possible) checkboxes in the tree at all levels;
- 'Deselect all' deselects all checkboxes at all levels.

The original item is pre-selected by default, as well as all below/dependent artefacts. Non-delete-able artefacts (cross-dependencies, no sufficient permissions) are marked as such with a red forbidden icon. A tooltip explains the reason and solution, e.g. "*Cannot be deleted since referenced by: XXXX, XXXX. First delete those structures and then try again.*". When there are more than 3 'outside' references, then the number of references is mentioned. If the user is not authorised to delete a specific artefact, then it is also marked as non-delete-able, and the tooltip feature displays the following: "*Cannot be deleted due to an insufficient permission. Contact the owner of the artefact to gain the deletion permission.*"

![DLM delete](/dotstatsuite-documentation/images/dlm-delete5.png)

A orange warning icon informs the user of prerequisites awaited for deleting some of the items. For example (see in screenshots below), when a codelist needs also the 'above' ConceptScheme deletion, it is mentioned as such: "*In order to delete this artefact, you must select conceptscheme XXXXX*".

![DLM delete](/dotstatsuite-documentation/images/dlm-delete6.png)

![DLM delete](/dotstatsuite-documentation/images/dlm-delete7.png)

Clicking 'Delete' will automatically initiate the deletion of all the selected structure artefacts and in the order that respects the top/down dependencies.  
The outcome of each deletion is:  
  - success: green-coloured bin icon.
  - failure: red-coloured icon with the tooltip displaying the corresponding error message.

The 'Cancel' button interrupts the deletion process, then changes its text to 'Close' and re-activates the 'Delete selected structures' button.  
Once the deletion actions are completed, the 'Delete selected structures' button becomes hidden and the 'Cancel' button changes the text back to 'Close'.  

![DLM delete](/dotstatsuite-documentation/images/dlm-delete8.png)

![DLM delete](/dotstatsuite-documentation/images/dlm-delete9.png)

**Note** that for dataflow and DSD artefacts, two bins are displayed because a technical/intermediate action is required for automatically cleaning the database objects.

The 'Close' button closes the popup window.

---

### Delete several similar artefacts
From the DLM list of artefacts, if you select several artefacts of the same type, you can select from the left menu, the option to **delete structures** all at once. 

![DLM delete](/dotstatsuite-documentation/images/dlm-delete10.png)

Clicking "delete structures" will simultaneously initiate the deletion of each artefact. The completion of the deletion results in a green or red bin icon next to each corresponding selected artefact.
