---
title: "Configuring and Customising"
subtitle: 
comments: false
weight: 70

---
<!-- This page (or a sub-page or sub-section of this page) of the documentation is referenced as an external resource in the .Stat Academy:
* https://academy.siscc.org/configuring-and-customising/
Any change affecting its URL must be communicated to the .Stat Academy content admin in advance. -->

### Overview of the different configuration files


---

**Folder architecture for .Stat JS components configuration files**

The below diagram shows how the configuration files of the .Stat JS components are structured:

```
└── configs
    ├── [organisationID]
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
    └── tenants.json                # General configuration for all .Stat JS components; at least 1 organisation(=tenant) is required
```

**Default configurations (or default overwrites) for .Stat JS components**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/tree/master/configs

---

**Folder architecture for .Stat JS components assets (images, style sheets)**

The below diagram shows how the asset files of the .Stat JS components are structured:

```
└── assets
    └── [organisationID]
        ├── data-explorer
        │   ├── images
        │   │   └── ????.???        # DE image files 
        │   ├── maps
        │   │   └── ????.json       # DE map files (for charting)
        │   └── styles
        │   │   └── styles.cc       # DE css styles
        ├── data-viewer
        │   ├── images
        │   │   └── ????.???        # Data Viewer image files 
        │   ├── maps
        │   │   └── ????.json       # Data Viewer map files (for charting)
        │   └── styles
        │   │   └── styles.cc       # Data Viewer css styles
        ├── data-lifecycle-manager
        │   ├── images
        │   │   └── ????.???        # DLM image files 
        │   └── styles
        │   │   └── styles.cc       # DLM css styles
        └── share
            └── ????.???            # Shared View Manager image files
```

**Default configurations for .Stat JS components**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/tree/master/assets

---

**Folder architecture for the default .Stat JS components internationalisation (translations) files**

The below diagram shows how the default internationalisation files of the .Stat JS components are structured:

```
└── i18n
    └── ??.json         # Internationalisation (translations) for all .Stat JS components - one file per locale with ??=locale code, e.g. "en"
```

**Default internationalisations (translations) for .Stat JS components**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/tree/master/i18n

---

|**TOPOLOGY configurations**|  |  |
|---|---|---|
| [Multi-tenant deployments of .Stat JS components](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/tenant-model)| | | 
| |Tenants definition|[tenants.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/blob/master/configs/tenants.json)|
| |Tenant's datasources definition|[tenants.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/blob/master/configs/tenants.json)|
| .Stat Core TRANSFER Service| | | 
| |Connection string + parameters|[dataspace.pivate.json](hhttps://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/blob/master/DotStatServices.Transfer/config/dataspaces.private.json.sample)|
| |Authorisation config|[auth.private.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/blob/master/DotStatServices.Transfer/config/auth.private.json.sample)|
| |Log files definition|[log4net.config](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/blob/master/DotStatServices.Transfer/config/log4net.config)|
| |Structural file size|[kerstekSettings.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/blob/master/config/kerstelSettings.json)
| .Stat Core AUTHORISATION Service|| |
| |Database connection string|[settings.private.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/-/blob/master/DotStatServices.AuthorizationManagement/config/settings.private.json.sample)|
| |Authorisation config|[auth.private.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/-/blob/master/DotStatServices.AuthorizationManagement/config/auth.private.json.sample)|
| |Log files definition|[log4net.config](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/-/blob/master/DotStatServices.AuthorizationManagement/config/log4net.config)|
| .Stat Core SDMX Service (SDMX-RI NSI web service © Eurostat)|| |
| |Log files definition|[log4net.config](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/blob/master/config/log4net.config)|

---

|**BRANDING configurations**|  |  |
|---|---|---|
| DATA EXPLORER|Data explorer settings|[default example settings.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/blob/master/configs/default/data-explorer/settings.json)|
| DATA VIEWER|Data viewer settings|[default example settings.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/blob/master/configs/default/data-viewer/settings.json)|
| DATA LIFECYCLE MANAGER|DLM settings|[default example settings.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/blob/master/configs/default/data-lifecycle-manager/settings.json)|

---

|**LOCALISATION configurations**|  |  |
|---|---|---|
| DATA EXPLORER & DATA VIEWER & DATA LIFECYCLE MANAGER|messages (one file per language)|[default i18n/en.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/blob/master/i18n/en.json)|
| .Stat Core Services|Common configuration|[default localization.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-config/-/blob/master/DotStat.Config/config/localization.json)|

---

|**.Stat JS component's FEATURE configurations**|  |  |
|---|---|---|
| DATA EXPLORER | Data explorer settings|[default example settings.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/blob/master/configs/default/data-explorer/settings.json)|
| DATA VIEWER | Data viewer settings|[default example settings.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/blob/master/configs/default/data-viewer/settings.json)|
| DATA LIFECYCLE MANAGER |DLM settings|[default example settings.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/blob/master/configs/default/data-lifecycle-manager/settings.json)|

---

Please see the related sub-topics for more information on specific configuration settings.