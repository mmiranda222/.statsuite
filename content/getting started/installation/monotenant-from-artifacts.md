---
title: Mono-tenant installation from gitlab pipeline artifacts
subtitle: 
comments: false
weight: 29
---

*slightly different than the codebase approach; git is not mandatory anymore and side-effects related to dependencies are avoided*.

**pre-requisites:**

- (reminder) an accessible (CORS-enabled, anonymous access enabled) SDMX v6.x endpoint
- nodejs 12.x and npm 6.x installed
- git installed (https://gitforwindows.org/); only to use git bash instead of cmd.exe for process variables
- solr 7.x installed and running on port 8983 (default) with a core created with `solr create -c sdmx-facet-search` from solr console
- redis downloaded and running on port 6379 (default)

*notes:*

- solr core name can be freely picked, default configuration targets sdmx-facet-search
- ports can be freely picked, if different than defaults they should be specified when launching services

**1. setup**

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
```

**2. config service**

1. download artifact archives and package.json file from gitlab:

  - [setup](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/jobs/artifacts/develop/download?job=setup)
  - [build](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/jobs/artifacts/develop/download?job=build)
  - [package.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/raw/develop/package.json?inline=false)

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
│   │   │   │   │   │   ├── settings.json      # search endpoint is set here (among other things, for data-explorer app)
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

- a: [see configs samples here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/tree/develop/data/dev/configs)
- b: [see assets samples here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/tree/develop/data/dev/assets)
- in settings, assets should contain the whole path, ie http://localhost:5007/assets/... because the proxy is not used in a mono-tenant approach

3. start the service:

- (in git bash) run `PORT=5007 npm run dist:run`
- check if everything is fine: http://localhost:5007/healthcheck

**3. search service**

1. download artifact archives and package.json files from gitlab:

  - [setup](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/jobs/artifacts/develop/download?job=setup)
  - [build](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/jobs/artifacts/develop/download?job=build)
  - [package.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/raw/develop/package.json?inline=false)

2. extract archives and organize folders/files as follow:
```
.
├── dotstatsuite
│   ├── search
│   │   ├── node_modules                       # from setup artifact
│   │   ├── dist                               # from build artifact
│   │   ├── package.json
```

4. start the service:

- (temporary) edit the 1st line of dist/params/production.js as follow:
```
const server = { host: '0.0.0.0', port: 3007 };
```
- (in git bash) run `PORT=3007 CONFIG_URL=http://localhost:5007 REDIS_HOST=localhost SOLR_HOST=localhost npm run dist:run`
- check if everything is fine: http://localhost:3007/healthcheck
- check if the config (mostly datasources) is fine: http://localhost:3007/api/config

5. handle index (that are indexable):

- get config: `curl -X GET http://localhost:3007/admin/config?api-key=secret`
- index dataflows: `curl -X POST http://localhost:3007/admin/dataflows?api-key=secret -d {}`
- get report: `curl -X GET http://localhost:3007/admin/report?api-key=secret`
- delete dataflows and config: `curl -X DELETE http://localhost:3007/admin/config?api-key=secret`

*notes:*

- process variables are SOLR_HOST, SOLR_PORT, REDIS_HOST, REDIS_PORT, CONFIG_URL and PORT
- PORT is not available yet, which explain why dist/params/production.js should be updated
- if the config is not fine, update the datasources.json and/or settings.json file(s) in the config service, restart the config service then restart the search service
- the search service is not coupled with its clients, the search endpoint is configurable from settings.json of the data-explorer app in the config service

**4. share service**

1. download artifact archives and package.json files from gitlab:

  - [setup](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/-/jobs/artifacts/develop/download?job=setup)
  - [build](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/-/jobs/artifacts/develop/download?job=build)
  - [package.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/raw/develop/package.json?inline=false)

2. extract archives and organize folders/files as follow:
```
.
├── dotstatsuite
│   ├── share
│   │   ├── node_modules                       # from setup artifact
│   │   ├── dist                               # from build artifact
│   │   ├── package.json
```

4. start the service:

- (in git bash) run `PORT=3006 CONFIG_URL=http://localhost:5007 REDIS_HOST=localhost SITE_URL=http://localhost:3006  npm run dist:run`
- check if everything is fine: http://localhost:3006/healthcheck

*notes:*

- SITE_URL should be an accessible url for a user, ie http://share.qa.oecd.redpelicans.com if used out of localhost

**5. data-explorer app**

1. download artifact archives and package.json files from gitlab:

  - [setup](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/jobs/artifacts/develop/download?job=setup)
  - [build](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/jobs/artifacts/develop/download?job=build)
  - [package.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/raw/develop/package.json?inline=false)

2. extract archives and organize folders/files as follow:
```
.
├── dotstatsuite
│   ├── data-explorer
│   │   ├── node_modules                       # from setup artifact
│   │   ├── dist                               # from build artifact (server files)
│   │   ├── build                              # from build artifact (client bundle)
│   │   ├── package.json
```

4. start the service:

- (in git bash) run `SERVER_PORT=3009 CONFIG_URL=http://localhost:5007 npm run start:run`
- check if everything is fine: http://localhost:3008 (proxy with a route mapped to data-explorer)

**6. data-viewer app**

1. download artifact archives and package.json files from gitlab:

  - [setup](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/-/jobs/artifacts/develop/download?job=setup)
  - [build](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/-/jobs/artifacts/develop/download?job=build)
  - [package.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/raw/develop/package.json?inline=false)

2. extract archives and organize folders/files as follow:
```
.
├── dotstatsuite
│   ├── data-viewer
│   │   ├── node_modules                       # from setup artifact
│   │   ├── dist                               # from build artifact (server files)
│   │   ├── build                              # from build artifact (client bundle)
│   │   ├── package.json
```

4. start the service:

- (in git bash) run `SERVER_PORT=3005 CONFIG_URL=http://localhost:5007 npm run start:run`

**summary**

```
graph LR
config[config:5007 .]
share[share:3006 .]
search[search:3007 .]
solr[solr:8983 .]
redis[redis:6379 .]
explorer[data-explorer:3009 . .]
viewer[data-viewer:3005 . .]
user((user .))
sdmx1(sdmx 1 indexable . .)
sdmx2(sdmx 2 .)
subgraph localhost_
search -->|bind at run .| config
search -->|bind at run .| solr
search -->|bind at run .| redis
share -->|bind at run .| config
share -->|bind at run .| redis
explorer -->|bind at run .| config
explorer -.->|defined in settings . .| search
explorer -.->|defined in settings . .| share
viewer -->|bind at run .| config
viewer -.->|defined in settings . .| share
end
user ==>explorer
user ==>viewer
explorer -.->|defined in datasources . .| sdmx1
explorer -.->|defined in datasources . .| sdmx2
search -.->|defined in datasources . .| sdmx1
```

![from gitlab artifacts summary](/images/from_gitlab_artifacts.png)
