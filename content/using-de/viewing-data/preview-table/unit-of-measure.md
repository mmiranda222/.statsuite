---
title: "Special display for 'Unit of measure' in preview table"
subtitle: "Whenever possible, display of all concepts related to the 'Unit of measure' as if they were one single component"
comments: false
weight: 2950
keywords: [
  'Introduction', '#introduction',
  'Reminders', '#reminders',
  'Underlying data model', '#underlying-data-model',
  'Display rules', '#display-rules',
  'Examples', '#examples',
  'Case 1: Table Header', '#case-1-table-header',
  'Case 2: Rows section', '#case-2-rows-section',
  'Case 3: Row axis', '#case-3-row-axis',
  'Case 4: Column axis', '#case-4-column-axis',
  'Case 5: Cell level', '#case-5-cell-level',
  'Charts', '#charts',
  'How to identify attributes in the JSON format message', '#how-to-identify-attributes-in-the-json-format-message',
]
---

#### Table of Content
- [Introduction](#introduction)
- [Reminders](#reminders)
- [Underlying data model](#underlying-data-model)
- [Display rules](#display-rules)
- [Examples](#examples)
  - [Case 1: Table Header](#case-1-table-header)
  - [Case 2: Rows section](#case-2-rows-section)
  - [Case 3: Row axis](#case-3-row-axis)
  - [Case 4: Column axis](#case-4-column-axis)
  - [Case 5: Cell level](#case-5-cell-level)
- [Charts](#charts)
- [How to identify attributes in the JSON format message](#how-to-identify-attributes-in-the-json-format-message)

---

### Introduction
In order to ease understanding the basic context of the data shown in the data table (according to standard statistical modelling), the predefined standard statistical concepts defining a full 'Unit of measure' (UoM) are displayed in an as compact as possible and well visible way, even if those concepts represent different dimensions or attributes. This means that those concepts are displayed in the data table, whenever possible, as if they were one single component.

---

### Reminders
In SDMX, an attribute is a component of the data structure, similar to a dimension, but it does not allow uniquely identifying an observation. It contains additional information about the data characteristics in coded (--> Codelist) or uncoded form (e.g. free text).  
Also like for dimensions, an attribute links to the Concept that defines its localised name and semantic. The localised name is used for display purposes (see details below).  

---

### Underlying data model
Some attributes and some dimensions play a specific role (e.g. Unit of measure, Unit multiplier, Base period) and will be interpreted, displayed differently or used to adapt the display.  
A pre-defined (optional, see the related [documentation for configuration](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#unit-of-measure-support)) dataflow-level annotation **UNIT_MEASURE_CONCEPTS** lists the dimensions and/or attributes (by ID) that will define how the full UoM (virtual) component is built and how its labels are auto-generated. By default, in case this annotation is not given, the full UoM will be composed of the following concepts: "UNIT_MEASURE,UNIT_MULT,BASE_PER" provided that these concepts are used as dimensions or attributes in the DSD of the displayed data. If the annotation is present but empty, then there is no special display of the (virtual) UoM component.  

```xml
<common:Annotation>  
    <common:AnnotationTitle>UNIT_MEASURE,UNIT_MULT,BASE_PER</common:AnnotationTitle>  
    <common:AnnotationType>UNIT_MEASURE_CONCEPTS</common:AnnotationType>  
</common:Annotation>  
```

The order of concepts in the **UNIT_MEASURE_CONCEPTS** annotation is significant and determines the order in which the different dimension and attribute item labels are concatenated into the UoM labels.

Because attributes can be attached at different levels, e.g. dataset, partial or full combinations of dimensions, the (virtual) UoM component depends not only on the dimensions directly defined in the annotation **UNIT_MEASURE_CONCEPTS** but also on the dimensions to which the composing attributes are attached. 

---

### Display rules
The (virtual) UoM component will be displayed at the "highest possible level" in the table according to the dispositions of all dimensions implied in the UoM definition (either directly as dimension or through the attachment of attributes to dimensions), the order of the levels from highest to lowest being defined as:  

1) Table header (displayed in table sub-title)  
2) Row Section  
3) Row or Column  
4) Cell = Row/Row Section and Column  

Exception: Any dimension that would normally be part of the (virtual) UoM component due to its direct definition in the annotation **UNIT_MEASURE_CONCEPTS**, but that has been placed through the table customisation feature (by default or by the user) into a specific axis (Row Section, Row or Column), which is different from that calculated for the (virtual) UoM component, will be excluded from the (virtual) UoM component and be displayed separately/normally. This functional choice has been made to not disturb users who see and place dimensions in the table customisation panel in specific axes. 

Based on the original placement of all dimensions that are finally combined into the (virtual) UoM component, the "highest possible level", at which the (virtual) UoM component will be displayed, is the:

- Table header: if all of those dimensions are placed in the Table header because the dimensions have single selections or the underlying attributes are attached at dataset level)
- Row Section: if at least some of those dimensions are placed in Row Sections and none in Rows or Columns
- Row: if at least some of those dimensions are placed in Rows and none in Columns
- Column: if at least some of those dimensions are placed in Columns and none in Rows or Row Sections
- Cell: if at least some of those dimensions are placed in Rows or Row Sections and some others are placed in Columns

When a related non-mandatory UoM attribute is attached at observation level (and thus to all dimensions) but the data message contains only one single attribute value, then a display is still not generally possible in the sub-header. This is because the nature of the attribute type implies that there isn't any guarantee that all observations are actually using the provided attribute value, as some observations might not have that attribute value defined. Our high performance objectif for the table generation doesn't allow for looping over all observations to verify that no observation misses that attribute value.

---

### Examples
See a stylised DSD (inspired by National Accounts) with the following concepts and codelist samples:  

![Data model example](/dotstatsuite-documentation/images/DE_UoM_data_model_example.png)

The concepts of the dimensions and attributes highlighted above in red are listed in the **UNIT_MEASURE_CONCEPTS** annotation. The underlying dimension attachment of the UnitMultiplier and BaseYear attributes are supposed to be *Measure* and *Country*.   
Therefor:  
- UNIT_MEASURE_CONCEPTS should thus be composed of the IDs of: Transformation, UnitMultiplier, UnitMeasure, PriceBase, BaseYear and Adjustment  
- A typical full UoM label could read in the above defined order: "Non-transformed, Thousands, Australian Dollar, Current Price, Not-applicable, Non-seasonally adjusted".  
- The **derived attachment level of the full UoM** would be: Measure, Country, Transformation, UnitMeasure, PriceBase and Adjustment 

#### Case 1: Table Header
The UoM label (which includes the labels for all dimensions in UNIT_MEASURE_CONCEPTS) is shown in the **second "Combined unit of measure" table subtitle**. The dimensions defined in UNIT_MEASURE_CONCEPTS are **not** displayed separately in the first table subtitle.

![Example case 1](/dotstatsuite-documentation/images/DE_UoM_Case1TableHeader.PNG)

See also: http://de-demo.siscc.org/vis?locale=en&dataflow[datasourceId]=staging%3ASIS-CC-stable&dataflow[dataflowId]=NAMAIN_T0102_A&dataflow[agencyId]=OECD.SDD&dataflow[version]=3.0&dataAvailability=on&term=uom&start=0&period=2015%2C2020&frequency=A&dataquery=A........._T...V..&layout[rows]=STO&layout[header]=TIME_PERIOD&layout[sections]=REF_AREA

Note: The dimensions UnitMeasure, PriceBase, Adjustment, Transformation had single values, were all to be placed in the table header, and have thus been merged into the UoM label.  
Note: "Not-applicable" item labels (having ID "_Z") are excluded from the UoM label, here BaseYear.

#### Case 2: Row section
The UoM labels (which do not include the labels for dimensions in UNIT_MEASURE_CONCEPTS **not** placed on the Row axis) are displayed in an additional **"Combined unit of measure" row section line**. The dimensions defined in UNIT_MEASURE_CONCEPTS displayed normally in the Row section axis are **not** displayed separately.
  
  ![Example case 2](/dotstatsuite-documentation/images/DE_UoM_Case2-row-section.png)


See also: http://de-demo.siscc.org/vis?locale=en&dataflow[datasourceId]=staging%3ASIS-CC-stable&dataflow[dataflowId]=NAMAIN_T0102_A&dataflow[agencyId]=OECD.SDD&dataflow[version]=3.0&dataAvailability=on&term=uom&start=0&period=2015%2C2020&frequency=A&dataquery=A...W0.S1......_Z....&layout[sections]=REF_AREA%2CINSTR_ASSET%2CPRICES&layout[rows]=STO&layout[header]=TIME_PERIOD  

Note: The dimension Measure had a single selection and is placed in the header. The dimensions Country, UnitMeasure and Adjustment were placed on row sections by the user. The dimensions PriceBase and Transformation had single values, were normally to be placed in the table header, but have been merged into the UoM label.  
Note: "Not-applicable" item labels (having ID "_Z") are excluded from the UoM label, here BaseYear.

#### Case 3: Row axis
The UoM labels (which do not include the labels for dimensions in UNIT_MEASURE_CONCEPTS **not** placed on the Column axis) are displayed in an additional **"Combined unit of measure" column**. The dimensions defined in UNIT_MEASURE_CONCEPTS displayed normally in the Row axis are **not** displayed separately.

![Example case 3](/dotstatsuite-documentation/images/DE_UoM_Case3-row-axis.png)

See also: http://de-demo.siscc.org/vis?dataquery=AU%2BBE.A.GDP..V.SA%2BNSA.NT&period=2000%2C2002&frequency=A&locale=en&dataflow[datasourceId]=staging%3ASIS-CC-stable&dataflow[dataflowId]=DF_UOM&dataflow[agencyId]=OECD&dataflow[version]=3.0&dataAvailability=on&filter=ADJUSTMENT

Note: The dimension Measure has only one value and is placed in the header. The dimensions Country and UnitMeasure were placed on rows by the user. The dimension Adjustment was placed on row sections by the user. The dimensions PriceBase and Transformation had single values, were normally to be placed in the table header, but have been merged into the UoM label at the lowest level (row).  
Note: "Not-applicable" item labels (having ID "_Z") are excluded from the UoM label, here BaseYear.

#### Case 4: Column axis
The UoM labels (which do not include the labels for dimensions in UNIT_MEASURE_CONCEPTS **not** placed in the Row section axis) are displayed in an additional **"Combined unit of measure" row**. The dimensions defined in UNIT_MEASURE_CONCEPTS displayed normally on the Column axis are **not** displayed separately.

![Example case 4](/dotstatsuite-documentation/images/DE_UoM_Case4-column-axis.png)

See also: http://de-qa.siscc.org/vis?locale=en&dataflow[datasourceId]=qa%3Astable&dataflow[dataflowId]=NAMAIN_T0102_A&dataflow[agencyId]=OECD.SDD&dataflow[version]=3.0&dataAvailability=true&period=2015%2C2020&frequency=A&dataquery=A..............&layout[rows]=STO%2CACTIVITY%2CACCOUNTING_ENTRY&layout[header]=TIME_PERIOD%2CPRICES&layout[sections]=REF_AREA  
  
Note: The dimensions Country, Measure, UnitMeasure and PriceBase were placed on columns by the user. The dimensions Adjustment and Transformation had single values, were normally to be placed in the table header, but have been merged into the UoM label.  
Note: "Not-applicable" item labels (having ID "_Z") are excluded from the UoM label, here BaseYear.

#### Case 5: Cell level
The UoM labels (which do not include the labels for dimensions in UNIT_MEASURE_CONCEPTS) are displayed as a **"Combined unit of measure" footnote at cell level**.

![Example case 5](/dotstatsuite-documentation/images/DE_UoM_Case5-cell-level.png)

See also: http://de-demo.siscc.org/vis?dataquery=Q.Y.AU.W0........XDC..N.&period=%2C2017-Q1&frequency=Q&locale=en&dataflow[datasourceId]=staging%3ASIS-CC-stable&dataflow[dataflowId]=NAMAIN_ALL&dataflow[agencyId]=OECD.SDD&dataflow[version]=3.0&dataAvailability=on&layout[rows]=STO%2CACTIVITY%2CPRICES&layout[header]=TABLE_IDENTIFIER&layout[sections]=REF_SECTOR%2CINSTR_ASSET%2CEXPENDITURE%2CACCOUNTING_ENTRY&term=uom&start=0  
  
**Notes**:  
- The dimension Measure had a single selection and is placed in the header. The dimensions Country and UnitMeasure were placed on rows by the user and the dimension Adjustment was placed on columns by the user. The dimensions PriceBase and Transformation had single values, were normally to be placed in the table header, but have been merged into the UoM label.  
- "Not-applicable" item labels (having ID "_Z") are excluded from the UoM label, here BaseYear.

---

### Charts
Data Explorer **charts** behave in the same way as tables for what concerns the construction of UoM for the chart header.

---

### How to identify attributes in the JSON format message
To identify an attribute, you should search within the following items chronologically:
1. AttributeList
2. ConceptIdentity

The attribute values are retrieved together with the observation values through a data query to the SDMX API. The API will return all attributes defined for the dataflow.  
The attributes to be considered are listed in the SDMX-JSON data message.

![DE UoM](/dotstatsuite-documentation/images/DE_UoM_6.png)

In the data message, the attributes can be returned at any of the levels: dataset, (series) and observation. If the URL parameter “dimensionAtObservation=allDimensions” is used then the series level is suppressed.  
**! Note that the level indicated in the data message can differ from the attachment level defined in the DSD! Thus, while the attribute values are of course to be taken from the data message, their attachment level to be used in the pivot table is to be taken from the DSD.**

![DE UoM](/dotstatsuite-documentation/images/DE_UoM_7.png)

In the data message, the attribute values are returned either together with the observations, (series), or only in the structure part at dataset-level.  
Example for attribute values returned at observation level (note: the attribute value definition is in the structure part of the data message):  

```json
"observations":{
"0:0:0:0:0:0":[1.054290476190476,null,null,0,null,null,null,null,null,null,null,0,null,0,null,0,0,0,0,0,null,null,null],
"0:0:0:0:0:1":[1.061440909090909,null,null,0,null,null,null,null,null,null,null,0,null,0,null,0,0,0,0,0,null,null,null]
}
```

Example for an attribute value returned at dataset level (there can of course only be one single value!):  

```json
"attributes": {
  "dataset": [ <-- physical attachment within data message which can be at a different (lower) level than defined in the Data Structure
    {
      "id": "PUBL_PUBLIC",
      "name": "Source publication (public)",
      "values": [
        {
          "id": "302",
          "name": "IBN 302"
        }
      ]
    }
  ]
}
```
