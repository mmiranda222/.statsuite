---
title: "Configuring and Customising"
subtitle: 
comments: false
weight: 70

---

### Overview of the different configuration files

|**TOPOLOGY**|  |  |
|---|---|---|
| |Datasources definition|[tenants.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/blob/master/configs/tenants.json)|
| |Tenants definition|[tenants.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/blob/master/configs/tenants.json)|
| TRANSFER Service| | | 
| |Connection string+Parameters|[dataspace.pivate.json](hhttps://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/blob/master/DotStatServices.Transfer/config/dataspaces.private.json.sample)|
| |Authorisation config|[auth.private.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/blob/master/DotStatServices.Transfer/config/auth.private.json.sample)|
| |Log files definition|[log4net.config](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/blob/master/DotStatServices.Transfer/config/log4net.config)|
| |Structural file size|[kerstekSettings.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/blob/master/config/kerstelSettings.json)
| AUTHORISATION Service|| |
| |Database connection string|[settings.private.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/-/blob/master/DotStatServices.AuthorizationManagement/config/settings.private.json.sample)|
| |Authorisation config|[auth.private.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/-/blob/master/DotStatServices.AuthorizationManagement/config/auth.private.json.sample)|
| |Log files definition|[log4net.config](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/-/blob/master/DotStatServices.AuthorizationManagement/config/log4net.config)|
| SDMX Service (SDMX-RI NSI web service © Eurostat)|| |
| |Log files definition|[log4net.config](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/blob/master/config/log4net.config)|

---

|**BRANDING**|  |  |
|---|---|---|
| DATA EXPLORER|Setting paramaters|[settings.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/blob/master/data/prod/configs/oecd/data-explorer/settings.json)|
| DATA VIEWER|Setting paramaters|[settings.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/blob/master/data/prod/configs/oecd/data-viewer/settings.json)|
| DATA LIFECYCLE MANAGER|Setting paramaters|[settings.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/blob/master/data/prod/configs/siscc/data-lifecycle-manager/settings.json)|

---

|**LOCALISATION**|  |  |
|---|---|---|
| DATA EXPLORER & DATA VIEWER & DATA LIFECYCLE MANAGER|messages (one file per language)|[i18n/en.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/blob/master/i18n/en.json)|
| .NET Services|Common configuration|[localization.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-config/-/blob/master/DotStat.Config/config/localization.json)|

---

|**FEATURES**|  |  |
|---|---|---|
| DATA EXPLORER | Data explorer settings|[settings.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/blob/master/configs/default/data-explorer/settings.json)|
| DATA VIEWER | Data viewer settings|[settings.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/blob/master/configs/default/data-viewer/settings.json)|
| DATA LIFECYCLE MANAGER |DLM settings|[settings.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/blob/master/configs/default/data-lifecycle-manager/settings.json)|
