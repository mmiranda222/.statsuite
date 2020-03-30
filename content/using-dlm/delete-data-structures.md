---
title: "Delete data structures"
subtitle: 
comments: false
weight: 250

---

With the DLM, data structures can be deleted separately for each structure object (artefact), e.g. a particular dataflow, codelist or datastructuredefinition, using the contextual 'delete structure' menu:

![DLM delete structures](/content/delete_structures.png)  

Data structures can also be deleted directly through the SDMX (NSI) web service API, using the DELETE http verb with the appropriate resource URL.  

**Important:** Data structure objects (artefacts) have to be deleted one by one, and in the appropriate order according to their dependency. E.g. in order to delete a dataflow, first any possible contentconstraint that references this dataflow must be deleted. Before deleting a datastructuredefinition, all referencing codelists, conceptschemes and dataflows must be deleted.  

--------------------------------
**Current limitation**:   
When a datastructuredefinition (DSD) is deleted using the SDMX (NSI) web service, then the related database objects for the storage of observations are currently not automatically deleted. 

**Work-around**:  
The storage of related observations can be manually cleaned up by calling the Transfer service **/cleanup/dsd** method with the appropriate parameters.  

--------------------------------

**Future outlook**:  
It is also planed to enhance the DLM, so that the deletion of a datastructuredefinition in the DLM will automatically call this method and make the cleanup of the storage of the related observations. Approximate delivery: 2020  
In the further future, it is planed to automatically trigger the cleanup directly from the SDMX (NSI) web service call (service-bus feature). Approximate delivery: 2021