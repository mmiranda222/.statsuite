---
title: "Configuring and Customising"
subtitle: 
comments: false
weight: 70

---

includes:

* [.Stat Data Explorer configuration](/configurations/de-configuration)
* [.Stat Data Explorer customisation](/configurations/de-customisation)
* [.Stat Data Lifecycle Manager configuration](/configurations/dlm-configuration)
* [.Stat Authentication configuration](/configurations/authentication)
* [SolR Optimisation](/configurations/solr-optimisation)


**Overview of the different configuration files**

|**TOPOLOGY**|  |  |
|---|---|---|
| |Datasources definition|[datasources.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/blob/develop/data/dev/configs/datasources.json)|
| |Tenants definition|[tenants.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/blob/develop/data/prod/configs/tenants.json)|
| TRANSFER Service| | | 
| |Connection string+Parameters|[dataspace.pivate.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/blob/develop/DotStatServices.Transfer/config/dataspaces.private.json.sample)|
| |Authorisation config|[auth.private.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/blob/develop/DotStatServices.Transfer/config/auth.private.json.sample)|
| |Log files definition|[log4net.config](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/blob/develop/DotStatServices.Transfer/config/log4net.config)|
| |Structural file size|[kerstekSettings.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/blob/develop/config/kerstelSettings.json)
| AUTHORISATION Service|| |
| |Database connection string|[settings.private.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/-/blob/develop/DotStatServices.AuthorizationManagement/config/settings.private.json.sample)|
| |Authorisation config|[auth.private.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/-/blob/develop/DotStatServices.AuthorizationManagement/config/auth.private.json.sample)|
| |Log files definition|[log4net.config](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/-/blob/develop/DotStatServices.AuthorizationManagement/config/log4net.config)|
| SDMX Service (SDMX-RI NSI web service © Eurostat)|| |
| |Log files definition|[log4net.config](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/blob/develop/config/log4net.config)|
|**BRANDING**|  |  |
| DATA EXPLORER|Setting paramaters|[settings.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/blob/develop/data/dev/configs/oecd/data-explorer/settings.json)|
| DATA VIEWER|Setting paramaters|[settings.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/blob/master/data/prod/configs/oecd/data-viewer/settings.json)|
| DATA LIFECYCLE MANAGER|Setting paramaters|[settings.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/blob/develop/data/dev/configs/oecd/data-lifecycle-manager/settings.json)|
|**LOCALISATION**|  |  |
| DATA EXPLORER|DE messages (a file for each language)|[i18n/en.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/blob/develop/data/dev/configs/oecd/data-explorer/i18n/en.json)|
| DATA VIEWER|DE messages (a file for each language)|[i18n/en.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/tree/develop/data/dev/configs/oecd/data-viewer/i18n)|
| DATA LIFECYCLE MANAGER|DLM messages (a file for each language)|[i18n/en.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/blob/develop/data/dev/configs/oecd/data-lifecycle-manager/i18n/en.json)|
| .Net Services|Common configuration|[localization.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-config/-/blob/develop/DotStat.Config/config/localization.json)|
|**FEATURES**|  |  |
| DATA VIEWER|Data viewer settings|[settings.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/blob/develop/data/prod/configs/oecd/data-viewer/settings.json)|
| DATA LIFECYCLE MANAGER|DLM settings|[settings.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/blob/develop/data/prod/configs/oecd/data-lifecycle-manager/settings.json)|
