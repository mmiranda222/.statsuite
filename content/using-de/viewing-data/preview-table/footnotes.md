---
title: "Footnotes displaying attributes in table views"
subtitle: 
comments: false
weight: 2900
keywords: [
  'Definition', '#definition',
  'Level of display', '#level-of-display',
  'Use case 1a: the attribute value is the same for all cells in the table', '#use-case-1a-the-attribute-value-is-the-same-for-all-cells-in-the-table',
  'Use case 1b: the attribute value has only one dimension relationship', '#use-case-1b-the-attribute-value-has-only-one-dimension-relationship',
  'Use case 2a: the attribute value is the same for all cells in any row section of the table', '#use-case-2a-the-attribute-value-is-the-same-for-all-cells-in-any-row-section-of-the-table',
  'Use case 2b: the attribute value is the same for all cells in any row section of the table', '#use-case-2b-the-attribute-value-is-the-same-for-all-cells-in-any-row-section-of-the-table',
  'Use case 3: the attribute value is the same for one dimension in the rows of the table', '#use-case-3-the-attribute-value-is-the-same-for-one-dimension-in-the-rows-of-the-table',
  'Use case 4a: the attribute value is the same for all cells in any column of the table', '#use-case-4a-the-attribute-value-is-the-same-for-all-cells-in-any-column-of-the-table',
  'Use case 4b: the attribute value is the same for all cells in any column of the table', '#use-case-4b-the-attribute-value-is-the-same-for-all-cells-in-any-column-of-the-table',
  'Use case 5: the attribute value is different between the cells in the table', '#use-case-5-the-attribute-value-is-different-between-the-cells-in-the-table',
]
---

#### Table of Content
- [Definition](#definition)
- [Level of display](#level-of-display)
  - [Use case 1a: the attribute value is the same for all cells in the table](#use-case-1a-the-attribute-value-is-the-same-for-all-cells-in-the-table)
  - [Use case 1b: the attribute value has only one dimension relationship](#use-case-1b-the-attribute-value-has-only-one-dimension-relationship)
  - [Use case 2a: the attribute value is the same for all cells in any row section of the table](#use-case-2a-the-attribute-value-is-the-same-for-all-cells-in-any-row-section-of-the-table)
  - [Use case 2b: the attribute value is the same for all cells in any row section of the table](#use-case-2b-the-attribute-value-is-the-same-for-all-cells-in-any-row-section-of-the-table)
  - [Use case 3: the attribute value is the same for one dimension in the rows of the table](#use-case-3-the-attribute-value-is-the-same-for-one-dimension-in-the-rows-of-the-table)
  - [Use case 4a: the attribute value is the same for all cells in any column of the table](#use-case-4a-the-attribute-value-is-the-same-for-all-cells-in-any-column-of-the-table)
  - [Use case 4b: the attribute value is the same for all cells in any column of the table](#use-case-4b-the-attribute-value-is-the-same-for-all-cells-in-any-column-of-the-table)
  - [Use case 5: the attribute value is different between the cells in the table](#use-case-5-the-attribute-value-is-different-between-the-cells-in-the-table)

---

### Definition
Footnotes are **coded or uncoded attributes** for which a star icon is displayed within brackets `(*)` directly left-aligned in the table cells, or next to the data view title.  
On cell mouse-over, a tooltip shows the attribute(s) and its value(s). If several footnotes are to be displayed for the same coordinates of a given view, then there will be only one star icon. Several attributes in the same footnote are separated by a new line in the tooltip. 

![footnotes attributes](/dotstatsuite-documentation/images/using-de-footnotes.png)

Displaying attributes as footnotes, instead of flags for instance, is defined per Data Explorer instance by the **configuration**: see [coded and uncoded attributes returned as footnotes](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#coded-and-uncoded-attributes-returned-as-footnotes) and [coded attributes returned as flags](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#coded-attributes-returned-as-flags).

---

### Level of display
Footnotes for attributes can be attached/displayed at the following levels in the table view (from *highest* level to *lowest*):
* data view (title)
* grouping of members of any dimensions
* time series
* observation

These different levels of display are represented in the following use cases.

#### Use case 1a: the attribute value is the same for all cells in the table
**When**:
* an attribute is attached to the *SDMX dataset* level (and defined as *none* by the data owner, meaning that the value of the attribute will not vary with any other structure component of the data view), OR
* all dimensions of the data view have unique values (and are thus displayed in the subtitle),  

**Then** the `(*)` icon is shown behind the data view **title**.  

![Case 1a](/dotstatsuite-documentation/images/using-de-footnotes-scenario1-with-no-relationship.PNG)

#### Use case 1b: the attribute value has only one dimension relationship
**NOTE**  
>Released in [February 28, 2020 Release .Stat Suite JS 4.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#february-28-2020)  

**When** an attribute is attached to only one single dimension, and that dimension has only one single value (and thus that dimension is in the data view subtitle),  
**Then** the `(*)` icon is shown behind the dimension name shown in the **subtitle**.

![Case 1b](/dotstatsuite-documentation/images/using-de-footnotes-one-dim-relationship.png)

#### Use case 2a: the attribute value is the same for all cells in any row section of the table
**When**:
* use case 1 is not applicable, AND
* only one target dimension is displayed in a row section, and  all remaining target dimensions (if any) have only one value (and thus are in the table sub-title),  

**Then** the `(*)` icon is displayed behind the dimension value of the corresponding **row section**.  

![Case 5](/dotstatsuite-documentation/images/using-de-footnotes-case5-with-2+dim-relationship.PNG)

#### Use case 2b: the attribute value is the same for all cells in any row section of the table
**When**:
* use case 1 is not applicable, AND
* more than one target dimension is displayed in a row section, and  all remaining target dimensions (if any) have only one value (and thus are in the table sub-title),  

**Then** the `(*)` icon is shown on the right of the corresponding **row section** cell.  

![Case 6](/dotstatsuite-documentation/images/using-de-footnotes-case6-with-2+dim-relationship.PNG)

#### Use case 3: the attribute value is the same for one dimension in the rows of the table
**When**:
* use case 2 is not applicable, AND
* more than one target dimension is displayed in the row axis, and all remaining dimensions (if any) are either on the row section axis or have only one value (and thus are in the table sub-title),  

**Then** the `(*)` icon is dislayed in row header cells behind the dimension value(s) (thus, cells in row without an attribute value do not show the `(*)` icon).  

![Case 8](/dotstatsuite-documentation/images/using-de-footnotes-case8-with-2+dim-relationship.PNG)

#### Use case 4a: the attribute value is the same for all cells in any column of the table
**When**:
* use case 3 is not applicable, AND
* only one target dimension is displayed in the columns, and all remaining target dimensions (if any) have only one value (and thus are in the table sub-title),  

**Then** the `(*)` icon is displayed  behind the target label in a columns header.  

![Case 4](/dotstatsuite-documentation/images/using-de-footnotes-case4-with-2+dim-relationship.PNG)

#### Use case 4b: the attribute value is the same for all cells in any column of the table
**When**:
* use case 3 is not applicable, AND
* more than one target dimension is displayed in the columns, and all remaining target dimensions (if any) have only one value (and thus are in the table sub-title),  

**Then** the `(*)` icon is displayed in a **specific column** (grey part) in the column corresponding to the attribute value(s) (thus, columns without an attribute value do not show the `(*)` icon).  

![Case 3](/dotstatsuite-documentation/images/using-de-footnotes-case3-with-1or2+dim-relationship.PNG)

#### Use case 5: the attribute value is different between the cells in the table
**When** use case 4 is not applicable,  
**Then** the `(*)` icon is shown in the **cell** corresponding to the specific attribute value (thus, cells without an attribute value do not show the `(*)` icon).

![]()
