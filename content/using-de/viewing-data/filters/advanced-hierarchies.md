---
title: "Advanced hierarchies"
subtitle: 
comments: false
weight: 2200
keywords: [
  'Introduction and prerequisite', '#introduction-and-prerequisite',
  'Advanced hierarchies in filters and table display', '#advanced-hierarchies-in-the-filters-and-table-display',
]
---

> Introduced with [August 3, 2022 Release .Stat Suite JS quark](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#august-3-2022)

#### Table of Content
- [Introduction and prerequisite](#introduction-and-prerequisite)
- [Advanced hierarchies in the filters and table display](#advanced-hierarchies-in-the-filters-and-table-display)

---

### Introduction and prerequisite
The use of *SDMX* 2.1 **Hierarchical Codelists** (HCL) allows changing the display of dimensions from a simple (mono-parent) and codelist-dependent hierarchy to an advanced (multi-parent) and context-specific (dsd/dataflow, dimension, language) hierarchy.

The application of advanced hierarchies is defined through a DSD and/or dataflow *SDMX* annotation of type **HIER_CONTEXT** (see [reference](https://sdmx.org/wp-content/uploads/Guidelines-on-the-use-of-SDMX-Annotations.pdf *- this is a work-around for the not yet available SDMX 3.0 HierarchyAssociation artefact*). In case both annotations are present, then the dataflow annotation takes precedence over the DSD annotation.  
The (comma-separated) link(s) between the dimension and the hierarchy in the hierarchical codelist artefact is provided in the Annotation Title for non-localised hierarchies, and in the Annotation Text for localised hierarchies in the following form:  
<component id>:<HCL agency>:<HCL id>(<HCL version>).<hierarchy id>,<component id>:<HCL agency>:<HCL id>(<HCL version>).<hierarchy id>,...

**Example:**  
`REF_AREA:OECD:HCL_TEST(1.0).CONT_EN` will provide the alternative hierarchy defined in artefact with URN `urn:sdmx:org.sdmx.infomodel.codelist.Hierarchy=REF_AREA:OECD:HCL_TEST(1.0).CONT_EN` for the REF_AREA dimension for the given dataflow or for all dataflows of the given DSD.

**file samples:**  
[Here attached](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/blob/master/content/HCL_-_Hierarchy_by_continents.xml) hierarchies "CONT_EN" and "CONT_FR" are linked in the corresponding dataflow or dsd annotation to the REF_AREA dimension:
- Hierarchy "CONT_EN": first World then OECD, all others are not displayed because out of validity date
- Hierarchy "CONT_FR": first OECD then World, all others are not displayed because out of validity date

[Here attached](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/blob/master/content/TEST-DF_AREA-1.0-all.xml) are examples of dataflows and DSD with localised or non-localised annotations of type `HIER_CONTEXT`.

---

### Advanced hierarchies in the filters and table display
In the Data Explorer context, these advanced hierarchies will overwrite the hierarchy and order of codes as defined in the original codelists in a specific context (dsd/dataflow+dimension+language). For example, for a specific dimension the original hierarchy defined in the "REF_AREA" codelist can be replaced by hierarchies better representing OECD/non-OECD countries, countries by continents, overseas territories displayed under their parent country, or in a flat list in an alphabetical order, etc.

Since these hierarchies allow for more complex parent-client relationships than the original codelists do, especially one child can have several parents (e.g France is part of World, of OECD countries, of EU countries and of EA countries, etc.), the filters and table views account for this. A code attached to several parents will be shown as child of each of the parents, except in table views when a parent might not be available in the data message.

In the DE filters, when a code is a child of more than one parent, then it is displayed multiple times in the hierarchy. Selecting any child once in the filter will also select it everywhere in the hierarchy.  
Also, a child with multiple parents in the same filter will only be counted as one in the filter count green icon.  
In the 'Used filters' area, a selected child with multiple parents will appear only once.

![DE advanced hierarchies](/dotstatsuite-documentation/images/de-advanced-hierarchies1.png)

In the **table view**, the observations attached to a multi-parent code are **re-displayed** (duplicated) for each parent that is selected and for which there is data at least for one observation that has any dimension combination with this parent.

![DE advanced hierarchies](/dotstatsuite-documentation/images/de-advanced-hierarchies2.png)

**IMPORTANT NOTE:** Codes defined in the original codelist that are **not listed in the HCL hierarchy** are still displayed, but at root level in the filter and table views at the top of the tree (in a non-defined order between themselves). If you do not want these codes to be used (and displayed) then you can use an Allowed Content Constraint to constrain their usage.
