---
title: "Manage user access"
subtitle: 
comments: false
weight: 220

---

### List of available permissions

| **id** | **Permission** | **Definition** |
| ------ | ------ | ------ |
| 0 | None | None |
| 1 | CanReadStructuralMetadata | Can read structural metadata attribute |
| 2 | CanReadData | Can read data attribute |
| 3 | WsUserRole | Underlying CanReadStructuralMetadata, CanReadData |
| 4 | CanIgnoreProductionFlag | Can ignore production flag attribute |
| 8 | CanPerformInternalMappingConfig | Can perform internal mapping configuration attribute |
| 15 | DomainUserRole | Underlying WsUserRole, CanIgnoreProductionFlag, CanPerformInternalMappingConfig |
| 16 | CanImportStructures | Can import structures attribute |
| 32 | CanImportData | Can import data attribute |
| 64 | CanModifyStoreSettings | Can modify store settings attribute |
| 128 | CanUpdateStructuralMetadata | Can update structural metadata attribute |
| 145 | StructureImporterRole_U | Underlying CanReadStructuralMetadata, CanImportStructures, CanUpdateStructuralMetadata |
| 256 | CanUpdateData | Can update data |
| 291 | DataImporterRole_U | Underlying WsUserRole, CanImportData, CanUpdateData |
| 512 | CanDeleteStructuralMetadata | Can delete structural metadadata attribute |
| 657 | StructureImporterRole | Underlying StructureImporterRole_U, CanDeleteStructuralMetadata |
| 1024 | CanDeleteData | Can delete data |
| 1315 | DataImporterRole | Underlying DataImporterRole_U, CanDeleteData |
| 2047 | AdminRole | Underlying DomainUserRole, CanModifyStoreSettings, StructureImporterRole, DataImporterRole |


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

