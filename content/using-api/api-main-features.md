---
title: "Main APIs features"
subtitle: 
comments: false
weight: 4500
keywords: [
  'Adding or replacing structures', '#adding-or-replacing-structures',
  'Adding data', '#adding-data',
  'Data validation process', '#data-validation-process',
  'Deleting structures', '#deleting-structures',
  'Known issues around replaced structures and subsequent data imports', '#known-issues-around-replaced-structures-and-subsequent-data-imports',
  'Management of embargoed data', 'https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/embargo-management',
]

---

#### Table of Content
- [Adding or replacing structures](#adding-or-replacing-structures)
- [Adding data](#adding-data)
- [Data validation process](#data-validation-process)
- [Deleting structures](#deleting-structures)
- [Known issues around replaced structures and subsequent data imports](#known-issues-around-replaced-structures-and-subsequent-data-imports)
- [Management of embargoed data](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/embargo-management)

This section describes the main features of the .Stat Suite data APIs for people who want to directly interact with the services behind the applications.  

---

### Adding or replacing structures

The simplest method to add or replace structural resources (maintainable SDMX artefacts) is to POST them (one by one or many at the same time) as a valid SDMX-ML snippet in the request body to the SDMX web service (`structure` path), e.g.

```
POST http://nsi-stable-siscc.redpelicans.com/rest/structure
```

**Important:** Artifacts have to be added all at the same time or one by one, in the appropriate order according to their dependency tree. E.g. in order to add a Dataflow, first or at least at the same time the referenced Codelists, ConceptSchemes and DSD must be added.   
Final artefacts can only be replaced, if the main content is not changed, e.g. only localised names, descriptions and annotations are changed. More important changes, e.g. adding or removing Codes from a Codelist are not permitted.  
Non-final artefacts can only be replaced, if they are not referenced by other artefacts.

If it is required to allow inserting new Codes in final or referenced non-final Codelists (without changing the version number) then the NSI web service configuration parameter "InsertNewItems" can be set to "true": 

```xml
<mapping.store InsertNewItems="true">
```

Note: Using this "InsertNewItems" parameter has not yet been fully tested.

---

### Adding data

Data can be added to a data space using the Transfer web service using one of these methods:
- Import (`/import/sdmxFile`, `/import/excel`): Upload data from an SDMX file, Excel file (together with the related table structure "EDD" file) or an external SDMX web service
- Transfer (`/transfer/dataflow`): Copy data from another internal data space (using a more performing DB to DB transmission)

Data can be embargoed using the Point-In-Time parameters of these both methods. For more details see the readme or the Transfer web service swagger file.

**Important:** 
Data uploaded into the fact table of a specific DSD (version) through another dataflow can only be extracted for a dataflow if the DB has previously been initialised for that dataflow. In order to initialize the database objects for a specific dataflow, use the Transfer web service `/init/dataflow` method, e.g.:

```
curl -X POST "http://transfer-siscc.redpelicans.com/1.2/init/dataflow" -H "accept: application/json" -H "Content-Type: multipart/form-data" -F "dataspace=MyDataspace" -F "dataflow=AGENCYID:DFID(1.0.0)"
```

---

### Data validation process
Since the [April 27, 2021 Release .Stat Suite .NET 6.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-27-2021), the validation process for data uploads is split into **basic** and **advanced** validations.  
Basic validations can be performed upon data imports for SDMX compliance, allowed/complete dimensions values, or representation requirements. Basic validations provide simplified error explanations.  
Advanced validations such as duplicate coordinates, consistent non-observational values, or mandatory attribute values have been moved to a new transfer method (/{version}/import/sdmxFile & validationType (0/1)). Advanced validations provide detailed error explanations.

In details, the API methods of the core-transfer service used for the data validation process:
  - Parameter `_validationType_` for basic or advanced validation (default basic) to the functions:
    - `/import/sdmxFileImport` 
    - `/import/excel`
    - `/transfer/dataflow`
  - basic validation allows to:
    - report multiple values for group and series attributes.
    - report null values to mandatory attributes.
    - when there are duplicates in the import, a single error message (about duplicates) will be included in the report. 
  - full validation allows to:
    - validate that the outcome of an import will result in consistency of values for group and series attributes.
    - validate that the outcome of an import will result in all mandatory attributes to have a value.
    - when there are duplicates in the import, every duplicate issue will be included in the report. 

- Additionnal validation methods:
  - 3 validation functions, each one corresponding to each different import format:
    - `/validate/sdmxFileImport` 
    - `/validate/excel`
    - `/validate/transferDataflow`
  - These methods perform an advanced validation, as described above, **but without** merging the staging data into the existing one (meaning no data import).

**Validations in both basic and advanced functions**  
- Attribute management
  - Consistency of dataset attributes maintained
  - Consistency of dimensions attributes maintained 
- Data file validations
  - Invalid dimension id (not in dsd)
     - no request ID initiated and error log is directly displayed in the Swagger Response body (400 Error bad request).
  - Invalid dataset attribute id (not in dsd)
     - Error msg: The attribute {0} does not belong to dataset {1}. Error msg 2: Attribute {3} not defined in DSD {4}.
  - Invalid dimension attribute id (not in dsd)
     - Error msg: The attribute {0} does not belong to dataset {1}. Error msg 2: Attribute {3} not defined in DSD {4}.
  - Invalid group attribute id  (not in dsd)
     - Error msg: The attribute {0} does not belong to dataset {1}. Error msg 2: Attribute {3} not defined in DSD {4}.
  - Invalid observation attribute id  (not in dsd)
     - Error msg: The attribute {0} does not belong to dataset {1}. Error msg 2: Attribute {3} not defined in DSD {4}.
  - Invalid dimension code in file (not in codelist)
     - Error msg: Code [{0}] not found for dimension {1}. Error msg 2: Unknown code for component {3} at key {1} : {4}.
  - Allowed content constraint violation (defined on dataflow)
     - Error msg: Constraint violation for [{3}], at row [{0}].
  - Null value (no code provided for dimension in data file)
     - Error msg: Missing member for [{3}] dimension, at row [{0}].
  - Missing dimension from series key
     - Error msg: Row {x} -  Column {DIM ID}: Column with unknown code.
  - Invalid value format (e.g. string)
     - Error msg: Observation value format error [{2}], at row [{0}]
  - Invalid attribute code in file  (not in codelist)
     - Error msg: Unknown code for attribute {3} at key {1} : {4}.
  - Attribute reported at multiple levels (series and observation)
     - `Validation is removed`, now all attributes are seemed by the validator as reported at observation level.
  - Observation attribute reported at dataset level in datafile
     - `Validation is removed`, now all attributes are seemed by the validator as reported at observation level.
  - Observation attribute reported at keyables (group or series)
     - `Validation is removed`, now all attributes are seemed by the validator as reported at observation level.
  - Attribute reported at multiple levels (dataset and observation)
     - `Validation is removed`, now all attributes are seemed by the validator as reported at observation level.
  - Dataset attribute value reported at keyables
     - `Validation is removed`, now all attributes are seemed by the validator as reported at observation level.
  - Dimension/group attribute reported at dataset level
     - `Validation is removed`, now all attributes are seemed by the validator as reported at observation level.
  - Wrong set of dimensions in key of keyable
     - Error msg: Attribute {3} is reported at a keyable where the partial keys are not matching the attribute definition in DSD. Key {4} reported but combination of {5} expected.

**Basic validations function**  
- Data file validations  
  - Duplicated coordinate (same coordinate with diff. values)
     - *Generic error about duplicated rows found in the import file*
  - Text (non-coded) attribute value length exceeds max limit
     - *Generic error about  the size of the value provided for one attribute exceeds the max limit of {}*
  - Mandatory attribute with null value
     - `Validation is removed`, mandatory attributes might not be reported.
  - Mandatory dimension/group attribute missing
     - `Validation is removed`, mandatory attributes might not be reported.
  - Mandatory attribute with null value and related obs. data in database
     - `Validation is removed`
  - Mandatory attribute with null value and related obs. data in import file
     - `Validation is removed`, mandatory attributes might not be reported.
  - Duplicated attribute key (group attributes)
     - `Validation is removed`
  - TextAttributeValueLengthExceedsMaxLimitWithCoordinate
     - *Generic error about the size of the value provided for one attribute exceeds the max limit of {0}*
  - Mandatory dataset attribute with null (empty) value
     - `Validation is removed`, mandatory attributes might not be reported.
  - Mandatory dataset attribute missing (from datafile and no value in DB either)
     - `Validation is removed`, mandatory attributes might not be reported.
  - Duplicated dataset attribute
     - *Generic error about duplicate dataset attributes found in the import*

**Advanced validations function**  
- Attribute management
  - Consistency of group attributes maintained
- Data file validations
  - Duplicated coordinate (same coordinate with diff. values)
     - Error msg: Duplicate coordinate [{1}], at row [{0}].	 
  - Mandatory attribute with null value
     - Error msg: Attribute {3} is mandatory but empty value is provided at key {1}.
  - Text (non-coded) attribute value length exceeds max limit
     - Error msg: Length of {3} attribute's value exceeds the limit ({5} > {6}) at coordinate {1}: {4}.
  - Mandatory dimension/group attribute missing
     - Error msg: Mandatory attribute {3} has no value provided but observation data is being loaded for coordinate: {1}.
  - Mandatory attribute with null value and related obs. data in database
     - Error msg: Mandatory {3} attribute value cannot be deleted due to related observation data existing in database for coordinate: {1}.
  - Mandatory attribute with null value and related obs. data in import file
     - Error msg: Mandatory {3} attribute value cannot be deleted due to observation data being loaded for the same coordinate: {1}.
  - Duplicated attribute key (group attributes)
     - Error msg: Values provided multiple times for attribute {3} at key {1}.	 
  - TextAttributeValueLengthExceedsMaxLimitWithCoordinate
     - Error msg: Length of {3} attribute's value exceeds the limit ({5} > {6}) at coordinate {1}: {4}.
  - Mandatory dataset attribute with null (empty) value
     - Error msg: Attribute {3} is mandatory but empty value is provided.
  - Mandatory dataset attribute missing (from datafile and no value in DB either)
     - Error msg: {3} is mandatory dataset attribute but has no value provided yet.
  - Duplicated dataset attribute
     - Error msg: Values provided multiple times for attribute {3}.

---

### Deleting structures

Individual structural resources can be deleted using the specific resource URL (including the artefact's agency, ID and version) and the HTTP verb `DELETE`, e.g.:

```
curl -X DELETE http://nsi-stable-siscc.redpelicans.com/rest/codelist/OECD/COUNTRY/1.0.0
```

**Important:** Artifacts have to be deleted one by one, and in the appropriate order according to their dependency tree. E.g. in order to delete a Dataflow, first any possible Content Constraint that references this Dataflow must be deleted. Before deleting a Codelist, any Data Structure Definitions referencing it must also be deleted.

---

### Known issues around replaced structures and subsequent data imports

If you have used the API to load data against a DSD, then deleted it and its associated codelists, and recreated them with different items, attempts to load data against the DSD will fail (with complaints about detecting changes in the codelist).

In order to solve this problem, once the DSD and related (non-referenced) codelists have been deleted, the related database objects for the storage of observations are to be cleaned up by calling the Transfer service `/cleanup/dsd` method with the appropriate parameters, e.g.:

```
curl -X DELETE "http://transfer-siscc.redpelicans.com/1.2/cleanup/dsd" -H "accept: application/json" -H "Content-Type: multipart/form-data" -d {"dataspace":"MyDataspace","dsd":"AGENCYID:DSDID(1.0.0)"}
```

Alternatively, the Transfer service `/cleanup/orphans` method can be used to delete all current orphan database tables, e.g.:

```
curl -X DELETE "http://transfer-siscc.redpelicans.com/1.2/cleanup/orphans" -H "accept: application/json" -H "Content-Type: multipart/form-data" -d {"dataspace":"MyDataSpace"}
```

Only afterwards, modified structures and the related data can be uploaded again.

