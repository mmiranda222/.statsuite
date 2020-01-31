---
title: "Mono-tenant update of DE and DLM services from gitlab pipeline artifacts"
subtitle: 
comments: false
weight: 46
---

**pre-requisites:**

- running install, see [install](/install-source-code/monotenant-install-from-artifacts)

**1. config service**

 1. download artifact archives and package.json file from gitlab:  

  - [setup](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/jobs/artifacts/master/download?job=setup)
  - [build](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/jobs/artifacts/master/download?job=build)
  - [package.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/raw/master/package.json?inline=false)

 2. restart the service: 
 
  - (in git bash) run `PORT=5007 npm run dist:run`

**2. search service**

 1. download artifact archives and package.json file from gitlab:  

  - [setup](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/jobs/artifacts/master/download?job=setup)
  - [build](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/jobs/artifacts/master/download?job=build)
  - [package.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/raw/master/package.json?inline=false)

 2. restart the service: 
 
  - (in git bash) run `PORT=3007 CONFIG_URL=http://localhost:5007 REDIS_HOST=localhost SOLR_HOST=localhost npm run dist:run`

**3. share service**

 1. download artifact archives and package.json file from gitlab:  

  - [setup](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/-/jobs/artifacts/master/download?job=setup)
  - [build](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/-/jobs/artifacts/master/download?job=build)
  - [package.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/raw/master/package.json?inline=false)

 2. restart the service: 

  - (in git bash) run `PORT=3006 CONFIG_URL=http://localhost:5007 REDIS_HOST=localhost SITE_URL=http://localhost:3006  npm run dist:run`

**4. data explorer app**

 1. download artifact archives and package.json file from gitlab:  

  - [setup](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/jobs/artifacts/master/download?job=setup)
  - [build](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/jobs/artifacts/master/download?job=build)
  - [package.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/raw/master/package.json?inline=false)

 2. restart the service:
 
  - (in git bash) run `SERVER_PORT=3009 CONFIG_URL=http://localhost:5007 npm run start:run`

**5. data viewer app**

 1. download artifact archives and package.json file from gitlab:  

  - [setup](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/-/jobs/artifacts/master/download?job=setup)
  - [build](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/-/jobs/artifacts/master/download?job=build)
  - [package.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/raw/master/package.json?inline=false)

 2. restart the service:
 
 - (in git bash) run `SERVER_PORT=3005 CONFIG_URL=http://localhost:5007 npm run start:run`

**6. data-lifecycle-manager app**

1. download artifact archives and package.json files from gitlab:

  - [setup](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/jobs/artifacts/develop/download?job=setup)
  - [build](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/jobs/artifacts/develop/download?job=build)
  - [package.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/raw/develop/package.json?inline=false)

2. restart the service:

  - (in git bash) run `SERVER_PORT=7000 CONFIG_URL=http://localhost:5007 npm run start:run`

 
