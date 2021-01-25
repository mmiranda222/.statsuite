---
title: "Using .Stat Suite APIs"
subtitle: 
comments: false
weight: 4000

---

#### Table of Content
- [Adding or replacing structures](#adding-or-replacing-structures)
- [Adding data](#adding-data)
- [Deleting structures](#deleting-structures)
- [Known issues around replaced structures and subsequent data imports](#known-issues-around-replaced-structures-and-subsequent-data-imports)
- [Management of embargoed data](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/embargo-management.md)

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
