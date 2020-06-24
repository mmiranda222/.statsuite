---
title: "Special display for 'Unit of measure' in preview table"
subtitle: "Whenever possible, display of all concepts related to the 'Unit of measure' as if they were one single component"
comments: false
weight: 2950

---

#### Table of Content
- [Intro](#intro)
- [Reminders](#reminders)
- [Underlying data model](#underlying-data-model)
- [Display rules](#display-rules)
- [Example](#example)
- [Charts](#charts)

---

### Intro
In order to ease understanding the basic context of the data shown in the data table (according to standard statistical modelling), the predefined standard statistical concepts defining a full 'Unit of measure' (UoM) are displayed in an as compact as possible and well visible way, even if those concepts represent different dimensions or attributes. This means that those concepts are displayed in the data table, whenever possible, as if they were one single component.

---

### Reminders
In SDMX, an attribute is a component of the data structure, similar to a dimension, but it does not allow uniquely identifying an observation. It contains additional information about the data characteristics in coded (--> Codelist) or uncoded form (e.g. free text).  
Also like for dimensions, an attribute links to the Concept that defines its localised name and semantic. The localised name is used for display purposes (see details below).  

---

### Underlying data model
Some attributes and some dimensions play a specific role (e.g. Unit of measure, Unit multiplier, Base period) and will be interpreted, displayed differently or used to adapt the display.  
A pre-defined (optional) dataflow-level annotation **UNIT_MEASURE_CONCEPTS** lists the dimensions and/or attributes (by ID) that will define how the full UoM (virtual) component is built and how its labels are auto-generated. By default, in case this annotation is not given, the full UoM will be composed of the following concepts: "UNIT_MEASURE,UNIT_MULT,BASE_PER" provided that these concepts are used as dimensions or attributes in the DSD of the displayed data. If the annotation is present but empty, then there is no special display of the (virtual) UoM component.  

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

---

### Example
See a stylised DSD (inspired by National Accounts) with the following concepts and codelist samples:  

![Data model example](/images/DE_UoM_data_model_example.png)

The concepts of the dimensions and attributes highlighted above in red are listed in the **UNIT_MEASURE_CONCEPTS** annotation. The underlying dimension attachment of the UnitMultiplier and BaseYear attributes are supposed to be *Measure* and *Country*.   
Therefor:  
- UNIT_MEASURE_CONCEPTS should thus be composed of the IDs of: Transformation, UnitMultiplier, UnitMeasure, PriceBase, BaseYear and Adjustment  
- A typical full UoM label could read in the above defined order: "Non-transformed, Thousands, Australian Dollar, Current Price, Not-applicable, Non-seasonally adjusted".  
- The **derived attachment level of the full UoM** would be: Measure, Country, Transformation, UnitMeasure, PriceBase and Adjustment 

#### Case 1: Table Header  
The UoM label (which includes the labels for all dimensions in UNIT_MEASURE_CONCEPTS) is shown in the **second "Unit of measure" table subtitle**. The dimensions defined in UNIT_MEASURE_CONCEPTS are **not** displayed separately in the first table subtitle.

![Example case 1](/images/DE_UoM_Case1.png)  

See also: http://de-staging-siscc.redpelicans.com/vis?dataquery=AU.A.GDP..V.SA.NT&period=2000%2C2004&frequency=A&locale=en&dataflow[datasourceId]=staging%3ASIS-CC-stable&dataflow[dataflowId]=DF_UOM&dataflow[agencyId]=OECD&dataflow[version]=3.0&dataAvailability=on&filter=PANEL_PERIOD

Note: The dimensions UnitMeasure, PriceBase, Adjustment, Transformation had single values, were all to be placed in the table header, and have thus been merged into the UoM label.  
Note: "Not-applicable" item labels (having ID "_Z") are excluded from the UoM label, here BaseYear.

#### Case 2
The UoM labels (which do not include the labels for dimensions in UNIT_MEASURE_CONCEPTS **not** placed on the Row axis) are displayed in an additional **"Unit of measure" row section line**. The dimensions defined in UNIT_MEASURE_CONCEPTS displayed normally in the Row section axis are **not** displayed separately.

**National Accounts**  
**Frequency**: Annual * **Measure**: GDP  

|                 |  |   Values    |
|-----------------|--|-------------|
| **Time period** |  |             |
| **Country**: Australia <br> ***Unit**: Non-transformed, Thousands, Australian Dollar, Current Price, Seasonally adjusted* |  |             |
| 2000            |  | 138.6418738 |
| 2001            |  | 113.7983151 |
| 2002            |  | 136.3920959 |
| **Country**: Australia <br> ***Unit**: Non-transformed, Thousands, Australian Dollar, Current Price, Non-seasonally adjusted* |  |             |
| 2000            |  | 134.4480365 |
| 2001            |  | 126.1257334 |
| 2002            |  | 138.4802883 |
| **Country**: Belgium <br> ***Unit**: Non-transformed, Thousands, Euro, Current Price, Seasonally adjusted* |  |             |
| 2000            |  | 138.6418738 |
| 2001            |  | 113.7983151 |
| 2002            |  | 136.3920959 |
| **Country**: Belgium <br> ***Unit**: Non-transformed, Thousands, Euro, Current Price, Non-seasonally adjusted* |  |             |
| 2000            |  | 134.4480365 |
| 2001            |  | 126.1257334 |
| 2002            |  | 138.4802883 |

[screenshot to follow - feature not fully implemented yet - UoM still displayed at Row instead of Row Section]  

See also: http://de-staging-siscc.redpelicans.com/vis?dataquery=AU%2BBE.A.GDP..V.SA%2BNSA.NT&period=2000%2C2002&frequency=A&locale=en&dataflow[datasourceId]=staging%3ASIS-CC-stable&dataflow[dataflowId]=DF_UOM&dataflow[agencyId]=OECD&dataflow[version]=3.0&dataAvailability=on&filter=ADJUSTMENT

Note: The dimension Measure had a single selection and is placed in the header. The dimensions Country, UnitMeasure and Adjustment were placed on row sections by the user. The dimensions PriceBase and Transformation had single values, were normally to be placed in the table header, but have been merged into the UoM label.  
Note: "Not-applicable" item labels (having ID "_Z") are excluded from the UoM label, here BaseYear.

#### Case 3
The UoM labels (which do not include the labels for dimensions in UNIT_MEASURE_CONCEPTS **not** placed on the Column axis) are displayed in an additional **"Unit of measure" column**. The dimensions defined in UNIT_MEASURE_CONCEPTS displayed normally in the Row axis are **not** displayed separately.

**National Accounts**  
**Frequency**: Annual * **Measure**: GDP  
  
| **Time period**                         |                          |  | 2001        | 2002        | 2003        |
|-----------------------------------------|--------------------------|--|-------------|-------------|-------------|
| **Country**                             | ***Unit***               |  |             |             |             |
| **Adjustment**: Non-seasonally adjusted |                          |  |             |             |             |
| Australia                               | *Non-transformed, Thousands, Australian Dollar, Current Price* |  | 138.6418738 | 137.1236678 | 136.6536471 |
| Belgium                                 | *Non-transformed, Thousands, Euro, Current Price* |  | 113.7983151 | 113.117064  | 113.5936765 |
| Canada                                  | *Non-transformed, Thousands, Canadian Dollar, Current Price* |  | 136.3920959 | 134.0008176 | 135.2551795 |
| **Adjustment**: Seasonally adjusted |                          |  |             |             |             |
| Australia                               | *Non-transformed, Thousands, Australian Dollar, Current Price*           |  | 134.4480365 | 134.154608  | 133.8576924 |
| Belgium                                 | *Non-transformed, Thousands, Euro, Current Price*           |  | 126.1257334 | 126.0543631 | 126.0131707 |
| Canada                                  | *Non-transformed, Thousands, Canadian Dollar, Current Price*           |  | 138.4802883 | 138.0792699 | 137.6584535 |

[screenshot to follow - feature not fully implemented yet - Adjustment dimension still displayed at Row instead of Row Section]  

See also: http://de-staging-siscc.redpelicans.com/vis?dataquery=AU%2BBE.A.GDP..V.SA%2BNSA.NT&period=2000%2C2002&frequency=A&locale=en&dataflow[datasourceId]=staging%3ASIS-CC-stable&dataflow[dataflowId]=DF_UOM&dataflow[agencyId]=OECD&dataflow[version]=3.0&dataAvailability=on&filter=ADJUSTMENT

Note: The dimension Measure has only one value and is placed in the header. The dimensions Country and UnitMeasure were placed on rows by the user. The dimension Adjustment was placed on row sections by the user. The dimensions PriceBase and Transformation had single values, were normally to be placed in the table header, but have been merged into the UoM label at the lowest level (row).  
Note: "Not-applicable" item labels (having ID "_Z") are excluded from the UoM label, here BaseYear.

#### Case 4
The UoM labels (which do not include the labels for dimensions in UNIT_MEASURE_CONCEPTS **not** placed in the Row section axis) are displayed in an additional **"Unit of measure" row**. The dimensions defined in UNIT_MEASURE_CONCEPTS displayed normally on the Column axis are **not** displayed separately.

![Example case 4](/images/DE_UoM_Case4.png)  

See also: http://de-staging-siscc.redpelicans.com/vis?dataquery=AU%2BBE.A.GDP%2BINV..V%2BQ.SA.NT&period=2000%2C2002&frequency=A&locale=en&dataflow[datasourceId]=staging%3ASIS-CC-stable&dataflow[dataflowId]=DF_UOM&dataflow[agencyId]=OECD&dataflow[version]=3.0&dataAvailability=on&filter=PRICE_BASE

Note: The dimensions Country, Measure, UnitMeasure and PriceBase were placed on columns by the user. The dimensions Adjustment and Transformation had single values, were normally to be placed in the table header, but have been merged into the UoM label.  
Note: "Not-applicable" item labels (having ID "_Z") are excluded from the UoM label, here BaseYear.

#### Case 5
The UoM labels (which do not include the labels for dimensions in UNIT_MEASURE_CONCEPTS) are displayed as a **"Unit of measure" footnote at cell level**.

![Example case 5](/images/DE_UoM_Case5.png)  

[improved screenshot to follow - feature not fully implemented yet - PriceBase and Transformation dimensions still displayed in Table sub-header instead of Cell]

See also: http://de-staging-siscc.redpelicans.com/vis?dataquery=AU%2BBE.A.GDP..V.SA%2BNSA.NT&period=2000%2C2000&frequency=A&locale=en&dataflow[datasourceId]=staging%3ASIS-CC-stable&dataflow[dataflowId]=DF_UOM&dataflow[agencyId]=OECD&dataflow[version]=3.0&dataAvailability=on

Note: The dimension Measure had a single selection and is placed in the header. The dimensions Country and UnitMeasure were placed on rows by the user and the dimension Adjustment was placed on columns by the user. The dimensions PriceBase and Transformation had single values, were normally to be placed in the table header, but have been merged into the UoM label.  
Note: "Not-applicable" item labels (having ID "_Z") are excluded from the UoM label, here BaseYear.

---

### Charts
Data Explorer **charts** behave in the same way as tables for what concerns the construction of UoM for the chart header.
