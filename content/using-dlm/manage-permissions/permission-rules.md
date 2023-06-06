---
title: "Manage user access"
title: "Permission business rules"
subtitle: 
comments: false
weight: 220
weight: 230
keywords: [
  'Introduction', '#introduction',
  'List of available permissions', '#list-of-available-permissions',
  'Basic permissions', '#basic-permissions',
  'Combined permissions', '#combined-permissions',
  'List of available SDMX artefact types', '#list-of-available-sdmx-artefact-types',
  'Visibility of permission rules', '#visibility-of-permission-rules',
]
---

#### Table of Content
- [Introduction](#introduction)
- [List of available permissions](#list-of-available-permissions)
  - [Basic permissions](#basic-permissions)
  - [Combined permissions](#combined-permissions)
- [List of available SDMX artefact types](#list-of-available-sdmx-artefact-types)
- [Visibility of permission rules](#visibility-of-permission-rules)

---

### Introduction
Currently, the Data Lifecycle Manager does not include yet user-interface features to manage user access rights to the content of the .Stat Suite data spaces. Therefore, user permissions still need to be entered, updated or deleted using the AuthorisationManagement web service. The following pieces of information give more information on the usage and parameters of this API.

Please see here a Demo version of the AuthorisationManagement web service: https://authz-demo.siscc.org/swagger/index.html
User permissions managed in the user interface of the DLM are using the [Authorisation Management](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management) web service. The following pieces of information provide more details on the permission definitions, and the usage of the API. You can also see a Demo version of the Authorisation Management web service: https://authz-demo.siscc.org/swagger/index.html

Access permissions can be defined individually for the following contexts:
 - per user (e-mail, e.g. user@domain.org), group of users (Project_Team) or any user (*)
 - per data space (e.g. Dissemination) or for all spaces managed within an instance (*)
 - per SDMX artefact type (e.g. Dsd, Dataflow) or any type (0)
 - per SDMX artefact maintenance agency (e.g. SDMX, MY_ORG) or any agency (*)
 - per SDMX artefact ID (e.g. DATAFLOW_ID) or any ID (*)
 - per SDMX artefact version (e.g. 1.0) or any version (*)
 - permission type (e.g. 3)

 For the list of available **Permission types** and **SDMX artefact types**, pleasse see below.
For the list of available **Permission types** and **SDMX artefact types**, please see below.

 In order to be able to use the AuthorisationManagement web service, the user needs to be authenticated and to provide a valid access token.
In order to be able to use the AuthorisationManagement web service, the user needs to be authenticated and to provide a valid access token.

---

### List of available permissions
#### Basic permissions
The basic permissions listed below are permissions associated to a single and specific action.  

| **id** | **Permission** | **Definition** |
| ------ | ------ | ------ |
| 1 | CanReadStructuralMetadata | Can read structural metadata attribute |
| 2 | CanReadData | Can read data attribute |
| 4 | CanIgnoreProductionFlag | Can ignore production flag attribute |
| 8 | CanPerformInternalMappingConfig | Can perform internal mapping configuration attribute |
| 16 | CanImportStructures | Can import structures attribute |
| 32 | CanImportData | Can import data attribute |
| 64* | CanModifyStoreSettings | Can modify store settings attribute |
| 128 | CanUpdateStructuralMetadata | Can update structural metadata attribute |
| 256 | CanUpdateData | Can update data |
| 512 | CanDeleteStructuralMetadata | Can delete structural metadadata attribute |
| 1024 | CanDeleteData | Can delete data |
| 2048 | CanReadPitData | Can read Point-in-Time (PiT) Data |

**Permission id:64 is implemented (as provided by the Eurostat's source code) but not yet used in the .Stat Suite context.*  
  
>**Note** that since [release .NET 6.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#march-05-2021), **permission id:0 is no longer supported** in .Stat Suite.

#### Combined permissions
Combined permissions are the combination of several basic permissions.  
A combination of permissions **must be** a combination of basic permissions as described in the table above, obtained by addition. For example, **adding together CanReadStructuralMetadata [1] and CanReadData [2] to get 3**, will create a combined permission that has the ability to read both structural metadata and data.  
Below is a table of the most used combinations, but others are acceptable.  

| **id** | **Permission** | **Definition** |
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

### Visibility of permission rules
Using the AuthorizationRules method of the AuthorisationManagement web service:
- A non-admin user (or member of a non-admin group) can only see all those permissions that grant this user with a permission.
- An admin user (or member of an admin group) - with admin permission `id:4095` - can see all permissions defined on those spaces on which that user has admin rights.

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
| full-admin-1              |                                       | fa1@auth.test   | fa1     |
| full-admin-2              | full-admin-group                      | fa2@auth.test   | fa2     |
| reset-admin-1             |                                       | ra1@auth.test   | ra1     |
| reset-admin-2             | reset-admin-group                     | ra2@auth.test   | ra2     |
| stable-admin-1            |                                       | sa1@auth.test   | sa1     |
| stable-admin-2            | stable-admin-group                    | sa2@auth.test   | sa2     |
| full-user-1               |                                       | fu1@auth.test   | fu1     |
| full-user-2               | full-user-group                       | fu2@auth.test   | fu2     |
| reset-user-1              |                                       | ru1@auth.test   | ru1     |
| reset-user-2              | reset-user-group                      | ru2@auth.test   | ru2     |
| stable-user-1             |                                       | su1@auth.test   | su1     |
| stable-user-2             | stable-user-group                     | su2@auth.test   | su2     |
| reset-admin-stable-user-2 | reset-admin-group, stable-user-group  | rasu2@auth.test | rasu2   |
| new-user-1                |                                       | nu1@auth.test   | nu1     |

Considering the following fictive authorization rules (one per line), the *visibility of these rules to each user* would be as follow:

| USERMASK           | ISGROUP | DATASPACE | PERMISSION |*full-admin-1*|*full-admin-2*|*reset-admin-1*|*reset-admin-2*|*stable-admin-1*|*stable-admin-2*|*full-user-1*|*full-user-2*|*reset-user-1*|*reset-user-2*|*stable-user-1*|*stable-user-2*|*reset-admin-stable-user-1*|*new-user-1*|
|--------------------|---------|-----------|------------|--------------|--------------|---------------|---------------|----------------|----------------|-------------|-------------|--------------|--------------|---------------|---------------|---------------------------|------------|
| fa1@auth.test      | 0       | *         | 4095       | y            | y            | y             | y             | y              | y              | n           | n           | n            | n            | n             | n             | y                         | n          |
| full-admin-group   | 1       | *         | 4095       | y            | y            | y             | y             | y              | y              | n           | n           | n            | n            | n             | n             | y                         | n          |
| ra1@auth.test      | 0       | reset     | 4095       | y            | y            | y             | y             | n              | n              | n           | n           | n            | n            | n             | n             | y                         | n          |
| reset-admin-group  | 1       | reset     | 4095       | y            | y            | y             | y             | n              | n              | n           | n           | n            | n            | n             | n             | y                         | n          |
| sa1@auth.test      | 0       | stable    | 4095       | y            | y            | n             | n             | y              | y              | n           | n           | n            | n            | n             | n             | n                         | n          |
| stable-admin-group | 1       | stable    | 4095       | y            | y            | n             | n             | y              | y              | n           | n           | n            | n            | n             | n             | n                         | n          |
| fu1@auth.test      | 0       | *         | 3          | y            | y            | y             | y             | y              | y              | y           | n           | n            | n            | n             | n             | y                         | n          |
| full-user-group    | 1       | *         | 3          | y            | y            | y             | y             | y              | y              | n           | y           | n            | n            | n             | n             | y                         | n          |
| ru1@auth.test      | 0       | reset     | 3          | y            | y            | y             | y             | n              | n              | n           | n           | y            | n            | n             | n             | y                         | n          |
| reset-user-group   | 1       | reset     | 3          | y            | y            | y             | y             | n              | n              | n           | n           | n            | y            | n             | n             | y                         | n          |
| su1@auth.test      | 0       | stable    | 3          | y            | y            | n             | n             | y              | y              | n           | n           | n            | n            | y             | n             | n                         | n          |
| stable-user-group  | 1       | stable    | 3          | y            | y            | n             | n             | y              | y              | n           | n           | n            | n            | n             | y             | y                         | n          |
| *                  | 0       | *         | 1          | y            | y            | y             | y             | y              | y              | y           | y           | y            | y            | y             | y             | y                         | y          |
| *                  | 0       | reset     | 3          | y            | y            | y             | y             | y              | y              | y           | y           | y            | y            | y             | y             | y                         | y          |
| *                  | 0       | stable    | 15         | y            | y            | y             | y             | y              | y              | y           | y           | y            | y            | y             | y             | y                         | y          |
