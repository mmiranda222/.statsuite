---
title: "Data validation options"
subtitle: 
comments: false
weight: 295

---

> Released with [October 5, 2021 .Stat Suite JS 10.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#october-5-2021)

When uploading data using the "Upload data" features in the DLM, advanced upload options allow the user to choose the validation process type. The user has three options:  
a) **Favour speed with basic validations**: basic validations are performed upon data upload for *SDMX* compliance, allowed/complete dimensions values, or representation requirements. It provides simplified error explanations.

b) **Apply advanced validations**: advanced validations are performed upon data upload for duplicated coordinates, consistent non-observational values, or mandatory attribute values. It provides detailed error explanations.

c) **Only run advanced validations without changing data**: this option will only perform an "analysis" of the data compliancy without updating the target dataspace, and a report by email will be sent with the results.

By default, the basic validations option is selected.

![dlm upload data validation](/dotstatsuite-documentation/images/dlm-upload-data-validation1.png)

In summary, basic validation allows to:
- report multiple values for group and series attributes;
- report null values to mandatory attributes;
- when there are duplicates in the import, a single error message (about duplicates) will be included in the report.
Full validation allows to:
- validate that the outcome of an import will result in consistency of values for group and series attributes;
- validate that the outcome of an import will result in all mandatory attributes to have a value;
- when there are duplicates in the import, every duplicate issue will be included in the report.

The full details of the validation process methods can be found [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/api-main-features/#data-validation-process). The documentation is also accessible from the DLM UI question mark icon.
