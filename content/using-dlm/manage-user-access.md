---
title: "Manage user access"
subtitle: 
comments: false
weight: 220

---

### List of available permissions
#### Basic permissions
The basic permissions listed below are permissions associated to a single and specific action.

| **id** | **Permission** | **Definition** |
| ------ | ------ | ------ |
| 0 | None | None |
| 1 | CanReadStructuralMetadata | Can read structural metadata attribute |
| 2 | CanReadData | Can read data attribute |
| 4 | CanIgnoreProductionFlag | Can ignore production flag attribute |
| 8 | CanPerformInternalMappingConfig | Can perform internal mapping configuration attribute |
| 16 | CanImportStructures | Can import structures attribute |
| 32 | CanImportData | Can import data attribute |
| 64 | CanModifyStoreSettings | Can modify store settings attribute |
| 128 | CanUpdateStructuralMetadata | Can update structural metadata attribute |
| 256 | CanUpdateData | Can update data |
| 512 | CanDeleteStructuralMetadata | Can delete structural metadadata attribute |
| 1024 | CanDeleteData | Can delete data |

#### Combined permissions
Combined permissions are the combination of several basic permissions.   
A combination of permissions **must** be a combination of basic permissions as described in the table above, obtained by addition. For example, adding together CanReadStructuralMetadata [1] and CanReadData [2] to get 3, creates a combined permission that has the ability to read both structural metadata and data. 
Below is a table of the most used combinations, but others are acceptable.  
 
| **id** | **Permission** | **Definition** |
| ------ | ------ | ------ |
| 3 | WsUserRole | Underlying CanReadStructuralMetadata[1], CanReadData[2] |
| 15 | DomainUserRole | Underlying WsUserRole[3], CanIgnoreProductionFlag[4], CanPerformInternalMappingConfig[8] |
| 145 | StructureImporterRole_U | Underlying CanReadStructuralMetadata[1], CanImportStructures[16], CanUpdateStructuralMetadata[128] |
| 291 | DataImporterRole_U | Underlying WsUserRole[3], CanImportData[32], CanUpdateData[256] |
| 657 | StructureImporterRole | Underlying StructureImporterRole_U[145], CanDeleteStructuralMetadata[512] |
| 1315 | DataImporterRole | Underlying DataImporterRole_U[657], CanDeleteData[1024] |
| 2047 | AdminRole | Underlying DomainUserRole[15], CanModifyStoreSettings[64], StructureImporterRole[657], DataImporterRole[1315] |


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

