---
title: "Hide information of a data view"
subtitle: 
comments: false
weight: 490
keywords: [
  'Hide information of a data view', '#hide-information-of-a-data-view',
  'Scenario 1: Hide dimensions', '#scenario-1-hide-dimensions',
  'Scenario 2: Hide dimension values', '#scenario-2-hide-dimension-values',
  'Scenario 3: Hide attributes', '#scenario-3-hide-attributes',
  'Scenario 4: Hide attribute values', '#scenario-4-hide-attribute-values',
  'Syntax', '#syntax',
  'Example', '#example',
  'Automatic hide of special values', '#automatic-hide-of-special-values',
  'Example', '#example',
]
---

#### Table of Content
- [Hide information of a data view](#hide-information-of-a-data-view)
  - [Scenario 1: Hide dimensions](#scenario-1-hide-dimensions)
  - [Scenario 2: Hide dimension values](#scenario-2-hide-dimension-values)
  - [Scenario 3: Hide attributes](#scenario-3-hide-attributes)
  - [Scenario 4: Hide attribute values](#scenario-4-hide-attribute-values)
  - [Syntax](#syntax)
  - [Example](#example)
- [Automatic hide of special values](#automatic-hide-of-special-values)
  - [Example](#example)

> *Version history:*  
> Hiding dimensions fixed to a set of specific values: implemented [July 20, 2023 Release .Stat Suite JS Virtual](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#july-20-2023)

---

### Hide information of a data view
You can decide to hide some specific information of a dataflow in its visual representations.

To do so, you can define the SDMX annotation of type `NOT_DISPLAYED` to be used for hiding a dimension, dimension values (from a Codelist), an attribute or attribute values (from a Codelist) in certain circumstances that are described in the following scenarios.

#### Scenario 1: Hide dimensions
When a dataflow dimension has an annotation `NOT_DISPLAYED`, then this dimension is hidden from the table's/chart's sub-title (when only one single value is selected or returned). This dimension is also hidden from the filters of the Data Explorer visualisation page AND from the information side panel.

#### Scenario 2: Hide dimension values
When a dimension value has an annotation `NOT_DISPLAYED`, then this value is hidden from the table's/chart's sub-title (when only this value is selected or returned) AND from the information side panel.

Note that it is still shown in the filter of the Data Explorer visualisation page.

#### Scenario 3: Hide attributes
When a dataflow attribute has an annotation `NOT_DISPLAYED`, then this attribute is hidden from the table.

#### Scenario 4: Hide attribute values
When an attribute value has an annotation `NOT_DISPLAYED`, then this attribute value is hidden from the table.

#### Syntax
Use the following syntax in a dimension or attribute definition to hide dimensions or attributes:
```
        "annotations": [{
                 "type": "NOT_DISPLAYED"
         }]
```

Use the following syntax in a dataflow or dataset definition to hide dimensions or attributes:

```
        "annotations": [{
                 "title": "DIM3,DIM6,ATTR5,ATTR6"   <-- These are the related dimension and attribute IDs
                 "type": "NOT_DISPLAYED",
         }]
```

Use the following syntax in a code definition within the Codelist or in dimension/attribute value to hide dimension values or attribute values:

```
        "annotations": [{
                 "type": "NOT_DISPLAYED"
         }]
```

Use the following syntax in a dataflow, a DSD or a dataset definition to hide dimension values or attribute values:

```
        "annotations": [{
                 "title": "DIM1=CODE1+CODE2,DIM3=CODE4,ATTR7=CODE5+CODE6"   <-- These are the related IDs of dimensions and their values, and attributes and their values
                 "type": "NOT_DISPLAYED",
         }]
```

Use **brackets** around a set of dimensions values to hide that set of values in the case that those values are the only ones currently available for this dimension, just like if the dimension was single-fixed.

Example: Hide CODE1 and CODE2 when they are the only ones available. Hide CODE3 when it is the only one available.

```
        "annotations": [{
                 "title": "DIM1=(CODE1+CODE2)+CODE3,DIM2=..."
                 "type": "NOT_DISPLAYED",
         }]
```

When using brackets, the Data Explorer behaves as follow:
- The dimension filter, which would have only (parts of) the listed set of values, is hidden. The data query will contain either the value selected by DEFAULT, if set, otherwise the (partly) set of values.
- In the data table/chart, whenever a dimension has only (parts of) the listed set of values, then the corresponding dimension is hidden. Note that potentially there could originally be different observations that only differ in their value of that dimension. In this case, all related cells are displayed like "doubled":  
  ![Example of DE table with doubled cells](/dotstatsuite-documentation/images/DE_table_doubled_cells.png)  
  It is the responsibility of the data owner to use the `NOT_DISPLAYED` annotation with care, so that such cases are avoided.

#### Example
The following example illustrates the above **[Scenario 2: Hide dimension values](#scenario-2-hide-dimension-values)**.

You can find [here](https://gitlab.com/sis-cc/dotstatsuite-documentation/blob/master/content/OECD.CFE-DF_DOMESTIC_TOURISM-1.0-all.xml) a SDMX structure file of a full Dataflow (with all referenced artifacts).

In this attached example, one code of a Codelist is defined with the `NOT_DISPLAYED` annotation in its code definition within the Codelist. It refers to the value "Other" of the dimension "Accommodation type".

Once this structure (and data) is uploaded into .Stat DLM (or any other SDMX 2.1 compliant's backoffice system) for Data Explorer dissemination, it will result hiding the value from the sub-title of the dataflow when this value is selected form the filter.

![Example of NOT_DISPLAYED annotation](/dotstatsuite-documentation/images/NOT_DISPLAYED.png)

---

### Automatic hide of special values
By default, the following special values (codes of a Codelist) are hidden in the dataflow sub-title in the Data Explorer visualisation page:
* _L (Local extension)
* _T (Total)
* _Z (Not applicable)

The case occurs when the code is the only available value, or when it is the only selection made in the given dimension.  
When the coded value of attribute or referential metadata attribute is a special value (_L, _T, _Z), it is also hidden in the notes or in the "information side panel". The (i) or * icons are not displayed at all when there are only related attribute/referential metadata values with coded "_T" and/or "_Z" values.

#### Example
In the following illustrations:
* When I select "Overnight visitors" from the filter, the selection appears in the sub-title of the dataflow;
* When I select **ONLY** "Total" from the same filter, the selection is applied to the view BUT the selection is NOT displayed in the sub-title of the dataflow.

![Example of hidden special value](/dotstatsuite-documentation/images/HIDE_SPECIAL_VALUES.png)
