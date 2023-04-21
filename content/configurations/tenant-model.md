---
title: "Tenant model"
subtitle: 
comments: false
weight: 71
keywords: [
  'Tenant model definition', '#tenant-model-definition',
  'Specific accept header per data space', '#specific-accept-header-per-data-space',
  'Use native NSI WS authentication for external source', '#use-native-nsi-ws-authentication-for-external-source',
  'Example of a tenant', '#example-of-a-tenant',
  'Example of a tenant deployment strategy', '#example-of-a-tenant-deployment-strategy',
  'Additional specifications', '#additional-specifications',
]
---

#### Table of content
- [Tenant model definition](#tenant-model-definition)
- [Specific accept header per data space](#specific-accept-header-per-data-space)
- [Use native NSI WS authentication for external source](#use-native-nsi-ws-authentication-for-external-source)
- [Example of a tenant](#example-of-a-tenant)
- [Example of a tenant deployment strategy](#example-of-a-tenant-deployment-strategy)
- [Additional specifications](#additional-specifications)

> *Version history:*  
> `hasRangeHeader` added in [April 20, 2023 Release .Stat Suite JS unicorn](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-20-2023)  
> **"default": true** is required **(mandatory)** since [March 4, 2022 Release .Stat Suite JS 13.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#march-4-2022)  
> Introduction of additional `urlv3` space parameter to enable the referential metadata feature with [February 21, 2022 Release .Stat Suite JS 12.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#february-21-2022)  
> `keycloak` is replaced by **`oidc`** entry with [December 14, 2021 Release .Stat Suite JS 11.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#december-14-2021)  
> New tenant model introduced with [July 8, 2021 Release .Stat Suite JS 9.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#july-8-2021)

> Disclaimer: The *New!* tenant model described below is aligned with [July 8, 2021 Release .Stat Suite JS 9.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#july-8-2021) and above versions of the .Stat Suite.

*Recorded presentation at the SIS-CC ATF meeting on Tue 29-Jun-2021: [online video](https://oecdtv.webtv-solution.com/embed/8262/en/video)*

---

### Tenant model definition
Allow for multi-tenant deployments of the .Stat Suite JS components

**Tenant** (now also called **organisation**) is the root definition of an organisation's configuration, for which `data space(s)` and application `scope(s)` can be defined.  
**Data space** is an SDMX endpoint with a URL and optional configuration parameters, such as supported headers and functions (e.g. `hasLastNObservations`).  
Application **scopes** are custom configurations for the DLM and DE applications:
- the `DE scope` defines which `data spaces` can be accessed and how they are to be indexed (or not) --> See `data sources` below.
- the `DLM scope` defines which `data spaces` are listed and how they are to be accessed (or not, e.g. what is the URL of the transfer service to be used for data and referential metadata imports into that space).
**Data source** is a virtual container defining a set of unique SDMX dataflows returned by the execution of `data queries` from one `data space`. `Data queries` are a list of SDMX CategoryScheme(s) with Categories into which dataflows to be indexed by the *sfs* search service are categorised.  

![New Tenant Model diagram](/dotstatsuite-documentation/images/new-tenant-model.png)

**Data spaces example diagram for an installation at the OECD:** 

![data space diagram](/dotstatsuite-documentation/images/data-space-diagram.png)

**Data sources example diagram for an installation at the OECD and an external data source using an ILO SDMX API:** 

![data source diagram](/dotstatsuite-documentation/images/data-source-diagram.png)

---

### Specific accept header per data space
>Released in [July 8, 2021 Release .Stat Suite JS 9.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#july-8-2021)

Define a specific **http accept header** for a given dataspace that will override the default header, allowing a specific accept header value for both structures and data.

* in `dotstatsuite-config/data/<env>/configs/tenants.json`

```json
{
  "tenant": {
    "id": "xxxx",
    "label": "xxxx",
    "spaces": {
      "XXXX-prod": {
        "label": "XXXX-prod",
        "url": "https://service-root/rest/",
        "urlv3": "https://service-root/rest/V2",
        "headers": {
          "data": {
            "csv": "application/vnd.sdmx.data+csv;version=2.0",
            "json": "application/vnd.sdmx.data+json;version=2.0",
            "xml": "application/vnd.sdmx.structurespecificdata+xml;version=2.1"
          },
          "structure": {
            "json": "application/vnd.sdmx.structure+json;version=1.0.0",
            "xml": "application/vnd.sdmx.structure+xml;version=2.1"
          }
        }
      },
      }
    }
  }
```

- `url`: The SDMX web service URL supporting the SDMX 2.1 REST syntax.
- `urlv3`: The SDMX web service URL supporting the SDMX 3.0 REST syntax. This additional configuration was added in [release .Stat Suite JS 12.1.0 (February 21, 2022)](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#february-21-2022) to enable the referential metadata extraction, which requires an SDMX 3.0 REST-compatible web service. 
- `headers`: Object holding the mime-types to be used per format `csv`, `json` and `xml`. To support referential metadata, the `json` header settings must use the SDMX-JSON 2.0 mime type, otherwise the SDMX-CSV 1.0, SDMX-JSON 1.0 and SDMX-ML 2.1 mime types can be used.
- `headersv3`: Same as `headers`, only instead of the mime-types for the SDMX 2.1 REST requests, will allow to customize the mime-types for the metadata requests made to the SDMX 3.0 REST url defined in `urlv3`. The default values used by the application are the following:
```json
{
  "headersv3": {
    "metadata": {
      "csv": "application/vnd.sdmx.data+csv;version=2.0",
      "json": "application/vnd.sdmx.data+json;version=2.0"
    }
  }
}
```

- `hasRangeHeader`: If set to `true`, uses the new `x-range` HTTP request header (default) or the previous `range` HTTP request header when requesting a limited amount of observations in SDMX data queries.
- `hasCustomRangeHeader`: Default: `true`. Only used in combination with `"hasRangeHeader": true`. To be set to `false` when the `x-range` HTTP request header is not understood by the SDMX web service. In this case, the previous `range` HTTP request header is used, when requesting a limited amount of observations in SDMX data queries. The `range` HTTP request header is incompatible with HTTP compression and with some cloud hosting technologies.   
```json
{
  "tenant": {
    "id": "xxxx",
    "label": "xxxx",
    "spaces": {
      "myspace": {
        "label": "myspace-name",
        "hasRangeHeader": true,
        "hasCustomRangeHeader": false
      }
    }
  }
}
```

---

### Use native NSI WS authentication for external source
>Introduced in [December 14, 2021 Release .Stat Suite JS 11.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#december-14-2021)

In case an external data source is accessible through an SDMX web service based on Eurostat's SDMX-RI "NSI" component (so called NSI web service), with the **`hasExternalAuth`** parameter the DLM and the DE can be instructed to authenticate against that web service using the native NSI authentication mechanism (implemented by Eurostat) based on HTTP basic access authentication (BA).

The user will have to enter the required credentials through a specific dialog box, as described [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/log-in-dlm/#connect-to-external-sources-using-the-native-nsi-authentication).

The **`hasExternalAuth`** parameter is to be set to `true` in the `dotstatsuite-config-data/<env>/configs/tenants.json` file for a given tenant `space`.

```json
{
  "tenant": {
      "spaces": {
      "ISTAT-DMM-demo": {
        "hasExternalAuth": true
      }
    }
  }
}
```

---

### Example of a tenant
Example of a `tenant.json` file inside which spaces, data sources, and scopes are defined.  
The DLM scope contains a list of spaces.  
The DE scope contains a space and data sources (only IDs): data sources are used for search index, and space is an additional source for enabling visualisation (without index).  
**Authentication** is defined at the scope level, allowing thus different providers’ `clientId` or `authority` across your application for a tenant as long as it is OpenID compliant (see more details [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/authentication/#generic-openid-compliance)).  
Also, in this example, the ‘oecd’ tenant is the default one ("default": true), even though there is only one tenant defined.

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
        "searchUrl": "http://nsiws-demo-release/rest",
        "headers": {
          "data": {
            "csv": "application/vnd.sdmx.data+csv;version=2.0",
            "json": "application/vnd.sdmx.data+json;version=2.0"
          }
        }
      },
      "staging:SIS-CC-reset": {
        "label": "staging:SIS-CC-reset",
        "url": "https://nsi-demo-reset.siscc.org/rest",
        "urlv3": "https://nsi-demo-reset.siscc.org/rest/V2",
        "hasRangeHeader": true,
        "supportsReferencePartial": true,
        "hasLastNObservations": true,
        "headers": {
          "data": {
            "csv": "application/vnd.sdmx.data+csv;version=2.0",
            "json": "application/vnd.sdmx.data+json;version=2.0"
          }
        }
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
          "authority": "https://keycloak.siscc.org/auth/realms/OECD",
          "client_id": "app"
        },
        "spaces": [
          {
            "id": "staging:SIS-CC-stable",
            "color": "#0549ab",
            "backgroundColor": "#b7def6",
            "label": "staging:SIS-CC-stable",
            "transferUrl": "https://transfer-demo.siscc.org/2",
            "dataExplorerUrl": "https://de-qa.siscc.org"
          },
          {
            "id": "staging:SIS-CC-reset",
            "color": "#0549ab",
            "backgroundColor": "#e2f2fb",
            "label": "staging:SIS-CC-reset",
            "authenticateToRemoteURL": true,
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

---

### Example of a tenant deployment strategy
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
