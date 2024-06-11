---
title: "Special display of 'combined concepts' in the preview table"
subtitle: "In the preview table, combine and display a set of concepts as a virtual single component"
comments: false
weight: 2950
keywords: [
  'Introduction', '#introduction',
  'Reminder', '#reminder',
  'How to define virtual components as combinations of concepts', '#how-to-define-virtual-components-as-combinations-of-concepts',
  'Display rules', '#display-rules',
  'Hiding of specific values in the combined concepts', '#hiding-of-specific-values-in-the-combined-concepts',
  'Examples', '#examples',
  'Case 1: Table Header', '#case-1-table-header',
  'Case 2: Rows section', '#case-2-rows-section',
  'Case 3: Row axis', '#case-3-row-axis',
  'Case 4: Column axis', '#case-4-column-axis',
  'Case 5: Cell level', '#case-5-cell-level',
  'Charts', '#charts',
]
---

#### Table of Content
- [Introduction](#introduction)
- [Reminder](#reminder)
- [How to define virtual components as combinations of concepts](#how-to-define-virtual-components-as-combinations-of-concepts)
- [Display rules](#display-rules)
- [Hiding of specific values in the combined concepts](#hiding-of-specific-values-in-the-combined-concepts)
- [Examples](#examples)
  - [Case 1: Table Header](#case-1-table-header)
  - [Case 2: Rows section](#case-2-rows-section)
  - [Case 3: Row axis](#case-3-row-axis)
  - [Case 4: Column axis](#case-4-column-axis)
  - [Case 5: Cell level](#case-5-cell-level)
- [Charts](#charts)

---

> *Version history:*  
> Use of combined concepts in the table layout configuration since [MMMMMMMMMM XX, 2024 Release .Stat Suite JS NAME](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#mmmmmmmmmmmmmmmm-XX-2024)  
> Enhanced rules for hiding of specific values in the combined concepts with [September 20, 2023 Release .Stat Suite JS "xray"](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#september-20-2023)  
> Introduced in [July 20, 2023 Release .Stat Suite JS Virtual](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#july-20-2023)

### Introduction
In order to simplify the dimensional layout of a data table, the data owner can define sets of dimensions and/or attributes to be combined and shown as single virtual components. This allows "at a glance" and compendium style datasets to keep their indicator-style tables while enabling structural modelling according to best practices and optimal search performance through a separate indexation and search of those dimensions. 

Note: This feature replaces the previous 'Combined unit of measure' (UoM) feature in a generic manner. Previous configurations for 'Combined unit of measure' are now ignored.

![Example of 2 combined concepts](/dotstatsuite-documentation/images/de-viewing-data-preview-table-uom-intro.png)
---

### Reminder
In SDMX, an attribute is a component of the data structure, similar to a dimension, but it does not allow uniquely identifying an observation. It contains additional information about the data characteristics in coded (--> Codelist) or uncoded form (e.g. free text).  
Also like for dimensions, an attribute links to the Concept that defines its localised name and semantic. The localised name is used for display purposes (see details below).  

---

### How to define virtual components as combinations of concepts
The optional dataflow or DSD level annotation of **type** `COMBINED_CONCEPTS` can be used to list different sets of dimension and/or attribute IDs that are to be combined and displayed as single virtual components.  
Its **title** must contain the semicolon-separated list of virtual components with their IDs and their comma-separated list of IDs of dimensions and/or attributes to be combined (`VIRT_COMP1:COMP_1_1,...,COMP_1_n;VIRT_COMP2:COMP_2_1,...,COMP_2_n`). The order of dimensions and/or attributes listed for each virtual component is significant and determines the displayed order of their values in the table, because the dimension and/or attribute value labels are concatenated into the virtual component labels in that order.  
Its **localised text** must contain the semicolon-separated list of virtual components with their IDs and their localised names (`VIRT_COMP1:Component name 1;VIRT_COMP2:Component name 2`). Semicolons within the localised names are not supported. 

Example:

```xml
<common:Annotation>  
    <common:AnnotationTitle>COMBINED_UNIT_MEASURE:UNIT_MEASURE,UNIT_MULT,BASE_PER;COMBINED_MEASURE:MEASURE,SEX,AGE</common:AnnotationTitle>  
    <common:AnnotationType>COMBINED_CONCEPTS</common:AnnotationType>
    <common:AnnotationText xml:lang="en">COMBINED_UNIT_MEASURE:Combined unit of measure;COMBINED_MEASURE:Combined measure</common:AnnotationText>  
    <common:AnnotationText xml:lang="fr">COMBINED_UNIT_MEASURE:Unité de mesure combinée;COMBINED_MEASURE:Mesure combinée</common:AnnotationText>  
</common:Annotation>   
```

The `COMBINED_CONCEPTS` dataflow/DSD annotation superseeds the default combinations configured in the **`defaultCombinations`** entry of the [Data Explorer configuration](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#default-combined-concepts). If the annotation is present but empty, then there is no special display of virtual components.  

Because attributes can be attached at different levels, e.g. dataset, partial or full combinations of dimensions, the virtual component layout depends not only on the dimensions directly defined in COMBINED_CONCEPTS but also on the dimensions to which the composing attributes are attached. See [here how the attachment of attributes is expressed in a SDMX-JSON data message](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/typical-use-cases/#how-to-retrieve-attribute-information-in-the-json-format-message).

---

### Display rules
The virtual components will be displayed at the highest possible _level_ in the table according to the dispositions of all dimensions implied in its definition (either directly as dimension or through the attachment of attributes to dimensions), the order of the _levels_ from highest to lowest being defined as:  

1) Table header (displayed in table sub-title)  
2) Row Section  
3) Row or Column  
4) Cell = Row/Row Section and Column  

The layout configuration feature will display the combined concept in an axis only if one of its dimensions has multiple values selected.

![Combined concepts and layout](/dotstatsuite-documentation/images/de-combined-concepts-layout.png)

Based on the original placement of all dimensions that are finally combined into the virtual component, the highest possible _level_, at which the virtual component will be displayed, is the:

- Table header: if all of those dimensions are placed in the Table header because the dimensions have single selections or the underlying attributes are attached at dataset level
- Row Section: if at least some of those dimensions are placed in Row Sections and none in Rows or Columns
- Row: if at least some of those dimensions are placed in Rows and none in Columns
- Column: if at least some of those dimensions are placed in Columns and none in Rows or Row Sections
- Cell: if at least some of those dimensions are placed in Rows or Row Sections and some others are placed in Columns

Note: When a non-mandatory attribute used in a virtual component is attached at observation level (and thus to all dimensions) but the data message contains only one single attribute value, then the attribute value is still displayed (separately if necessary) at observation level even if a display in the table sub-header might have been possible. This is because the nature of the attribute type implies that there isn't any guarantee that all observations are actually using the provided attribute value. Our high performance objectif for the table generation doesn't allow for looping over all observations to verify that no observation misses that attribute value.

---

### Hiding of specific values in the combined concepts
If the `NOT_DISPLAYED` annotation (for a code in a codelist, for a dataflow or for a DSD) requires to hide an item of a dimension or an attribute listed used for a virtual component, then this item is excluded from the concatenated label of the virtual component value. 

Example: In all following example cases, we exclude the "Not applicable" item label (having ID "_Z") of the BaseYear attribute from the COMBINED_UNIT_MEASURE label.

Whenever a set of combined concepts has **only hidden components**, then the first value the these hidden concepts is displayed in the table view instead of an empty cell.

---

### Examples
See a stylised DSD (inspired by National Accounts) with the following concepts and codelist samples:  

![Data model example](/dotstatsuite-documentation/images/DE_UoM_data_model_example.png)

The dimensions and attributes highlighted above in red are listed in COMBINED_UNIT_MEASURE (one of the virtual components defined in the `COMBINED_CONCEPTS` annotation [here](#how-to-define-virtual-components-as-combinations-of-concepts)). The underlying dimension attachment of the UnitMultiplier and BaseYear attributes are supposed to be *Measure* and *Country*.   
Therefor:  
- The virtual component COMBINED_UNIT_MEASURE should thus be composed of the IDs of: Transformation, UnitMultiplier, UnitMeasure, PriceBase, BaseYear and Adjustment  
- The label of a virtual component value could read in the above defined order: "Non-transformed, Thousands, Australian Dollar, Current Price, Not-applicable, Non-seasonally adjusted".  
- The **derived attachment level of the virtual component** would be: Measure, Country, Transformation, UnitMeasure, PriceBase and Adjustment.

#### Case 1: Table Header
The virtual component COMBINED_UNIT_MEASURE (including all its dimensions) is shown in the **second "Combined unit of measure" table subtitle**. The COMBINED_UNIT_MEASURE dimensions are thus **not** displayed separately in the first table subtitle.

![Example case 1](/dotstatsuite-documentation/images/DE_UoM_Case1TableHeader.PNG)

See also: http://de-demo.siscc.org/vis?locale=en&dataflow[datasourceId]=staging%3ASIS-CC-stable&dataflow[dataflowId]=NAMAIN_T0102_A&dataflow[agencyId]=OECD.SDD&dataflow[version]=3.0&dataAvailability=on&term=uom&start=0&period=2015%2C2020&frequency=A&dataquery=A........._T...V..&layout[rows]=STO&layout[header]=TIME_PERIOD&layout[sections]=REF_AREA

Note: The dimensions UnitMeasure, PriceBase, Adjustment, Transformation had single values, were all to be placed in the table header, and have thus been merged into the COMBINED_UNIT_MEASURE value label. 

#### Case 2: Row section
The virtual component COMBINED_UNIT_MEASURE (not including its dimensions that are **not** placed on the Row axis) are displayed in an additional **"Combined unit of measure" row section line**. The UNIT_MEASURE_CONCEPTS dimensions displayed normally in the Row section axis are thus **not** displayed separately.
  
  ![Example case 2](/dotstatsuite-documentation/images/DE_UoM_Case2-row-section.png)

See also: http://de-demo.siscc.org/vis?locale=en&dataflow[datasourceId]=staging%3ASIS-CC-stable&dataflow[dataflowId]=NAMAIN_T0102_A&dataflow[agencyId]=OECD.SDD&dataflow[version]=3.0&dataAvailability=on&term=uom&start=0&period=2015%2C2020&frequency=A&dataquery=A...W0.S1......_Z....&layout[sections]=REF_AREA%2CINSTR_ASSET%2CPRICES&layout[rows]=STO&layout[header]=TIME_PERIOD  

Note: The dimension Measure had a single selection and is placed in the header. The dimensions Country, UnitMeasure and Adjustment were placed on row sections by the user. The dimensions PriceBase and Transformation had single values, were normally to be placed in the table header, but have been merged into the COMBINED_UNIT_MEASURE value label.  

#### Case 3: Row axis
The virtual component COMBINED_UNIT_MEASURE (not including its dimensions that are **not** placed on the Column axis) are displayed in an additional **"Combined unit of measure" column**. The UNIT_MEASURE_CONCEPTS dimensions displayed normally in the Row axis are thus **not** displayed separately.

![Example case 3](/dotstatsuite-documentation/images/DE_UoM_Case3-row-axis.png)

See also: http://de-demo.siscc.org/vis?dataquery=AU%2BBE.A.GDP..V.SA%2BNSA.NT&period=2000%2C2002&frequency=A&locale=en&dataflow[datasourceId]=staging%3ASIS-CC-stable&dataflow[dataflowId]=DF_UOM&dataflow[agencyId]=OECD&dataflow[version]=3.0&dataAvailability=on&filter=ADJUSTMENT

Note: The dimension Measure has only one value and is placed in the header. The dimensions Country and UnitMeasure were placed on rows by the user. The dimension Adjustment was placed on row sections by the user. The dimensions PriceBase and Transformation had single values, were normally to be placed in the table header, but have been merged into the combined UoM label at the lowest level (row).  

#### Case 4: Column axis
The virtual component COMBINED_UNIT_MEASURE (not including its dimensions that are **not** placed in the Row section axis) are displayed in an additional **"Combined unit of measure" row**. The UNIT_MEASURE_CONCEPTS dimensions displayed normally on the Column axis are thus **not** displayed separately.

![Example case 4](/dotstatsuite-documentation/images/DE_UoM_Case4-column-axis.png)

See also: http://de-qa.siscc.org/vis?locale=en&dataflow[datasourceId]=qa%3Astable&dataflow[dataflowId]=NAMAIN_T0102_A&dataflow[agencyId]=OECD.SDD&dataflow[version]=3.0&dataAvailability=true&period=2015%2C2020&frequency=A&dataquery=A..............&layout[rows]=STO%2CACTIVITY%2CACCOUNTING_ENTRY&layout[header]=TIME_PERIOD%2CPRICES&layout[sections]=REF_AREA  
  
Note: The dimensions Country, Measure, UnitMeasure and PriceBase were placed on columns by the user. The dimensions Adjustment and Transformation had single values, were normally to be placed in the table header, but have been merged into the COMBINED_UNIT_MEASURE value label.  

#### Case 5: Cell level
The virtual component COMBINED_UNIT_MEASURE (not including any of its dimensions) are displayed as a **"Combined unit of measure" footnote at cell level**.

![Example case 5](/dotstatsuite-documentation/images/DE_UoM_Case5-cell-level.png)

See also: http://de-demo.siscc.org/vis?dataquery=Q.Y.AU.W0........XDC..N.&period=%2C2017-Q1&frequency=Q&locale=en&dataflow[datasourceId]=staging%3ASIS-CC-stable&dataflow[dataflowId]=NAMAIN_ALL&dataflow[agencyId]=OECD.SDD&dataflow[version]=3.0&dataAvailability=on&layout[rows]=STO%2CACTIVITY%2CPRICES&layout[header]=TABLE_IDENTIFIER&layout[sections]=REF_SECTOR%2CINSTR_ASSET%2CEXPENDITURE%2CACCOUNTING_ENTRY&term=uom&start=0  
  
Note: The dimension Measure had a single selection and is placed in the header. The dimensions Country and UnitMeasure were placed on rows by the user and the dimension Adjustment was placed on columns by the user. The dimensions PriceBase and Transformation had single values, were normally to be placed in the table header, but have been merged into the COMBINED_UNIT_MEASURE value label.  

---

### Charts
Data Explorer **charts** behave in the same way as tables for what concerns the construction of labels for virtual component values for the chart header.
