---
title: "Upload data from Excel files"
subtitle: 
comments: false
weight: 290
keywords: [
  'Data file format and size', '#data-file-format-and-size',
  'Upload data file', '#upload-data-file',
]
---

#### Table of Content
- [Data file format and size](#data-file-format-and-size)
- [Upload data file](#upload-data-file)

---

### Data file format and size
The Data Lifecycle Manager allows uploading data stored in **Excel xlsx** files, if the data is organised in spreadsheet tables according to a specific table description, which is to be provided together with the Excel file through an additional "EDD" (Excel Data Descriptor) xml file.

- EDD schema: [EDD.xsd](/dotstatsuite-documentation/using-dlm/upload-data/EDD.xsd)
- EDD documentation: [EDD-documentation-v1.0.docx](/dotstatsuite-documentation/using-dlm/upload-data/EDD-documentation-v1.0.docx)
- Example-based explanation: [EDD-documentation-v1.0.xlsx](/dotstatsuite-documentation/using-dlm/upload-data/EDD-documentation-v1.0.xlsx)
- Example Excel xlsx and EDD: 
  - Excel data: [Excel-data-example.xlsx](/dotstatsuite-documentation/using-dlm/upload-data/Excel-data-example.xlsx)
  - EDD: [EDD-example.xml](/dotstatsuite-documentation/using-dlm/upload-data/EDD-example.xml)

The "Upload data & referential metadata" feature supports **Excel xlsx** file format for data and **xml** file format for "EDD".  
The file size limitation is set to 30MB by default which can be changed through the configuration of the application. Note that unlike SDMX files, this size limitation can't be bypass for Excel/EDD files **and** the use of a file path of a shared folder is not available for Excel/EDD files.

---

### Upload data file
* Click on "Upload data & referential metadata" from the top banner of the DLM.
* Add (+) your "EDD" and "Excel xlxs" files with the file explorer option **or**
* Drag & drop the files in the dashed area 
* Select one or several target data space(s).

**Example of successful data upload request:**

![dlm-upload-data-edd-success](/dotstatsuite-documentation/images/dlm-upload-data-edd-success.png)

Note that the two files must be uploaded together:
* Uploading "EDD" xml file only: the upload button is active as this file format is accepted as single upload for SDMX files. However, after performing the upload, an error message will be displayed as the "Excel xlsx" file is missing.
* Uploading "Excel xlsx" file only: the upload button will remain greyed (inactive) as this file format is not accepted separately. The corresponding "EDD" file must be added then the upload can be performed.

**Example of failed data upload request *(due to e.g. missing Excel xlsx file)*:**

![dlm-upload-data-edd-fail](/dotstatsuite-documentation/images/dlm-upload-data-edd-fail.png)

See also [notifications](/dotstatsuite-documentation/using-dlm/upload-data/upload-data-sdmx-file/#notifications)
