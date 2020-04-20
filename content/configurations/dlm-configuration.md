---
title: ".Stat DLM configuration"
subtitle: 
comments: false
weight: 74

---

*under construction...*

#### Table of Content
- [InsertNewItems parameter](#insertnewitemsparameter)

---

### InsertNewItems parameter

>Released in [March 29, 2020 Release .Stat Suite .NET 3.3.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#march-29-2020)  

The **`InsertNewItems`** parameter located in the `app.config` of the NSI web service allows to update final or non-final SDMX artefacts (of ItemScheme types, e.g. codelist) without changing the version of it.  
When the parameter is set to:  
```yaml
    - name: INSERT_NEW_ITEM_SCHEME_VALUES
      value: "true"
```
Then it is possible for instance to add a new code in a codelist without modifying its Agency/ID/Version.
