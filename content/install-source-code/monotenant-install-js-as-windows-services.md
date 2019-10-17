---
title: "monotenant-install-js-as-windows-services"
subtitle: 
comments: false
weight: 47
---

# Table of Content
- [prerequisites](#prerequisites)
- [folders](#folders)
- [nssm](#nssm)
- [solr](#solr)
- [solr core](#solr-core)
- [redis](#redis)
- [dotstatsuitejs](#dotstatsuitejs)
- [artefacts](#artefacts)
- [indexation](#indexation)

# prerequisites
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
- https://nodejs.org/en/download/current
- check chocolatey during installation
- check:
  - open git bash
  - run `node --version` v12.x and above
  - run `npm --version` v6.11.x and above

#### java v8 (for solr)
- close git bash
- https://www.java.com/fr/download/windows-64bit.jsp
- check:
  - open git bash
  - run `which java`

# folders
> hint: folders should not contain user specific

- open git bash
- run `cd && cd /c && mkdir dotstatsuitejs && cd dotstatsuitejs && mkdir pm2 nssm redis solr config search share explorer viewer && ll`

# nssm
> hint: use to have solr as a windows service

- download nssm: https://nssm.cc/download at version 2.24
- unzip in dotstasuitejs/nssm
  - result: dotstasuitejs/nssm/nssm-2.24

# solr
- download solr 7.x: https://lucene.apache.org/solr/downloads.html
- unzip it in dotstasuitejs/solr
  - result: dotstasuitejs/solr/solr-7.7.2
- open git bash
- go to dotstasuitejs/nssm/nssm-2.24/win64
- run `./nssm.exe install solr772`
- in the nssm window:
  - set path as dotstasuitejs/solr/solr-7.7.2/bin/solr
  - set as arguments `start -f -p 8983`
  - click on install service
- close git bash
- start the service from services
- go in chrome to http://localhost:8983

# create a solr core
> hint: use powershell to avoid apache cli error

- open powershell
- go to dotstasuitejs\solr\solr-7.7.2\bin
- run `.\solr create -c sdmx-facet-search -p 8983`
- check in chrome to http://localhost:8983/solr/#/sdmx-facet-search/core-overview

# redis
> hint: the msi setup redis as a windows service

- download redis: https://github.com/microsoftarchive/redis/releases/download/win-3.2.100/Redis-x64-3.2.100.msi
- during the installation:
  - add the redis installation folder to the path
- (the service Redis should be running)
- close git bash
- check:
  - open git bash
  - run `redis-cli ping`

# dotstatsuitejs
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
  - ? Set PM2_SERVICE_PM2_DIR C:\Users\Nico\AppData\Roaming\npm\node_modules\pm2\index.js (push enter)
- close git bash


# artefacts
> hint: you need a token in order to script the artefacts download
- download artefact and pm2 scripts https://gitlab.com/sis-cc/dotstatsuite-documentation/tree/master/dotstatsuitejs
- move the both files into dotstatsuitejs
- in dotstatsuitejs folder
- open git bash  
- run `./dotstatsuitejs_artefacts.sh YOUR_TOKEN` *download and unzip artefacts from gitlab (develop branch)* / *[How create a Token]  (https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html)*  
- **get assets and configs from http://206.189.58.70 and put it in dotstatsuitejs/config**
- run `./dotstatsuitejs_pm2.sh` *start services, save pm2 dump and delete all services*
- in windows services, start dotstatsuitejs
- checks:
  - config: http://localhost:5007/healthcheck
  - share: http://localhost:3006/healthcheck (redis OK)
  - search: http://localhost:3007/healthcheck (redis OK, solr OK)
  - explorer: http://localhost:3009
  - viewer: http://localhost:3005 (no id)

# indexation
> hint: default api-key value is secret

- get config: `curl -X GET http://localhost:3007/admin/config?api-key=secret`
- index dataflows: `curl -X POST http://localhost:3007/admin/dataflows?api-key=secret`
- get report: `curl -X GET http://localhost:3007/admin/report?api-key=secret`
- delete dataflows and config: `curl -X DELETE http://localhost:3007/admin/config?api-key=secret`
