---
title: "Upload data from an Excel file"
subtitle: 
comments: false
weight: 4330
keywords: [
  'Data file format and size', '#data-file-format-and-size'
]
---

#### Table of Content
- [Data file format and size](#data-file-format-and-size)

---

### Data file format and size
The transfer service allows uploading data stored in **Excel xlsx** files, if the data is organised in spreadsheet tables according to a specific table description, which is to be provided together with the Excel file through an additional "EDD" (Excel Data Descriptor) xml file.

- EDD schema: [EDD.xsd](/dotstatsuite-documentation/using-dlm/manage-data/upload-data/EDD.xsd)
- EDD documentation: [EDD-documentation-v1.0.docx](/dotstatsuite-documentation/using-dlm/manage-data/upload-data/EDD-documentation-v1.0.docx)
- Example-based explanation: [EDD-documentation-v1.0.xlsx](/dotstatsuite-documentation/using-dlm/manage-data/upload-data/EDD-documentation-v1.0.xlsx)
- Example Excel xlsx and EDD: 
  - Excel data: [Excel-data-example.xlsx](/dotstatsuite-documentation/using-dlm/manage-data/upload-data/Excel-data-example.xlsx)
  - EDD: [EDD-example.xml](/dotstatsuite-documentation/using-dlm/manage-data/upload-data/EDD-example.xml)

The upload feature supports **Excel xlsx** file format for data and **xml** file format for "EDD".  
The file size limitation is set to 30MB by default which can be changed through the configuration of the application. Note that unlike SDMX files, this size limitation can't be bypassed for Excel/EDD files **and** the use of a file path of a shared folder is not available for Excel/EDD files.
