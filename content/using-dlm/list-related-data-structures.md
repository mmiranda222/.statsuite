---
title: "List related data structures"
subtitle: 
comments: false
weight: 255

---

> Released in [January 21, 2021 Release .Stat Suite JS 7.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#january-21-2021-js)

To visualise and discover the dependencies between data structure artefacts, e.g. which Dataflows reference a particular Data Structure Definition, or which Codelists are being used by that Data Structure Definition, the contextual 'List related structures' menu can be used:

![DLM list related structures](/dotstatsuite-documentation/images/dlm-list-related-structures.png)  

### Mechanism to retrieve close structural artefact dependencies
Recursively starting from the selected artefact, the DLM finds and **lists in a DLM dependency tree all** the related artefacts of the current artefact using the query syntax: `http://sdmx-service-root/[ArtefactType]/[Agency]/[Id]/[Version]?references=all`, e.g. a query for a dataflow would return also the related codelists, conceptschemes, DSD and contentconstraints.  
  1) If the DLM dependency tree contains any other artefacts than the original one (because there are related artefacts) then the DLM verifies if those are being referenced by artefacts that are not in the list (through **executing the query** `http://sdmx-service-root/[ArtefactType]/[Agency]/[Id]/[Version]?references=parents` for each of those), e.g. the original DSD referenced codelist might also be referenced by another DSD.  
  2) if any under (a) analysed artefacts is being referenced by non-listed artefacts, and this analysed artefact is at a lower DLM-tree-level than the original artefact (means "is referencing" the original artefact), then the DLM **adds these yet non-listed artefacts to the list** (at the appropriate level) and **recursively re-executes** the query `http://sdmx-service-root/[ArtefactType]/[Agency]/[Id]/[Version]?references=parents` on all newly added artefacts to find and add also all its DLM-tree lower-level artefacts until all the lowest reachable DLM-tree-leaves have been added to the list.  

### Display of dependency tree
The DLM displays in a popup all the listed artefacts using a tree control with vertical scroll, showing the artefact type, name, ID, version, "finality" and agency (using the standard DLM styles):

![DLM list related structures](/dotstatsuite-documentation/images/dlm-list-related-structures-tree-example.png)  

The popup can be closed using the window close button.
