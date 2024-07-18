---
title: "FMR Workbench"
subtitle: 
comments: false
weight: 280
keywords: [
  'Configuration', '#configuration',
  'Create structure', '#create-structure',
  'View and edit structure', '#view-and-edit-structure',
]
---

#### Table of Content
- [Configuration](#configuration)
- [Create structure](#create-structure)
- [View and edit structure](#view-and-edit-structure)

---
>Released in [June 13, 2024 Release .Stat Suite JS arc](/dotstatsuite-documentation/changelog/#june-13-2024)

The **[FMR Workbench](https://www.sdmx.io/tools/fwb/)** developed by BIS can be integrated seamlessly with .Stat DLM to allow users to create or edit SDMX structures directly in .Stat Suite data spaces. Find more details about the FMR Workbench:
- [Getting started](https://fmrwiki.sdmxcloud.org/FMR_Workbench)
- [General guidance](https://fmrwiki.sdmxcloud.org/Main_Page)

### Configuration
To integrate FMR Workbench with .Stat DLM, you need to configure both applications: see details [here](/dotstatsuite-documentation/configurations/dlm-configuration/#fmr-workbench-integration).

The integration between the FMR Workbench and .Stat DLM entails:
1. A .Stat **data space"** corresponds to a **Workbench "environment"**.
2. Authentication is managed at the environment level in Workbench, therefore users need to log in each time they switch the environment/dataspace. The authentication service and the permission management service are the ones defined and used by the .Stat Suite.
3. In order to be able to create and edit SDMX structures with the FMR Workbench, a list of allowed Agency IDs must be configured first in the FMR Workbench configuration. The Agency IDs must correspond to the ones used in .Stat DLM. The best pratice is to use the same Agency Scheme in both applications.

---

### Create structure
Only when FMR is integrated with an instance of the DLM, then the header of .Stat DLM displays a new option called "Create structure".

![DLM FMR integration](/dotstatsuite-documentation/images/dlm-fmr1.png)

Clicking on it expands a list of all SDMX artefact types enabled to be created. Clicking a sub-menu item will open the FMR in a new browser tab pointing to the corresponding artefact creation wizard.

![DLM FMR integration](/dotstatsuite-documentation/images/dlm-fmr2.png)

**Create structure in FMR:**  
![DLM FMR integration](/dotstatsuite-documentation/images/dlm-fmr-create.png)

Any newly created structures in FMR are **automatically synchronised with .Stat DLM**.

---

### View and edit structure
Only when FMR is integrated with an instance of the DLM, then each contextual menu of any artefact displays a list of new options:
- "View structure" opens the artefact detailed view in FMR in a new browser tab; 
- "Edit structure" opens the artefact editable view in FMR in a new browser tab;
- "Edit annotations" opens the artefact "Edit Annotations" view in FMR in a new browser tab.

![DLM FMR integration](/dotstatsuite-documentation/images/dlm-fmr3.png)

Any changes made in FMR are automatically synchronised with .Stat DLM.

**View stucture in FMR:**  
![DLM FMR integration](/dotstatsuite-documentation/images/dlm-fmr-view.png)

**Edit stucture in FMR:**  
![DLM FMR integration](/dotstatsuite-documentation/images/dlm-fmr-edit.png)

**Edit annotations in FMR:**  
![DLM FMR integration](/dotstatsuite-documentation/images/dlm-fmr-edit-annotations.png)
