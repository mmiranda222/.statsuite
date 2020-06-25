# devops dashboard

## services

<table>
<thead>
<tr><th>name/repo</th><th>env/branch</th><th>status</th><th>coverage</th><th>subdomain(s)</th><th>endpoint(s)</th><th>note(s)</th></tr>
</thead>
<body>
<tr>
<td rowspan="6">[nsi](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin)</td>
<td rowspan="2">qa/develop</td>
<td rowspan="2">![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/badges/develop/pipeline.svg?style=flat-square)</td>
<td rowspan="2">![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/badges/develop/coverage.svg?style=flat-square)</td>
<td>nsi-stable-qa-oecd</td>
<td>[health](http://nsi-stable-qa-oecd.redpelicans.com/health)</td>
<td>-</td>
<tr>
<td>nsi-reset-qa-oecd</td>
<td>[health](http://nsi-reset-qa-oecd.redpelicans.com/health)</td>
<td>-</td>
</tr>
<tr>
<td rowspan="4">staging/master</td>
<td rowspan="4">![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/badges/master/pipeline.svg?style=flat-square)</td>
<td rowspan="4">![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/badges/master/coverage.svg?style=flat-square)</td>
<td>nsi-design-oecd</td>
<td>[health](http://nsi-design-oecd.redpelicans.com/health)</td>
<td>-</td>
</tr>
<tr>
<td>nsi-staging-oecd</td>
<td>[health](http://nsi-staging-oecd.redpelicans.com/health)</td>
<td>-</td>
</tr>
<tr>
<td>nsi-stable-siscc</td>
<td>[health](http://nsi-stable-siscc.redpelicans.com/health)</td>
<td>-</td>
</tr>
<tr>
<td>nsi-reset-siscc</td>
<td>[health](http://nsi-reset-siscc.redpelicans.com/health)</td>
<td>-</td>
</tr>
<tr>
<td rowspan="4">[transfer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer)</td>
<td rowspan="2">qa/develop</td>
<td rowspan="2">![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/badges/develop/pipeline.svg?style=flat-square)</td>
<td rowspan="2">![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/badges/develop/coverage.svg?style=flat-square)</td>
<td rowspan="2">transfer-qa-oecd</td>
<td>[health](http://transfer-qa-oecd.redpelicans.com/health)</td>
<td>-</td>
</tr>
<tr>
<td>[swagger](http://transfer-qa-oecd.redpelicans.com/swagger)</td>
<td>-</td>
</tr>
<tr>
<td rowspan="2">staging/master</td>
<td rowspan="2">![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/badges/master/pipeline.svg?style=flat-square)</td>
<td rowspan="2">![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/badges/master/coverage.svg?style=flat-square)</td>
<td rowspan="2">transfer-siscc</td>
<td>[health](http://transfer-siscc.redpelicans.com/health)</td>
<td>-</td>
</tr>
<tr>
<td>[swagger](http://transfer-siscc.redpelicans.com/swagger)</td>
<td>-</td>
</tr>
<tr>
<td rowspan="4">[authz](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management)</td>
<td rowspan="2">qa/develop</td>
<td rowspan="2">![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/badges/develop/pipeline.svg?style=flat-square)</td>
<td rowspan="2">![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/badges/develop/coverage.svg?style=flat-square)</td>
<td rowspan="2">authz-qa-oecd</td>
<td>[health](http://authz-qa-oecd.redpelicans.com/health)</td>
<td>-</td>
</tr>
<tr>
<td>[swagger](http://authz-qa-oecd.redpelicans.com/swagger)</td>
<td>-</td>
</tr>
<tr>
<td rowspan="2">staging/master</td>
<td rowspan="2">![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/badges/master/pipeline.svg?style=flat-square)</td>
<td rowspan="2">![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/badges/master/coverage.svg?style=flat-square)</td>
<td rowspan="2">authz-siscc</td>
<td>[health](http://authz-siscc.redpelicans.com/health)</td>
<td>-</td>
</tr>
<tr>
<td>[swagger](http://authz-siscc.redpelicans.com/swagger)</td>
<td>-</td>
</tr>
<tr>
<td rowspan="10">[data-explorer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer)</td>
<td rowspan="2">qa/develop</td>
<td rowspan="2">![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/badges/develop/pipeline.svg?style=flat-square)</td>
<td rowspan="2">![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/badges/develop/coverage.svg?style=flat-square)</td>
<td rowspan="2">de-qa-oecd</td>
<td>[website](http://de-qa-oecd.redpelicans.com)</td>
<td>-</td>
</tr>
<tr>
<td>[health](http://de-qa-oecd.redpelicans.com/api/healthcheck)</td>
<td>-</td>
</tr>
<tr>
<td rowspan="8">staging/master</td>
<td rowspan="8">![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/badges/master/pipeline.svg?style=flat-square)</td>
<td rowspan="8">![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/badges/master/coverage.svg?style=flat-square)</td>
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
<td>[website](http://de-staging-siscc.redpelicans.com)</td>
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
<td rowspan="3">[data-viewer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer)</td>
<td>qa/develop</td>
<td>![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/badges/develop/pipeline.svg?style=flat-square)</td>
<td>![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/badges/develop/coverage.svg?style=flat-square)</td>
<td>dv-qa-oecd</td>
<td>[website](http://dv-qa-oecd.redpelicans.com)</td>
<td>-</td>
</tr>
<tr>
<td rowspan="2">staging/master</td>
<td rowspan="2">![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/badges/master/pipeline.svg?style=flat-square)</td>
<td rowspan="2">![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/badges/master/coverage.svg?style=flat-square)</td>
<td>dv-staging-oecd</td>
<td>[website](http://dv-staging-oecd.redpelicans.com)</td>
<td>-</td>
</tr>
<tr>
<td>dv-staging-siscc</td>
<td>[website](http://dv-staging-siscc.redpelicans.com)</td>
<td>-</td>
</tr>
<tr>
<td rowspan="5">[data-lifecycle-manager](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager)</td>
<td rowspan="2">qa/develop</td>
<td rowspan="2">![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/badges/develop/pipeline.svg?style=flat-square)</td>
<td rowspan="2">![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/badges/develop/coverage.svg?style=flat-square)</td>
<td rowspan="2">dlm-qa-oecd</td>
<td>[website](http://dlm-qa-oecd.redpelicans.com)</td>
<td>-</td>
</tr>
<tr>
<td>[health](http://dlm-qa-oecd.redpelicans.com/healthcheck)</td>
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
<td>[website](http://dlm-staging-siscc.redpelicans.com)</td>
<td>-</td>
</tr>
<tr>
<td rowspan="2">[sdmx-faceted-search](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search)</td>
<td>qa/develop</td>
<td>![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/badges/develop/pipeline.svg?style=flat-square)</td>
<td>![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/badges/develop/coverage.svg?style=flat-square)</td>
<td>sfs-qa-oecd</td>
<td>[health](http://sfs-qa-oecd.redpelicans.com/healthcheck)</td>
<td>-</td>
</tr>
<tr>
<td>staging/master</td>
<td>![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/badges/master/pipeline.svg?style=flat-square)</td>
<td>![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/badges/master/coverage.svg?style=flat-square)</td>
<td>sfs-staging-oecd</td>
<td>[health](http://sfs-staging-oecd.redpelicans.com/healthcheck)</td>
<td>-</td>
</tr>
<tr>
<td rowspan="2">[share](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share)</td>
<td>qa/develop</td>
<td>![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/badges/develop/pipeline.svg?style=flat-square)</td>
<td>![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/badges/develop/coverage.svg?style=flat-square)</td>
<td>share-qa-oecd</td>
<td>[health](http://share-qa-oecd.redpelicans.com/healthcheck)</td>
<td>-</td>
</tr>
<tr>
<td>staging/master</td>
<td>![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/badges/master/pipeline.svg?style=flat-square)</td>
<td>![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/badges/master/coverage.svg?style=flat-square)</td>
<td>share-staging-oecd</td>
<td>[health](http://share-staging-oecd.redpelicans.com/healthcheck)</td>
<td>-</td>
</tr>
<tr>
<td rowspan="2">[config](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config)</td>
<td>qa/develop</td>
<td>![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/badges/develop/pipeline.svg?style=flat-square)</td>
<td>![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/badges/develop/coverage.svg?style=flat-square)</td>
<td>-</td>
<td>-</td>
<td>internal service</td>
</tr>
<tr>
<td>staging/master</td>
<td>![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/badges/master/pipeline.svg?style=flat-square)</td>
<td>![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/badges/master/coverage.svg?style=flat-square)</td>
<td>-</td>
<td>-</td>
<td>internal service</td>
</tr>
<tr>
<td rowspan="2">[proxy](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy)</td>
<td>qa/develop</td>
<td>![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy/badges/develop/pipeline.svg?style=flat-square)</td>
<td>![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy/badges/develop/coverage.svg?style=flat-square)</td>
<td>-</td>
<td>-</td>
<td>internal service</td>
</tr>
<tr>
<td>staging/master</td>
<td>![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy/badges/master/pipeline.svg?style=flat-square)</td>
<td>![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy/badges/master/coverage.svg?style=flat-square)</td>
<td>-</td>
<td>-</td>
<td>internal service</td>
</tr>

<tr>
<td rowspan="2">[keycloak](https://gitlab.com/sis-cc/.stat-suite/keycloak)</td>
<td>qa/develop</td>
<td>-</td>
<td>-</td>
<td>keycloak-oecd</td>
<td>[admin UI](http://keycloak-oecd.redpelicans.com)</td>
<td>shared between qa and staging</td>
</tr>
<tr>
<td>staging/master</td>
<td>-</td>
<td>-</td>
<td>-</td>
<td>-</td>
<td>not used</td>
</tr>
</body>
</table>

## packages

|name|version|status|coverage|demo|note(s)|
|-|-|-|-|-|-|
|[sdmxjs](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmxjs)|![npm package](https://img.shields.io/npm/v/@sis-cc/dotstatsuite-sdmxjs?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmxjs/badges/master/pipeline.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmxjs/badges/master/coverage.svg?style=flat-square)|[sdmxjs](http://sdmxjs-qa-oecd.redpelicans.com/)|:muscle: @RedPDRoncoli|
|[visions](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions)|![npm package](https://img.shields.io/npm/v/@sis-cc/dotstatsuite-visions?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions/badges/master/pipeline.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions/badges/master/coverage.svg?style=flat-square)|[visions](http://visions-qa-oecd.redpelicans.com/)|:sparkles: @mike.velluet|
|[ui-footer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-footer)|![npm package](https://img.shields.io/npm/v/@sis-cc/dotstatsuite-ui-footer?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-footer/badges/master/pipeline.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-footer/badges/master/coverage.svg?style=flat-square)|-|will be included visions|
|[ui-header](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-header)|![npm package](https://img.shields.io/npm/v/@sis-cc/dotstatsuite-ui-header?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-header/badges/master/pipeline.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-header/badges/master/coverage.svg?style=flat-square)|-|will be included visions|
|[components](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-components)|![npm package](https://img.shields.io/npm/v/@sis-cc/dotstatsuite-components?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-components/badges/master/pipeline.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-components/badges/master/coverage.svg?style=flat-square)|-|tests are scattered inside|
|[ui-components](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-components)|![npm package](https://img.shields.io/npm/v/@sis-cc/dotstatsuite-ui-components?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-components/badges/master/pipeline.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-components/badges/master/coverage.svg?style=flat-square)|-|will be merged with visions|
|[d3-charts](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-d3-charts)|![npm package](https://img.shields.io/npm/v/@sis-cc/dotstatsuite-d3-charts?style=flat-square)|![status](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-d3-charts/badges/master/pipeline.svg?style=flat-square)|![coverage](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-d3-charts/badges/master/coverage.svg?style=flat-square)|-|complex to test|
