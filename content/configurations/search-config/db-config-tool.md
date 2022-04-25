---
title: "SQL Server configuration without SQL Mgmt Studio"
subtitle: 
comments: false
weight: 92

---

**Database configuration tool**

The **Database Configuration Tool** can be used for the configuration of MS SQL server databases in situations where those databases cannot be accessed directly, e.g. in [containerised installation](https://sis-cc.gitlab.io/dotstatsuite-documentation/install-docker/) approaches, or in environments like the [SIS-CC DevOps](https://sis-cc.gitlab.io/dotstatsuite-documentation/getting-started/devops/) one.

It currently supports the following tasks:
* Set database recovery mode set to `SIMPLE` *(always executed)*
* Adjust maximum size of Data & Log files *(optional)*

Detailed information can be found [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/tree/master/DotStat.Devops.Db.Config).
