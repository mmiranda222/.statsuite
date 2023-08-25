---
title: ".Stat CORE configuration"
subtitle: 
comments: false
weight: 70
keywords: [
  'Transfer web service configuration', '#transfer-web-service-configuration',
  'Authorisation-management web service configuration', '#authorisation-management-web-service-configuration',
  'SDMX (NSI) web service configuration', '#sdmx-nsi-web-service-configuration',
  'SQL Server DB configuration without SQL Mgmt Studio', '#sql-server-db-configuration-without-sql-mgmt-studio',
  '.Stat Suite data space compression', '#stat-suite-data-space-compression',
]

---
#### Table of Content
- [Transfer web service configuration](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer#configuration)
- [Authorisation-management web service configuration](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management#configuration)
- [SDMX (NSI) web service configuration](https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored/-/blob/master/doc/CONFIGURATION.md)
- [SQL Server DB configuration without SQL Mgmt Studio](#sql-server-db-configuration-without-sql-mgmt-studio)
- [.Stat Suite data space compression](#stat-suite-data-space-compression)

---

### SQL Server configuration without SQL Mgmt Studio
The **Database Configuration Tool** can be used for the configuration of MS SQL server databases in situations where those databases cannot be accessed directly, e.g. in [containerised installation](https://sis-cc.gitlab.io/dotstatsuite-documentation/install-docker/) approaches, or in environments like the [SIS-CC DevOps](https://sis-cc.gitlab.io/dotstatsuite-documentation/getting-started/devops/) one.

It currently supports the following tasks:
* Set database recovery mode set to `SIMPLE` *(always executed)*
* Adjust maximum size of Data & Log files *(optional)*

Detailed information can be found [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/tree/master/DotStat.Devops.Db.Config).

---

### .Stat Suite data space compression
> Introduced in [August 24, 2023 Release .Stat Suite .NET 'elote'](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#august-24-2023)

The Transfer web service configuration setting `Archive` (boolean, default `false`) controls the compression behaviour of a data space. If set to `true` then all the data and referential metadata stored in the concerned data space are considered archived (almost static) and the related database tables use an SQL `COLUMNSTORE_ARCHIVE` data compression.

All the existing Transfer and SDMX (NSI) API functionality remains for `Archive`d dataspaces.

A dataspace can already contain data and be configured later as `Archive`d. In this case after a init/dataflow, transfer or import, the data/referential metadata will be compressed.

Once the data and referential metadata is `Archive`d, there is no implementation to remove the table compression again. In other words, if a data space configured as `Archive`d is reconfigured to non `Archive`d, the previously contained `Archive`d data and refrerential metadata will continue to be compressed.

`Archive`d data spaces do not use unique constraints to garantee unique observations. This is achieved instead by validating duplicates while importing/transfering data and referential metadata.

When data is imported, it is automatically compressed. This can cause increased CPU usage compared to non-`Archive`d data spaces. When data is exported, it is automatically uncompressed again.

Compression does not affect backup, restore nor log shipping.

**Benefits and costs:** 

- Compressing columnstore indexes with archival compression, causes the index to **perform slower** than columnstore indexes that do not have the archival compression. Use archival compression only when you can afford to use extra time and CPU resources to compress and retrieve the data.
- The benefit of archival compression, is **reduced storage**, which is useful for data that is not accessed frequently. For example, if you have a partition for each month of data, and most of your activity is for the most recent months, you could archive older months to reduce the storage requirements. The estimated compression rate (depending on the data content) is at least 80%.

For more information, see [here](https://learn.microsoft.com/en-us/sql/relational-databases/data-compression/data-compression?view=sql-server-ver16#columnstore-and-columnstore-archive-compression).