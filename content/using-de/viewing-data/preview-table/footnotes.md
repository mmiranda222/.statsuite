---
title: "Notes displaying attributes in table views"
subtitle: 
comments: false
weight: 2900
keywords: [
  'Definition', '#definition',
  'Level of display', '#level-of-display',
  'Case 1: the attribute value is known to be the same for all cells in the data view', '#case-1-the-attribute-value-is-known-to-be-the-same-for-all-cells-in-the-data-view',
  'Case 2: the attribute value is known to be the same for all cells in a row section of the table', '#case-2-the-attribute-value-is-known-to-be-the-same-for-all-cells-in-a-row-section-of-the-table',
  'Case 3: the attribute value is known to be the same for all cells in a row of the table', '#case-3-the-attribute-value-is-known-to-be-the-same-for-all-cells-in-a-row-of-the-table',
  'Case 4: the attribute value is known to be the same for all cells in a column of the table', '#case-4-the-attribute-value-is-known-to-be-the-same-for-all-cells-in-a-column-of-the-table',
  'Case 5: the attribute values may otherwise vary between the cells in the table', '#case-5-the-attribute-values-may-otherwise-vary-between-the-cells-in-the-table',
]
---

#### Table of Content
- [Definition](#definition)
- [Level of display](#level-of-display)
  - [Case 1: the attribute value is known to be the same for all cells in the data view](#case-1-the-attribute-value-is-known-to-be-the-same-for-all-cells-in-the-data-view)
  - [Case 2: the attribute value is known to be the same for all cells in a row section of the table](#case-2-the-attribute-value-is-known-to-be-the-same-for-all-cells-in-a-row-section-of-the-table)
  - [Case 3: the attribute value is known to be the same for all cells in a row of the table](#case-3-the-attribute-value-is-known-to-be-the-same-for-all-cells-in-a-row-of-the-table)
  - [Case 4: the attribute value is known to be the same for all cells in a column of the table](#case-4-the-attribute-value-is-known-to-be-the-same-for-all-cells-in-a-column-of-the-table)
  - [Case 5: the attribute values may otherwise vary between the cells in the table](#case-5-the-attribute-values-may-otherwise-vary-between-the-cells-in-the-table)

---

### Definition
A **note** is one possible display approach for **coded or uncoded attributes**, where an underlined star icon is displayed `*` at the appropriate places. On mouse-over, a tooltip shows the corresponding attribute(s) and its/their value(s). Attributes referring to the same level in the data view are grouped under one single star icon. Several attributes in the same note are separated by a new line in the tooltip. 

![notes attributes](/dotstatsuite-documentation/images/using-de-footnotes.png)

See [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/#display-of-additional-information) for information about when attributes are displayed through **notes**.

---

### Level of display
Notes for attributes can be attached/displayed at the following levels in the data view (from *highest* level to *lowest*):
* data view (title or sub-title)
* partial groups of members of any dimensions, one specific case being the time series
* full groups of members of dimensions (observation)

Attributes are displayed at the most appropriate place in the table according to their attachment definition and the current data view layout. The following cases define the possible different places:

#### Case 1: The attribute value is known to be the same for all cells in the data view

**When**:
* The attribute is attached to the *SDMX dataset* level (and defined as *none* by the data owner, meaning that the value of the attribute will not vary with any other structure component of the data view), OR
* The attribute is attached only to one or more single-valued dimensions (and thus those dimensions are listed in the data view subtitle)  

**Then** the `*` icon is shown behind the data view **title**.  

![Case 1a](/dotstatsuite-documentation/images/using-de-footnotes-scenario1-with-no-relationship.PNG)

**However, if under these conditions**:
* only one single-fixed dimension is concerned  

**Then** the `*` icon is shown instead next to the text of the corresponding single-fixed dimension in the data view **subtitle**.  

![Case 1b](/dotstatsuite-documentation/images/using-de-footnotes-one-dim-relationship.png)

Note that this is the only case that allows being used in both tables and charts. All other cases are only available for tables.

#### Case 2: The attribute value is known to be the same for all cells in a row section of the table

**When**:
* Case 1 does not apply, AND
* In addition to zero or more single-valued dimensions, the attribute is attached only to one or more dimensions displayed in a row section  

**Then** the `*` icon is shown next to the text of the corresponding **row section** header.  

![Case 2a](/dotstatsuite-documentation/images/using-de-footnotes-case5-with-2+dim-relationship.PNG)

**However, if under these conditions**:
* only one dimension in the row section is concerned  

**Then** the `*` icon is shown instead next to the text of the corresponding **row section dimension**.  

![Case 2b](/dotstatsuite-documentation/images/using-de-footnotes-case2-with-1-dim-relationship.PNG)

#### Case 3: The attribute value is known to be the same for all cells in a row of the table
**When**:
* Cases 1 to 2 do not apply, AND
* In addition to zero or more single-valued dimensions and zero or more dimensions displayed in a row section, the attribute is attached only to one or more dimensions displayed in the row axis  

**Then** the `*` icon is shown next to the row header in the **adjacent cell of the extra (greyed) column**.  
 
![Case 3a](/dotstatsuite-documentation/images/using-de-footnotes-case8-with-2+dim-relationship.PNG)

**However, if under these conditions**:
* only one dimension in the row axis is concerned  

**Then** the `*` icon is shown instead next to the text of the corresponding **row header cell**.  

![Case 3b](/dotstatsuite-documentation/images/using-de-footnotes-case3-with-1or2+dim-relationship.PNG)

#### Case 4: The attribute value is known to be the same for all cells in a column of the table
**When**:
* Cases 1 to 3 do not apply, AND
* In addition to zero or more single-valued dimensions, the attribute is attached only to one or more dimensions displayed in the column axis  

**Then** the `*` icon is shown next to the column header in the **adjacent cell of the extra (greyed) row**.

![Case 4a](/dotstatsuite-documentation/images/using-de-footnotes-case4-with-2+dim-relationship.PNG)

**However, if under these conditions**:
* only one dimension in the column axis is concerned  

**Then** the `*` icon is shown instead next to the text of the corresponding **column header cell**.  

![Case 4b](/dotstatsuite-documentation/images/using-de-footnotes-case7.1.1-with-2+dim-relationship.PNG)

#### Case 5: The attribute values may otherwise vary between the cells in the table

**When** Cases 1 to 4 do not apply,  
**Then** the `*` icon is shown in the **data cell** corresponding to the specific attribute value attachment.

![Case 5](/dotstatsuite-documentation/images/using-de-footnotes-case5.PNG)

**Note**: When a non-mandatory attribute is attached at observation level (and thus to all dimensions) and the data message contains only one single attribute value, then a display is still not possible in the sub-header. This is because the nature of the attribute type implies that there isn't any guarantee that all observations are actually using the provided attribute value, as some observations might not have that attribute value defined. Our high performance objectif for the table generation doesn't allow for looping over all observations to verify that no observation misses that attribute value.
