---
title: ".Stat DLM configuration"
subtitle: 
comments: false
weight: 79
keywords: [
  'Data space names', '#data-space-names',
  'Data space colors', '#data-space-colors',
  'Data space InsertNewItems parameter', '#data-space-insertnewitems-parameter',
  'Use data space as internal space or external space', '#use-data-space-as-internal-space-or-external-space',
  'Auto-authenticate to external source', '#auto-authenticate-to-external-source',
  'Use native NSI WS authentication for external source', '#use-native-nsi-ws-authentication-for-external-source',
  'Define data preview per space', '#define-data-preview-per-space',
  'List of SDMX artefact types', '#list-of-sdmx-artefact-types',
  'Upload size limit', '#upload-size-limit',
  'Logbook submission time boundaries', '#logbook-submission-time-boundaries',
]

---

#### Table of Content
- [Data space names](#data-space-names)
- [Data space colors](#data-space-colors)
- [Data space InsertNewItems parameter](#data-space-insertnewitems-parameter)
- [Use data space as internal space or external space](#use-data-space-as-internal-space-or-external-space)
- [Auto-authenticate to external source](#auto-authenticate-to-external-source)
- [Use native NSI WS authentication for external source](#use-native-nsi-ws-authentication-for-external-source)
- [Define data preview per space](#define-data-preview-per-space)
- [List of SDMX artefact types](#list-of-sdmx-artefact-types)
- [Upload size limit](#upload-size-limit)
- [Logbook submission time boundaries](#logbook-submission-time-boundaries)

For the tenant and data space definitions please see [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/tenant-model).

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

### Use data space as internal space or external space
>Changed in [December 14, 2021 Release .Stat Suite JS 11.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#december-14-2021)

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
>Released in [August 3, 2022 Release .Stat Suite JS quark](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#august-3-2022)  

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
>Introduced in [December 14, 2021 Release .Stat Suite JS 11.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#december-14-2021)

In case an external data source is accessible through an SDMX web service based on Eurostat's SDMX-RI "NSI" component (so called NSI web service), with the **`hasExternalAuth`** parameter the DLM can be instructed to authenticate against that web service using the native NSI authentication mechanism (implemented by Eurostat) based on HTTP basic access authentication (BA).

The user will have to enter the required credentials through a specific dialog box, as described [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/log-in-dlm/#connect-to-external-sources-using-the-native-nsi-authentication).

For more information on how to set the **`hasExternalAuth`** parameter, please see [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/tenant-model/#use-native-nsi-ws-authentication-for-external-source)

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
Define the file size limitation when uploading data or strutures files **applied by the DLM user interface** as follow:    
Provided in number of bites, the upload file size limit is usually set to 30MB by default (like in the example below).  

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-lifecycle-manager/settings.json`

```json
"uploadSizeLimit": 30000000
```

This configuration parameter only concerns the JavaScript front-end part of the DLM application. 

Specific configurations are also necessary also for the underlying .Stat CORE services (transfer and NSI). The hosting web server(s) (e.g. IIS, Kestrel, ..) need(s) to be configured to accept http requests with bodies of the required size. All web servers have their own defaults, e.g. the .Net Core builtin web server, called Kestrel, has a default maximum request body size of 30,000,000 bytes, which is approximately 28.6 MB.

More information on how to make this configuration in Kestrel (on the example of the NSI web service) can be found [here](https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored/-/blob/master/doc/CONFIGURATION.md#maximum-size-of-the-submited-sdmx-messages). For other web server technologies, please consult their specific documentation.

### Logbook submission time boundaries
> Released in [December 5, 2022 Release .Stat Suite JS spin](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#december-5-2022)

Define the boundaries of the **submission time logbook filter**. Rules are:
- configuration applies to the tenant;
- valid values for start and end param. are "now" or any [ISO date string](https://en.wikipedia.org/wiki/ISO_8601);
- by default it is set to `"start": "2019-01-01"` and `"end": "now"`;
- if settings are not set, or invalid, then default boundaries are [30 days - now].

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-lifecycle-manager/settings.json`

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
