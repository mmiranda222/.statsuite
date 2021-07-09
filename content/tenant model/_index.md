---
title: "Tenant model"
subtitle: 
comments: false
weight: 65
keywords: [
  'Tenant model definition', '#tenant-model-definition',
  'Example of a tenant', '#example-of-a-tenant',
  'Example of a tenant deployment strategy', '#example-of-a-tenant-deployment-strategy',
]
---

#### Table of content
- [Tenant model definition](#tenant-model-definition)
- [Example of a tenant](#example-of-a-tenant)
- [Example of a tenant deployment strategy](#example-of-a-tenant-deployment-strategy)

--- 

> Disclaimer: The *New!* tenant model described below is aligned with [July 8, 2021 Release .Stat Suite JS 9.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#july-8-2021) and above versions of the .Stat Suite.

*Recorded presentation at the SIS-CC ATF meeting on Tue 29-Jun-2021: [online video](https://oecdtv.webtv-solution.com/embed/8262/en/video)*

### Tenant model definition
Allow for multi-tenant deployments with multi search engines

**Tenant** is the root definition of an organisation configuration, to which you can attach **scope(s)**, **data space(s)**, and **data source(s)**.  
**Data space** is a SDMX endpoint with an URL and optional headers or options' overrides (e.g. `hasLastNObservations`).  
**Data source** is a reference to a data space and a list of data queries used by the *sfs* search service to get a list of dataflows to index. More precisely, data queries are a list of SDMX CategoryScheme(s) to which dataflows are categorised.  
**Scopes** for DLM and DE are used to define custom configurations for applications:
- the DE scope defines data sources (because the search indexes from a data source), and data spaces (e.g. when in some cases the DE can have direct links to a space without search index);
- the DLM scope contains spaces. In addition, each space for the DLM also contains the URL of the transfer service, aligning thus the architecture with the back-end services, where a transfer URL is bound to a data space, and also supporting cases when a space can be un-related to any transfer service.

![New Tenant Model diagram](/dotstatsuite-documentation/images/new-tenant-model.png)

#### Example of a tenant
Example of a `tenant.json` file inside which spaces, data sources, and scopes are defined.  
The DLM scope contains a list of spaces.  
The DE scope contains a space and data sources (only IDs): data sources are used for search index, and space is an additional source for enabling visualisation (without index).  
**Keycloak** is defined at the scope level, allowing thus different `clientId` or `Realm` across your application for a tenant.

```json
{
  "default": {
    "id": "default",
    "label": "default",
    "description": "default tenant used for healthcheck"
  },
  "oecd": {
    "id": "oecd",
    "label": "oecd",
    "spaces": {
      "staging:SIS-CC-stable": {
        "label": "staging:SIS-CC-stable",
        "url": "https://nsi-demo-stable.siscc.org/rest",
        "hasRangeHeader": true,
        "supportsReferencePartial": true,
        "hasLastNObservations": false
      },
      "staging:SIS-CC-reset": {
        "label": "staging:SIS-CC-reset",
        "url": "https://nsi-demo-reset.siscc.org/rest",
        "hasRangeHeader": true,
        "supportsReferencePartial": true,
        "hasLastNObservations": true
      },
      "ILO-prod": {
        "label": "ILO-prod",
        "url": "https://ilo.org/sdmx/rest",
        "hasRangeHeader": true,
        "supportsReferencePartial": true,
        "hasLastNObservations": true
      },
      "UNICEF-prod": {
        "label": "UNICEF-prod",
        "url": "https://sdmx.data.unicef.org/ws/public/sdmxapi/rest",
        "hasRangeHeader": false,
        "supportsReferencePartial": true,
        "hasLastNObservations": true,
        "headers": {
          "data": {
            "csv": "application/vnd.sdmx.data+csv",
            "json": "application/vnd.sdmx.data+json;version=1.0.0",
            "xml": "application/xml"
          },
          "structure": {
            "json": "application/vnd.sdmx.structure+json;version=1.0.0",
            "xml": "application/vnd.sdmx.structure+xml;version=2.1"
          }
        }
      }
    },
    "datasources": {
      "ds:staging:SIS-CC-stable": {
        "dataSpaceId": "staging:SIS-CC-stable",
        "indexed": true,
        "dataqueries": [
          {
            "version": "1.0",
            "categorySchemeId": "OECDCS1",
            "agencyId": "OECD"
          },
          {
            "version": "1.0",
            "categorySchemeId": "CAS_2",
            "agencyId": "OECD"
          }
        ]
      },
      "ds:qa:stable": {
        "dataSpaceId": "qa:stable",
        "indexed": true,
        "dataqueries": [
          {
            "version": "1.0",
            "categorySchemeId": "OECDCS1",
            "agencyId": "OECD"
          }
        ]
      }
    },
    "scopes": {
      "dlm": {
        "type": "dlm",
        "label": "dlm",
        "keycloak": {
          "realm": "OECD",
          "clientId": "app"
        },
        "spaces": [
          {
            "id": "staging:SIS-CC-stable",
            "color": "#0549ab",
            "backgroundColor": "#b7def6",
            "label": "staging:SIS-CC-stable",
            "transferUrl": "https://transfer-demo.siscc.org/1.2",
            "dataExplorerUrl": "https://de-qa.siscc.org"
          },
          {
            "id": "staging:SIS-CC-reset",
            "color": "#0549ab",
            "backgroundColor": "#e2f2fb",
            "label": "staging:SIS-CC-reset",
            "transferUrl": "https://transfer-demo.siscc.org/1.2",
            "dataExplorerUrl": "https://de-qa.siscc.org"
          },
          {
            "id": "ILO-prod",
            "isExternal": true,
            "color": "white",
            "backgroundColor": "#1e2dbe",
            "label": "ILO-prod",
            "dataExplorerUrl": "https://de-qa.siscc.org"
          },
          {
            "id": "UNICEF-prod",
            "isExternal": true,
            "color": "white",
            "backgroundColor": "#1cabe2",
            "label": "UNICEF-prod",
            "dataExplorerUrl": "https://de-qa.siscc.org"
          }
        ]
      },
      "dlm2": {
        "type": "dlm",
        "label": "dlm2",
        "keycloak": {
          "realm": "OECD",
          "clientId": "app"
        },
        "spaces": [
          {
            "id": "staging:SIS-CC-stable",
            "color": "#0549ab",
            "backgroundColor": "#b7def6",
            "label": "staging:SIS-CC-stable",
            "isExternal": true,
            "dataExplorerUrl": "https://de-qa.siscc.org"
          },
          {
            "id": "staging:SIS-CC-reset",
            "color": "#0549ab",
            "backgroundColor": "#e2f2fb",
            "label": "staging:SIS-CC-reset",
            "isExternal": true,
            "dataExplorerUrl": "https://de-qa.siscc.org"
          {
            "id": "ILO-prod",
            "isExternal": true,
            "color": "white",
            "backgroundColor": "#1e2dbe",
            "label": "ILO-prod",
            "dataExplorerUrl": "https://de-qa.siscc.org"
          },
          {
            "id": "UNICEF-prod",
            "isExternal": true,
            "color": "white",
            "backgroundColor": "#1cabe2",
            "label": "UNICEF-prod",
            "dataExplorerUrl": "https://de-qa.siscc.org"
          }
        ]
      },
      "de": {
        "type": "de",
        "label": "de",
        "keycloak": {
          "realm": "OECD",
          "clientId": "app"
        },
        "spaces": [
          "qa:stable",
          "staging:SIS-CC-stable",
          "staging:SIS-CC-reset",
          "ILO-prod",
          "UNICEF-prod"
        ],
        "datasources": [
          "ds:staging:SIS-CC-stable",
          "ds:qa:stable"
        ]
      }
    }
  }
}



```

#### Example of a tenant deployment strategy
`routes.json` file exmaple of a deployment strategy using a proxy: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp/-/blob/master/qa/proxy/routes.json

```json
[
  {"host": "keycloak.siscc.org", "target": "http://keycloak-http"},

  {"host": "sdmxjs-qa.siscc.org", "target": "http://sdmxjs"},
  {"host": "visions-qa.siscc.org", "target": "http://visions"},
  {"host": "sfs-qa.siscc.org", "target": "http://sfs" },
  {"host": "share-qa.siscc.org", "target": "http://share" },
  {"host": "dv-qa.siscc.org", "target": "http://data-viewer", "tenant": "oecd" },
  {"host": "dlm-qa.siscc.org", "target": "http://data-lifecycle-manager", "tenant": "oecd:dlm" },
  {"host": "dlm2-qa.siscc.org", "target": "http://data-lifecycle-manager", "tenant": "oecd:dlm2" },
  {"host": "de-qa.siscc.org", "target": "http://data-explorer", "tenant": "oecd:de" }
]
```
