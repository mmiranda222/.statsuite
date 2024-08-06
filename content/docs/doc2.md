---
title: ".Stat DevOps implementation"
subtitle: 
comments: false
weight: 30
keywords: [
  'open-source development business requirements', '#open-source-development-business-requirements',
  'quality assurance QA environment', '#quality-assurance-qa-environment',
  'functional staging DEMO environment', '#functional-staging-demo-environment',
  'technical stack', '#technical-stack',
  'technical environment (cloud)', '#technical-environment-cloud',
  'flow', '#flow',
  'process', '#process',
  'mapping', '#mapping',
  'git', '#git',
  'gitlab', '#gitlab',
  'npm', '#npm',
  'nuget', '#nuget',
  'dashboard', '#dashboard',
]
---
<!-- This page (or a sub-page or sub-section of this page) of the documentation is referenced as an external resource in the .Stat Academy:
* https://academy.siscc.org/courses/introduction-to-the-stat-suite-open-source-framework/
Any change affecting its URL must be communicated to the .Stat Academy content admin in advance. -->
---

### open-source development business requirements
#### quality assurance QA environment

- Automated update triggered by **Dev** branch merge (part of “peer-review” Kanban step) 
- Used by **Product Management team** to:  
  -	directly test through API/Swagger/Postman candidate .Stat CORE services:   
    ° [**NSI ws with stable content** (upgraded database) called 'qa:stable'](https://nsi-qa-stable.siscc.org)  
    ° [**NSI ws with re-initialised content** (new database) called 'qa:reset'](https://nsi-qa-reset.siscc.org)  
    ° [**Transfer ws**](https://transfer-qa.siscc.org/swagger/)  
    ° [**Authorisation ws**](https://authz-qa.siscc.org/swagger/)  
  - test [**'PM' tenant**  of candidate **DE**](https://de-qa.siscc.org) plugged to:  
    ° indexing SIS-CC Demo-related staging instance of NSI ws with stable content (upgraded database) called 'staging:SIS-CC-stable'   
    ° indexing QA instance of NSI ws with stable content (upgraded database) called 'qa:stable'  
    ° [Data viewer app](https://dv-qa.siscc.org)  
  - test [**'PM' tenant**  of candidate **DLM**](https://dlm-qa.siscc.org) with internal data spaces plugged to:  
    ° SIS-CC Demo-related staging instance of NSI ws with stable content (upgraded database) called 'staging:SIS-CC-stable'   
    ° SIS-CC Demo-related staging instance of NSI ws with re-initialised content (new database) called 'staging:SIS-CC-reset'  
    ° SIS-CC Demo-related staging instance of Transfer ws  
  - test [**'PM' tenant**  of candidate **DLM**](https://dlm2-qa.siscc.org) with internal data spaces plugged to:  
    ° QA instance of NSI ws with stable content (upgraded database) called 'qa:stable'   
    ° QA instance of NSI ws with re-initialised content (new database) called 'qa:reset'  
    ° QA instance of Transfer ws  
- Other links:
  - [User identity management](https://keycloak.siscc.org)
  - [Share ws](https://share-qa.siscc.org/healthcheck)
  - [Search ws](https://sfs-qa.siscc.org/healthcheck)

#### functional staging DEMO environment

- Automated update triggered by **Master** branch merge (part of “release” Kanban step)
- Hosting stable instances for **SIS-CC (for Demo purposes)** of:
  -	directly test through API/Swagger/Postman candidate .Stat CORE services:  
    ° [**NSI ws with stable content** (upgraded database) called 'staging:SIS-CC-stable'](https://nsi-demo-stable.siscc.org)  
    ° [**NSI ws with re-initialised content** (new  database) called 'staging:SIS-CC-reset'](https://nsi-demo-reset.siscc.org)  
    ° [**Transfer ws**](https://transfer-demo.siscc.org/swagger)  
    ° [**Authorisation ws**](https://authz-demo.siscc.org/swagger)  
  - [**'SIS-CC' tenant** of **DE**](https://de-demo.siscc.org) plugged to:  
    ° stable NSI ws with stable content (upgraded database) called 'staging:SIS-CC-stable'   
    ° stable NSI ws with re-initialised content (new  database) called 'staging:SIS-CC-reset'  
    ° [Data viewer app](https://dv-demo.siscc.org)  
  - [**'SIS-CC' tenant** of **DLM**](https://dlm-demo.siscc.org) plugged to:  
    ° stable NSI ws with stable content (upgraded database) called 'staging:SIS-CC-stable'  
    ° stable NSI ws with re-initialised content (new  database) called 'staging:SIS-CC-reset'  
    ° stable Transfer ws  
- Hosting stable instances for **OECD Practice Building team** of: 
  -	directly test through API/Swagger/Postman candidate .Stat CORE services:  
    ° [**NSI ws with stable content** (upgraded database) called 'OECD-design'](https://nsi-demo-oecd-design.siscc.org)  
    ° [**NSI ws with stable content** (upgraded database) called 'OECD-staging'](https://nsi-demo-oecd-staging.siscc.org)  
    ° [**Transfer ws**](https://transfer-demo.siscc.org/swagger)  
    ° [**Authorisation ws**](https://authz-demo.siscc.org/swagger)  
  - [**'OECD' tenant** of **DE**](hhttps://de-demo-oecd.siscc.org) plugged to:  
    ° stable NSI ws with stable content (upgraded database) called 'OECD-design'  
    ° stable NSI ws with stable content (upgraded database) called 'OECD-staging'  
    ° [Data viewer app](https://dv-demo.siscc.org)
  - [**'OECD' tenant** of **DLM**](https://dlm-demo-oecd.siscc.org) plugged to:  
    ° stable NSI ws with stable content (upgraded database) called 'OECD-design'  
    ° stable NSI ws with stable content (upgraded database) called 'OECD-staging'  
    ° stable Transfer ws  
- Other links:
  - [User identity management](https://keycloak.siscc.org)
  - [Share ws](https://share-demo.siscc.org/healthcheck)
  - [Search ws](https://sfs-demo.siscc.org/healthcheck)
- Other tenants of DE and DLM for specific SIS-CC members 
  - either plugged to their own SDMX APIs
  - or plugged into above mentioned SIS-CC Demo-related instances of .Stat CORE services

---

### technical stack

The following technologies and cloud services are used for the DevOps implementation:

<table>
<thead>
<tr>
<td align="center" colspan=5><a href="https://docs.gitlab.com/ee/ci/pipelines.html">gitlab: open-source code repository and automation pipelines</a></td>
</tr>
<tr>
<td align="center" colspan=5><img src="/dotstatsuite-documentation/images/gitlab-logo-gray-rgb.png" style="height: 40px;" /></td>
</tr>
</thead>
<tbody>
<tr>
<td align="center"><a href="https://www.npmjs.com">npmjs: public JS libary repositories</a></td">
<td align="center"><a href="https://www.nuget.org/">nuget: public .Net Core library repositories</a></td>
<td align="center"><a href="https://www.docker.com">docker-hub: public JS & .Net Core application container image repositories</a></td>
<td align="center"><a href="https://cloud.google.com">gcp: hosting public qa & staging infrastructure</a></td>
<td align="center"><a href="https://kubernetes.io">kubernetes: container deployment orchestration</a></td>
</tr>
<tr>
<td align="center"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Npm-logo.svg/1280px-Npm-logo.svg.png" style="height: 40px;" /></td>
<td align="center"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/NuGet_project_logo.svg/220px-NuGet_project_logo.svg.png" style="height: 40px;" /></td>
<td align="center"><img src="https://www.usine-digitale.fr/mediatheque/5/3/8/000277835_homePageUne/docker.jpg" style="height: 40px;" /></td>
<td align="center"><img src="https://www.pinclipart.com/picdir/middle/54-541486_google-cloud-platform-svg-clipart.png" style="height: 40px;" /></td>
<td align="center"><img src="https://kubernetes.io/images/wheel.svg" style="height: 40px;" /></td>
</tr>
</tbody>
</table>

---

### technical environment (cloud)

* .Stat Data Explorer components and .Stat Data Lifecycle Manager
  - 1 cluster of 3 nodes with 2 namespaces (qa and staging) on google cloud platform
  - https
  - probes
  - kubernetes, how to update topology, not automated
  - repository: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp  
    ° holds kubernetes configuration files
* .Stat Core components
  - 1 cluster of 3 nodes with 2 namespaces (qa and staging) on google cloud platform
  - https
  - probes
  - kubernetes, how to update topology, not automated
  - repository: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-core-rp  
    ° holds kubernetes configuration files

---

### flow

MERMAID

---

### process

MERMAID

---

### mapping

|env|git branch|cluster namespace|
|---|---|---|
|qa|develop|qa|
|staging|master|staging|

---

### git
- see [git-flow](http://nvie.com/posts/a-successful-git-branching-model/)

---

### gitlab
- all repositories are under https://gitlab.com/sis-cc/.stat-suite
- each repository defines its pipelines in `gitlab-ci.yml` file
- 2 types of pipeline:

webapp/service
MERMAID

npm/nuget package
MERMAID

---

### npm
- npm packages are published under https://www.npmjs.com/settings/sis-cc/packages
- tags are only on commits in master and trigger a publish

---

### nuget

- nuget packages are published under https://www.nuget.org/profiles/SIS-CC
- tags are only on commits in master and trigger a publish
- this page provides information about [Usage of semantic versioning in .Stat Suite CORE components and services](/getting-started/semantic-version)

---

### dashboard

- kubernetes JS-based components: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp
- kubernetes .NET-based components: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-core-rp
- **dashboard**: https://gitlab.com/sis-cc/dotstatsuite-documentation/-/blob/master/devops-dashboard.md