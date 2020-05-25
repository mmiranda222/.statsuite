---
title: "Delete data structures"
subtitle: 
comments: false
weight: 250

---

With the DLM, data structures can be deleted separately for each structure object (artifact), e.g. a particular Dataflow, Codelist or Data Structure Definition, using the contextual 'delete structure' menu:

![DLM delete structures](/using-dlm/files/delete_structures.png)  

Data structures can also be deleted directly through the SDMX (NSI) web service API, using the DELETE HTTP verb with the appropriate resource URL. Example of deleting a Codelist:

```bash
curl -X DELETE http://nsi-stable-siscc.redpelicans.com/rest/codelist/OECD/COUNTRY/1.0.0
```

**Important:** Artifacts have to be deleted one by one, and in the appropriate order according to their dependency tree. E.g. in order to delete a Dataflow, first any possible Content Constraint that references this Dataflow must be deleted. Before deleting a Codelist, any Data Structure Definitions referencing it must also be deleted.  

--------------------------------
**Current limitation**:   
When a Data Structure Definition (DSD) is deleted using the *SDMX* (NSI) web service, then the related database objects for the storage of observations are not currently automatically deleted. 

**Work-around**:  
The storage of related observations can be manually cleaned up by calling the Transfer service **/cleanup/dsd** method with the appropriate parameters.  

--------------------------------

**Future outlook**:  
It is also planed to enhance the DLM, so that the deletion of a Data Structure Definition in the DLM will automatically call this method and make the cleanup of the storage of the related observations. Approximate delivery: 2020  
In the further future, it is planed to automatically trigger the cleanup directly from the *SDMX* (NSI) web service call (service-bus feature). Approximate delivery: 2021
