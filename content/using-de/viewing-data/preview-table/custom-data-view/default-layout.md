---
title: "Default layout"
subtitle: 
comments: false
weight: 460

---

You can define a default layout of a dataflow for automatically, and by default, displaying dimension(s) in the according axis of the visualisation's data table.  

To do so, you can define the following SDMX annotations to indicate the orientation of a dimension:  
* LAYOUT_ROW
* LAYOUT_COLUMN
* LAYOUT_ROW_SECTION

#### Syntax

Use the following syntax when defining the annotations in the dimensions' definition within a DSD:

```
        "annotations": [{
                 "type": "LAYOUT_ROW"
         }]
        "annotations": [{
                 "type": "LAYOUT_COLUMN"
         }]
        "annotations": [{
                "type": "LAYOUT_ROW_SECTION"
        }]
```

Use the following syntax when defining the annotations in the Dataflow or DSD definition:  

```
        "annotations": [{
                 "title": "DIM6"   <-- These are the related dimension IDs (the order is significant)
                 "type": "LAYOUT_ROW",
         }]
        "annotations": [{
                 "title": "DIM2,DIM1"   <-- These are the related dimension IDs (the order is significant)
                 "type": "LAYOUT_COLUMN",
         }]
        "annotations": [{
                 "title": "DIM4,DIM5,DIM3"   <-- These are the related dimension IDs (the order is significant)
                 "type": "LAYOUT_ROW_SECTION",
         }]
```

#### Exceptions

* It is possible to use only one or two of the LAYOUT annotations, not all three of them, e.g. one dimension is defined on rows with `LAYOUT_ROW`, one dimension is defined on columns with `LAYOUT_COLUMN`, but no dimension is defined on `LAYOUT_ROW_SECTION`.  
* several dimensions can be defined on the same axis, like in the syntax example above. The order of display in the table will reflect the order defined in the syntax.

#### Example
You can find [here](https://gitlab.com/sis-cc/dotstatsuite-documentation/blob/master/content/OECD-AIR_EMISSIONS_DF-1.0.xml) a SDMX structure file of a Dataflow.

In this attached example, several dimension IDs are defined in the dataflow definition with LAYOUT annotations.

Once this structure (and data) is uploaded into .Stat DLM (or any other SDMX 2.1 compliant's backoffice system) for Data Explorer dissemination, it will result in displaying the dataflow in the following default data table representation:  

![Example of LAYOUT annotations](/dotstatsuite-documentation/images/LAYOUT.png)
