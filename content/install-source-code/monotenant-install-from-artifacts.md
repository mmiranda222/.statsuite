---
title: "Mono-tenant installation of DE and DLM services from gitlab pipeline artifacts"
subtitle: 
comments: false
weight: 45
keywords: [
  'pre-requisites', '#pre-requisites',
  'summary', '#summary',
  '1. setup', '#1-setup',
  '2. config service', '#2-config-service',
  '3. search service', '#3-search-service',
  '4. share service', '#4-share-service',
  '5. data-explorer app', '#5-data-explorer-app',
  '6. data-viewer app', '#6-data-viewer-app',
  '7. data-lifecycle-manager app', '#7-data-lifecycle-manager-app',
]
---

#### Table of Content

- [pre-requisites](#pre-requisites)
- [summary](#summary)
- [1. setup](#1-setup)
- [2. config service](#2-config-service)
- [3. search service](#3-search-service)
- [4. share service](#4-share-service)
- [5. data-explorer app](#5-data-explorer-app)
- [6. data-viewer app](#6-data-viewer-app)
- [7. data-lifecycle-manager app](#7-data-lifecycle-manager-app)


*slightly different than the source code approach; git is not mandatory anymore and side-effects related to dependencies are avoided*.

---

### pre-requisites

- (reminder) an accessible (CORS-enabled, anonymous access enabled) SDMX v6.x endpoint
- [nodejs 14.x](https://nodejs.org/en/download/) and [npm 6.14.x](https://www.npmjs.com/package/npm) installed
- [git](https://gitforwindows.org/) installed ; only to use git bash instead of cmd.exe for process variables
- [solr 7.x](https://lucene.apache.org/solr/downloads.html) installed and running on port 8983 (default) with a core created with `solr create -c sdmx-facet-search` from solr console
- [redis](https://redis.io/download) downloaded and running on port 6379 (default)
- [keycloak](https://www.keycloak.org/downloads.html) v7.x (minimum) - v11.0.2 (latest tested and recommended) downloaded and running on port 8080 (default)

*notes:*

- solr core name can be freely picked, default configuration targets sdmx-facet-search
- ports can be freely picked, if different than defaults they should be specified when launching services

---

### summary

![from gitlab artifacts summary](/dotstatsuite-documentation/images/from_gitlab_artifacts.png)

---

### 1. setup

1. (temporary) `npm i -g cross-env`
1. create folders as follow:
```
.
├── dotstatsuite
│   ├── config
│   ├── search
│   ├── data-explorer
│   ├── data-viewer
│   ├── share
|   ├── data-lifecycle-manager
```

---

### 2. config service

1. download artifact archives and package.json file from gitlab:

  - [setup](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/jobs/artifacts/master/download?job=setup)
  - [build](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/jobs/artifacts/master/download?job=build)
  - [package.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/raw/master/package.json?inline=false)

2. extract archives and organize folders/files as follow:
```
.
├── dotstatsuite
│   ├── config
│   │   ├── node_modules                       # from setup artifact
│   │   ├── dist                               # from build artifact
│   │   ├── configs                            # see note a
│   │   │   ├── datasources.json               # datasources definition
│   │   │   ├── tenants.json                   # tenants definition
│   │   │   │   ├── default
│   │   │   │   │   ├── data-explorer
│   │   │   │   │   │   ├── i18n
│   │   │   │   │   │   ├── settings.json
│   │   │   │   │   ├── data-viewer
│   │   │   │   │   │   ├── i18n
│   │   │   │   │   │   ├── settings.json
│   │   ├── assets                             # see note b
│   │   │   ├── default
│   │   │   │   ├── data-explorer
│   │   │   │   │   │   ├── images
│   │   │   │   │   │   ├── styles*
│   │   │   │   ├── data-viewer
│   │   │   │   │   │   ├── images
│   │   │   │   │   │   ├── styles*
│   │   ├── package.json
```

*notes:*

- a: [see configs samples here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/tree/master/data/prod/configs)
- b: [see assets samples here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/tree/master/data/prod/assets)
- in settings, assets should have the right path, if you change the name folder by default make sure to change path assets url

```json
"viewer": {
  "logo": "/assets/default/data-explorer/images/sis-cc-logo.png",
}
```

3 . start the service:

- (in git bash) run `PORT=5007 npm run dist:run`
- check if everything is fine: http://localhost:5007/healthcheck

---

### 3. search service

1. download artifact archives and package.json files from gitlab:

  - [setup](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/jobs/artifacts/master/download?job=setup)
  - [build](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/jobs/artifacts/master/download?job=build)
  - [package.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/raw/master/package.json?inline=false)

2. extract archives and organize folders/files as follow:
```
.
├── dotstatsuite
│   ├── search
│   │   ├── node_modules                       # from setup artifact
│   │   ├── dist                               # from build artifact
│   │   ├── package.json
```

3. start the service:

  - (temporary) edit the 1st line of dist/params/production.js as follow: `const server = { host: '0.0.0.0', port: 3007 };`
  - (in git bash) run `PORT=3007 CONFIG_URL=http://localhost:5007 REDIS_HOST=localhost SOLR_HOST=localhost npm run dist:run`
  - check if everything is fine: http://localhost:3007/healthcheck
  - check if the config (mostly to check datasources) is fine: http://localhost:3007/api/config

4. handle index (that are indexable):

  - get config: `curl -X GET http://localhost:3007/admin/config?api-key=secret`
  - index dataflows: `curl -X POST http://localhost:3007/admin/dataflows?api-key=secret -d {}`
  - get report: `curl -X GET http://localhost:3007/admin/report?api-key=secret`
  - delete dataflows and config: `curl -X DELETE http://localhost:3007/admin/config?api-key=secret`

*notes:*

- process variables are SOLR_HOST, SOLR_PORT, REDIS_HOST, REDIS_PORT, CONFIG_URL and PORT
- PORT is not available yet, which explain why dist/params/production.js should be updated
- if the config is not fine, update the datasources.json and/or settings.json file(s) in the config service, restart the config service then restart the search service
- the search service is not coupled with its clients, the search endpoint is configurable from settings.json of the data-explorer app in the config service

---

### 4. share service

1. download artifact archives and package.json files from gitlab:

  - [setup](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/-/jobs/artifacts/master/download?job=setup)
  - [build](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/-/jobs/artifacts/master/download?job=build)
  - [package.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/raw/master/package.json?inline=false)

2. extract archives and organize folders/files as follow:
```
.
├── dotstatsuite
│   ├── share
│   │   ├── node_modules                       # from setup artifact
│   │   ├── dist                               # from build artifact
│   │   ├── package.json
```

3. start the service:

  - (in git bash) run `PORT=3006 CONFIG_URL=http://localhost:5007 REDIS_HOST=localhost SITE_URL=http://localhost:3006  npm run dist:run`
  - check if everything is fine: http://localhost:3006/healthcheck

*notes:*

- SITE_URL should be an accessible url for a user, ie http://share.qa.oecd.redpelicans.com if used out of localhost

---

### 5. data-explorer app

1. download artifact archives and package.json files from gitlab:

  - [setup](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/jobs/artifacts/master/download?job=setup)
  - [build](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/jobs/artifacts/master/download?job=build)
  - [package.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/raw/master/package.json?inline=false)

2. extract archives and organize folders/files as follow:
```
.
├── dotstatsuite
│   ├── data-explorer
│   │   ├── node_modules                       # from setup artifact
│   │   ├── dist                               # from build artifact (server files)
│   │   ├── build                              # from build artifact (client bundle)
│   │   │   ├── assets                         # assets from config
│   │   ├── package.json
```

3. Copy your assets from config and put them in build folder

4. start the service:

  - (in git bash) run `SERVER_PORT=3009 CONFIG_URL=http://localhost:5007 AUTH_SERVER_URL=http://localhost:8080 npm run start:run`
  - check if everything is fine: http://localhost:3009 (proxy with a route mapped to data-explorer)

---

### 6. data-viewer app

1. download artifact archives and package.json files from gitlab:

  - [setup](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/-/jobs/artifacts/master/download?job=setup)
  - [build](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/-/jobs/artifacts/master/download?job=build)
  - [package.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/raw/master/package.json?inline=false)

2. extract archives and organize folders/files as follow:
```
.
├── dotstatsuite
│   ├── data-viewer
│   │   ├── node_modules                       # from setup artifact
│   │   ├── dist                               # from build artifact (server files)
│   │   ├── build                              # from build artifact (client bundle)
│   │   │   ├── assets                         # assets from config
│   │   ├── package.json
```

3. Copy your assets from config and put them in build folder

4. start the service:

  - (in git bash) run `SERVER_PORT=3005 CONFIG_URL=http://localhost:5007 npm run start:run`

---

### 7. data-lifecycle-manager app

1. download artifact archives and package.json files from gitlab:

  - [setup](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/jobs/artifacts/develop/download?job=setup)
  - [build](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/jobs/artifacts/develop/download?job=build)
  - [package.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/raw/develop/package.json?inline=false)

2. extract archives and organize folders/files as follow:
```
.
├── dotstatsuite
│   ├── data-lifecycle-manager
│   │   ├── node_modules                       # from setup artifact
│   │   ├── dist                               # from build artifact (server files)
│   │   ├── build                              # from build artifact (client bundle)
│   │   │   ├── assets                         # assets from config
│   │   ├── package.json
```

3. Copy your assets from config and put them in build folder

4. start the service:

  - (in git bash) run `SERVER_PORT=7000 CONFIG_URL=http://localhost:5007 AUTH_SERVER_URL=http://localhost:8080 npm run start:run`
