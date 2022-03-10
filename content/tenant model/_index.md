---
title: "Tenant model"
subtitle: 
comments: false
weight: 65
keywords: [
  'Tenant model definition', '#tenant-model-definition',
  'Example of a tenant', '#example-of-a-tenant',
  'Example of a tenant deployment strategy', '#example-of-a-tenant-deployment-strategy',
  'Additional specifications', '#additional-specifications',
]
---

> *Version history:*  
> Introduction of `urlv3` space parameter to enable the referential metadata feature with [February 21, 2022 Release .Stat Suite JS 12.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#february-21-2022)  
> **"default": true** is required **(mandatory)** since [March 4, 2022 Release .Stat Suite JS 13.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#march-4-2022)  
> `keycloak` is replaced by **`oidc`** entry with [December 14, 2021 Release .Stat Suite JS 11.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#december-14-2021)  
> New tenant model introduced with [July 8, 2021 Release .Stat Suite JS 9.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#july-8-2021)

---

#### Table of content
- [Tenant model definition](#tenant-model-definition)
- [Example of a tenant](#example-of-a-tenant)
- [Example of a tenant deployment strategy](#example-of-a-tenant-deployment-strategy)
- [Additional specifications](#additional-specifications)

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
**Authentication** is defined at the scope level, allowing thus different providers' `client_id` or `authority` across your application for a tenant as long as it is OpenID compliant (see more details [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/authentication/#generic-openid-compliance)).

Also, in this example, the 'oecd' tenant is the default one (`"default": true`), even though there is only one tenant defined. 'staging:SIS-CC-stable' space of 'oecd' tenant supports the *SDMX* v2 API for referential metadata display (see more details [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/ref-metadata/)) `"urlv3": "https://nsi-demo-stable.siscc.org/rest/V2"`.

```json
{
  "oecd": {
    "id": "oecd",
    "label": "oecd",
    "default": true,
    "spaces": {
      "staging:SIS-CC-stable": {
        "label": "staging:SIS-CC-stable",
        "hasRangeHeader": true,
        "supportsReferencePartial": true,
        "hasLastNObservations": false,
        "url": "https://nsi-demo-stable.siscc.org/rest",
        "urlv3": "https://nsi-demo-stable.siscc.org/rest/V2",
        "searchUrl": "http://nsiws-demo-release/rest"
      },
      "staging:SIS-CC-reset": {
        "label": "staging:SIS-CC-reset",
        "url": "https://nsi-demo-reset.siscc.org/rest",
        "urlv3": "https://nsi-demo-reset.siscc.org/rest/V2",
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
        "oidc": {
          "authority": "OECDhttps://keycloak.siscc.org/auth/realms/OECD",
          "client_id": "app"
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
        "oidc": {
          "authority": "https://keycloak.siscc.org/auth/realms/OECD",
          "client_id": "app"
        },
        "spaces": [
          "qa:stable",
          "staging:SIS-CC-stable",
          "staging:SIS-CC-reset",
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
`routes.json` file example of a deployment strategy using a proxy: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp/-/blob/master/qa/proxy/routes.json

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

---

### Additional specifications

**Multi-tenant index**  
If you want 2 different Solr search indexations, you need **2 tenant definitions** in your `tenants.json` file, following the above example.

**`searchUrl` override**  
The `searchUrl` parameter can be used in some cases to override the url of the space when requested by the search service. If you have a request limiter for your web services (e.g. NSIWS), you may want to bypass this limit when indexing (because there will be a lot of requests and they won't be from a malicious origin). In that case, `searchUrl` is a temporary solution to address this issue, where the `sfs` search service uses `searchUrl` instead of `url` for the space definition.
