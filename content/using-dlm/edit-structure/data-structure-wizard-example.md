---
title: "Example of the ESTAT Data Structure Wizard"
subtitle: 
comments: false
weight: 267
keywords: [
  'Codelists and their Codes', '#codelists-and-their-codes',
  'Concept Schemes and their Concepts', '#concept-schemes-and-their-concepts',
  'Category Schemes and their Categories', '#category-schemes-and-their-categories',
  'Agency Schemes and their Agencies', '#agency-schemes-and-their-agencies',
  'Other SDMX Item Scheme artefacts', '#other-sdmx-item-scheme-artefacts',
  'Hierarchical Codelists', '#hierarchical-codelists',
  'Data Structure Definitions', '#data-structure-definitions',
  'Dataflows, Content Constraints and Categorisations', '#dataflows-content-constraints-and-categorisations',
  'Metadata Structure Definitions', '#metadata-structure-definitions',
  'Metadataflows', '#metadataflows',
  'Structure Sets', '#structure-sets',
  'Annotations', '#annotations',
]
---

The following provides an example of user interfaces showing how to manage (creation and edition) SDMX artefacts. The examples are given by screenshots of the User Interface of the **[Eurostat's Data Structure Wizard (DSW)](https://webgate.ec.europa.eu/fpfis/wikis/pages/viewpage.action?pageId=488314869)**.

#### Table of Content
- [Codelists and their Codes](#codelists-and-their-codes)
- [Concept Schemes and their Concepts](#concept-schemes-and-their-concepts)
- [Category Schemes and their Categories](#category-schemes-and-their-categories)
- [Agency Schemes and their Agencies](#agency-schemes-and-their-agencies)
- [Other SDMX Item Scheme artefacts](#other-sdmx-item-scheme-artefacts)
- [Hierarchical Codelists](#hierarchical-codelists)
- [Data Structure Definitions](#data-structure-definitions)
- [Dataflows, Content Constraints and Categorisations](#dataflows-content-constraints-and-categorisations)
- [Metadata Structure Definitions](#metadata-structure-definitions)
- [Metadataflows](#metadataflows)
- [Structure Sets](#structure-sets)
- [Annotations](#annotations)

---

### Codelists and their Codes
Codelist is a list of Codes (members) that can be used to define the allowed values of Dimensions and Attributes in Data Structure Definitions.  
Codelist is a specific case of an Item Scheme (abstract class).

![dsw codelist](/dotstatsuite-documentation/images/dsw-codelist1.png)

![dsw codelist](/dotstatsuite-documentation/images/dsw-codelist2.png)

---

### Concept Schemes and their Concepts
Concept Scheme is a list of Concepts that can be used to describe Dimensions and Attributes in Data Structure Definitions.
Concept Scheme is a specific case of an Item Scheme (abstract class). A Codelist can be defined as the default representation of a Concept.  
Example UI for managing ConceptSchemes and Concepts:

![dsw concept](/dotstatsuite-documentation/images/dsw-concept1.png)

![dsw concept](/dotstatsuite-documentation/images/dsw-concept2.png)

---

### Category Schemes and their Categories
Category Scheme is a list of Categories (themes) that can be used to categories Dataflows (sub-sets or “views” of data) or other SDMX artefacts into a tree simple hierarchical structure (each Category can only have one parent Category) through a Categorization.  
Category Scheme is a specific case of an Item Scheme (abstract artefact).

![dsw category](/dotstatsuite-documentation/images/dsw-category1.png)

![dsw category](/dotstatsuite-documentation/images/dsw-category2.png)

![dsw category](/dotstatsuite-documentation/images/dsw-category3.png)

---

### Agency Schemes and their Agencies
Agency Scheme is a flat list of Agencies (e.g. directorates) that can be used to define owners of individual SDMX artefacts.  
Agency Scheme is a specific case of an Item Scheme.

![dsw agency](/dotstatsuite-documentation/images/dsw-agency1.png)

![dsw agency](/dotstatsuite-documentation/images/dsw-agency2.png)

![dsw agency](/dotstatsuite-documentation/images/dsw-agency3.png)

---

### Other SDMX Item Scheme artefacts
SDMX defines other SDMX artefacts that have the same properties than all the previous Scheme artefacts:
* Data Provider Scheme,
* Data Consumer Scheme, and
* Organization Unit Scheme.

![dsw other](/dotstatsuite-documentation/images/dsw-other1.png)

![dsw other](/dotstatsuite-documentation/images/dsw-other2.png)

---

### Hierarchical Codelists
A Hierarchical Codelist is a structure that allows for more complex hierarchies of Codes defined in a Codelist for data discovery and visualisation purposes. The principal features of the Hierarchical Codelist are:
1. A child code can have more than one parent.
2. There can be more than one code that has no parent (i.e. more than one “root node”).
3. There may be many hierarchies (or “views”) defined, in terms of the associations between the codes. Each hierarchy serves a particular purpose in the reporting, analysis, or dissemination of data.
4. The levels in a hierarchy can be explicitly defined or they can be implicit: (i.e. they exist only as parent/child relationships in the coding structure).

![dsw hierarchy](/dotstatsuite-documentation/images/dsw-hierarchy1.png)

![dsw hierarchy](/dotstatsuite-documentation/images/dsw-hierarchy2.png)

![dsw hierarchy](/dotstatsuite-documentation/images/dsw-hierarchy3.png)

![dsw hierarchy](/dotstatsuite-documentation/images/dsw-hierarchy4.png)

---

### Data Structure Definitions
The Data Structure Definition (DSD) defines the structure of a hypercube (multi-dimensional set of data). It defines:
* the Dimensions to be used together with the associated Concepts and Codelists (except Time and Measure Dimensions)
* the mandatory or optional Data Attributes to be used together with the associated Concepts and Codelists or – if uncoded - representations (format types)
* the supported Groupings of above Dimensions (e.g. to define attachment levels of Data Attributes)
* if a Time Dimension is present or not
* a Measure Dimension if present
* the Primary Measure (observation format type)

![dsw dsd](/dotstatsuite-documentation/images/dsw-dsd1.png)

![dsw dsd](/dotstatsuite-documentation/images/dsw-dsd2.png)

![dsw dsd](/dotstatsuite-documentation/images/dsw-dsd3.png)

![dsw dsd](/dotstatsuite-documentation/images/dsw-dsd4.png)

![dsw dsd](/dotstatsuite-documentation/images/dsw-dsd5.png)

![dsw dsd](/dotstatsuite-documentation/images/dsw-dsd6.png)

---

### Dataflows, Content Constraints and Categorisations
A Dataflow is a sub-set or a constrained view of data within the previously defined Data Structure Definition.  
The Content Constraint is defined to sub-set the Codelists. In SDMX, dimensions cannot be “switched off” in Dataflows, however in the SIS-CC context, end-user visualisations should allow hiding specific dimensions that have their Codelist constrained to a single Code. For that, the system should allow tagging the concerned dimensions with –z.  
A Dataflow can also be defined for the whole complete set of data defined by a Data Structure Definition. In this case the Dataflow has no linked Content Constraint.  
A Dataflow can be flexibly categorised. For that the independent SDMX artefact Categorisation is available to link any Dataflow to any Category. Therefore, a Dataflow can be categorised multiple times (into different Categories), and several Dataflows can be categorized into a single Category.

![dsw dataflow](/dotstatsuite-documentation/images/dsw-dataflow1.png)

![dsw dataflow](/dotstatsuite-documentation/images/dsw-dataflow2.png)

![dsw dataflow](/dotstatsuite-documentation/images/dsw-dataflow3.png)

![dsw dataflow](/dotstatsuite-documentation/images/dsw-dataflow4.png)

![dsw dataflow](/dotstatsuite-documentation/images/dsw-dataflow5.png)

![dsw dataflow](/dotstatsuite-documentation/images/dsw-dataflow6.png)

From a given DSD with or without uploaded data, users need to be able to create a Dataflow, meaning a constrained view of a defined DSD.  
Therefore, users need to be able to define a new Dataflow by tagging specific Dimensions and Dimension Members of a DSD. It should be feasible from:
* Triggering the “Add new” process, by selecting “Create a new Dataflow”, then selecting the DSD, the data space and tagging the Dimensions and Dimensions Members from the pivot table preview, or
* Directly tagging Dimensions and Dimensions Members from a DSD preview.

*Note* that a dataflow can also be defined without any constraint, meaning for the whole set of data defined by a DSD.

A dataflow can be associated to a Category in a CategoryScheme, e.g. for Dissemination purpose. Dataflow categorisation is flexible, meaning that one Dataflow can be associated to multiple Categories. Therefore, users need a feature for associating a Dataflow to one or more than one Category when creating it.

---

### Metadata Structure Definitions
The Metadata Structure Definition (MSD) defines the Concepts and their hierarchy which comprise the metadata to be reported, the types of objects to which the metadata relate, and the means for identifying those objects. The metadata structure definition is best thought of as being analogous to a data structure definition. The information model intentionally models the metadata structure definition in a way that is similar to the data structure definition. It defines:
* Metadata Targets (where the metadata values are being attached) which are identifiable
* Report Structures (how the metadata values are being organised, e.g. the hierarchical list of 41 OECD metadata “types”) which are also identifiable

Metadata Targets are combinations of Target Objects that can be of different types (classes), depending on where to attach the metadata values, e.g. to a combination of a Dataflow and a Dimension, or of a Dataflow and a combination of codes from the Dimensions of that Dataflow. Each Target Object must also have an ID (since it is an identifiable object), and a Representation (an ItemScheme or a Facet) that defines in which form the metadata values define their attachment. Predefined Facet values include “KEY_VALUES”,“OBSERVATIONAL_TIME_PERIOD”,“IDENTIFIABLE_REFERENCE”, “DATA_SET_REFERENCE” and“ATTACHMENT_CONSTRAINT_REFERENCE”.

The predefined Target Object type for attachment at any combination of codes from the dimensions of a DSD (or a Dataflow) is “DimensionDescriptorValuesTarget”. In this case, the Target Object representation is a special Facet “KEY_VALUES”. If the metadata values are to be defined for a specific point in time at which metadata values are reported (sent) then the corresponding Target Object type is “ReportPeriodTarget” and the Target Object representation is a Facet “OBSERVATIONAL_TIME_PERIOD”. If the metadata values are to be attached to a structural artefact, then the Target Object type is the type of that artefact, and the Target Object representation is a Facet “IDENTIFIABLE_REFERENCE”.

Report Structures are linked to at least one Metadata Target and contain a simple hierarchical list of Metadata Attributes which are defined as Concepts taken from any existing ConceptSchemes. These Metadata Attributes build the structure into which the textual or structured content of the metadata values need to be organised. The Metadata Attributes correspond to the previous 41 OECD metadata “types”.

![dsw msd](/dotstatsuite-documentation/images/dsw-msd1.png)

![dsw msd](/dotstatsuite-documentation/images/dsw-msd2.png)

![dsw msd](/dotstatsuite-documentation/images/dsw-msd3.png)

![dsw msd](/dotstatsuite-documentation/images/dsw-msd4.png)

---

### Metadataflows
A Metadataflow is a flow of metadata (in form of MetadataSets) provided e.g. for different reference periods.  
Metadata Structure Definition and Metadataflow are very similar structures to Data Structure Definition and Dataflow, but they host referential metadata rather than data.  
Unlike Dataflows, Metadataflows cannot be constraint.

![dsw metadataflow](/dotstatsuite-documentation/images/dsw-metadataflow1.png)

![dsw metadataflow](/dotstatsuite-documentation/images/dsw-metadataflow2.png)

---

### Structure Sets
A Structure Set allows components in one structure to be mapped to components in another structure of the same type.  
The allowable structures that can be mapped and the components that can be mapped within these structures are:

| **Structure Type** | **Component type** |
| ------ | ------ |
| Codelist | Code |
| Category Scheme | Category |
| Concept Scheme | Concept |
| Organisation Scheme | Organisation – this allows mapping any type of Organisation to any type of Organisation (e.g. a Data Provider to an Organisation Unit) |
| Hierarchical Codelist | Hierachical Code to Code or vice-versa |
| Data Structure Definition | Dimension, Measure Dimension, Time Dimension. Data Attribute, Primary Measure |
| Metadata Structure Definition | Target Object, Metadata Attribute |
| Dataflow | None |
| Metadataflow | None |

Structure Sets are most often used to map data from one Data Structure to another Data Structure.

---

### Annotations
All classes derived from the abstract class AnnotableArtefact (all above mentioned structures) may have Annotations (or notes): this supports the need to add notes to all SDMX-ML elements.  
The Annotation is used to convey extra information to describe any SDMX construct. This information may be in the form of a URL reference and/or a multilingual text (represented by the association to InternationalString).

![dsw annotations](/dotstatsuite-documentation/images/dsw-annotations1.png)
