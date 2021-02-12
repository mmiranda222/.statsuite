# devops dashboard

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
<td>:ambulance: [health](https://nsi-qa-stable.siscc.org/health)</td>
<td>-</td>
<tr>
<td>https://nsi-qa-reset.siscc.org</td>
<td>:ambulance: [health](https://nsi-qa-reset.siscc.org/health)</td>
<td>-</td>
</tr>
<tr>
<td rowspan="4">staging/master</td>
<td rowspan="4">![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/badges/master/pipeline.svg?style=flat-square)</td>
<td rowspan="4">![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/badges/master/coverage.svg?style=flat-square)</td>
<td>https://nsi-demo-oecd-design.siscc.org</td>
<td>:ambulance: [health](https://nsi-demo-oecd-design.siscc.org/health)</td>
<td>-</td>
</tr>
<tr>
<td>https://nsi-demo-oecd-staging.siscc.org</td>
<td>:ambulance: [health](https://nsi-demo-oecd-staging.siscc.org/health)</td>
<td>-</td>
</tr>
<tr>
<td>https://nsi-demo-stable.siscc.org</td>
<td>:ambulance: [health](https://nsi-demo-stable.siscc.org/health)</td>
<td>-</td>
</tr>
<tr>
<td>https://nsi-demo-reset.siscc.org</td>
<td>:ambulance: [health](https://nsi-demo-reset.siscc.org/health)</td>
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
<td rowspan="11">[data-explorer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer)</td>
<td rowspan="2">qa/develop</td>
<td rowspan="2">![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/badges/develop/pipeline.svg?style=flat-square)</td>
<td rowspan="2">![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/badges/develop/coverage.svg?style=flat-square)</td>
<td rowspan="2">de-qa-oecd</td>
<td>[website](http://de-qa.siscc.org/)</td>
<td>-</td>
</tr>
<tr>
<td>[health](http://de-qa.siscc.org/api/healthcheck)</td>
<td>-</td>
</tr>
<tr>
<td rowspan="9">staging/master</td>
<td rowspan="9">![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/badges/master/pipeline.svg?style=flat-square)</td>
<td rowspan="9">![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/badges/master/coverage.svg?style=flat-square)</td>
<td rowspan="2">de-staging-oecd</td>
<td>[website](http://de-staging-oecd.redpelicans.com)</td>
<td>-</td>
</tr>
<tr>
<td>[health](http://de-staging-oecd.redpelicans.com/api/healthcheck)</td>
<td>-</td>
</tr>
<tr>
<td>de-staging-siscc</td>
<td>[website](http://de-demo.siscc.org)</td>
<td>-</td>
</tr>
<tr>
<td>de-staging-abs</td>
<td>[website](http://de-staging-abs.redpelicans.com)</td>
<td>-</td>
</tr>
<tr>
<td>de-staging-astat</td>
<td>[website](http://de-staging-astat.redpelicans.com)</td>
<td>-</td>
</tr>
<tr>
<td>de-staging-statec</td>
<td>[website](http://de-staging-statec.redpelicans.com)</td>
<td>-</td>
</tr>
<tr>
<td>de-staging-statsnz</td>
<td>[website](http://de-staging-statsnz.redpelicans.com)</td>
<td>-</td>
</tr>
<tr>
<td>de-staging-ins</td>
<td>[website](http://de-staging-ins.redpelicans.com/)</td>
<td>-</td>
</tr>
<tr>
<td>de-staging-bfs</td>
<td>[website](http://de-staging-bfs.redpelicans.com/)</td>
<td>-</td>
</tr>
<tr>
<td rowspan="3">[data-viewer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer)</td>
<td>qa/develop</td>
<td>![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/badges/develop/pipeline.svg?style=flat-square)</td>
<td>![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/badges/develop/coverage.svg?style=flat-square)</td>
<td>dv-qa-oecd</td>
<td>[website](http://dv-qa.siscc.org)</td>
<td>-</td>
</tr>
<tr>
<td rowspan="2">staging/master</td>
<td rowspan="2">![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/badges/master/pipeline.svg?style=flat-square)</td>
<td rowspan="2">![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/badges/master/coverage.svg?style=flat-square)</td>
<td>dv-staging-oecd</td>
<td>[website](http://dv-demo.siscc.org)</td>
<td>-</td>
</tr>
<tr>
<td>dv-staging-siscc</td>
<td>[website](http://dv-staging-siscc.redpelicans.com)</td>
<td>-</td>
</tr>
<tr>
<td rowspan="7">[data-lifecycle-manager](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager)</td>
<td rowspan="4">qa/develop</td>
<td rowspan="4">![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/badges/develop/pipeline.svg?style=flat-square)</td>
<td rowspan="4">![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/badges/develop/coverage.svg?style=flat-square)</td>
<td rowspan="2">dlm-qa-oecd</td>
<td>[website](http://dlm-qa.siscc.org)</td>
<td>-</td>
</tr>
<tr>
<td>[health](http://dlm-qa.siscc.org/healthcheck)</td>
<td>-</td>
</tr>
<tr>
<td rowspan="2">dlm2-qa-oecd</td>
<td>[website](http://dlm2-qa.siscc.org)</td>
<td>-</td>
</tr>
<tr>
<td>[health](http://dlm2-qa.siscc.org/healthcheck)</td>
<td>-</td>
</tr>
<tr>
<td rowspan="3">staging/master</td>
<td rowspan="3">![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/badges/master/pipeline.svg?style=flat-square)</td>
<td rowspan="3">![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/badges/master/coverage.svg?style=flat-square)</td>
<td rowspan="2">dlm-staging-oecd</td>
<td>[website](http://dlm-staging-oecd.redpelicans.com)</td>
<td>-</td>
</tr>
<tr>
<td>[health](http://dlm-staging-oecd.redpelicans.com/healthcheck)</td>
<td>-</td>
</tr>
<tr>
<td>dlm-staging-siscc</td>
<td>[website](http://dlm-demo.siscc.org)</td>
<td>-</td>
</tr>

<td rowspan="2">[keycloak](https://gitlab.com/sis-cc/.stat-suite/keycloak)</td>
<td rowspan="2">develop</td>
<td rowspan="2">![status](https://gitlab.com/sis-cc/.stat-suite/keycloak/badges/develop/pipeline.svg?style=flat-square)</td>
<td rowspan="2">-</td>
<td>keycloak-oecd</td>
<td>[admin UI](http://keycloak-oecd.redpelicans.com)</td>
<td>v6.0.1</td>
</tr>
<tr>
<td>keycloak-staging-oecd</td>
<td>[admin UI](http://keycloak-oecd.redpelicans.com)</td>
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

## packages

|name|version|status|coverage|demo|note(s)|
|-|-|-|-|-|-|
|[sdmxjs](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmxjs)|![npm package](https://img.shields.io/npm/v/@sis-cc/dotstatsuite-sdmxjs?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmxjs/badges/master/pipeline.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmxjs/badges/master/coverage.svg?style=flat-square)|:books: https://sdmxjs-qa.siscc.org|:muscle: @RedPDRoncoli|
|[visions](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions)|![npm package](https://img.shields.io/npm/v/@sis-cc/dotstatsuite-visions?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions/badges/master/pipeline.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions/badges/master/coverage.svg?style=flat-square)|:lipstick: https://visions-qa.siscc.org|:sparkles: @mike.velluet|
|[components](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-components)|![npm package](https://img.shields.io/npm/v/@sis-cc/dotstatsuite-components?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-components/badges/master/pipeline.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-components/badges/master/coverage.svg?style=flat-square)|-|tests are scattered inside|
|[ui-footer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-footer)|![npm package](https://img.shields.io/npm/v/@sis-cc/dotstatsuite-ui-footer?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-footer/badges/master/pipeline.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-footer/badges/master/coverage.svg?style=flat-square)|-|will be included visions|
|[ui-header](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-header)|![npm package](https://img.shields.io/npm/v/@sis-cc/dotstatsuite-ui-header?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-header/badges/master/pipeline.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-header/badges/master/coverage.svg?style=flat-square)|-|will be included visions|
|[ui-components](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-components)|![npm package](https://img.shields.io/npm/v/@sis-cc/dotstatsuite-ui-components?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-components/badges/master/pipeline.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-components/badges/master/coverage.svg?style=flat-square)|-|will be merged with visions|
|[d3-charts](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-d3-charts)|![npm package](https://img.shields.io/npm/v/@sis-cc/dotstatsuite-d3-charts?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-d3-charts/badges/master/pipeline.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-d3-charts/badges/master/coverage.svg?style=flat-square)|-|complex to test|
