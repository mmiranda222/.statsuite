---
title: "Search Configuration"
subtitle: 
comments: false
weight: 87
keywords: [
 'Folder architecture', '#folder-architecture',
 'sfs.json and search result boost', '#sfs-json-and-search-result-boost',
 'settings.json', '#settings.json',
]
---

#### Table of Content
- [Folder architecture](#folder-architecture)
- [sfs.json and search result boost](#sfs-json-and-search-result-boost)
- [sfs/settings.json](#sfs-settings.json)

---

### Folder architecture
The below diagram shows how the configuration files of the Search (sfs) service, respectively **settings.json** and **sfs.json**, are structured:

```
.
├── configs
│   ├── oecd
│   │   ├── data-explorer
│   │   ├── data-viewer
|   |   ├── data-lifecycle-manager
|   |   ├── sfs
|   |   |   ├── settings.json       # see Table of content
|   ├── sfs.json                    # see Table of content
|   ├── tenants.json
```

---

### sfs.json and search result boost
The default configuration of sfs.json file is an empty object with fields property. This file is currently required and mandatory for the search service, especially for the search result boost feature. See more in the ([readme resource config](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search#resource-config)) file.

*sfs.json*
```json
{
  "fields": {}
}
```

*Note* that the sfs.json file is merged with the [default configuration](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/blob/develop/src/server/init/params.js).

#### Example
Use case: we want to create a search text boost based on `dataflowId` rather than dataflow name.  
Considering that in the [default configuration](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/blob/develop/src/server/init/params.js), the property name weight is at "2".  
In order to boost the search result for dataflowId in the data-explorer, you need to increase the `dataflowId` weight in the sfs.json file.

*sfs.json*
```json
{
  "fields": {
    "dataflowId": {
      "weight": 100
    }
  }
}
```

The weight property will increase the score returned by the search service. As a result, any dataflow with the `dataflowId` that is matching the searched term used in the data-explorer will be displayed at a first position in the search result.  

---

### sfs/settings.json
The **sfs/settings.json** file is defined at the tenant level and allows to override the search service calls to the NSI in order to bypass a request limiter.

**Override** the (data) spaces from the tenants.json... 

*tenants.json*
```json
{
  "spaces": {
    "demo-design": {
      "label": "demo-design",
      ...
      "url": "http://localhost:80/rest"
    }
  }
}
```

... with the url from that space only for the search service used:  

*settings.json*
```json
{
  "spaces": {
    "demo-design": {
      "url": "http://nsi-url/rest"
    }
  }
}
```

**Note** that this config. file only works as an override configuration. If left empty, then the original configuration from the 'tenants.json' is are applied.
