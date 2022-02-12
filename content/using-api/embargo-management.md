---
title: "Embargo management"
subtitle: 
comments: false
weight: 7000
keywords: [
  'Point in time (PIT) release feature', '#point-in-time-release-feature',
  'Basic characteristics', '#basic-characteristics',
  'Storage', '#storage',
  'Using the API to manage the PIT version', '#using-the-api-to-manage-the-pit-version',
  'Prepare a (new) PIT version', '#prepare-a-new-pit-version',
  'Check the current PIT version status', '#check-the-current-pit-version-status',
  'Automated release of the PIT version', '#automated-release-of-the-pit-version',
  'Rollback and Restoration', '#rollback-and-restoration',
  'Data retrieval', '#data-retrieval',
  'PIT access permissions', '#pit-access-permissions',
]

---

#### Table of Content
- [Point in time (PIT) release feature](#point-in-time-release-feature)
  - [Basic characteristics](#basic-characteristics)
  - [Storage](#storage)
- [Using the API to manage the PIT version](#using-the-api-to-manage-the-pit-version)
  - [Prepare a (new) PIT version](#prepare-a-new-pit-version)
  - [Check the current PIT version status](#check-the-current-pit-version-status)
  - [Automated release of the PIT version](#automated-release-of-the-pit-version)
  - [Rollback and Restoration](#rollback-and-restoration)
- [Data retrieval](#data-retrieval)
- [PIT access permissions](#pit-access-permissions)

This section describes the main features of the .Stat Suite data APIs for the management of embargoed data through a "point in time" (PIT) release.

---

### Point in time release feature
This feature covers the use case when an organisation has to prepare a new revision, but for legal reasons, this data cannot be published before a given date time. The aim is to disseminate updated data at the point in time release date without waiting for a data loading delay. Once the point in time release date is reached, the updated data and attributes are immediately available at once in the disseminate space.

**Scope**  
The PIT only applies to the data values and associated attribute values, it does not modify the Data Structure Definition (DSD). For a given DSD, the data producer/owner submits PIT revisions of the data values and attributes, which are not visible for the data consumers until a given datetime in the future. Thus the PIT feature allows for **only one embargo version for the entire DSD**, but it can use any dataflow (or the whole DSD) for the API call. In case separate PIT release processes are required for different dataflows of the same DSD, then it is necessary to define separate DSDs, one for each dataflow.

#### Basic characteristics
*  The Point in Time feature is not based on SDMX features.
*  The PIT is done at DSD level, meaning that all dataflows that are part of a DSD will contain a PIT version, when it is created (even if their data might not be changed).
*  The Data Lifecycle Manager (DLM) also supports the PIT features. See the [upload data](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/upload-data/point-in-time/) and [copy data](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/copy-data/#point-in-time-release) features.
*  There can be DSDs with:
   - only live data, no PIT version
   - both live data and PIT version
   - no live data, only PIT version

#### Storage
The storage of both the LIVE and PIT versions of the data and attributes is done by using a pair of A and B fact tables (for data and attribute) per DSD. A separate table stores the information to manage the PIT and restoration versions. This table stores the release date, restoration date and the mapping of A/B tables with Live/PIT versions.  
Tables involved in the PIT feature:

*  [\[Management\].\[Artifact\]](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access#managementartefact)
*  [\[Data\].\[FILT_{dsd id}\]](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access#datafilt_dsd-id)
*  [\[Data\].\[FACT_{dsd id}_{table version}\]](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access#datafact_dsd-id_table-version)
*  [\[Data\].\[Fact_{dsd id}_{table version}_DELETED\]](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access#datafact_dsd-id_table-version_deleted)
*  [\[Data\].\[ATTR_{dsd id}_{table version}_DF\]](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access#dataattr_dsd-id_table-version_df)
*  [\[Data\].\[ATTR_{dsd id}_{table version}_DIMGROUP\]](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access#dataattr_dsd-id_table-version_dimgroup)

**[Data database diagram](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access#dotstatsuitecore_data_dataspace-database)**

---

### Using the API to manage the PIT version

#### Prepare a (new) PIT version
The Point in Time release options can be directly specified in **all the Transfer service data upload/copy functions**.
   *  The import will allow to set the release date at some point in the future. If not set, then the release date is undetermined and the release is never executed. The release data can be set or changed subsequently.
   *  Multiple data imports are allowed for the PIT version, which will modify the PIT data values and/or the release date.
   *  When there is an existing PIT version, the Live version of the data cannot be updated.

Currently, the following parameters are supported:

| Name | Type | Description | Requirement |
|------|------|-------------|-------------|
| targetVersion | integer | Indicates which version of the tables should be targeted (Live or PIT). In case there is already a PIT release defined on the DSD, all transaction on this DSD will target the PIT release irrespectively to the value of this parameter.<br>Available values: 0 (Live), 1 (PIT) - Default: 0 (Live)<br>When target version is LIVE version, PITReleaseDate is set to null and restorationOptionRequired is set to false | Optional |
| sourceVersion | integer | Only in `/transfer/dataflow` method. Indicates which version of the tables should be used as source (Live or PIT).<br>Available values: 0 (Live), 1 (PIT) - Default: 0 (Live)| Optional |
| PITReleaseDate | string | When provided, this date will be the date and time when the PIT release is activated (i.e. is made available for data queries). When not provided, the PIT release won't be activated automatically. If its value refers to a date and time in the past, then the PIT release is immediately activated and release right at the end of the transaction.<br>Format YYYY-MM-DDThh:mm:ss.sTZD  e.g. 2022-06-04T10:16:01, 2022-06-04T08:16:01Z, 2022-06-04T10:16:01+02:00, 2022-06-04T10:16:01.021+02:00 | Optional |
| restorationOptionRequired | boolean | Optional parameter. Indicates if the current LIVE version should be kept for restoration purposes when the PIT release becomes active. | Optional |

In case PIT data should be released immediately, the PITReleaseDate parameter should be set to the current date-time or a past date-time. 

**IMPORTANT NOTE**: since [September 03, 2021 Release .Stat Suite .NET 7.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#september-03-2021), for the release date-time, the PITReleaseDate parameter is a datetime value with the time zone designator, according to technical standards (see: [https://www.w3.org/TR/NOTE-datetime](https://www.w3.org/TR/NOTE-datetime)). This time zone designator allows specifying a precise target release datetime independently from the current time zone of the server where the NSI web service is running.   
Example: **1997-07-16T19:20:30.45+01:00**.

When transfering data between internal data spaces using the Transfer service `/transfer/dataflow` method, then the following scenarios are supported through the `targetVersion` and `sourceVersion` parameters:
*  **Source space --> Target space**
   *  Live data --> Live data
   *  Live data --> PIT data
   *  PIT data --> Live data
   *  PIT data --> PIT data

However, the PIT release date must always be set explicitly for the target. It is not copied from the source.

#### Check the current PIT version status
**Information** about the current Point-In-Time release can be obtained with the Transfer web service method `/pointintime​/PITInfo`:
* Indicates if currently there is a PIT release defined on the artefact
* In case there is a PIT release defined, provides the release date
* In case there is a PIT release defined, indicates if the restoration option was requested, to keep a copy of the current live data

Example:  
`POST /1.2/pointintime/PITinfo`

[More information about the Point-In-Time release status check](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer#post-12pointintimepitinfo-information-about-point-in-time-release)

#### Automated release of the PIT version
The release of the PIT version happens at the exact date-time as specified in the relase date-time. Ongoing data retrieval requests are not interrupted by a PIT release event and continue to serve the previous Live data.  
There is no physical movement of data as part of release event in order to respect the strict timeliness of the release. Therefor, PIT releases do not affect performance. This is important because at the release date time, there is an expected increase of data requests for the new revision.

The release of a PIT version is fully transparent for data consumers. They only need to reexecute the query. The actual content constraints (data availability) are available for both versions of the data.

At a later point, both PIT and Live versions will support the *Last updated* and *Updated after* features.

#### Rollback and Restoration
To **Rollback** a still awaiting PIT release that has not yet been released, use the Transfer web service method `/pointintime​/rollback`. In other words, if a data import request creates a PIT with a release date null (undefined) or some time in the future, then this rollback functionality will allow the user to fully cancel and delete the scheduled PIT.

A rollback will:
* not affect the current Live version, it will only cancel/delete the scheduled PIT version.
* only be available if there is currently a PIT version and its release date is null (undefined) or scheduled for some time in the future.
* not be possible once the PIT release date has passed. For this purpose see the **Restore** function below.

Example:  
`POST /1.2/pointintime/rollback`

[More information about Rollback of Point-In-Time release](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer#post-12pointintimerollback-rollback-of-point-in-time-release)

To **Restore** previous Live data to an already released Point-In-Time version, use the Transfer web service method `/pointintime​/restoration`. A precondition for this feature to be available is to indicate during the PIT data import/transfer using the **restorationOptionRequired** option to keep a restoration copy of the data. This option is available whenever a PIT is newly defined or updated.  
This feature cannot restore the data to any state in the past, but only to one previous version.

Scenarios:
* 1. PIT Data import/transfer with **restorationOptionRequired** set to **false**:  
     After the PIT data has been released, the previous Live data cannot be restored anymore.
* 2. PIT Data import/transfer with **restorationOptionRequired** set to **true**:  
     After the PIT data has been released, the previous Live data can be restored as long as there is no new import for dataflows that are part of the same DSD (once a new import is requested, the restoration copy is lost). This scenario can be used to restore the previous Live data once a PIT has been released and the Rollback is not possible anymore. 

Example:  
`POST /1.2/pointintime/restoration`

[More information about Restoration of an already released PIT version](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer#post-12pointintimerestoration-restoration-of-already-released-pit-version)

---

### Data retrieval
The SDMX (NSI) web service supports the retrieval of the PIT and Live versions of the data. By default, the Live data version is returned.

To request a current non-released PIT version, the following additional http header is to be used the data request:
*  Header name: **X-Release**
*  Header values: **PIT**

If this header is not specified or it is empty then the Live data are returned.

When querying Actual content constraints, and if there is a PIT version then 2 constraint versions (each with proper validity dates) are returned: one for the Live version, and one for the PIT version.

---

### PIT access permissions
Only a user with the following access permissions valid for that underlying data can read PIT data versions:
*  User with permissions to manage data (insert/update/delete): DataImporterRole (1315) or their respective underlying basic permissions
*  User with permissions to see PIT data: CanReadPitData (2048)
*  User with full admin permissions: AdminRole (4095)

Only a user with the following access permissions valid for that underlying data can impot/copy PIT data versions:
*  User with permissions to manage data (insert/update/delete): DataImporterRole (1315) or their respective underlying basic permissions
*  User with full admin permissions: AdminRole (4095)

**How to fully disable PIT data access**  
Specific SDMX (NSI) web service instances can be configured to never return any PIT data versions, which disables the PIT header mentioned above.  
The configuration of whether access to Point-in-Time data should be allowed, is to be injected into the file `/config/dataspaces.private.json` as a json node `SpacesInternal/AllowPITTargetDataVersion` of type boolean. If the value is `false`, then attempts to retrieve PIT data results in a HTTP 401 error.

Configuration example:
```json
"spacesInternal": [
    {
      "Id": "SDMXwsWithoutPITAccess",
      "AllowPITTargetDataVersion": false
    }
]
```
