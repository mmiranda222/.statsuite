---
title: "Upload data or referential metadata"
subtitle: 
comments: false
weight: 310

---

> *Version history:*  
> Data supported in SDMX-CSV version 2.0 file format, and including combined actions since [September 22, 2022 Release .Stat Suite .NET 'blueberry'](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#september-22-2022)
> Referential metadata upload introduced in DLM in [February 21, 2022 Release .Stat Suite JS 12.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#february-21-2022)

**Data** or **referential metadata** can be uploaded by using the main menu feature "Upload data & referential metadata" available from the top banner of the DLM.

![dlm-upload-data-banner](/dotstatsuite-documentation/images/dlm-upload-data-sdmx-banner.png)

The DLM upload supports the following general types of **file formats**:  
- [SDMX data or referential metadata files](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/manage-data/upload-data/upload-data-and-metadata/) for either observation and attribute values or for referential metadata attribute values
- [Excel data files](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/manage-data/upload-data/upload-data-edd/) together with an "Excel data definition (EDD)" xml file that defines how to read the data from the Excel file  

The main additional upload features are:  
- [Basic or advanced input validations](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/manage-data/upload-data/data-validation/)
- [Embargo (DSD-level point-in-time release)](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/manage-data/upload-data/point-in-time/)

The supported types of data are: [To be complemented.] For uploading longer attribute values (>150 characters) see [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/manage-structures/upload-structure/text-attribute-length).

At the end of all data uploads the **actual content constraints** of **all** dataflows of the underlying data structure are auto-(re-)generated. For more information see [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/data/#auto-generation-of-actual-content-constraints).
