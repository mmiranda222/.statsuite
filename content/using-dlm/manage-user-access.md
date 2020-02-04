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
| 3 | WsUserRole | Underlying  <br> . CanReadStructuralMetadata,  <br> . CanReadData |
| 4 | CanIgnoreProductionFlag | Can ignore production flag attribute |
| 8 | CanPerformInternalMappingConfig | Can perform internal mapping configuration attribute |
| 15 | DomainUserRole | Underlying <br> . WsUserRole, <br> . CanIgnoreProductionFlag, <br> . CanPerformInternalMappingConfig |
| 16 | CanImportStructures | Can import structures attribute |
| 32 | CanImportData | Can import data attribute |
| 64 | CanModifyStoreSettings | Can modify store settings attribute |
| 128 | CanUpdateStructuralMetadata | Can update structural metadata attribute |
| 145 | StructureImporterRole_U | Underlying <br> . CanReadStructuralMetadata, <br> . CanImportStructures, <br> . CanUpdateStructuralMetadata |
| 256 | CanUpdateData | Can update data |
| 291 | DataImporterRole_U | Underlying <br> . WsUserRole, <br> . CanImportData, <br> . CanUpdateData |
| 512 | CanDeleteStructuralMetadata | Can delete structural metadadata attribute |
| 657 | StructureImporterRole | Underlying <br> . StructureImporterRole_U, <br> . CanDeleteStructuralMetadata |
| 1024 | CanDeleteData | Can delete data |
| 1315 | DataImporterRole | Underlying <br> . DataImporterRole_U, <br> . CanDeleteData |
| 2047 | AdminRole | Underlying <br> . DomainUserRole, <br> . CanModifyStoreSettings, <br> . StructureImporterRole, <br> . DataImporterRole |


