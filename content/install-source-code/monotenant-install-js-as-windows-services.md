---
title: "Mono-tenant installation of .Stat DE as Windows services"
subtitle: 
comments: false
weight: 47
keywords: [
  'prerequisites', '#prerequisites',
  'git bash', '#git-bash',
  'nodejs & npm', '#nodejs-&-npm',
  'java v8 (for solr)', '#java-v8-for-solr',
  'folders', '#folders',
  'nssm', '#nssm',
  'solr', '#solr',
  'Create a solr collection', '#create-a-solr-collection',
  'redis', '#redis',
  'mongo', '#mongo',
  'keycloak', '#keycloak',
  'dotstatsuitejs', '#dotstatsuitejs',
  'artefacts', '#artefacts',
  'indexation', '#indexation',
]
---

#### Table of Content
- [prerequisites](#prerequisites)
  - [git bash](#git-bash)
  - [nodejs & npm](#nodejs-&-npm)
  - [java v8 (for solr)](#java-v8-for-solr)
- [folders](#folders)
- [nssm](#nssm)
- [solr](#solr)
- [Create a solr collection](#create-a-solr-collection)
- [redis](#redis)
- [mongo](#mongo)
- [keycloak](#keycloak)
- [dotstatsuitejs](#dotstatsuitejs)
- [artefacts](#artefacts)
- [indexation](#indexation)

---

### Prerequisites

#### git bash
- https://gitforwindows.org/
- during installation:
  - use git and optional unix tools from the command prompt
  - checkout as-is, commit as-is
  - enable symbolic links
- check:
  - open git bash
  - run `git --version` v2.23.0 and above

#### nodejs & npm
- close git bash
- https://nodejs.org/en/download/
- check:
  - open git bash
  - run `node --version` v14.x and above
  - run `npm --version` v6.14.x and above

#### java v8 (for solr)
- close git bash
- https://www.java.com/fr/download/windows-64bit.jsp
- check:
  - open git bash
  - run `which java`

---

### Folders
> hint: folders should not contain user specific

- open git bash
- run `cd && cd /c && mkdir dotstatsuitejs && cd dotstatsuitejs && mkdir pm2 nssm keycloak redis solr config search share explorer viewer dlm && ll`

---

### NSSM
> hint: use to have solr as a windows service

- download nssm: https://nssm.cc/download at version 2.24
- unzip in dotstatsuitejs/nssm
  - result: dotstatsuitejs/nssm/nssm-2.24

---

### Solr
- download solr 7.x: https://lucene.apache.org/solr/downloads.html (solr 8.7 since [May 19, 2021 Release .Stat Suite JS 8.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#may-19-2021))
- unzip it in dotstatsuitejs/solr
  - result: dotstatsuitejs/solr/solr-7.7.2
- open git bash
- go to dotstatsuitejs/nssm/nssm-2.24/win64
- run `./nssm.exe install solr772`
- in the nssm window:
  - set path as dotstatsuitejs/solr/solr-7.7.2/bin/solr (don't copy past use "..." for find the solr bin )
  - set as arguments `start -f -p 8983`
  - click on install service
- close git bash
- start the service from services (solr772)
- go in chrome to http://localhost:8983

---

### Create a solr collection
  - create a collection [How to create a collection](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/indexing-data/#how-to-create-a-collection)
---

### Mongo
  - download mongo: https://www.mongodb.com/try/download/community
  - default port 27017
  - installation step to be completed... (you can complete it by creating a MR on https://gitlab.com/sis-cc/dotstatsuite-documentation)
---

### Redis
> hint: the msi setup redis as a windows service

- download redis: https://github.com/microsoftarchive/redis/releases/download/win-3.2.100/Redis-x64-3.2.100.msi
- during the installation:
  - add the redis installation folder to the path
- (the service Redis should be running)
- close git bash
- check:
  - open git bash
  - run `redis-cli ping`

---

### Keycloak
**keycloak v7.x (minimum) - v12.0.4 (latest tested and recommended)**
- download keycloak: https://downloads.jboss.org/keycloak/7.0.0/keycloak-7.0.0.zip
- unzip it in dotstatsuitejs/keycloak
  - result: dotstatsuitejs/keycloak/keycloak-7.0.0
- copy the folder C:\dotstatsuitejs\keycloak\keycloak-7.0.0\docs\contrib\scripts\service
  - in C:\dotstatsuitejs\keycloak\keycloak-7.0.0\bin
  - result: C:\dotstatsuitejs\keycloak\keycloak-7.0.0\bin\service
- add environnement variable JAVA_HOME // need to verify
- open windows powerShell
- go in C:\dotstatsuitejs\keycloak\keycloak-7.0.0\bin\service
- run `.\service.bat install /display keycloak`
- start the service from services (keycloak)
- go in chrome to http://localhost:8080 (wait for keycloak to load)
  - create your admin account
  regarding your file dotstatsuitejs/config/configs/tenants.json
  - add realm (e.g OECD)
  - create Clients 
    - client ID (e.g app)
    - Root URL (http://localhost:7000)
  - add user

A very useful tutorial on how to get a Keycloak server ready to work with the .Stat suite is also available [**here**](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/authentication/keycloak-configuration/).

---

### Dotstatsuitejs
> hint: pm2 is a tool that monitors nodejs services  
> pm2-service-install makes it run as a windows service

- open git bash
- run `npm i -g pm2 pm2-windows-service`
- run `pm2-service-install -n dotstatsuitejs`
  - ? Perform environment setup (recommended)? Yes
  - ? Set PM2_HOME? Yes
  - ? PM2_HOME value: c:\dotstatsuitejs\pm2
  - ? Set PM2_SERVICE_SCRIPTS (the list of start-up scripts for pm2)? No
  - ? Set PM2_SERVICE_PM2_DIR? Yes
  - ? Set PM2_SERVICE_PM2_DIR C:\Users\Nico\AppData\Roaming\npm\node_modules\pm2\index.js
- close git bash

---

### Artefacts
> hint: you need a token in order to script the artefacts download  

- download artefact and pm2 scripts https://gitlab.com/sis-cc/dotstatsuite-documentation/tree/master/dotstatsuitejs
- move the both files into dotstatsuitejs
- in dotstatsuitejs folder
- open git bash  
- run `./artefacts.sh YOUR_TOKEN` *download and unzip artefacts from gitlab (develop branch)* / *[How create a Token]  (https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html)*  
- **setup your assets and configs. put it in dotstatsuitejs/config like below**
```
.
├── dotstatsuite
│   ├── config
│   │   ├── node_modules                       # from setup artifact
│   │   ├── dist                               # from build artifact
│   │   ├── configs
│   │   │   ├── tenants.json                   # tenants & datasources definition
│   │   │   │   ├── default
│   │   │   │   │   ├── data-explorer
│   │   │   │   │   │   ├── i18n
│   │   │   │   │   │   ├── settings.json
│   │   │   │   │   ├── data-viewer
│   │   │   │   │   │   ├── i18n
│   │   │   │   │   │   ├── settings.json
│   │   ├── assets
│   │   |   ├── default
│   │   |   │   │   ├── data-explorer
│   │   |   │   │   │   │   ├── images
│   │   |   │   │   │   │   ├── styles
│   │   │   │   ├── data-viewer
│   │   │   │   │   │   ├── images
│   │   │   │   │   │   ├── styles
│   │   ├── package.json
│   ├── data-explorer                          # application
│   │   ├── build
│   │   |   ├── assets
│   │   |   │   ├── default
│   │   |   │   │   ├── data-explorer
│   │   |   │   │   │   │   ├── images
│   │   |   │   │   │   │   ├── styles
```
- copy assets folder into build applications (**no need to change assets url anymore in settings**)   
link in settings assets should stay like below:   
```
"favicon": "/assets/siscc/data-explorer/images/favicon.ico"
```
- edit pm2.sh to set your personnal environnement variable (e.g TRANSFER_SERVER_URL, CONFIG_FOLDER...)
- in windows services, start dotstatsuitejs
- checks:
  - config: http://localhost:5007/healthcheck
  - share: http://localhost:3005/healthcheck (redis OK)
  - search: http://localhost:3004/healthcheck (mongo OK, solr OK)
  - explorer: http://localhost:7001
  - viewer: http://localhost:7002 (no id)
  - dlm: http://localhost:7000

---

### Indexation
> hint: default api-key value is secret

- get config: `curl -X GET http://localhost:3004/admin/config?api-key=secret&tenant=default`
- index dataflows: `curl -X POST http://localhost:3004/admin/dataflows?api-key=secret&tenant=default`
- get report: `curl -X GET http://localhost:3004/admin/report?api-key=secret&tenant=default`
- delete dataflows and config: `curl -X DELETE http://localhost:3004/admin/config?api-key=secret&tenant=default`
