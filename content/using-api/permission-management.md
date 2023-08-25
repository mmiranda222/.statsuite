---
title: "Permission management"
subtitle: "Details about the Authorisation-Management web service"
comments: false
weight: 10000
keywords: [
  'Introduction', '#introduction',
  'List of available permissions', '#list-of-available-permissions',
  'Granular permissions', '#granular-permissions',
  'Standard roles', '#standard-roles',
  'List of available SDMX artefact types', '#list-of-available-sdmx-artefact-types',
  'Visibility of permissions', '#visibility-of-permissions',
]
---

#### Table of Content
- [Introduction](#introduction)
- [List of available permissions](#list-of-available-permissions)
  - [Granular permissions](#granular-permissions)
  - [Standard roles](#standard-roles)
- [List of available SDMX artefact types](#list-of-available-sdmx-artefact-types)
- [Visibility of permissions](#visibility-of-permissions)

---

### Introduction
The the [Authorisation-Management](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management) web service allows retrieving, inserting, updating and deleting user permissions. We provide here more detailed information on the permission definitions as well as on the usage and parameters of this API. A Demo version of the Authorisation-Management web service is available here: https://authz-demo.siscc.org/swagger/index.html.

Access permissions can be defined individually for the following contexts:
 - per user (e-mail, e.g. user@domain.org), group of users (Project_Team) or any user (*)
 - per data space (e.g. Dissemination) or for all spaces managed within an instance (*)
 - per SDMX artefact type (e.g. Dsd, Dataflow) or any type (0)
 - per SDMX artefact maintenance agency (e.g. SDMX, MY_ORG) or any agency (*)
 - per SDMX artefact ID (e.g. DATAFLOW_ID) or any ID (*)
 - per SDMX artefact version (e.g. 1.0) or any version (*)
 - permission type (e.g. 3)

For the list of available **Permission types** and **SDMX artefact types**, please see below.

In order to be able to use the Authorisation-Management web service, the user needs to be authenticated and to provide a valid access token.

---

### List of available permissions
#### Granular permissions
The **granular permissions** listed below are permissions associated to a single and specific action.  

| **id** | **Granular permission** | **Definition** |
| ------ | ------ | ------ |
| 1 | CanReadStructuralMetadata | Can read structural metadata attribute |
| 2 | CanReadData | Can read data attribute |
| 4 | CanIgnoreProductionFlag | Can ignore production flag attribute |
| 8 | CanPerformInternalMappingConfig | Can perform internal mapping configuration attribute |
| 16 | CanImportStructures | Can import structures attribute |
| 32 | CanImportData | Can import data attribute |
| 64 | CanModifyStoreSettings | Can retrieve, insert, update and delete permissions |
| 128 | CanUpdateStructuralMetadata | Can update structural metadata attribute |
| 256 | CanUpdateData | Can update data |
| 512 | CanDeleteStructuralMetadata | Can delete structural metadadata attribute |
| 1024 | CanDeleteData | Can delete data |
| 2048 | CanReadPitData | Can read Point-in-Time (PiT) Data |

>**Note** that since [release .NET 6.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#march-05-2021), **permission id:0 is no longer supported** in .Stat Suite.

>**Note** that since [August 24, 2023 release .NET 'elote'](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#august-24-2023), **permission id:64 works as expected** also in .Stat Suite.

#### Standard roles
**Standard roles** are combinations of several granular permissions as described in the table above, obtained by **addition**. For example, **adding together CanReadStructuralMetadata [1] and CanReadData [2] to get 3**, will create a standard role that has the ability to read both structural metadata and data.  
Below is a table of pre-defined standard roles, but others are possible.  

| **id** | **Standard role** | **Definition** |
| ------ | ------ | ------ |
| 3 | WsUserRole | Underlying CanReadStructuralMetadata[1], CanReadData[2] |
| 15 | DomainUserRole | Underlying WsUserRole[3], CanIgnoreProductionFlag[4], CanPerformInternalMappingConfig[8] |
| 145 | StructureImporterRole_U | Underlying CanReadStructuralMetadata[1], CanImportStructures[16], CanUpdateStructuralMetadata[128] |
| 291 | DataImporterRole_U | Underlying WsUserRole[3], CanImportData[32], CanUpdateData[256] |
| 657 | StructureImporterRole | Underlying StructureImporterRole_U[145], CanDeleteStructuralMetadata[512] |
| 1315 | DataImporterRole | Underlying DataImporterRole_U[291], CanDeleteData[1024] |
| 4095 | AdminRole | Underlying DomainUserRole[15], CanModifyStoreSettings[64], StructureImporterRole[657], DataImporterRole[1315], CanReadPitData[2048] |

---

### List of available SDMX artefact types

| **id** | **SDMX artefact type** |
| ------ | ------ |
| 0 | Any |
| 1 | AgencyScheme |
| 2 | Agency |
| 3 | DataProviderScheme |
| 4 | DataProvider |
| 5 | DataConsumerScheme |
| 6 | DataConsumer |
| 7 | OrganisationUnitScheme |
| 8 | OrganisationUnit |
| 9 | CodeList |
| 10 | Code |
| 11 | HierarchicalCodelist |
| 12 | Hierarchy |
| 13 | HierarchicalCode |
| 14 | Categorisation |
| 15 | CategoryScheme |
| 16 | Category |
| 17 | ConceptScheme |
| 18 | Concept |
| 19 | Dsd |
| 20 | DataAttribute |
| 21 | AttributeDescriptor |
| 22 | Dataflow |
| 23 | Dimension |
| 24 | Group |
| 25 | MeasureDimension |
| 26 | TimeDimension |
| 27 | Msd |
| 28 | ReportStructure |
| 29 | MetadataAttribute |
| 30 | Process |
| 31 | ProcessStep |
| 32 | Transition |
| 33 | ProvisionAgreement |
| 34 | Registration |
| 35 | Subscription |
| 36 | AttachmentConstraint |
| 37 | ContentConstraint |
| 38 | StructureSet |
| 39 | StructureMap |
| 40 | ReportingTaxonomyMap |
| 41 | RepresentationMap |
| 42 | CategoryMap |
| 43 | CategorySchemeMap |
| 44 | ConceptSchemeMap |
| 45 | CodeMap |
| 46 | CodeListMap |
| 47 | ComponentMap |
| 48 | ConceptMap |
| 49 | OrganisationMap |
| 50 | OrganisationSchemeMap |
| 51 | HybridCodelistMap |
| 52 | HybridCode |
| 53 | MetadataTargetRegion |
| 54 | Organisation |
| 55 | OrganisationScheme |

---

### Visibility of permissions
Using the **AuthorizationRules** method of the Authorisation-Management web service:
- A user without any CanModifyStoreSettings[64] permission (or member of a group without any CanModifyStoreSettings[64] permission) can only see all those permissions that grant this user with a permission.
- An user with a CanModifyStoreSettings[64] permission (or member of a group with a CanModifyStoreSettings[64] permission) can see all permissions defined on those spaces on which that user has those permissions.

When a user is individually granted with a specific permission, and this user also belongs to a group which has its own permissions, then the **user permissions are cumulative** with its individual permissions and the group permissions he belongs to.  
User permissions are also cumulative with the generic user permission ("*") if any.  

**It is important to check** that the NSI web service configuration parameters (Authentication, Allow anonymous, Authorisation) correspond to one of the following tryptics, knowing that if they match with one of the **bold** tryptics, then the specific authorisations won't be taken into consideration.  


| NSI WS config  |                 |               | 
|----------------|-----------------|---------------|
| Authentication | Allow anonymous | Authorization |
| On             | TRUE            | On            |
| On             | FALSE           | On            |
| Off            | TRUE            | On            |
| Off            | FALSE           | On            |
| **On**         | **TRUE**        | **Off**       |
| On             | FALSE           | Off           |
| **Off**        | **TRUE**        | **Off**       |
| **Off**        | **FALSE**       | **Off**       |

**Example:**  

Consider the following fictive users:

| User                      | Group membership                      | Email           | User Id |
|---------------------------|---------------------------------------|-----------------|---------|
| gen-admin-1               |                                       | fa1@auth.test   | fa1     |
| gen-admin-2               | gen-admin-group                       | fa2@auth.test   | fa2     |
| reset-admin-1             |                                       | ra1@auth.test   | ra1     |
| reset-admin-2             | reset-admin-group                     | ra2@auth.test   | ra2     |
| stable-admin-1            |                                       | sa1@auth.test   | sa1     |
| stable-admin-2            | stable-admin-group                    | sa2@auth.test   | sa2     |
| gen-user-1                |                                       | fu1@auth.test   | fu1     |
| gen-user-2                | gen-user-group                        | fu2@auth.test   | fu2     |
| reset-user-1              |                                       | ru1@auth.test   | ru1     |
| reset-user-2              | reset-user-group                      | ru2@auth.test   | ru2     |
| stable-user-1             |                                       | su1@auth.test   | su1     |
| stable-user-2             | stable-user-group                     | su2@auth.test   | su2     |
| reset-admin-stable-user-2 | reset-admin-group, stable-user-group  | rasu2@auth.test | rasu2   |
| new-user-1                |                                       | nu1@auth.test   | nu1     |

Considering the following fictive authorization rules (one per line), the *visibility of these rules to each user* would be as follow:

| USERMASK           | ISGROUP | DATASPACE | PERMISSION |*gen-admin-1*|*gen-admin-2*|*reset-admin-1*|*reset-admin-2*|*stable-admin-1*|*stable-admin-2*|*gen-user-1*|*gen-user-2*|*reset-user-1*|*reset-user-2*|*stable-user-1*|*stable-user-2*|*reset-admin-stable-user-1*|*new-user-1*|
|--------------------|---------|-----------|------------|--------------|--------------|---------------|---------------|----------------|----------------|-------------|-------------|--------------|--------------|---------------|---------------|---------------------------|------------|
| fa1@auth.test      | 0       | *         | 64       | y            | y            | y             | y             | y              | y              | n           | n           | n            | n            | n             | n             | y                         | n          |
| gen-admin-group   | 1       | *         | 64       | y            | y            | y             | y             | y              | y              | n           | n           | n            | n            | n             | n             | y                         | n          |
| ra1@auth.test      | 0       | reset     | 64       | y            | y            | y             | y             | n              | n              | n           | n           | n            | n            | n             | n             | y                         | n          |
| reset-admin-group  | 1       | reset     | 64       | y            | y            | y             | y             | n              | n              | n           | n           | n            | n            | n             | n             | y                         | n          |
| sa1@auth.test      | 0       | stable    | 64       | y            | y            | n             | n             | y              | y              | n           | n           | n            | n            | n             | n             | n                         | n          |
| stable-admin-group | 1       | stable    | 64       | y            | y            | n             | n             | y              | y              | n           | n           | n            | n            | n             | n             | n                         | n          |
| fu1@auth.test      | 0       | *         | 3          | y            | y            | y             | y             | y              | y              | y           | n           | n            | n            | n             | n             | y                         | n          |
| gen-user-group    | 1       | *         | 3          | y            | y            | y             | y             | y              | y              | n           | y           | n            | n            | n             | n             | y                         | n          |
| ru1@auth.test      | 0       | reset     | 3          | y            | y            | y             | y             | n              | n              | n           | n           | y            | n            | n             | n             | y                         | n          |
| reset-user-group   | 1       | reset     | 3          | y            | y            | y             | y             | n              | n              | n           | n           | n            | y            | n             | n             | y                         | n          |
| su1@auth.test      | 0       | stable    | 3          | y            | y            | n             | n             | y              | y              | n           | n           | n            | n            | y             | n             | n                         | n          |
| stable-user-group  | 1       | stable    | 3          | y            | y            | n             | n             | y              | y              | n           | n           | n            | n            | n             | y             | y                         | n          |
| *                  | 0       | *         | 1          | y            | y            | y             | y             | y              | y              | y           | y           | y            | y            | y             | y             | y                         | y          |
| *                  | 0       | reset     | 3          | y            | y            | y             | y             | y              | y              | y           | y           | y            | y            | y             | y             | y                         | y          |
| *                  | 0       | stable    | 15         | y            | y            | y             | y             | y              | y              | y           | y           | y            | y            | y             | y             | y                         | y          |
