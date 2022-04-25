---
title: "Edit data structures"
subtitle: 
comments: false
weight: 265
keywords: [
  'Generic DSD Matrix SDMX-ML generator', '#generic-dsd-matrix-sdmx-ml-generator',
  'SDMX ISTAT Framework', '#sdmx-istat-framework',
  'SDMX Data Structure Wizard (DSW)', '#sdmx-data-structure-wizard',
  'Fusion Registry Community Edition', '#fusion-registry-community-edition',
]

---

Currently, the Data Lifecycle Manager itself doesn't directly offer data structure editing features. Data structures need to be edited using other tools outside of the DLM and be uploaded once readily prepared as xml file.

We recommend the **SDMX Matrix Generator** introduced below, or any of the open-source companion software listed here: https://siscc.org/stat-suite/companion-software/. More SDMX tools that might allow creating and editing SDMX data structures are listed on the official [SDMX web site](https://sdmx.org/?page_id=4500).

---

### Generic DSD Matrix SDMX-ML generator

- technology: Excel macro [.xlsm file]
- source code: https://gitlab.com/sis-cc/sdmx-tools/sdmx-matrix-generator
- documentation: https://sis-cc.gitlab.io/sdmx-tools/documentation/using-matrix-gen/
- developed by: OECD
- target audience: statisticians with basic (non-technical) SDMX data modelling knowledge

This tool is used to visually model and design SDMX data artefacts, and generate the SDMX-ML markup for implementation. It is an enhancement of the Generic SDMX Design Matrix which has proven to be successful as a collaborative design tool for non-SDMX experts. 

The primary goal of the tool is to be able to create the artefacts without a lot of SDMX technical knowledge, and to put the focus on the statistical aspects of the data model. 

This tool maps to these GSBPM sub-processes:
  - 2.1 Design outputs (Dataflows design in Dataflows and DSD-Concept Matrix worksheets)
  - 2.2 Design variable descriptions (decomposition and creation of indicators in Indicator-Concept Matrix worksheet)
  - 3.1 Reuse or build collection instruments (generating SDMX-ML for reporting Dataflows)
  - 3.3 Reuse or build dissemination instruments (generating SDMX-ML for dissemination Dataflows)

A video record of a demo of the tool is available from [here online](https://oecdtv.webtv-solution.com/embed/6650/en/video).
