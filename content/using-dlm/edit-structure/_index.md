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

Currently, the Data Lifecycle Manager itself doesn't directly offer data structure editing features. Data strcutures need to be edited using other tools outside of the DLM and be uploaded once readily prepared as xml file.

We recommend using the following tools for data structure creation or editions:

#### Table of Content
- [Generic DSD Matrix SDMX-ML generator](#generic-dsd-matrix-sdmx-ml-generator)
- [SDMX ISTAT Framework](#sdmx-istat-framework)
- [SDMX Data Structure Wizard (DSW)](#sdmx-data-structure-wizard)
- [Fusion Registry Community Edition](#fusion-registry-community-edition)

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

---

### SDMX ISTAT Framework

- technology: Javascript web application with .Net-based server backend
- link: https://github.com/SDMXISTATTOOLKIT/META-DATA.MANAGER
- developed by: ISTAT (Italian National Statistical Office)
- target audience: statisticians with (non-technical) SDMX data modelling knowledge

The SDMX Istat Toolkit is a set of pick-and-choose building blocks allowing a statistical office to standardize and industrialize the dissemination/reporting business process. It can be used successfully for building dissemination/reporting SDMX compliant databases and for implementing SDMX in terms of metadata management, machine-actionable dissemination and Open (Statistical)Data. Within many other features, it allows creating and editing SDMX data structures. The following modules would be required for data structure editing:  

- Metadata Repository/Registry – based on the SDMX-RI Mapping Store, allows to handle SDMX structural metadata (Data Structure Definition; Code List; Hierarchical Code List; Concept Scheme; Dataflow; Category Scheme; Structure Set; Process; Organisation Scheme, Metadata Structure Definition, Metadata Flow)
- SDMX Web Service – based on the SDMX-RI Web Service Provider, allows to query and submit structural metadata. 
- SDMX Metamanager – provides a graphical user interface for browsing, download, create and submit structural metadata. It can be used as a “switch” towards different SDMX Web Services based on the SDMX-RI. In this context a user can browse metadata stored in distributed repositories. The application allows to handle the order in the Code Lists and to add further items in already final Code Lists.

---

### SDMX Data Structure Wizard

- technology: Java standalone desktop application
- link: http://ec.europa.eu/eurostat/web/sdmx-infospace/sdmx-it-tools/dsw
- developed by: Eurostat
- target audience: statisticians with (non-technical) SDMX data modelling knowledge

The tool supports version 2.0 & 2.1 of the SDMX standard. It can be used both offline (with a local repository) and on-line (connected to an SDMX Registry), depending on each user’s preference and access rights.

Another facility of the application is that it offers the possibility to create dynamically a data message template for a specified DSD. These templates can be populated and then sample data files created for transformation to an HTML format and saved locally.

The DSW also provides a mechanism for importing/exporting SDMX-ML 2.0 & 2.1 DSDs and a mechanism for importing/exporting DSDs from/to GESMES/TS structure files. Furthermore, SDMX-ML 2.0 & 2.1 DSDs can be validated against SDMX standard schemes.

In the on-line mode, the tool communicates with any standard-compliant SDMX Registry (e.g. Eurostat SDMX Registry) offering in the same time all the functionalities provided in the offline mode, too. The application offers the possibility to connect to a SDMX Registry and update the local repository, if the right permissions are granted (query privilege). Moreover, after editing the DSD artefacts locally, the edited (or a new) artefact can be submitted to the SDMX Registry (“maintain” privilege).

It should be possible to connect the DSW to a .Stat Suite CORE data space (its related SDMX web service) to retrieve data structures. However, update functionality is not guaranteed due to the incompatibility in the authentication method.

**An overview of the tool with screenshots can be found in [this page](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/edit-structure/data-structure-wizard-example)**.

---

### Fusion Registry Community Edition

- technology: Java application with web interface
- link: https://metadatatechnology.com/software/communityTools.php
- developed by: Metadata Technology
- target audience: statisticians with (non-technical) SDMX data modelling knowledge

Fusion Registry Community Edition is an SDMX structural metadata registry supporting all versions of SDMX-ML (1.0, 2.0 and 2.1) and SDMX-EDI. It is designed for official statistics applications where a central controlled source of structural metadata is required, and it allows structures to be authored, maintained and viewed using the web user interface which provides wizards to guide users through specific tasks. 


**More SDMX tools that might allow creating and editing SDMX data structures are listed on the official [SDMX web site](https://sdmx.org/?page_id=4500).**
