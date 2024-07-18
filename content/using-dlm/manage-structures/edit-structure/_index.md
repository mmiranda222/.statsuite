---
title: "Create or edit data structures"
subtitle: 
comments: false
weight: 265
keywords: [
  'FMR Workbench', '#fmr-workbench',
  'SDMX Matrix Generator', '#sdmx-matrix-generator',
  'SDMX Constructor', '#sdmx-constructor',
  'Fusion Metadata Registry (FMR)', '#fusion-metadata-registry-fmr',
]

---

The Data Lifecycle Manager application itself doesn't directly offer data structure creation or editing features. However, there are a number of solutions that provide such functionality. While some are closely integrating with the .Stat Suite, others require to create or edit data structures outside of the .Stat DLM and its data spaces. In this case, the data structures are to be downloaded and/or (re-)uploaded in the .Stat Suite in SDMX-ML format.

In addition to the tools listed below, please consult the list of software on the official [SDMX web site](https://sdmx.org/?page_id=4500).

### FMR Workbench

The FMR Workbench web application (developed by the BIS) can be **integrated seamlessly with the .Stat DLM**. This provides structures creation and editing with just one mouse click within the DLM. It includes almost all UI features that are available in the Fusion Metadata Registry (FMR) application (see below). 

See [here](/dotstatsuite-documentation/using-dlm/manage-structures/edit-structures/fmr-workbench/) for more details. 

---

### SDMX Matrix Generator

We recommend using the SDMX Matrix Generator Excel add-in (developed by SIS-CC) to **model statistical data based on high-quality modelling guidelines** and for generating the related new SDMX structures in SDMX-ML format, which will then need to be uploaded, e.g., using the DLM. All within Excel, the "SDMX Matrix" approach especially supports the hard work of **concept and code harmonisation across a data domain**, as well as the optimisation of the number of DSDs and dataflows. The tool is intended for statisticians with basic (non-technical) SDMX data modelling knowledge.

- source code: https://gitlab.com/sis-cc/sdmx-tools/sdmx-matrix-generator
- documentation: https://sis-cc.gitlab.io/sdmx-tools/documentation/using-matrix-gen/

A video record of a demo of the tool is available from [here online](https://oecdtv.webtv-solution.com/embed/6650/en/video).

---

### SDMX Constructor

The SDMX Constructor Windows application (developed by ILO) allows easily creating and editing data structures (following the SDMX standards) **directly stored in .Stat Suite data spaces**. It offers a **very user-friendly interface** that eases the structure creation and editing. The tool is intended for statisticians with basic (non-technical) SDMX data modelling knowledge.

See [here](https://ilostat.github.io/dsdc/) for more details. 

The documentation also describes how the SDMX Constructor connects with the .Stat Suite: https://dingshutong.github.io/sdmxc/connecting-to.html.

---

### Fusion Metadata Registry (FMR)

Fusion Metadata Registry (FMR) (developed by the BIS) is a **fully fletched software platform for managing SDMX structures**. It provides:
- a controlled repository for SDMX structural metadata (SDMX metadata registry) independent from the .Stat data spaces
- 3 integrated metadata-driven data processing services: data validation, data transformation (mapping data between structures) and conversion of data between SDMX data formats. They are usable through the web UI or integrated into data automation processes using the REST API.
- data structure authoring and maintenance web application

See [here](https://www.sdmx.io/tools/fmr/) for more details. 