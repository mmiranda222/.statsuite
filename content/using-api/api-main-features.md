---
title: "Main APIs features"
subtitle: 
comments: false
weight: 4100
keywords: [
  'Adding or replacing structures', '#adding-or-replacing-structures',
  'Deleting structures', '#deleting-structures',
  'Support of high-frequency time periods using SDMX annotation', '#support-of-high-frequency-time-periods-using-sdmx-annotation',
  'Loading data or referential metadata', '#loading-data-or-referential-metadata',
  'Data and referential metadata upload queuing mechanism', '#data-and-referential-metadata-upload-queuing-mechanism',
  'Data validation process', '#data-validation-process',
  'Validations in both basic and advanced functions', '#validations-in-both-basic-and-advanced-functions',
  'Basic validations function', '#basic-validations-function',
  'Advanced validations function', '#advanced-validations-function',
  'Management of embargoed data', 'https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/embargo-management',
  'Data storage performance tuning', '#data-storage-performance-tuning',
]

---

#### Table of Content
- [Adding or replacing structures](#adding-or-replacing-structures)
- [Deleting structures](#deleting-structures)
- [Support of high-frequency time periods using SDMX annotation](#support-of-high-frequency-time-periods-using-sdmx-annotation)
- [Loading data or referential metadata](#loading-data-or-referential-metadata)
- [Data and referential metadata upload queuing mechanism](#data-and-referential-metadata-upload-queuing-mechanism)
- [Data validation process](#data-validation-process)
  - [Validations in both basic and advanced functions](#validations-in-both-basic-and-advanced-functions)
  - [Basic validations function](#basic-validations-function)
  - [Advanced validations function](#advanced-validations-function)
- [Management of embargoed data](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/embargo-management)
- [Data storage performance tuning](#data-storage-performance-tuning)

This section describes the main features of the .Stat Suite data APIs for people who want to directly interact with the services behind the applications.  

---

### Adding or replacing structures
The method to add or replace structural resources (maintainable SDMX artefacts) is to POST them (one by one or many at the same time) as a valid SDMX-ML snippet in the request body to the SDMX web service (`structure` path), e.g.

```
POST https://nsi-demo-stable.siscc.org/rest/structure
```

**Important:** Artefacts have to be added all at the same time or one by one, in the appropriate order according to their dependency tree. E.g. in order to add a Dataflow, first or at least at the same time the referenced Codelists, ConceptSchemes and DSD must be added.   
Final artefacts can only be replaced, if the main content is not changed, e.g. only localised names, descriptions and annotations are changed. More important changes, e.g. adding or removing Codes from a Codelist are not permitted.  
Non-final artefacts can only be replaced, if they are not referenced by other artefacts.

If it is required to allow inserting new Codes in final or referenced non-final Codelists (without changing the version number) then the NSI web service configuration parameter "InsertNewItems" can be set to "true": 

```xml
<mapping.store InsertNewItems="true">
```

Note: Using this "InsertNewItems" parameter has not yet been fully tested.

---

### Deleting structures
Structural resources (maintainable SDMX artefacts) can only be deleted **one by one** using the HTTP `DELETE` verb with the full artefact's REST path including all identification information according to the [SDMX Restful API standard](https://github.com/sdmx-twg/sdmx-rest/blob/master/doc/maintenance.md#delete), e.g.

```
DELETE https://nsi-demo-stable.siscc.org/rest//structure/codelist/SDMX/CL_FREQ/1.0
```

**Important:**  
Artefacts can only be deleted if they are currently not beeing referenced by any other structural artefact. Therefore always start by deleting all referencing artefacts before deleting the artefact itself, e.g. in order to delete a Dataflow, first delete any possible Content Constraint that references this Dataflow. Before deleting a Codelist, any Data Structure Definitions referencing it must also be deleted. Proceed recursively in the appropriate order according to the dependency tree.

Deleting a Dataflow will currently not automatically delete the related "MappingSet" information used to bind the underlying uploaded data to the structures. Therefore, before deleting a Dataflow, the related "MappingSet" information needs to be deleted, which is to be done using the Transfer web service method `/cleanup/mappingsets`:

```
DELETE /cleanup/mappingsets
{
   "dataspace": "design",
   "dataflow": "OECD:DF_MEI(1.0)"
}
```

Deleting a Data Structure Definition (DSD) will currently not automatically delete the related data in the Data database, which will cause troubles if you recreate the DSD with different Codelists and try to upload data against the DSD. Therefore, after deleting a DSD, the related data needs to be deleted separately, which is to be done using the Transfer web service method `/cleanup/dsd`:  

```
DELETE /cleanup/dsd
{
   "dataspace": "design",
   "dsd": "OECD:MEI(1.0)"
}
```

Alternatively, the Transfer web service `/cleanup/orphans` method can be used on the whole data space to delete all current orphan database tables, e.g.:

```
DELETE /cleanup/orphans
{
   "dataspace": "design"
}
```

Only afterwards, modified DSDs can be used again to upload data.

---

### Support of high-frequency time periods using SDMX annotation
SDMX time periods with **frequencies higher than daily** (e.g. hours, minutes, seconds) need a special DSD annotation of type **"SUPPORT_DATETIME"**.

```json
        "annotations": [{
                 "type": "SUPPORT_DATETIME"
         }]
```

If this annotation is defined at the DSD level, then uploading data with values for e.g. a time period for minutely frequency will be successful.  
If the user imports data with minutely time periods into a DSD not yet ready for this type of time periods, due to the missing "SUPPORT_DATETIME" annotation, then the transfer (at least in advanced validations) logs an appropriate error message: "_Error found in_ {... info on place of error, like row number, component etc. ...}.  _Datetime time periods are not supported by default. To allow supporting this special type of time periods, you need to add an annotation of type "SUPPORT_DATETIME" to the underlying Data Structure Definition and re-initialise the data DB objects using the transfer method /init/dataflow._"   

**Note** that .Stat Suite officially does not support time periods below seconds (fraction of seconds).

---

### Loading data or referential metadata
Attribute, observation and referential metadata values can be loaded to a data space using the Transfer web service using one of these methods:
- Import (`/import/sdmxFile`, `/import/excel`): Upload data (attribute and observation values) by submitting an SDMX-ML 2.0, SDMX-ML 2.1, SDMX-CSV 1.0 or Excel file (Excel file together with the related table structure "EDD" file) or by a file path or URL reference to an SDMX-ML 2.0, SDMX-ML 2.1 or SDMX-CSV 1.0 file (e.g. from an external SDMX web service), or   
- Upload of referential metadata values by submitting an SDMX-CSV 2.0 file or by a file path or URL reference to an SDMX-CSV 2.0 file (e.g. from an external SDMX web service)  
- Transfer (`/transfer/dataflow`): Copy data (attribute and observation values) and/or referential metadata values from another internal data space (using a more performing DB to DB transmission)

*(Since [April 28, 2022 Release .Stat Suite .NET 8.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-28-2022)*) Data imports from files of SDMX-ML 2.0, SDMX-ML 2.1 and SDMX-CSV 1.0 format support the usage of **`NaN` ("not a number") as missing** values for numerical data types. Those numbers are set to `Null` in the .Stat Core data database. They are only exported again as `NaN` if the corresponding SDMX NSI web service configuration is set.

*(Since [August 24, 2023 Release .Stat Suite .NET 'elote''](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#august-24-2023)*) An optional parameter `sendEmail` is available in all relevant transfer service methods that can send emails. This parameter allows the requester to decide to receive only emails only for unsuccessful requests (`ifError` (2)), `never` (1) or `always` (0). By default, the parameter is set to always send the email (0).

Data can be embargoed using the Point-In-Time parameters of these both methods. For more details see the readme or the Transfer web service swagger file.

**Important:**  
Data uploaded into the fact table of a specific DSD (version) through another dataflow can only be extracted for a dataflow if the DB has previously been initialised for that dataflow. In order to initialize the database objects for a specific dataflow, use the Transfer web service `/init/dataflow` method, e.g.:

```
POST /init/dataflow
{
   "dataspace": "design",
   "dataflow": "OECD:DF_MEI(1.0)"
}
```

#### Data and referential metadata upload queuing mechanism
The transfer web service instance uses a simple queuing mechanism that allows for a limited parallelism of upload transactions. 

All data change requests (without any specific limitation) are added to the queue. A configurable maximum number of requests (see `MaxConcurrentTransactions` parameter [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer#configuration), default: 10) are automatically taken from the top of the queue and executed in parallel as long as they concern transactions for different Data Structure Definitions (DSDs) (fact tables). Requests for DSDs for which another transaction is currently already being executed are automatically re-queued.

**Important:**  
The import queue is currently managed in-memory and **not persisted**. All ongoing or queued requests are lost and need to be resubmitted in case the Transfer service stops.  
Each transfer web service instance (in a web farm) manages its own in-memory queue, and is agnostic of the state of the queue of other instances targeting the same dataspace.  

---

### Data validation process
Since the [April 27, 2021 Release .Stat Suite .NET 6.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-27-2021), the validation process for data uploads is split into **basic** and **advanced** validations.  
**Basic validations** can be performed upon data imports for SDMX compliance, allowed/complete dimensions values, or representation requirements. Basic validations provide simplified error explanations.  
**Advanced validations** such as duplicate coordinates, consistent non-observational values, or mandatory attribute values are part of the transfer method `/{version}/import/sdmxFile`. Advanced validations provide detailed error explanations.

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

#### Validations in both basic and advanced functions
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

#### Basic validations function
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

#### Advanced validations function
- Attribute management
  - Consistency of group attributes maintained
- Data file validations
  - Duplicated coordinate (same coordinate with diff. values)
     - Error msg: Duplicate coordinate [{1}], at row [{0}].	 
  - Text (non-coded) attribute value length exceeds max limit
     - Error msg: Length of {3} attribute's value exceeds the limit ({5} > {6}) at coordinate {1}: {4}.
  - Mandatory attribute with null value and related obs. data in database
     - Error msg: Mandatory {3} attribute value cannot be deleted due to related observation data existing in database for coordinate: {1}.
  - Mandatory attribute with null value and related obs. data in import file
     - Error msg: Mandatory {3} attribute value cannot be deleted due to observation data being loaded for the same coordinate: {1}.
  - Mandatory observation attribute with null (empty) value
     - Error msg: Attribute {3} is mandatory but empty value is provided.
  - Mandatory observation attribute missing (from datafile and no value in DB either)
     - Error msg: {3} is mandatory dataset attribute but has no value provided yet.
  - Mandatory time-series attribute with null (empty) value
     - Error msg: Attribute {3} is mandatory but empty value is provided.
  - Mandatory time-series attribute missing (from datafile and no value in DB either)
     - Error msg: {3} is mandatory dataset attribute but has no value provided yet.
  - Mandatory dimension/group attribute with null (empty) value
     - Error msg: Attribute {3} is mandatory but empty value is provided.
  - Mandatory dimension/group attribute missing (from datafile and no value in DB either)
     - Error msg: {3} is mandatory dataset attribute but has no value provided yet.
  - Mandatory dataset attribute with null (empty) value
     - Error msg: Attribute {3} is mandatory but empty value is provided.
  - Mandatory dataset attribute missing (from datafile and no value in DB either)
     - Error msg: {3} is mandatory dataset attribute but has no value provided yet.
  - Duplicated attribute key (group attributes)
     - Error msg: Values provided multiple times for attribute {3} at key {1}.	 
  - Duplicated dataset attribute
     - Error msg: Values provided multiple times for attribute {3}.
  - TextAttributeValueLengthExceedsMaxLimitWithCoordinate
     - Error msg: Length of {3} attribute's value exceeds the limit ({5} > {6}) at coordinate {1}: {4}.

---

### Data storage performance tuning
> Released with [May 15, 2024 Release .Stat Suite .NET gingerbread](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#may-15-2024)

There are 3 possible index types available to **tune the performance of the tables for a DSD** used to store the observations, attributes and reference metadata attributes *according to the data volume and data usage (amount of read/write operations)* as follow:
- **.Stat default**: Rowstore and nonclustered columnstore indexes `NONCLUSTERED_COLUMNSTORE`: optimal for smaller datasets (less than 1 million observations) or very frequently updated data (more than once per day). The import speed is the best possible. Performance of extractions is similar to the second option for these dataset sizes.
- Clustered columnstore index `CLUSTERED_COLUMNSTORE`: optimal for large datasets (more than 1 million observations) and not frequently updated data (at most once per day). The import speed is reduced but the extraction speed is significantly better for these dataset sizes.
- Clustered columnstore index with "archive" compression `CLUSTERED_COLUMNSTORE_ARCHIVE`: optimal for datasets that are not updated anymore, are rarely accessed and when import and extraction speed are not critical since that may be decreased. This option significantly reduces the necessary disk space. 

The method **{API_VERSION}/tune/dsd** allows applying the `CLUSTERED_COLUMNSTORE` index type or the `CLUSTERED_COLUMNSTORE_ARCHIVE` index type to a DSD in a .Stat CORE data space.   

- Once moved a DSD is tuned with one of the clustered columnstore index types, it is not possible to revert it back to the `NONCLUSTERED_COLUMNSTORE` index type.  
- This method cannot be used for DSDs in data spaces [configured](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer#spacesinternal) with `Archive=true`, because all DSDs in that space automatically use the `CLUSTERED_COLUMNSTORE_ARCHIVE` index type.
- The `CLUSTERED_COLUMNSTORE_ARCHIVE` index type doesn't use a primary key when the data space is [configured](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer#spacesinternal) with `KeepHistory=false`, because the primary key would significantly increase the required disk space and should not be needed if updates (and unicity checks) aren't done anymore. However, `KeepHistory=true` requires the usage of a primary key.
- This method may require a long processing time to change the index type, thus it is asyncronous and queued. Once the request is processed, the user receives an email with the outcome.

The method **{API_VERSION}/tune/info** allows retrieving the information about the currently applied index type for a given DSD in a .Stat CORE data space.  

**Note:**  
  
These methods require the "manage structures" permission on the DSD, representing the following granular permissions:  
- read structures
- insert structures
- update structures
- delete structures;  

If this is not the case then the transfer responds with HTTP 403 Forbidden.

For more details about `/tune/dsd` and `/tune/info` methods see **[here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer#post-versiontunedsd--tune-the-dsd-with-the-selected-indextype)**.