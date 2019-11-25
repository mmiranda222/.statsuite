---
title: Installation based on a ready-to-use service package
subtitle: 
comments: false
weight: 62
---

# Table of Content
- [Intro](#intro)
- [Multi-tenant architecture](#multi-tenant-architecture)
- [Cloud-hosting for SIS-CC member organisations and their partners for test, demo and pilot purposes](#cloud-hosting-for-sis-cc-member-organisations-and-their-partners-for-test-demo-and-pilot-purposes)
- [Cloud-hosting by any organisation for their own partners for test, demo, pilot or full-production purposes](#cloud-hosting-by-any-organisation-for-their-own-partners-for-test-demo-pilot-or-full-production-purposes)

## Intro

The three .Stat Suite main modules **Data Explorer**, **.Stat Core** and **Data Lifecycle Manager** [*to come*] are containerised and packaged as fully-functional, ready-to-use services using [Kubernetes](https://kubernetes.io/docs/home/) technology, which can be freely re-used by anyone in its own cloud or premises.

The **kubernetes cluster definitions** are located in the following repositories:

- **.Stat Core**: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-core-rp
- **.Stat Data Explorer**:  https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp

Please see each repository for detailed information on how to use these.

Our DevOps chain is also using these kubernetes cluster definitions, see the following running apps/services in our qa/staging environments:

* http://data-explorer.staging.oecd.redpelicans.com/
* http://webapp.staging.oecd.redpelicans.com/?tenant=oecd
* http://data-viewer.staging.oecd.redpelicans.com/?chartId=3
* http://transfer.qa.core.oecd.redpelicans.com/swagger/index.html
* http://nsi.qa.core.oecd.redpelicans.com/


The kubernetes cluster definitions implement a "multi-tenant architecture" that allows for sharing the kubernetes cluster between different tenants (organisations, projects, domains, portals, etc.)


## Multi-tenant architecture

### Examples of tenants defined in our DevOps (qa/staging) environments

|tenant|specs|url|
|---|---|---|
|oecd|own sdmx oecd qa endpoint, siscc design|http://data-explorer.qa.oecd.redpelicans.com/|


### technical overview

{{< mermaid align="left" >}}
graph LR
id1(browser)
id2((internet))
id3[proxy]
id4((data-explorer))
id12((share-viewer))
id5[search]
id6[share]
id7[config]
id8[solr]
id9(redis)
id10(redis)
id11((x))
id13[sdmx/nsi]
id14[transfer]
id15(mssql)

id1 --> id2
id2 --> id3
subgraph oecd cluster on GCP
id3 -->|app & tenant| id11
id3 -->|assets| id7
id11 --> id4
id11 --> id5
id11 --> id6
id11 --> id12
id4 --> id7
id5 --> id7
id5 --> id8
id5 --> id9
id6 --> id7
id6 --> id10
id12 --> id7
end
id2 --> id13
id2 --> id14
subgraph oecd cluster on GCP
id13 --> id15
id14 --> id15
end
{{< /mermaid >}}


### demo: add/update a tenant

1. update list of tenants: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/blob/develop/data/dev/configs/tenants.json
1. add tenant config (data-explorer & sdmx): https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/tree/develop/data/dev/configs
1. add tenant referenced assets (data-explorer): https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/tree/develop/data/dev/assets
1. check the tenant at http://data-explorer.staging.oecd.redpelicans.com/?tenant= `tenant`
1. update something in the configuration and check the update

### demo: add/update an app for the tenant (see sis-cc workshop hands-on)

1. fork from webapp
1. inject pre-coded app (to create)
1. declare it somewhere
1. check the app at `http://<app>.staging.<tenant>.redpelicans.com`
1. update the app
1. check the app at `http://<app>.staging.<tenant>.redpelicans.com`


## Cloud-hosting for SIS-CC member organisations and their partners for test, demo and pilot purposes

Using our DevOps environment with the "multi-tenant architecture", we can propose to our collaboration partners an out-of-the-box, easy-to-setup cloud hosting of the .Stat Suite for test, demo or pilot purposes.<br>
No need for locally hosting servers, building complex infrastructures or worrying about security plans:

* The apps and services are cloud-hosted and all components and accesses are centrally maintained;
* The model allows for seamlessly integrating additional tenants into the stack when needed;
* The DevOps chain automatically keeps installations up-to-date with the latest .Stat Suite version (dev or master), thus organisations can easily test and use the latest features;
* Costs and resources are minimised.

![.Stat Suite as a Service](/images/as-a-service.png)

[Contact us](mailto:contact@siscc.org) for further information and to set up a new tenant for you.


## Cloud-hosting by any organisation for their own partners for test, demo, pilot or full-production purposes

Our kubernetes cluster definitions with the "multi-tenant architecture" can be freely re-used and adapted by any organisation wishing to provide their own out-of-the-box, easy-to-setup cloud hosting of the .Stat Suite for their partner organisations.
 
