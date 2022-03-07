---
title: "Preview table"
subtitle: 
comments: false
weight: 2500
keywords: [
  'Role of preview-tables', '#role-of-preview-tables',
  'Preview-table components', '#preview-table-components',
  'Initial layout', '#initial-layout',
  'Layout variations from changing user selections', '#layout-variations-from-changing-user-selections',
  'Display of observations values', '#display-of-observations-values',
  'Display of additional information', 'display-of-additional-information',
  'Display of hierarchical dimensions', '#display-of-hierarchical-dimensions',
  'Management of empty columns', '#management-of-empty-columns',
  'Management of empty rows', '#management-of-empty-rows',
  'Management of empty row sections', '#management-of-empty-row-sections',
  'Vertical scroll and freezing table header and Rows section rows', '#vertical-scroll-and-freezing-table-header-and-rows-section-rows',
  'Horizontal scroll and freezing row headers', '#horizontal-scroll-and-freezing-row-headers',
  'Scroll back arrows', '#scroll-back-arrows', 
  'Horizontal merged column header cells', '#horizontal-merged-column-header-cells',
  'Highlighted cells, rows and columns', '#highlighted-cells-rows-and-columns',
  'Extreme cases of layout', '#extreme-cases-of-layout',
  'Links to underlying microdata', '#links-to-underlying-microdata',
]
---

### Table of Content
- [Role of preview-tables](#role-of-preview-tables)
- [Preview-table components](#preview-table-components)
- [Initial layout](#initial-layout)
- [Layout variations from changing user selections](#layout-variations-from-changing-user-selections)
- [Display of observations values](#display-of-observations-values)
- [Display of additional information](#display-of-additional-information)
- [Display of hierarchical dimensions](#display-of-hierarchical-dimensions)
- [Management of empty columns](#management-of-empty-columns)
- [Management of empty rows](#management-of-empty-rows)
- [Management of empty row sections](#management-of-empty-row-sections)
- [Vertical scroll and freezing table header and Rows section rows](#vertical-scroll-and-freezing-table-header-and-rows-section-rows)
- [Horizontal scroll and freezing row headers](#horizontal-scroll-and-freezing-row-headers)
- [Scroll back arrows](#scroll-back-arrows)
- [Horizontal merged column header cells](#horizontal-merged-column-header-cells)
- [Highlighted cells, rows and columns](#highlighted-cells-rows-and-columns)
- [Extreme cases of layout](#extreme-cases-of-layout)
- [Links to underlying microdata](#links-to-underlying-microdata)

---

### Role of preview-tables
The preview-tables are not meant to be publication-ready statistical tables. They are only meant to provide a quick mean for users to validate that they have found the data that they were looking for.  
Therefore, larger online table displays (and the related Excel table downloads) are not supported in order to assure high performance. However, larger amounts of selected data can still be downloaded using the native SDMX formats (SDMX-CSV, SDMX-ML, SDMX-JSON).  
If publication-ready statistical tables are required, then they should be implemented using the feature to download external resources (e.g. ready-made data extractions or tables) based on the "EXT_RESOURCE" dataflow annotation. 

The preview-table is constructed out of the data resulting from the SDMX query that corresponds to the curent data selection in the filters. In order to prevent too large tables to be built and the web browser to freeze due to memory overload, the SDMX query includes a predefined, configurable range limit, e.g. 2500 observations. If the range limitation needed to be used because the unlimited result would have exceeded the limit, then a warning message is displayed in the second table sub-title. For more details see [this section](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/incomplete-data/). 

For performance reasons, the maximum number of table rows, columns and cells are also limited through configuration.

Because the SDMX API does not allow yet for pro-active pagination, only the first page of data can currently be previewed.

The following specific preview-table actions are proposed:  
- download as-is preview-table as Excel file (xslx)

---

### Preview-table components
The preview-table has a **header** (title, first subtitle, second subtitle (unit)), a **footer** (source, logo, copyright) that are common with the charts - for more details see [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/common-header-and-footer/) - and a **table grid**. This table grid is a three-dimensional pivot table with the following axes:  
- **Column**
- **Row section** (groupings of rows with the same partial dimension selection)
- **Row**

Note that the **row section** is meant to help and enhance the table readability by avoiding (too many) repeated or imbricated row header cells.  
The classical feature of the pivot table 'filter' axis (like in Excel pivot tables) is assured by the visualisation page [filters](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/). Therefore, the table grid does not have its own additional 'filter' selector.

The dimensions on the **Column axis** are shown completely flattened into **1 header row per dimension**. It means that each child cell is shown without the hierarchy of its parents. "FULL_NAME" annotations might later be an alternative to provide necessary hierarchical information.

The dimensions on the **Row axis** are shown with **1 header column per dimension**. Hierarchies are represented through indentation of dimension values (see [this section](#display-of-hierarchical-dimensions) for more details).

Unless all dimensions have single(-fixed) values, there must always be **at least one dimension on the Row axis**. This is required in order to avoid the *strange* layout case when there are dimensions on the Row section axis but none on the Row axis.  
There is no vertical cell merging when vertically neighboured row header cells have the same value. It is rather encouraged to use more than 1 row dimension only in cases when statistically absolutely necessary. Otherwise, the Row axis should always contain one single dimension and all other (non-Column-axis) dimensions should be positioned on the Row section axis.

The dimensions on the **Row section axis** are shown completely flattened, which means each child value within the concatenated row section dimensions is shown without the hierarchy of its parents. "FULL_NAME" annotations might later be an alternative to provide necessary hierarchical information.  
Because Row section rows do not include the dimensions in the Row axis and thus the resulting coordinates/combinations are always incomplete, there are no data value cells in these rows. These Row section rows thus span horizontally over the complete table width.  
The Row Section content is constructed the same way as the table subtitle with the concatenated dimension and dimension value names, and with dimensions separated by " ● ".

The distribution of the different data dimensions over the pivot table axes is called **layout**. See below how the initial layout is determined. 

---

### Initial layout
When the preview-table is first displayed, the initial layout is determined in the following ordered way:

1) Independently from default layouts defined in the annotations, all dimensions with exactly one item (selected or returned) are excluded from the table axis and displayed instead in the first table *subtitle*. Only those single-fixed dimensions normally displayed in the subtitle can be hidden through the "NOT_DISPLAYED" annotation.
2) The default table layout defined by annotations ("LAYOUT_ROW" or "LAYOUT_COLUMN" or "LAYOUT_ROW_SECTION") is applied to the remaining dimensions.  
  *Not implemented (yet): If the configurable maximum number of dimensions to be shown in Columns is exceeded, then the last over-counting dimensions (but not the Time_Period dimension) are moved to the Row Section axis. If the configurable maximum number of dimensions to be shown in Rows is exceeded, then the last over-counting dimensions (but not the Ref_Area dimension) are moved to the Row Section axis.*
3) If there is no Column dimension yet, then the Time_Period dimension, if it has no layout annotation, otherwise the first dimension without a layout annotation, except the Ref_Area dimension, is moved to the Column axis.
4) If there is no Row dimension yet, then the Ref_Area dimension dimension, if it has no layout annotation, otherwise the first dimension without a layout annotation, except the Time_Period, is moved to the Rows axis.
5) All other dimensions without a layout annotation are moved to the Row Section axis.

The dimensions configured to be part of the "Unit of measure" concepts are, when possible, merged together with the attributes configured to be part of the "Unit of measure" concepts and displayed as a separate "virtual" dimension on an automaically defined axis. For more details see [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/unit-of-measure/).

What happens when the user starts customising the layout is described [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/customise-feature/).

---

### Layout variations from changing user selections
If the user changes the selection(s), then it can impact the data preview table if a dimension has now more than 1 or exactly one item, and so if it is displayed in the table grid or in the table subtitle. The following rules apply when the user makes **filter selection changes**:
* The current layout positioning of dimensions, for which the number of available items (selected or returned) has not changed (between one and many), is not modified;
* Any dimension, for which the number of available items (selected or returned) changes from many to one, moves from wherever it is in the table grid into the table sub-title or, if the "NOT_DISPLAYED" annotation requests so, is hidden;
* Any dimension, for which the number of available items (selected or returned) changes from one to many, moves from the table sub-title (or from the hidden status) into the table grid reapplying the rules for the initial layout:
  1) Move it back into its last previous table axis (if available).
  2) Otherwise move it to the axis defined by the layout annotation of the dimension.
  3) Otherwise, if it is not the Time_Period dimension and if there is currently no ROW dimension, move into the Row axis. 
  4) Otherwise, if it is not the Ref_Area dimension and if there is currently no COLUMN dimension, move into the Column axis.
  5) Otherwise move in into the Row Section axis.

---

### Display of observations values
**Observation values in numerical formats** (real, decimal, ...) are displayed as 'Numbers' with thousand separators (e.g. " " (non-breaking space), "." or "'") and a decimal separator (e.g. "." or ",") according to the predefined, configurable locale, and with the fixed number of decimals after the decimal separator as specified in the relevant "DECIMALS" attribute.  

**Example:**   
3 512 032.00

Other **non-numeric** and **coded measure values formats** are supported and detailed (with example) [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/core-data-model/#data-type-definitions).

---

### Display of additional information
> *Version history:*  
> *footnotes* replaced by *notes* in [March 4, 2022 Release .Stat Suite JS 13.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#march-4-2022)  
> Enhanced with [February 21, 2022 Release .Stat Suite JS 12.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#february-21-2022)

Data attributes and referential metadata can be displayed for preview tables and charts in different ways: as flags, as notes, or in a side panel. 

**Flags**  
Directly displays the IDs of related coded attribute values (with maximal 4 characters) next to the observation value. The localised names of the attribute values are displayed on mouse-over in a tooltip bubble.  
For more information see [coded attributes displayed as flags](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#coded-attributes-returned-as-flags)

**Notes**  
Displays a star icon '*' at the appropriate places. The related attribute values are displayed on mouse-over in a tooltip bubble.  
For more information see [attributes displayed as notes](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/footnotes/)

**Side panel**  
Displays an information icon '(i)' at the appropriate places. The related attribute and referential metadata values are displayed on mouse-over in an information side panel.  
For more information see [information side panel](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/#information-panel).  

The following optional Data Explorer (DE) configuration parameters (see [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#coded-and-uncoded-attributes-returned-as-notes) how to be configured) can be used to define the way to display attributes within the scope of a Data Explorer (note that the content represents examples):  
```json
"attributes": {
    "flags": ["OBS_STATUS", "CONF_STATUS"],
    "notes": ["NOTE"]
}
```

The following optional dataflow (DF) annotations can be used to define the way to display attributes for a specific dataflow (note that the content represents examples):
```json
"annotations": [
    {
        "title": "OBS_STATUS,CONF_STATUS",
        "type": "LAYOUT_FLAG"
    },
    {
        "title": "NOTE1,NOTE2",
        "type": "LAYOUT_NOTE"
    },
    {
        "title": "DECIMALS",
        "type": "NOT_DISPLAYED"
    }
]
```

#### The following display rules are applied with ascending prevalence for any attribute
(7) The DE configuration `notes` defines which attributes are displayed in the cell `note`.  
(6) The DE configuration `flags` defines which attributes are displayed in the cell `flag`.   
(5) The DF annotation `LAYOUT_NOTE` fully overwrites the list in DE configuration `notes` and instead defines which attributes are displayed in the cell `note`.  
(4) The DF annotation `LAYOUT_FLAG` fully overwrites the list in DE configuration `flags` and instead defines which attributes are displayed in the cell `flag`.  
(3) The DF annotations `UNIT_MEASURE_CONCEPTS`, `DRILLDOWN_CONCEPTS` and `DRILLDOWN` define which attributes are displayed differently due to other (already existing, being implemented or planned) features, even if they have been listed in any of the previously mentioned settings.  
(2) The DF annotation `NOT_DISPLAYED` defines which attributes are **not displayed** at all even if they have been listed in any of the previously mentioned setting.  
(1) All attributes not defined by the previously listed settings are shown in the `information` side panel with (i) icon. 

**Rule's exception for Flags**  
If the value ID of an attribute that is defined as flag is longer than 4 characters, then this value will not be displayed as a flag but as a note.

---

### Display of hierarchical dimensions
>*Version history:*  
> Extended to all dimensions + dots with [December 14, 2021 Release .Stat Suite JS 11.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#december-14-2021)  
> Introduced in [October 8, 2019 Release .Stat Suite JS 2.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#october-8-2019) 

All **dimensions with hierarchies** on the Row axis are **indented** (`"·" 'middle dot' " " 'figure space'` per level of indentation) according to the level of hierarchy.

In case of long titles (two lines or more), then all lines are indented (all lines would start at the same place as the first one).

In cases when a child with an observation value is displayed in the table without its contextual parent, meaning e.g. when the parent has no data for the same selection, then the parent name (if the data message is not constrainted to exclude this parent) is displayed as prefix of the child followed by `">" 'greater than'`, e.g. **·  Seeland > Kallnach**

![Table with hierarchical dimensions](/dotstatsuite-documentation/images/DE_table_hierarchy.png)

---

### Management of empty columns
Whenever a column is empty, it is automatically excluded from the table. 

---

### Management of empty rows
Whenever a row is empty, it is automatically excluded from the table.  
If a row with a higher-level hierarchy parent in any row dimension is removed, then all related child rows are displayed one level up in the hierarchical indentation.

**Note**: The future, planned "FULL_NAME" name alternative implementation will replace names of children for which the complete parent hierachy is not displayed.

---

### Management of empty row sections
Whenever a complete row section is empty, it is automatically excluded from the table.  

---

### Vertical scroll and freezing table header and Rows section rows
If the table cannot vertically fit on the available screen then the screen should allow vertical scrolling (but infinite dynamic scroll is not impemented).  
While vertically scrolling, the table grid header rows do not scroll but are frozen.
Also the Row sections rows stay sticky on the top of the table while scrolling and as long the corresponding child rows are shown on the screen.

Table header and Row section row freezing is disabled when [Accessibility support](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/general-layout/#web-content-accessibility-support) is enabled.

![DE table vertical scrolling](/dotstatsuite-documentation/images/de-table-vertical-scroll.gif)

---

### Horizontal scroll and freezing row headers
>*Version history:*  
> Enhanced with [March 4, 2022 Release .Stat Suite JS 13.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#march-4-2022)  
> Introduced in [January 13, 2022 Release .Stat Suite JS 12.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#january-13-2022)

When scrolling horizontally, the table header (title and subtitle) is frozen on the left side of the browser window, and the toolbar menu is frozen in the middle of the browser window.  
The row header(s) and the row section header(s) are frozen on the left side of the browser window when scrolling horizontally.  
It/they move(s) to the left when scrolling horizontally until reaching the right border of the browser window and stick(s) there, unless there is not enough space for the remaining data columns (e.g. mobile mode), in which case it/they keep(s) scrolling.

![DE table horizontal scrolling](/dotstatsuite-documentation/images/de-table-horizontal-scroll.gif)

---

### Scroll back arrows
> Introduced in [March 4, 2022 Release .Stat Suite JS 13.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#march-4-2022)

A "fast-forward left" button and a "fast-forward top" button appear when the user has started scrolling whther horizontally or vertically. Using one of these buttons, the user can quickly go back to the initial horizontal or vertical scroll position.  
Once the user is back to the initial horizontal scroll position, then the "fast-forward left" button disappears.  
Once the user is back to the initial vertical scroll position, then the "fast-forward top" button disappears.

![DE table scroll and arrows](/dotstatsuite-documentation/images/de-table-scroll-arrows.gif)

---

### Horizontal merged column header cells
> Released in [May 19, 2021 Release .Stat Suite JS 8.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#may-19-2021)

When 2 or more dimensions are positioned on the Column axis, and if 2 or more horizontally neighboured cells have the same value (dimension item), then **these cells are merged**.  
Merging is not applied to cells that have different cells in rows above them, thus never to cells in the last (lowest) column header row.  
The merged column header labels are centered by default, but whenever the table width is larger than the width of the table display space, then it sufficiently moves within the cell to the left or right in order to stay visible even **when scrolling horizontally**.

![DE table merged header cells](/dotstatsuite-documentation/images/de-table-merged-cells.png)

**Note** that this feature doesn't apply to the [html WCAG table](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/general-layout/#web-content-accessibility-support).

---

### Highlighted cells, rows and columns
> Released in [April 1, 2021 Release .Stat Suite JS 7.2.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-1-2021)

A table cell is highlighted with a blue border when mouse-hovered or selected.    
Cells can be selected and deselected through double-click.  
When a cell is selected, then also all cells in the same row and same column (except column header cells) are background-coloured with a specific highlight colour (Neutral lighten-3 #FEF4E6). Row sections and column headers are not impacted.  
The highlight remains when switching the representation from table to chart and table again, but is removed when either the cell selection, the table layout or the data selection change.

![DE table view highlight](/dotstatsuite-documentation/images/de-preview-table-highlight.png)

---

### Extreme cases of layout

When all dimensions have **single(-fixed) values**, in which case there are no Column, Row section and Row dimensions and thus only one single value is to be displayed, then the special attribute row and column are hidden and flags/footnotes is shown directly in the single cell:

![DE_table_scrolling](/dotstatsuite-documentation/images/DE_table_single_value.png)

In case there is **no Column** dimension, then the special attribute column is hidden and flags/footnotes are shown directly in the cell(s).

![DE_table_scrolling](/dotstatsuite-documentation/images/DE_table_responsiveness.png)

Since there must always be at least one dimension in the Row axis (unless all dimensions have single(-fixed) values - see above case) the following table layout is **not possible**:

![DE_table_scrolling](/dotstatsuite-documentation/images/DE_table_without_row_dims.png)

---

### Links to underlying microdata

For any DSD and dataflow fulfilling the conditions for microdata, the Data Explorer will add a hyperlink to each table value cell that allows (through clicking the link) opening the microdata viewer tab which displays those microdata that are linked to that aggregated data value.

![de-microdata-1](/dotstatsuite-documentation/images/de-microdata-1.png)

For more information, see [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/microdata-preview-table/).
