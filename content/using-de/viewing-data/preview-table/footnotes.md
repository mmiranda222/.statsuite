---
title: "Notes displaying attributes in table views"
subtitle: 
comments: false
weight: 2900
keywords: [
  'Definition', '#definition',
  'Level of display', '#level-of-display',
  'Case 1: the attribute value is known to be the same for all cells in the table', '#case-1-the-attribute-value-is-known-to-be-the-same-for-all-cells-in-the-table',
  'Case 2: the attribute value is known to be the same for all cells in a row section of the table', '#case-2-the-attribute-value-is-known-to-be-the-same-for-all-cells-in-a-row-section-of-the-table',
  'Case 3: the attribute value is known to be the same for all cells in a row of the table', '#case-3-the-attribute-value-is-known-to-be-the-same-for-all-cells-in-a-row-of-the-table',
  'Case 4: the attribute value is known to be the same for all cells in a column of the table', '#case-4-the-attribute-value-is-known-to-be-the-same-for-all-cells-in-a-column-of-the-table',
  'Case 5: the attribute values may otherwise vary between the cells in the table', '#case-5-the-attribute-values-may-otherwise-vary-between-the-cells-in-the-table',
]
---

#### Table of Content
- [Definition](#definition)
- [Level of display](#level-of-display)
  - [Case 1: the attribute value is known to be the same for all cells in the table](#case-1-the-attribute-value-is-known-to-be-the-same-for-all-cells-in-the-table)
  - [Case 2: the attribute value is known to be the same for all cells in a row section of the table](#case-2-the-attribute-value-is-known-to-be-the-same-for-all-cells-in-a-row-section-of-the-table)
  - [Case 3: the attribute value is known to be the same for all cells in a row of the table](#case-3-the-attribute-value-is-known-to-be-the-same-for-all-cells-in-a-row-of-the-table)
  - [Case 4: the attribute value is known to be the same for all cells in a column of the table](#case-4-the-attribute-value-is-known-to-be-the-same-for-all-cells-in-a-column-of-the-table)
  - [Case 5: the attribute values may otherwise vary between the cells in the table](#case-5-the-attribute-values-may-otherwise-vary-between-the-cells-in-the-table)

---

### Definition
Notes are **coded or uncoded attributes** for which a star icon is displayed within brackets `*` directly left-aligned in the table cells, or next to the data view title.  
On cell mouse-over, a tooltip shows the attribute(s) and its value(s). If several notes are to be displayed for the same coordinates of a given view, then there will be only one star icon. Several attributes in the same note are separated by a new line in the tooltip. 

![notes attributes](/dotstatsuite-documentation/images/using-de-footnotes.png)

Displaying attributes as notes, instead of flags for instance, is defined per Data Explorer instance by the **configuration**: see [coded and uncoded attributes returned as notes](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#coded-and-uncoded-attributes-returned-as-notes) and [coded attributes returned as flags](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#coded-attributes-returned-as-flags).

---

### Level of display
Notes for attributes can be attached/displayed at the following levels in the table view (from *highest* level to *lowest*):
* data view (title)
* grouping of members of any dimensions
* time series
* observation

These different levels of display are represented in the following cases.

#### Case 1: The attribute value is known to be the same for all cells in the table

**When**:
* The attribute is attached to the *SDMX dataset* level (and defined as *none* by the data owner, meaning that the value of the attribute will not vary with any other structure component of the data view), OR
* The attribute is attached only to one or more single-valued dimensions (and thus those dimensions are listed in the data view subtitle)  
**Then** the `*` icon is shown behind the data view **title**.  

![Case 1a](/dotstatsuite-documentation/images/using-de-footnotes-scenario1-with-no-relationship.PNG)

#### Case 2: The attribute value is known to be the same for all cells in a row section of the table

**When**:
* Case 1 does not apply, AND
* In addition to zero or more single-valued dimensions, the attribute is attached only to one or more dimensions displayed in a row section  
**Then** the `*` icon is shown next to the text of the corresponding **row section** header.  

![Case 5](/dotstatsuite-documentation/images/using-de-footnotes-case5-with-2+dim-relationship.PNG)

#### Case 3: The attribute value is known to be the same for all cells in a row of the table
**When**:
* Cases 1 to 2 do not apply, AND
* In addition to zero or more single-valued dimensions and zero or more dimensions displayed in a row section, the attribute is attached only to one or more dimensions displayed in the row axis
**Then** the `*` icon is shown next to the row header in the adjacent cell of the extra (greyed) column.  

![Case 8](/dotstatsuite-documentation/images/using-de-footnotes-case8-with-2+dim-relationship.PNG)

#### Case 4: The attribute value is known to be the same for all cells in a column of the table
**When**:
* Cases 1 to 3 do not apply, AND
* In addition to zero or more single-valued dimensions, the attribute is attached only to one or more dimensions displayed in the column axis
**Then** the `*` icon is shown next to the column header in the adjacent cell of the extra (greyed) row.

![Case 4](/dotstatsuite-documentation/images/using-de-footnotes-case4-with-2+dim-relationship.PNG)

#### Case 5: The attribute values may otherwise vary between the cells in the table

**When** Cases 1 to 4 do not apply,  
**Then** the `*` icon is shown in the data cell corresponding to the specific attribute value attachment.

![]()

**Note**: When a non-mandatory attribute is attached at observation level (and thus to all dimensions) and the data message contains only one single attribute value, then a display is still not possible in the sub-header. This is because the nature of the attribute type implies that there isn't any guarantee that all observations are actually using the provided attribute value, as some observations might not have that attribute value defined. Our high performance objectif for the table generation doesn't allow for looping over all observations to verify that no observation misses that attribute value.
