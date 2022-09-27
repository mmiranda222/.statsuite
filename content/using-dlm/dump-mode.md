---
title: "Export all in dump mode"
subtitle: 
comments: false
weight: 550

---

> Version history:  
> Enhanced with dump of referential metadata since [August 3, 2022 Release .Stat Suite JS quark](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#august-3-2022)  
> Released in [October 7, 2020 Release .Stat Suite JS 5.4.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#october-7-2020)

---

To help specific users such as methodology advisers, metadata managers or lead statisticians, the dump feature proposes a one-click extraction of the whole content of a data space. All structure objects (artefacts), data and referential metadata of the selected data spaces are downloaded and saved in files in the download folder defined by the web browser settings of the user.  

![dlm dump page](/dotstatsuite-documentation/images/dlm-dump-1.png)  
  
---

### What is extracted?

- **Data structure files**
    - one SDMX-ML data structure file per structural artefact type (e.g. codelist, conceptscheme, categoryscheme, dsd, dataflow, etc.)  
    - one SDMX-ML data structure file per dataflow (with all structural references)    
- **Data files**
    - one zip-compressed SDMX-CSV data file per dataflow (with all corresponding data values)
- **Referential metadata files**
    - one zip-compressed SDMX-CSV data file per dataflow (with all corresponding metadata values)

In case that there are no available data or referential metadata the related csv file will be empty. 

**DISCLAIMER:** The csv file for referential metadata is currently located **in a sub-folder** within the zip-compressed file. In order to extract the csv file, it is necessary to use a zip tool that is able to extract files from zip-archives with sub-folders, such as Winzip or 7zip. This will be improved with ticket  [dotstatsuite-core-sdmxri-nsi-ws#268](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/268).

![zip file content with sub-folder](/dotstatsuite-documentation/images/dlm-dump-zip-with-sub-folder.png)  

---
  
### Naming convention
  
To assist the user retrieve their relevant content, the file names respect a naming convention.  
All the filenames are  
* prefixed respectively by the **corresponding structural artefact type**, by **'data'** or by **'refmetadata'**,
* followed by the triple (Agency, ID, Version) displayed as **Agency_ID(Version)**,
* and a **timestamp**.
  
--- 

### Download folder  
  
In the download folder defined by the user's web browser settings, the user will find all the structural artefact files and the zip-compressed data and referential metadata files.  

![dlm dump result folder](/dotstatsuite-documentation/images/dlm-dump-2.png)  

**Note** that in order to avoid multiple validation popup windows, the user's web browser settings should be set to not ask where to save each file before downloading.
