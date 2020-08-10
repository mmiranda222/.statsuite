---
title: "Preview table"
subtitle: 
comments: false
weight: 2500

---

### Table of Content
- [Role of preview-tables](#role-of-preview-tables)
- [Preview-table components](#preview-table-components)
- [Initial layout](#initial-layout)
- [Layout variations from changing user selections](#layout-variations-from-changing-user-selections)
- [Extreme cases of layout](#extreme-cases-of-layout)
- [Display of observations values](#display-of-observations-values)
- [Management of empty columns](#management-of-empty-columns)
- [Management of empty rows](#management-of-empty-rows)
- [Management of empty row sections](#management-of-empty-row-sections)
- [Vertical scroll and freezing table header and Rows section rows](#vertical-scroll-and-freezing-table-header-and-rows-section-rows)

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
- Column
- Row section (groupings of rows with the same partial dimension selection)
- Row

The **row section** has been introduced to enhance the table readability because it helps avoiding (too many) repeated or imbricated row header cells.

The classical feature of the pivot table 'filter' axis (like in Excel pivot tables) is assured by the visualisation page filters. Therefore the table grid does not have its own additional 'filter' selector.

The dimensions on the Column axis are shown completely flattened into **1 header row per dimension**. Flattened means each child cell is shown without the hierarchy of its parents. "FULL_NAME" annotations might later be an alternative to provide necessary hierarchical information. Currently, there is no horizontal cell merging when neighboured column header cells have the same value.

The dimensions on the Row axis are shown flattened into **1 header column per dimension**. Flattened means each child cell is shown without the hierarchy of its parents. "FULL_NAME" annotations might later be an alternative to provide necessary hierarchical information. However, if the last row dimension has a hierarchy - even though depending on the current data selection it might not be always complete - then all child labels are **indented** (+15 pixels per level of hierarchy) according to the level in the (incomplete) hierarchy provided in the data message.  
Unless all dimensions have single(-fixed) values, there must always be at least one dimension in the Row axis. This is required in order to avoid the strange layout case when there are dimensions in the Row section axis but none in the Row axis.  
There is no vertical cell merging when vertically neighboured row header cells have the same value. It is rather encouraged to use more than 1 row dimension only in cases when statistically absolutely necessary. Otherwise, the Row axis should contain always one single dimension and all other (non-Column-axis) dimensions should be positioned on the Row section axis. 

The dimensions on the Row section axis are shown completely flattened, which means each child value within the concatenated row section dimensions is shown without the hierarchy of its parents. "FULL_NAME" annotations might later be an alternative to provide necessary hierarchical information.  
Because Row section rows do not include the dimensions in the Row axis and thus the resulting coordinates/combinations are always incomplete, there are no data value cells in these rows. These Row section rows thus span horizontally over the complete table width.  
The Row Section content is constructed in the same way as the table subtitle with the concatenated dimension and dimension value names with dimensions separated by " ● ".

The distribution of the different data dimensions over the pivot table axes is called *layout*. See below how the initial layout is determined. 

---

### Initial layout

When the preview-table is first displayed, the initial layout is determined in the following ordered way:  

1) Independently from default layouts defined in the annotations, all dimensions with exactly one item (selected or returned) are excluded from the table axes and displayed instead in the first table *subtitle*. Only those single-fixed dimensions normally displayed in the subtitle can be hidden through the "NOT_DISPLAYED" annotation.
2) The default table layout defined by annotations ("LAYOUT_ROW" or "LAYOUT_COLUMN" or "LAYOUT_ROW_SECTION") is applied to the remaining dimensions.  
  *Not implemented (yet): If the configurable maximum number of dimensions to be shown in Columns is exceeded, then the last over-counting dimensions (but not the Time_Period dimension) are moved to the Row Section axis. If the configurable maximum number of dimensions to be shown in Rows is exceeded, then the last over-counting dimensions (but not the Ref_Area dimension) are moved to the Row Section axis.*
3) If there is no Column dimension yet, then the Time_Period dimension, if it has no layout annotation, otherwise the first dimension without a layout annotation, except the Ref_Area dimension, is moved to the Column axis.
4) If there is no Row dimension yet, then the Ref_Area dimension dimension, if it has no layout annotation, otherwise the first dimension without a layout annotation, except the Time_Period, is moved to the Rows axis.
5) All other dimensions without a layout annotation are moved to the Row Section axis.

The dimensions configured to be part of the "Unit of measure" concepts are, when possible, merged together with the attributes configured to be part of the "Unit of measure" concepts and displayed as a separate "virtual" dimension on an automaically defined axis. For more details see [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/unit-of-measure/).  

What happens when the user starts customizing the layout is described [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/customise-feature/).  

---

### Layout variations from changing user selections

If the user changes the selection(s), it can impact the data preview table if a dimension has now more than 1 or exactly one item, and so if it is displayed in the table grid or in the table subtitle. The following rules apply when the user makes filter selection changes:
* The current layout positioning of dimensions, for which the number of available items (selected or returned) has not changed (between one and many), is not modified;
* Any dimension, for which the number of available items (selected or returned) changes from many to one, moves from wherever it is in the table grid into the table sub-title or, if the "NOT_DISPLAYED" annotation requests so, is hidden;
* Any dimension, for which the number of available items (selected or returned) changes from one to many, moves from the table sub-title (or from the hidden status) into the table grid reapplying the rules for the initial layout:
  1) Move it back into its last previous table axis (if available).
  2) Otherwise move it to the axis defined by the layout annotation of the dimension.
  3) Otherwise, if it is not the Time_Period dimension and if there is currently no ROW dimension, move into the Row axis. 
  4) Otherwise, if it is not the Ref_Area dimension and if there is currently no COLUMN dimension, move into the Column axis.
  5) Otherwise move in into the Row Section axis.

---

### Extreme cases of layout

When all dimensions have single(-fixed) values, in which case there are no Column, Row section and Row dimensions and thus only one single value is to be displayed, then the special attribute row and column are hidden and flags/footnotes is shown directly in the single cell:

![DE_table_scrolling](/dotstatsuite-documentation/images/DE_table_single_value.png)

In case there is no Column dimension, then the special attribute column is hidden and flags/footnotes are shown directly in the cell(s).

![DE_table_scrolling](/dotstatsuite-documentation/images/DE_table_responsiveness.png)

Since there must always be at least one dimension in the Row axis (unless all dimensions have single(-fixed) values - see above case) the following table layout is *not* possible:

![DE_table_scrolling](/dotstatsuite-documentation/images/DE_table_without_row_dims.png)

---

### Display of observations values

Observation values in numerical formats (real, decimal, ...) are displayed as 'Numbers' with thousand separators (e.g. " " (non-breaking space), "." or "'") and a decimal separator (e.g. "." or ",") according to the predefined, configurable locale, and with the fixed number of decimals after the decimal separator as specified in the relevant "DECIMALS" attribute.  

**Example:**   
3 512 032.00

---

### Management of empty columns

Whenever a column is empty, it is automatically excluded from the table. 

---

### Management of empty rows

Whenever a row is empty, it is automatically excluded from the table.  
If a row with a higher-level hierarchy parent in the last row dimension is removed, then all related child rows are displayed one level up in the hierarchical indentation.

**Note**: The future, planned "FULL_NAME" name alternative implementation will replace names of children for which the complete parent hierachy is not displayed.

---

### Management of empty row sections

Whenever a complete row section is empty, it is automatically excluded from the table.  

---

### Vertical scroll and freezing table header and Rows section rows

If the table cannot vertically fit on the available screen then the screen should allow vertical scrolling (but infinite dynamic scroll is not impemented).  
While vertically scrolling, the table grid header rows do not scroll but are frozen.
Also the Row sections rows stay sticky on the top of the table while scrolling and as long the corresponding child rows are shown on the screen.

![DE_table_scrolling](/dotstatsuite-documentation/images/DE_table_scrolling.png)

Table header and Row section row freezing is disabled when [Accessibility support](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/general-layout/#web-content-accessibility-support) is enabled.
