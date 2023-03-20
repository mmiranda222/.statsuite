# devops dashboard

> quick access: [IPs](#ips) | [services](#services) | [cross-services](#cross-services) | [internal-services](#internal-services) | [special-services](#special-services) | [packages](#packages) | [snapshots](#snapshots) | [GCP logs](#gcp-logs)

## IPs

|cluster|scope|namespace|IP|
|-|-|-|-|
|oecd-core|BE|qa|35.244.176.154|
|oecd-core|BE|staging|34.102.193.227|
|oecd|FE|qa|35.186.222.13|
|oecd|FE|staging|35.244.225.85|

## services

<table>
<thead>
<tr><th>name/repo</th><th>env/branch</th><th>status</th><th>coverage</th><th>url(s)</th><th>endpoint(s)</th><th>note(s)</th></tr>
</thead>
<body>
<tr>
<td rowspan="6">[nsiws](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws)</td>
<td rowspan="2">qa/develop</td>
<td rowspan="2">![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/badges/develop/pipeline.svg?style=flat-square)</td>
<td rowspan="2">![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/badges/develop/coverage.svg?style=flat-square)</td>
<td>https://nsi-qa-stable.siscc.org</td>
<td>:ambulance: [health](https://nsi-qa-stable.siscc.org/health) - :clipboard: [swagger](https://nsi-qa-stable.siscc.org/swagger)</td>
<td>-</td>
<tr>
<td>https://nsi-qa-reset.siscc.org</td>
<td>:ambulance: [health](https://nsi-qa-reset.siscc.org/health) - :clipboard: [swagger](https://nsi-qa-reset.siscc.org/swagger)</td>
<td>-</td>
</tr>
<tr>
<td rowspan="4">staging/master</td>
<td rowspan="4">![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/badges/master/pipeline.svg?style=flat-square)</td>
<td rowspan="4">![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/badges/master/coverage.svg?style=flat-square)</td>
<td>https://nsi-demo-oecd-design.siscc.org</td>
<td>:ambulance: [health](https://nsi-demo-oecd-design.siscc.org/health) - :clipboard: [swagger](https://nsi-demo-oecd-design.siscc.org/swagger)</td>
<td>-</td>
</tr>
<tr>
<td>https://nsi-demo-oecd-staging.siscc.org</td>
<td>:ambulance: [health](https://nsi-demo-oecd-staging.siscc.org/health) - :clipboard: [swagger](https://nsi-demo-oecd-staging.siscc.org/swagger)</td>
<td>-</td>
</tr>
<tr>
<td>https://nsi-demo-stable.siscc.org</td>
<td>:ambulance: [health](https://nsi-demo-stable.siscc.org/health) - :clipboard: [swagger](https://nsi-demo-stable.siscc.org/swagger)</td>
<td>-</td>
</tr>
<tr>
<td>https://nsi-demo-reset.siscc.org</td>
<td>:ambulance: [health](https://nsi-demo-reset.siscc.org/health) - :clipboard: [swagger](https://nsi-demo-reset.siscc.org/swagger)</td>
<td>-</td>
</tr>
<tr><td colspan="7"></td></tr>
<tr>
<td rowspan="2">[transfer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer)</td>
<td>qa/develop</td>
<td>![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/badges/develop/pipeline.svg?style=flat-square)</td>
<td>![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/badges/develop/coverage.svg?style=flat-square)</td>
<td>https://transfer-qa.siscc.org/health</td>
<td>:ambulance: [health](https://transfer-qa.siscc.org/health) - :clipboard: [swagger](https://transfer-qa.siscc.org/swagger)</td>
<td>-</td>
</tr>
<tr>
<td>staging/master</td>
<td>![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/badges/master/pipeline.svg?style=flat-square)</td>
<td>![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/badges/master/coverage.svg?style=flat-square)</td>
<td>https://transfer-demo.siscc.org/health</td>
<td>:ambulance: [health](https://transfer-demo.siscc.org/health) - :clipboard: [swagger](https://transfer-demo.siscc.org/swagger)</td>
<td>-</td>
</tr>
<tr><td colspan="7"></td></tr>
<tr>
<td rowspan="2">[authz](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management)</td>
<td>qa/develop</td>
<td>![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/badges/develop/pipeline.svg?style=flat-square)</td>
<td>![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/badges/develop/coverage.svg?style=flat-square)</td>
<td>https://authz-qa.siscc.org/health</td>
<td>:ambulance: [health](https://authz-qa.siscc.org/health) - :clipboard: [swagger](https://authz-qa.siscc.org/swagger)</td>
<td>-</td>
</tr>
<tr>
<td>staging/master</td>
<td>![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/badges/master/pipeline.svg?style=flat-square)</td>
<td>![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/badges/master/coverage.svg?style=flat-square)</td>
<td>https://authz-demo.siscc.org/health</td>
<td>:ambulance: [health](https://authz-demo.siscc.org/health) - :clipboard: [swagger](https://authz-demo.siscc.org/swagger)</td>
<td>-</td>
</tr>
<tr><td colspan="7"></td></tr>
<tr>
<td rowspan="2">[sdmx-faceted-search](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search)</td>
<td>qa/develop</td>
<td>![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/badges/develop/pipeline.svg?style=flat-square)</td>
<td>![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/badges/develop/coverage.svg?style=flat-square)</td>
<td>https://sfs-qa.siscc.org/healthcheck</td>
<td>:ambulance: [health](https://sfs-qa.siscc.org/healthcheck)</td>
<td>-</td>
</tr>
<tr>
<td>staging/master</td>
<td>![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/badges/master/pipeline.svg?style=flat-square)</td>
<td>![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/badges/master/coverage.svg?style=flat-square)</td>
<td>https://sfs-demo.siscc.org/healthcheck</td>
<td>:ambulance: [health](https://sfs-demo.siscc.org/healthcheck)</td>
<td>-</td>
</tr>
<tr><td colspan="7"></td></tr>
<tr>
<td rowspan="2">[share](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share)</td>
<td>qa/develop</td>
<td>![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/badges/develop/pipeline.svg?style=flat-square)</td>
<td>![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/badges/develop/coverage.svg?style=flat-square)</td>
<td>https://share-qa.siscc.org/healthcheck</td>
<td>:ambulance: [health](https://share-qa.siscc.org/healthcheck)</td>
<td>-</td>
</tr>
<tr>
<td>staging/master</td>
<td>![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/badges/master/pipeline.svg?style=flat-square)</td>
<td>![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/badges/master/coverage.svg?style=flat-square)</td>
<td>https://share-demo.siscc.org/healthcheck</td>
<td>:ambulance: [health](https://share-demo.siscc.org/healthcheck)</td>
<td>-</td>
</tr>
<tr>
<tr><td colspan="7"></td></tr>
<tr>
<td rowspan="10">[data-explorer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer)</td>
<td>qa/develop</td>
<td>![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/badges/develop/pipeline.svg?style=flat-square)</td>
<td>![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/badges/develop/coverage.svg?style=flat-square)</td>
<td>https://de-qa.siscc.org</td>
<td>:globe_with_meridians: [website](https://de-qa.siscc.org) - :ambulance: [health](https://de-qa.siscc.org/api/healthcheck)</td>
<td>-</td>
</tr>
<tr>
<td rowspan="9">staging/master</td>
<td rowspan="9">![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/badges/master/pipeline.svg?style=flat-square)</td>
<td rowspan="9">![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/badges/master/coverage.svg?style=flat-square)</td>
<td>https://de-demo.siscc.org</td>
<td>:globe_with_meridians: [website](https://de-demo.siscc.org) - :ambulance: [health](https://de-demo.siscc.org/api/healthcheck)</td>
<td>-</td>
</tr>
<tr>
<td>https://de-demo-oecd.siscc.org</td>
<td>:globe_with_meridians: [website](https://de-demo-oecd.siscc.org) - :ambulance: [health](https://de-demo-oecd.siscc.org/api/healthcheck)</td>
<td>-</td>
</tr>
<tr>
<td>https://de-demo-oecd-eco.siscc.org</td>
<td>:globe_with_meridians: [website](https://de-demo-oecd-eco.siscc.org) - :ambulance: [health](https://de-demo-oecd-eco.siscc.org/api/healthcheck)</td>
<td>-</td>
</tr>
<tr>
<td>https://de-demo-oecd-daf-dti.siscc.org</td>
<td>:globe_with_meridians: [website](https://de-demo-oecd-daf-dti.siscc.org/) - :ambulance: [health](https://de-demo-oecd-daf-dti.siscc.org/api/healthcheck)</td>
<td>-</td>
</tr>
<tr>
<td>https://de-demo-abs.siscc.org</td>
<td>:globe_with_meridians: [website](https://de-demo-abs.siscc.org) - :ambulance: [health](https://de-demo-abs.siscc.org/api/healthcheck)</td>
<td>-</td>
</tr>
<tr>
<td>https://de-demo-ins.siscc.org</td>
<td>:globe_with_meridians: [website](https://de-demo-ins.siscc.org) - :ambulance: [health](https://de-demo-ins.siscc.org/api/healthcheck)</td>
<td>-</td>
</tr>
<tr>
<td>https://de-demo-statec.siscc.org</td>
<td>:globe_with_meridians: [website](https://de-demo-statec.siscc.org) - :ambulance: [health](https://de-demo-statec.siscc.org/api/healthcheck)</td>
<td>-</td>
</tr>
<tr>
<td>https://de-demo-statsnz.siscc.org</td>
<td>:globe_with_meridians: [website](https://de-demo-statsnz.siscc.org) - :ambulance: [health](https://de-demo-statsnz.siscc.org/api/healthcheck)</td>
<td>-</td>
</tr>
<tr>
<td>https://de-demo-bfs.siscc.org</td>
<td>:globe_with_meridians: [website](https://de-demo-bfs.siscc.org) - :ambulance: [health](https://de-demo-bfs.siscc.org/api/healthcheck)</td>
<td>-</td>
</tr>
<tr><td colspan="7"></td></tr>
<tr>
<td rowspan="2">[data-viewer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer)</td>
<td>qa/develop</td>
<td>![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/badges/develop/pipeline.svg?style=flat-square)</td>
<td>![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/badges/develop/coverage.svg?style=flat-square)</td>
<td>https://dv-qa.siscc.org</td>
<td>:globe_with_meridians: [website](https://dv-qa.siscc.org) - :ambulance: [health](https://dv-qa.siscc.org/api/healthcheck)</td>
<td>-</td>
</tr>
<tr>
<td>staging/master</td>
<td>![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/badges/master/pipeline.svg?style=flat-square)</td>
<td>![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/badges/master/coverage.svg?style=flat-square)</td>
<td>https://dv-demo.siscc.org</td>
<td>:globe_with_meridians: [website](https://dv-demo.siscc.org) - :ambulance: [health](https://dv-demo.siscc.org/api/healthcheck)</td>
<td>-</td>
</tr>
<tr><td colspan="7"></td></tr>
<tr>
<td rowspan="5">[data-lifecycle-manager](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager)</td>
<td rowspan="2">qa/develop</td>
<td rowspan="2">![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/badges/develop/pipeline.svg?style=flat-square)</td>
<td rowspan="2">![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/badges/develop/coverage.svg?style=flat-square)</td>
<td>https://dlm-qa.siscc.org</td>
<td>:globe_with_meridians: [website](https://dlm-qa.siscc.org) - :ambulance: [health](https://dlm-qa.siscc.org/api/healthcheck)</td>
<td>-</td>
</tr>
<tr>
<td>https://dlm2-qa.siscc.org</td>
<td>:globe_with_meridians: [website](https://dlm2-qa.siscc.org) - :ambulance: [health](https://dlm2-qa.siscc.org/api/healthcheck)</td>
<td>-</td>
</tr>
<tr>
<td rowspan="3">staging/master</td>
<td rowspan="3">![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/badges/master/pipeline.svg?style=flat-square)</td>
<td rowspan="3">![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/badges/master/coverage.svg?style=flat-square)</td>
<td>https://dlm-demo.siscc.org</td>
<td>:globe_with_meridians: [website](https://dlm-demo.siscc.org) - :ambulance: [health](https://dlm-demo.siscc.org/api/healthcheck)</td>
<td>-</td>
</tr>
</tr>
<tr>
<td>https://dlm-demo-oecd.siscc.org</td>
<td>:globe_with_meridians: [website](https://dlm-demo-oecd.siscc.org) - :ambulance: [health](https://dlm-demo-oecd.siscc.org/api/healthcheck)</td>
<td>-</td>
</tr>
<tr>
<td>https://dlm-demo-oecd-eco.siscc.org</td>
<td>:globe_with_meridians: [website](https://dlm-demo-oecd-eco.siscc.org) - :ambulance: [health](https://dlm-demo-oecd-eco.siscc.org/api/healthcheck)</td>
<td>-</td>
</tr>
</body>
</table>

## cross services

<table>
<thead>
<tr><th>name/repo</th><th>branch</th><th>status</th><th>url(s)</th><th>endpoint(s)</th><th>note(s)</th></tr>
</thead>
<body>
<tr>
<td>[keycloak](https://gitlab.com/sis-cc/.stat-suite/keycloak)</td>
<td>develop</td>
<td>![status](https://gitlab.com/sis-cc/.stat-suite/keycloak/badges/develop/pipeline.svg?style=flat-square)</td>
<td>https://keycloak.siscc.org</td>
<td>:cop: [admin UI](https://keycloak.siscc.org)</td>
<td>v7.0.0</td>
</tr>
</body>
</table>

## internal services

<table>
<thead>
<tr><th>name/repo</th><th>env/branch</th><th>status</th><th>coverage</th></tr>
</thead>
<body>
<tr>
<td rowspan="2">[proxy](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy)</td>
<td>qa/develop</td>
<td>![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy/badges/develop/pipeline.svg?style=flat-square)</td>
<td>![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy/badges/develop/coverage.svg?style=flat-square)</td>
</tr>
<tr>
<td>staging/master</td>
<td>![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy/badges/master/pipeline.svg?style=flat-square)</td>
<td>![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy/badges/master/coverage.svg?style=flat-square)</td>
</tr>
<tr><td colspan="4"></td></tr>
<tr>
<td rowspan="2">[config](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config)</td>
<td>qa/develop</td>
<td>![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/badges/develop/pipeline.svg?style=flat-square)</td>
<td>![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/badges/develop/coverage.svg?style=flat-square)</td>
</tr>
<tr>
<td>staging/master</td>
<td>![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/badges/master/pipeline.svg?style=flat-square)</td>
<td>![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/badges/master/coverage.svg?style=flat-square)</td>
</tr>
</body>
</table>

## special services

MSSQL access for reading (debug) purpose:
- qa (dynamic)
- staging (dynamic)

ECO oecd internal network nsiws:
- https://em-sbx-dev-7.main.oecd.org - :ambulance: [health](https://em-sbx-dev-7.main.oecd.org/health)
- https://em-sbx-dev-7.main.oecd.org:81 - :ambulance: [health](https://em-sbx-dev-7.main.oecd.org:81/health)

## packages

|name|version|status|coverage|demo|note(s)|
|-|-|-|-|-|-|
|[sdmxjs](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmxjs)|![npm package](https://img.shields.io/npm/v/@sis-cc/dotstatsuite-sdmxjs?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmxjs/badges/master/pipeline.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmxjs/badges/master/coverage.svg?style=flat-square)|:books: https://sdmxjs-qa.siscc.org|:muscle: @RedPDRoncoli|
|[visions](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions)|![npm package](https://img.shields.io/npm/v/@sis-cc/dotstatsuite-visions?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions/badges/master/pipeline.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions/badges/master/coverage.svg?style=flat-square)|:lipstick: https://visions-qa.siscc.org|:sparkles: @mike.velluet|
|[components](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-components)|![npm package](https://img.shields.io/npm/v/@sis-cc/dotstatsuite-components?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-components/badges/master/pipeline.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-components/badges/master/coverage.svg?style=flat-square)|-|tests are scattered inside|
|[ui-footer (legacy)](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-footer)|![npm package](https://img.shields.io/npm/v/@sis-cc/dotstatsuite-ui-footer?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-footer/badges/master/pipeline.svg?style=flat-square)|-|-|has been included in visions|
|[ui-header (legacy)](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-header)|![npm package](https://img.shields.io/npm/v/@sis-cc/dotstatsuite-ui-header?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-header/badges/master/pipeline.svg?style=flat-square)|-|-|has been included in visions|
|[ui-components (legacy)](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-components)|![npm package](https://img.shields.io/npm/v/@sis-cc/dotstatsuite-ui-components?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-components/badges/master/pipeline.svg?style=flat-square)|-|-|has been included in visions|
|[d3-charts](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-d3-charts)|![npm package](https://img.shields.io/npm/v/@sis-cc/dotstatsuite-d3-charts?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-d3-charts/badges/master/pipeline.svg?style=flat-square)|-|-|complex to test|
|-|-|-|-|-|-|
|[core-data-access](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access)|![nuget package](https://img.shields.io/nuget/v/DotStat.DataAccess.NuGet.svg?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/badges/master/pipeline.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/badges/develop/coverage.svg?style=flat-square)|-|-|
|[core-common](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common)|![nuget package](https://img.shields.io/nuget/v/DotStat.Common.svg?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/badges/master/pipeline.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/badges/develop/coverage.svg?style=flat-square)|-|-|
|[core-config](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-config)|-|-|Validation of localization values to be validated in core-common|

## snapshots

[technical documentation](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-core-rp#backup-restore) from dotstatsuite-kube-core-rp repository

|name|target|namespace|schedule frequency|autodelete after|
|---|---|---|---|---|
schedule-mssql-qa-0|mssql|qa|Every day between 3:00 AM and 4:00 AM|14 days|
schedule-mssql-staging-0|mssql|staging|Every day between 3:00 AM and 4:00 AM|14 days|
schedule-redis-qa-0|redis|qa|Every day between 3:00 AM and 4:00 AM|14 days|
schedule-redis-staging-0|redis|staging|Every day between 3:00 AM and 4:00 AM|14 days|
schedule-postgresql-0|postgresql|qa (also used for staging)|Every day between 3:00 AM and 4:00 AM|14 days|

## GCP logs

https://console.cloud.google.com/logs > siscc project

|namespace|service (container name)|logname|
|---|---|---|
|qa|nsi-reset|QA_NSI_RESET|
|qa|nsi/dbup-reset-structure|QA_DBUP_RESET_STRUCTURE|
|qa|nsi-stable|QA_NSI_STABLE|
|qa|nsi/dbup-stable-structure|QA_DBUP_STABLE_STRUCTURE|
|qa|transfer|QA_TRANSFER|
|qa|transfer/dbup-stable-data|QA_DBUP_STABLE_DATA|
|qa|transfer/dbup-reset-data|QA_DBUP_RESET_DATA|
|qa|transfer/dotstatsuite-devops-db-config|-|
|qa|authz|QA_AUTHZ|
|qa|authz/dbup-common|QA_DBUP_COMMON|
|staging|nsi-reset-siscc|STAGING_NSI_RESET_SISCC|
|staging|nsi/dbup-reset-structure|STAGING_DBUP_RESET_STRUCTURE_SISCC|
|staging|nsi-stable-siscc|STAGING_NSI_STABLE_SISCC|
|staging|nsi/dbup-stable-structure|STAGING_DBUP_STABLE_STRUCTURE_SISCC|
|staging|nsi-staging-oecd|STAGING_NSI_STAGING_OECD|
|staging|nsi/dbup-staging-structure|STAGING_DBUP_STAGING_STRUCTURE_OECD|
|staging|nsi-design-oecd|STAGING_NSI_DESIGN_OECD|
|staging|nsi/dbup-design-structure|STAGING_DBUP_DESIGN_STRUCTURE_OECD|
|staging|transfer|STAGING_TRANSFER|
|staging|transfer/dbup-nsi-design-oecd-data|STAGING_DBUP_DESIGN_DATA_OECD|
|staging|transfer/dbup-nsi-staging-oecd-data|STAGING_DBUP_STAGING_DATA_OECD|
|staging|transfer/dbup-nsi-stable-siscc-data|STAGING_DBUP_STABLE_DATA_SISCC|
|staging|transfer/dbup-nsi-reset-siscc-data|STAGING_DBUP_RESET_DATA_SISCC|
|staging|transfer/dotstatsuite-devops-db-config|-|
|staging|authz|STAGING_AUTHZ|
|staging|authz/dbup-common|STAGING_DBUP_COMMON|
