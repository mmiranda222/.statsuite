---
title: ".Stat DLM configuration"
subtitle: 
comments: false
weight: 79
keywords: [
  'Authentication', '#authentication',
  'Data space names', '#data-space-names',
  'Data space colors', '#data-space-colors',
  'Data space InsertNewItems parameter', '#data-space-insertnewitems-parameter',
  'Use data space as internal space or external space', '#use-data-space-as-internal-space-or-external-space',
  'Auto-authenticate to external source', '#auto-authenticate-to-external-source',
  'Use native NSI WS authentication for external source', '#use-native-nsi-ws-authentication-for-external-source',
  'Define data preview per space', '#define-data-preview-per-space',
  'List of SDMX artefact types', '#list-of-sdmx-artefact-types',
  'Default data validations option', '#default-data-validations-option',
  'Upload size limit', '#upload-size-limit',
  'Logbook submission time boundaries', '#logbook-submission-time-boundaries',
  'List of the standard roles for user permissions', '#list-of-the-standard-roles-for-user-permissions',
  'Override the default Authorisation-Managementn service URL', '#override-the-default-authorisation-management-service-url',
]

---
<!-- This page (or a sub-page or sub-section of this page) of the documentation is referenced as an external resource in the .Stat Academy:
* https://academy.siscc.org/configuring-and-customising/
Any change affecting its URL must be communicated to the .Stat Academy content admin in advance. -->

#### Table of Content
- [Authentication](#authentication)
- [Data space names](#data-space-names)
- [Data space colors](#data-space-colors)
- [Data space InsertNewItems parameter](#data-space-insertnewitems-parameter)
- [Use data space as internal space or external space](#use-data-space-as-internal-space-or-external-space)
- [Auto-authenticate to external source](#auto-authenticate-to-external-source)
- [Use native NSI WS authentication for external source](#use-native-nsi-ws-authentication-for-external-source)
- [Define data preview per space](#define-data-preview-per-space)
- [List of SDMX artefact types](#list-of-sdmx-artefact-types)
- [Default data validations option](#default-data-validations-option)
- [Upload size limit](#upload-size-limit)
- [Logbook submission time boundaries](#logbook-submission-time-boundaries)
- [List of the standard roles for user permissions](#list-of-the-standard-roles-for-user-permissions)
- [Override the default Authorisation-Management service URL](#override-the-default-authorisation-management-service-url)

For the tenant (`organisation` and `scope`) and data space definitions please see [here](/dotstatsuite-documentation/configurations/tenant-model).

---

### Authentication
The Data Lifecycle Manager requires an authentication configuration through an OpenID-Connect compliant identity provider.

For more information, see [here](/dotstatsuite-documentation/configurations/authentication/#authentication-in-the-dlm). 

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
>Released in [March 29, 2020 Release .Stat Suite .NET 3.3.0](/dotstatsuite-documentation/changelog/#march-29-2020)  

The **`InsertNewItems`** parameter located in the `app.config` of the NSI web service allows to update final or non-final SDMX artefacts (of ItemScheme types, e.g. codelist) without changing the version of it.  
When the parameter is set to:  
```yaml
    - name: INSERT_NEW_ITEM_SCHEME_VALUES
      value: "true"
```
Then it is possible for instance to add a new code in a codelist without modifying its Agency/ID/Version.

---

### Use data space as internal space or external space
>Changed in [December 14, 2021 Release .Stat Suite JS 11.0.0](/dotstatsuite-documentation/changelog/#december-14-2021)

Internal spaces in the DLM are those that allow for data imports or copies from other spaces. For this, a related transfer service is required and the  **`transferUrl`** parameter instructs the DLM to automatically show that data space as internal, automatically authenticate against that space with the common auth token and use the given transfer service instance for data imports. Otherwise, the data space is shown as external.

The **`transferUrl`** parameter is to be set in the `dotstatsuite-config-data/<env>/configs/tenants.json` file under a DLM `scope` for a given `space` to the rest root URL of the related transfer service.

```json
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
```

---

### Auto-authenticate to external source
>Released in [August 3, 2022 Release .Stat Suite JS quark](/dotstatsuite-documentation/changelog/#august-3-2022)  

In case a .Stat CORE data space is external because its definition doesn't define a transfer service to be used for imports, but it uses the same identity provider that is defined for the internal spaces, then the **`authenticateToRemoteURL`** parameter instructs the DLM to automatically authenticate against that source with the common auth token as well as to allow the transfer web service defined for an internal space (when called through one of the `/import/sdmxFile` or `/validate/sdmxFile` methods) to authenticate against that data source with that same auth token.

The **`authenticateToRemoteURL`** parameter is to be set to `true` in the `dotstatsuite-config-data/<env>/configs/tenants.json` file under a DLM `scope` for a given `space`.

```json
    "scopes": {
      "dlm": {
        "type": "dlm",
        "label": "dlm"
        },
        "spaces": [
          {
            "id": "staging:SIS-CC-reset",
            "color": "#0549ab",
            "backgroundColor": "#e2f2fb",
            "label": "staging:SIS-CC-reset",
            "dataExplorerUrl": "https://de-qa.siscc.org",
            "authenticateToRemoteURL": true
          }
      }
```

---

### Use native NSI WS authentication for external source
>Introduced in [December 14, 2021 Release .Stat Suite JS 11.0.0](/dotstatsuite-documentation/changelog/#december-14-2021)

In case an external data source is accessible through an SDMX web service based on Eurostat's SDMX-RI "NSI" component (so called NSI web service), with the **`hasExternalAuth`** parameter the DLM can be instructed to authenticate against that web service using the native NSI authentication mechanism (implemented by Eurostat) based on HTTP basic access authentication (BA).

The user will have to enter the required credentials through a specific dialog box, as described [here](/dotstatsuite-documentation/using-dlm/log-in-dlm/#connect-to-external-sources-using-the-native-nsi-authentication).

For more information on how to set the **`hasExternalAuth`** parameter, please see [here](/dotstatsuite-documentation/configurations/tenant-model/#use-native-nsi-ws-authentication-for-external-source)

---

### Define data preview per space
With the **`dataExplorerUrl`** parameter the DLM is instructed to allow previewing structures and data with the Data Explorer for an internal or external DLM data space.

The **`dataExplorerUrl`** parameter is to be set in the `dotstatsuite-config-data/<env>/configs/tenants.json` file under a DLM `scope` for a given `space` to the URL of the Data Explorer to be used.

```json
    "scopes": {
      "dlm": {
        "type": "dlm",
        "label": "dlm"
        },
        "spaces": [
          {
            "id": "staging:SIS-CC-reset",
            "color": "#0549ab",
            "backgroundColor": "#e2f2fb",
            "label": "staging:SIS-CC-reset",
            "dataExplorerUrl": "https://de-qa.siscc.org"
          }
      }
```

---

### List of SDMX artefact types
Define the types of SDMX structural artefacts selectable in the DLM 'Filter by type' selector (see [functional specs](/dotstatsuite-documentation/using-dlm/dlm_overview/#types)). Only artefacts of those types can be displayed in the DLM user interface.

* in `dotstatsuite-config-data/<env>/configs/<organisation>/data-lifecycle-manager/settings.json`

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

### Default data validations option
> Introduced in [December 5, 2022 Release .Stat Suite JS spin](/dotstatsuite-documentation/changelog/#december-5-2022)

Define, in the 'Data upload' and 'Data transfer' menus, what is the **data validations type option** selected by default:
- **"basic"** for Favour speed with basic validations
- **"advanced"** for Apply advanced validations

* in `dotstatsuite-config-data/<env>/configs/<organisation>/data-lifecycle-manager/settings.json`

```json
  "app": {
    "defaultOptionDataValidation": "advanced"
  }
```

See more about the functional specifications of this feature [here](/dotstatsuite-documentation/using-dlm/manage-data/upload-data/data-validation/).

---

### Upload size limit
Define the file size limitation when uploading data or strutures files **applied by the DLM user interface** as follow:    
Provided in number of bites, the upload file size limit is usually set to 30MB by default (like in the example below).  

* in `dotstatsuite-config-data/<env>/configs/<organisation>/data-lifecycle-manager/settings.json`

```json
  "sdmx": {
    "uploadSizeLimit": 30000000
  }
```

Specific configurations are also necessary also for the underlying .Stat CORE services (transfer and NSI). The hosting web server(s) (e.g. IIS, Kestrel, ..) need(s) to be configured to accept http requests with bodies of the required size. All web servers have their own defaults, e.g. the .Net Core builtin web server, called Kestrel, has a default maximum request body size of 30,000,000 bytes, which is approximately 28.6 MB.

In order to change the `MaxRequestBodySize` parameter in the **transfer service**, it will depend on the installation mode of back-end services:
- in case of a docker installation an environment variable of the container should be used to specify the max. size, e.g.:

> Kestrel__Limits__MaxRequestBodySize: 52428800

- if you have source code installation, then the config file you created should be moved into the `config` folder of transfer service. Please note that if you also use IIS, then IIS may also have limitations on the maximum file size.

More information on how to make this configuration in Kestrel (on the example of the NSI web service) can be found [here](https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored/-/blob/master/doc/CONFIGURATION.md#maximum-size-of-the-submited-sdmx-messages). For other web server technologies, please consult their specific documentation.

---

### Logbook submission time boundaries
> Released in [December 5, 2022 Release .Stat Suite JS spin](/dotstatsuite-documentation/changelog/#december-5-2022)

Define the boundaries of the **submission time logbook filter**. Rules are:
- configuration applies to the organisation;
- valid values for start and end param. are "now" or any [ISO date string](https://en.wikipedia.org/wiki/ISO_8601);
- by default it is set to `"start": "2019-01-01"` and `"end": "now"`;
- if settings are not set, or invalid, then default boundaries are [30 days - now].

* in `dotstatsuite-config-data/<env>/configs/<organisation>/data-lifecycle-manager/settings.json`

```json
 "logs": {
    "transfer": {
      "timeExtents": {
        "start": "2019-01-01",
        "end": "now"
      }
    }
  }
```

---

### List of the standard roles for user permissions
> Introduced in [December 5, 2022 Release .Stat Suite JS spin](/dotstatsuite-documentation/changelog/#december-5-2022)

Define, per organisation, the **Standard roles** set for the 'DLM --> Manage permissions --> Add/View/Edit' form, based on any combination of the granular permissons as defined in the Authorisation-Management Service.  
By default, the below set of combinations is pre-defined as standard roles.

References:
- [Authorisation-Management API features and granular permissions](/dotstatsuite-documentation/using-api/permission-management)
- [Functional specifications of the DLM GUI](/dotstatsuite-documentation/using-dlm/manage-permissions)

![DLM config basic permissions](/dotstatsuite-documentation/images/dlm-config-basic-permissions.png)

* in `dotstatsuite-config-data/<env>/configs/<organisation>/data-lifecycle-manager/settings.json`

```json
  "sdmx": {
    "permissionGroups": [
      {
        "id": 3,
        "permissions": [1, 2]
      },
      {
        "id": 145,
        "permissions": [1, 16, 128]
      },
      {
        "id": 657,
        "permissions": [1, 16, 128, 512]
      },
      {
        "id": 3363,
        "permissions": [1, 2, 32, 256, 1024, 2048]
      },
      {
        "id": 2051,
        "permissions": [1, 2, 2048]
      },
      {
        "id": 4095,
        "permissions": [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048]
      }
    ]
  }
```

The `"permissionGroup"` lists the standard roles using per role a unique `"id"`, which represents the **sum** of the IDs of the underlying granular permissons as defined in the Authorisation-Management service, as well as the list of those IDs.

Each role ID also requires the definition of a localised label in an "override" `i18n` folder under `dotstatsuite-config-data/<env>/configs/<organisation>/data-lifecycle-manager/` with each language's translation file. For example, here are the English labels to add corresponding to the above set of roles: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/blob/develop/configs/default/data-lifecycle-manager/i18n/en.json.

---

### Override the default Authorisation-Management service URL
>Released in [December 5, 2022 Release .Stat Suite JS spin](/dotstatsuite-documentation/changelog/#december-5-2022)

Define an Authorisation-Management service URL at the DLM scope level that will override the one defined as an env. variable during the deployment. This override is made especially to allow for a specific Authorisation-Management service URL per DLM scope when a DLM instance has several scopes.

* in `dotstatsuite-config-data/<env>/configs/tenants.json` file under a DLM `scope`

```json
  "dlm2": {
    "type": "dlm",
    "label": "dlm2",
    "oidc": {
      "authority": "https://...",
      "client_id": "app"
    },
    "authzServerUrl": "https://authz-env.org/1.1",
```
