---
title: "Tenant model"
subtitle: 
comments: false
weight: 71
keywords: [
  'Tenant model definition', '#tenant-model-definition',
  'Tenant deployment', '#tenant-deployment',
  'Specific accept header per data space', '#specific-accept-header-per-data-space',
  'Use native NSI WS authentication for external source', '#use-native-nsi-ws-authentication-for-external-source',
  'Example of complete tenant configuration', '#example-of-complete-tenant-configuration',
  'Additional specifications', '#additional-specifications',
]
---

#### Table of content
- [Tenant model definition](#tenant-model-definition)
- [Tenant deployment](#tenant-deployment)
- [Specific accept header per data space](#specific-accept-header-per-data-space)
- [Use native NSI WS authentication for external source](#use-native-nsi-ws-authentication-for-external-source)
- [Example of complete tenant configuration](#example-of-a-tenant)
- [Additional specifications](#additional-specifications)

> *Version history:*  
> `hasRangeHeader` added in [April 20, 2023 Release .Stat Suite JS unicorn](/dotstatsuite-documentation/changelog/#april-20-2023)  
> **"default": true** is required **(mandatory)** since [March 4, 2022 Release .Stat Suite JS 13.0.0](/dotstatsuite-documentation/changelog/#march-4-2022)  
> Introduction of additional `urlv3` space parameter to enable the referential metadata feature with [February 21, 2022 Release .Stat Suite JS 12.1.0](/dotstatsuite-documentation/changelog/#february-21-2022)  
> `keycloak` is replaced by **`oidc`** entry with [December 14, 2021 Release .Stat Suite JS 11.0.0](/dotstatsuite-documentation/changelog/#december-14-2021)  
> New tenant model introduced with [July 8, 2021 Release .Stat Suite JS 9.0.0](/dotstatsuite-documentation/changelog/#july-8-2021)

> Disclaimer: The *New!* tenant model described below is aligned with [July 8, 2021 Release .Stat Suite JS 9.0.0](/dotstatsuite-documentation/changelog/#july-8-2021) and above versions of the .Stat Suite.

*Recorded presentation at the SIS-CC ATF meeting on Tue 29-Jun-2021: [online video](https://oecdtv.webtv-solution.com/embed/8262/en/video)*

---

### Tenant model definition
The .Stat Suite tenant model allows for multiple varying configurations, customisations and brandings of a single instance (deployment) of the .Stat Suite JS components (Data Explorer, Data Viewer and Data Lifecycle Manager).

There are 2 configuration levels for tenants in this model:  
- **Organisation**: It allows for defining a specific configuration, customisation and branding of the JS components. 
  - **Scope**: It (only) allows for defining specific **data spaces** (1), the indexation rules and the **OpenID-Connect-compatible (OIDC) authentication provider** per JS application for an organisation.   
    A `DE scope` defines which `data spaces` can be accessed and how they are to be indexed (or not) --> See `data sources` (2) below.  
    A `DLM scope` defines which `data spaces` are listed and how they are to be accessed (or not, e.g. what is the URL of the transfer service to be used for data and referential metadata imports into that space).

There can be several organisations and each organisation can have several scopes per JS application.

(1) A **data space** is an SDMX endpoint with a URL and optional configuration parameters, such as supported headers and functions (e.g. `hasLastNObservations`).  
  - Example diagram:  
     <img src="/dotstatsuite-documentation/images/data-space-diagram.png"  width="633" height="264" alt="data space diagram">

(2) A **data source** is a virtual container defining a set of unique SDMX dataflows returned by the execution of `data queries` from one `data space`. `Data queries` are a list of SDMX CategoryScheme(s) with Categories into which dataflows to be indexed by the *sfs* search service are categorised.  
  - Example diagram:  
    <img src="/dotstatsuite-documentation/images/data-source-diagram.png"  width="633" height="203" alt="data source diagram">

<img src="/dotstatsuite-documentation/images/new-tenant-model.png"  width="645" height="408" alt="New Tenant Model diagram">

#### Example configuration

tenants.json

```json
{
  "org-1": {
    "id": "org-1",
    "label": "org-1-name",
    "spaces": {
      "space-1": {
        "label": "space-1-name",
        ...
      },
      "space-2": {
        "label": "space-2-name",
        ...
      },
    },
    "datasources": {
      "ds:space-1": {
        "dataSpaceId": "space-1",
        "dataqueries": [...]
      }
    },
    "scopes": {
      "dlm-scope-1": {
        "type": "dlm",
        "label": "dlm-scope-1-name",
        "oidc": {
          ...
        },
        "spaces": [
          {
            "id": "space1",
            ...
          },
          {
            "id": "space2",
            ...
          }
        ]
      },
      "dlm-scope-1": {
        ...
      },
      "de-scope-1": {
        "type": "de",
        "label": "de-scope-1-name",
        "oidc": {
          ...
        },
        "spaces": [
          "space1",
          "space2"
        ],
        "datasources": [
          "ds:space1",
          "ds:space2"
        ]
      },
      "de-scope-2": {
        ...
      }
    }
  },
  "org-2": {
    ...
  }
}
```

---

### Tenant deployment
In order to allow users to reach the different `organisations` and their `scopes`, each `scope` in each `organisation` needs its own web application URL (host) `https://<app+env+organisation+scope>.<domain>`, which could be replaced by a dedicated DNS entry, e.g.,`https://<app>.<env>.<organisation>.<scope>.<domain>`.  

The .Stat [**'proxy' service**](/dotstatsuite-documentation/getting-started/framework/#proxy-service) is used to route the requests from those individual URLs to to appropriate underlying target application. By setting the `organisation:scope` headers depending on host it instructs the target application to inject the related configurations, customisations and brandings stored in the configurations and served by the .Stat [**config service**](/dotstatsuite-documentation/getting-started/framework/#config-service). 

The mapping from the web application URL (host) to the target application and `organisation` and scope is configured in the `routes.json` file of the proxy service:

```json
[
  {"host": "<app+env+organisation+scope>.<domain>", "target": "http://<application>", "tenant": "<organisation>[:<scope>]"},  
  ...
]
```
The `scope` part is optional and not required when an application has no specific scopes.

The organisation-wide configurations, customisations and brandings (not those defined in the scopes) are configured per application (Data Explorer, Data Viewer and Data Lifecycle Manager) in a `settings.json` file served by the [config service](/dotstatsuite-documentation/getting-started/framework/#config-service):

`/<env>/configs/<organisation>/<app>/settings.json`

#### Example

See the tenants definition [here](#example-of-complete-tenant-configuration).

See the `routes.json` file example of a deployment strategy using a proxy: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp/-/blob/master/qa/proxy/routes.json

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

**Related organisation-wide configurations, customisations and brandings:**

```
└── siscc-config-data\configs
    ├── oecd
    │   ├── data-explorer
    │   │   ├── i18n
    │   │   │   └── ??.json         # DE internationalisation (translations) **overwrites** - one file per locale with ??=locale code, e.g. "en"
    │   │   └── settings.json       # DE configuration
    │   ├── data-viewer
    │   │   ├── i18n
    │   │   │   └── ??.json         # Data Viewer internationalisation (translations) **overwrites** - one file per locale with ??=locale code, e.g. "en"
    │   │   └── settings.json       # Data Viewer configuration
    │   ├── data-lifecycle-manager
    │   │   ├── i18n
    │   │   │   └── ??.json         # DLM internationalisation (translations) **overwrites** - one file per locale with ??=locale code, e.g. "en"
    │   │   └── settings.json       # DLM configuration
    │   └── sfs
    │       └── settings.json       # Organisation- and search-specific settings overwriting general settings in /configs/tenants.json 
    ├── sfs.json                    # Instance-specific search fields configuration overwriting application-defaults
    └── tenants.json                # General configuration for all .Stat JS components; at least 1 organisation is required
```

---

### Specific accept header per data space
Define a specific **http accept header** for a given dataspace that will override the default header, allowing a specific accept header value for both structures and data.

* in `dotstatsuite-config/data/<env>/configs/tenants.json`

```json
{
  "tenant": {
    "id": "xxxx",
    "label": "xxxx",
    "spaces": {
      "space-X": {
        "label": "space-X-name",
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
- `urlv3`: The SDMX web service URL supporting the SDMX 3.0 REST syntax. This additional configuration was added to enable the referential metadata extraction, which requires an SDMX 3.0 REST-compatible web service. 
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
      "space-X": {
        "label": "space-X-name",
        "hasRangeHeader": true,
        "hasCustomRangeHeader": false
      }
    }
  }
}
```

---

### Use native NSI WS authentication for external source
In case an external data source is accessible through an SDMX web service based on Eurostat's SDMX-RI "NSI" component (so called NSI web service), with the **`hasExternalAuth`** parameter the DLM and the DE can be instructed to authenticate against that web service using the native NSI authentication mechanism (implemented by Eurostat) based on HTTP basic access authentication (BA).

The user will have to enter the required credentials through a specific dialog box, as described [here](/dotstatsuite-documentation/using-dlm/log-in-dlm/#connect-to-external-sources-using-the-native-nsi-authentication).

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

### Example of complete tenant configuration
Example of a `tenant.json` file inside which `organisations`, `scopes`, `data spaces` and `data sources` are defined.  

**Authentication** is defined at the scope level, allowing thus different providers’ `clientId` or `authority` across your application for a `organisation` as long as it is OpenID compliant (see more details [here](/dotstatsuite-documentation/configurations/authentication/#generic-openid-compliance)).  
Also, in this example, the ‘oecd’ `organisation` is the default one ("default": true), even though there is only one `organisation` defined.

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
        "supportsPostLongRequests": true,
        "hasLastNObservations": true,
        "supportsCsvFile": false,
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

### Additional specifications

**Multi-tenant index**  
If you want 2 different Solr search indexations, you need **2 organisation definitions** in your `tenants.json` file, following the above example.

**`searchUrl` override**  
The `searchUrl` parameter can be used in some cases to override the url of the space when requested by the search service. If you have a request limiter for your web services (e.g. NSIWS), you may want to bypass this limit when indexing (because there will be a lot of requests and they won't be from a malicious origin). In that case, `searchUrl` is a temporary solution to address this issue, where the `sfs` search service uses `searchUrl` instead of `url` for the space definition.
