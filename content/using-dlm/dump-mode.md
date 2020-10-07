---
title: "Export all in dump mode"
subtitle: 
comments: false
weight: 500

---

>Released in [October 7, 2020 Release .Stat Suite JS 5.4.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#october-7-2020)

To help some users such as methodology adviser, metadata manager, statistician, the dump feature proposes a simple backup of all contents of a data space.  
Data and all data structure objects (artefacts) of a specified data space are exported in files on the download folder defined by the web browser settings of the user.  

![dlm dump page](/dotstatsuite-documentation/images/dlm-dump-1.png)  
  
---

### What is backed-up?

- **Data structure files**
    - one SDMX-ML data structure file per structural artefact type (e.g. codelist, conceptscheme, categoryscheme, dsd, dataflow, etc.)  
    - one SDMX-ML data structure file per dataflow (with all structural references)    
- **Data files**
    - one compressed SDMX-CSV data file per dataflow (with all corresponding data values)  

---
  
### Naming convention
  
To assist the user retrieve their relevant content, the file names respect a naming convention.  
All the filenames are  
* prefixed by the **structural artefact type**, or by **'data'** for the data file,
* followed by the triple (Agency, ID, Version) displayed as **Agency_ID(Version)**,
* and a **timestamp**.
  
--- 

### Download folder  
  
In the download folder defined by the user's web browser settings, the user will find all the structural artefact files and the compressed data files.  

![dlm dump result folder](/dotstatsuite-documentation/images/dlm-dump-2.png)  

**Note** that in order to avoid multiple validation popup windows, the user's web browser settings should be set to not ask where to save each file before downloading.
