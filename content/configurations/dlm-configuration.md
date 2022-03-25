---
title: ".Stat DLM configuration"
subtitle: 
comments: false
weight: 82
keywords: [
  'Data space names', '#data-space-names',
  'Data space colors', '#data-space-colors',
  'Data space InsertNewItems parameter', '#data-space-insertnewitems-parameter',
  'List of SDMX artefact types', 'list-of-sdmx-artefact-types',
  'Upload size limit', '#upload-size-limit'
]

---

#### Table of Content
- [Data space names](#data-space-names)
- [Data space colors](#data-space-colors)
- [Data space InsertNewItems parameter](#data-space-insertnewitems-parameter)
- [List of SDMX artefact types](#list-of-sdmx-artefact-types)
- [Upload size limit](#upload-size-limit)

For the tenant and data space definitions please see [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/tenant-model.md).

---

### Data space names
Define the name of an internal or external data space displayed to the end-user in the DLM UI, regardless the `datasourceIds`.

* in `dotstatsuite-config-data/<env>/configs/tenants.json`  

```json
    "spaces": {
      "staging:SIS-CC-stable": {
        "label": "SIS-CC stable"
      },
    }
```

---

### Data space colors
Define the font color and background color for each internal and external data space. The colors defined are applied in all options, features and representations of the data spaces (e.g. in the selectors and list of results, upload and transfer features, etc.)

* in `dotstatsuite-config-data/<env>/configs/tenants.json` under a DLM `scope`  
where `"color"` refers to the font color of the name, and `"backgroundColor"` refers to the background colored area.

```json
    "scopes": {
      "dlm": {
        "type": "dlm",
        "label": "dlm"
        },
        "spaces": [
          {
            "id": "staging:SIS-CC-stable",
            "color": "#0549ab",
            "backgroundColor": "#b7def6",
            "label": "staging:SIS-CC-stable"
          }
      }
```

![data space color](/dotstatsuite-documentation/images/dlm-config-source-color.png)

---

### Data space InsertNewItems parameter
>Released in [March 29, 2020 Release .Stat Suite .NET 3.3.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#march-29-2020)  

The **`InsertNewItems`** parameter located in the `app.config` of the NSI web service allows to update final or non-final SDMX artefacts (of ItemScheme types, e.g. codelist) without changing the version of it.  
When the parameter is set to:  
```yaml
    - name: INSERT_NEW_ITEM_SCHEME_VALUES
      value: "true"
```
Then it is possible for instance to add a new code in a codelist without modifying its Agency/ID/Version.

---

### List of SDMX artefact types
Define the types of SDMX structural artefacts selectable in the DLM 'Filter by type' selector (see [functional specs](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/dlm_overview/#types)). Only artefacts of those types can be displayed in the DLM user interface.

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-lifecycle-manager/settings.json`

```json
  "sdmx": {
    "typeIds": [
      "agencyscheme",
      "categoryscheme",
      "categorisation",
      "codelist",
      "conceptscheme",
      "contentconstraint",
      "datastructure",
      "dataflow",
      "hierarchicalcodelist",
      "metadatastructure",
      "metadataflow",
      "structureset"
    ]
  }
```

---

### Upload size limit
Define the file size limitation when uploading data or strutures files using the DLM user interface.  
Provided in number of bites, the upload file size limit is usually set to 30MB by default (like in the example below).  

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-lifecycle-manager/settings.json`

```json
"uploadSizeLimit": 30000000
```

**Note** that this configuration parameter only concerns the JavaScript front-end part of the DLM application, and another limitation parameter is set for the .Stat CORE services for the submitted files. More information to be found [here](https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored/-/blob/master/doc/CONFIGURATION.md#maximum-size-of-the-submited-sdmx-messages).
