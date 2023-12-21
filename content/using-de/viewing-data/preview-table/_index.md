---
title: "Preview table"
subtitle: 
comments: false
weight: 2500
keywords: [
  'Role of preview-tables', '#role-of-preview-tables',
  'Preview-table components', '#preview-table-components',
  'Initial layout', '#initial-layout',
  'Custom (default) table settings', '#custom-default-table-settings',
  'Layout variations from changing user selections', '#layout-variations-from-changing-user-selections',
  'Display of observations values', '#display-of-observations-values',
  'Display of qualitative observations', '#display-of-qualitative-observations',
  'Display of additional information', '#display-of-additional-information',
  'Display of hierarchical dimensions', '#display-of-hierarchical-dimensions',
  'Display of advanced hierarchies', '#display-of-advanced-hierarchies',
  'Management of empty columns', '#management-of-empty-columns',
  'Management of empty rows', '#management-of-empty-rows',
  'Management of empty row sections', '#management-of-empty-row-sections',
  'Horizontal scroll', '#horizontal-scroll',
  'Vertical scroll', '#vertical-scroll',
  'Scroll back arrows', '#scroll-back-arrows', 
  'Horizontal merged column header cells', '#horizontal-merged-column-header-cells',
  'Highlighted cells, rows and columns', '#highlighted-cells-rows-and-columns',
  'Extreme cases of layout', '#extreme-cases-of-layout',
  'Links to underlying microdata', '#links-to-underlying-microdata',
]
---

#### Table of Content
- [Role of preview-tables](#role-of-preview-tables)
- [Preview-table components](#preview-table-components)
- [Initial layout](#initial-layout)
- [Custom (default) table settings](#custom-default-table-settings)
- [Layout variations from changing user selections](#layout-variations-from-changing-user-selections)
- [Display of observations values](#display-of-observations-values)
- [Display of qualitative observations](#display-of-qualitative-observations)
- [Display of additional information](#display-of-additional-information)
- [Display of hierarchical dimensions](#display-of-hierarchical-dimensions)
- [Display of advanced hierarchies](#display-of-advanced-hierarchies)
- [Management of empty columns](#management-of-empty-columns)
- [Management of empty rows](#management-of-empty-rows)
- [Management of empty row sections](#management-of-empty-row-sections)
- [Horizontal scroll](#horizontal-scroll)
- [Vertical scroll](#vertical-scroll)
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

The preview-table is constructed out of the data resulting from the SDMX query that corresponds to the curent data selection in the filters. In order to prevent too large tables to be built and the web browser to freeze due to memory overload, the SDMX query includes a predefined, configurable range limit, e.g. 2500 observations. If the range limitation needed to be used because the unlimited result would have exceeded the limit, then a warning message is displayed in the second table sub-title. For more details see [this section](/dotstatsuite-documentation/using-de/viewing-data/preview-table/incomplete-data/). 

For performance reasons, the maximum number of table rows, columns and cells are also limited through configuration.

Because the SDMX API does not allow yet for pro-active pagination, only the first page of data can currently be previewed.

The following specific preview-table actions are proposed:  
- [download](/dotstatsuite-documentation/using-de/viewing-data/toolbar/#table-in-excel) as-is preview-table as Excel file (xslx)

---

### Preview-table components
The preview-table has a **header** (title, first subtitle, second subtitle (unit)), a **footer** (source, logo, copyright) that are common with the charts - for more details see [here](/dotstatsuite-documentation/using-de/viewing-data/common-header-and-footer/) - and a **table grid**. This table grid is a three-dimensional pivot table with the following axes:  
- **Column**
- **Row section** (groupings of rows with the same partial dimension selection)
- **Row**

Note that the **row section** is meant to help and enhance the table readability by avoiding (too many) repeated or imbricated row header cells.  
The classical feature of the pivot table 'filter' axis (like in Excel pivot tables) is assured by the visualisation page [filters](/dotstatsuite-documentation/using-de/viewing-data/filters/). Therefore, the table grid does not have its own additional 'filter' selector.

The dimensions on the **Column axis** are shown flattened into **1 header row per dimension**, or vertically indented for dimensions with hierarchies (see more details in [this section](#display-of-hierarchical-dimensions)). It means that each child cell is shown without the hierarchy of its parents. "FULL_NAME" annotations might later be an alternative to provide necessary hierarchical information.

The dimensions on the **Row axis** are shown with **1 header column per dimension**. Hierarchies are represented through indentation of dimension values (see [this section](#display-of-hierarchical-dimensions) for more details).

Unless all dimensions have single(-fixed) values, there must always be **at least one dimension on the Row axis**. This is required in order to avoid the *strange* layout case when there are dimensions on the Row section axis but none on the Row axis.  
There is no vertical cell merging when vertically neighboured row header cells have the same value. It is rather encouraged to use more than 1 row dimension only in cases when statistically absolutely necessary. Otherwise, the Row axis should always contain one single dimension and all other (non-Column-axis) dimensions should be positioned on the Row section axis.

The dimensions on the **Row section axis** are shown flattened, and for hierarchical dimensions, each child value within the concatenated row section is shown its parent(s) in a breadcrumb feature (see [this section](#display-of-hierarchical-dimensions) for more details).  
Because Row section rows do not include the dimensions in the Row axis and thus the resulting coordinates/combinations are always incomplete, there are no data value cells in these rows. These Row section rows thus span horizontally over the complete table width.  
The Row Section content is constructed with each dimension on a distinct line.

The distribution of the different data dimensions over the pivot table axes is called **layout**. See below how the initial layout is determined. 

---

### Initial layout
When the preview-table is first displayed, the initial layout is determined in the following ordered way:

1) Independently from default layouts defined in the annotations, all dimensions with exactly one item (selected or returned) are excluded from the table axis and displayed instead in the first table *subtitle*. Only those single-fixed dimensions normally displayed in the subtitle can be hidden through the "NOT_DISPLAYED" annotation.
2) The default table layout options defined by annotations (for more details see [here](/dotstatsuite-documentation/using-de/viewing-data/preview-table/custom-data-view/default-layout/)) are then applied to the remaining dimensions.  
  *Not implemented (yet): If the configurable maximum number of dimensions to be shown in Columns is exceeded, then the last over-counting dimensions (but not the Time_Period dimension) are moved to the Row Section axis. If the configurable maximum number of dimensions to be shown in Rows is exceeded, then the last over-counting dimensions (but not the Ref_Area dimension) are moved to the Row Section axis.*
3) If there is no Column dimension yet, then the Time_Period dimension, if it has no layout annotation, otherwise the first dimension without a layout annotation, except the Ref_Area dimension, is moved to the Column axis.
4) If there is no Row dimension yet, then the Ref_Area dimension dimension, if it has no layout annotation, otherwise the first dimension without a layout annotation, except the Time_Period, is moved to the Rows axis.
5) All other dimensions without a layout annotation are moved to the Row Section axis.

The dimensions configured to be part of the combined virtual components are, when possible, merged together with the attributes configured to be part of the combined virtual components. These virtual components are displayed separately on automaically defined axes. For more details see [here](/dotstatsuite-documentation/using-de/viewing-data/preview-table/combined-concepts/).

What happens when the user starts customising the layout is described [here](/dotstatsuite-documentation/using-de/viewing-data/preview-table/customise-feature/).

---

### Custom (default) table settings

* [Default layout](/dotstatsuite-documentation/using-de/viewing-data/preview-table/custom-data-view/default-layout/)
* [Increased table size](/dotstatsuite-documentation/using-de/viewing-data/preview-table/custom-data-view/increased-table-size)
* [Default filter selections](/dotstatsuite-documentation/using-de/viewing-data/preview-table/custom-data-view/default-selection/)
* [Hide information of a data view](/dotstatsuite-documentation/using-de/viewing-data/preview-table/custom-data-view/not-displayed/)
* [Implicit and explicit orders](/dotstatsuite-documentation/using-de/viewing-data/preview-table/custom-data-view/implicit-explicit-order/)
* [Additional downloads of external resources](/dotstatsuite-documentation/using-de/viewing-data/preview-table/custom-data-view/external-resources/)

---

### Layout variations from changing user selections
If the user changes the selection(s), then it can impact the data preview table if a dimension has now more than 1 or exactly one item, and so if it is displayed in the table grid or in the table subtitle. The following rules apply when the user makes **filter selection changes**:
* The current layout positioning of dimensions, for which the number of available items (selected or returned) has not changed (between one and many), is not modified;
* Any dimension, for which the number of available items (selected or returned) changes from many to one, moves from wherever it is in the table grid into the table sub-title or, if the `NOT_DISPLAYED` annotation requests so, is hidden;
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

Other **non-numeric** and **coded measure values formats** are supported and detailed (with example) [here](/dotstatsuite-documentation/using-api/core-data-model/#data-type-definitions).

---

### Display of qualitative observations
> *Version history:*  
> Wrapped textual values since [December 20, 2023 Release .Stat Suite JS yay](/dotstatsuite-documentation/changelog/#december-20-2023)

Observations values in textual formats can be displayed in the table view when the *SDMX* representation of the measure is of textual type, e.g. 'String' (see the list of supported representation types [here](/dotstatsuite-documentation/using-api/core-data-model/#data-type-definitions)).  
When the textual values are too long, then the text is wrapped so that the table length fits to the length of the web-browser page.

![Table with qualitative observations](/dotstatsuite-documentation/images/de-table-qualitative.png)

---

### Display of additional information
> *Version history:*  
> *footnotes* replaced by *notes* in [March 4, 2022 Release .Stat Suite JS 13.0.0](/dotstatsuite-documentation/changelog/#march-4-2022)  
> Enhanced with [February 21, 2022 Release .Stat Suite JS 12.1.0](/dotstatsuite-documentation/changelog/#february-21-2022)

Data attributes and referential metadata can be displayed for preview tables and charts in different ways: through flags, notes, or icons with a link to information displayed in a side panel. 

**Flags**  
Directly displays the IDs of related coded attribute values (with maximal 4 characters) next to the observation value. The localised names of the attribute values are displayed on mouse-over in a tooltip bubble.  
Attributes are displayed through flags only if the code ID of the attribute value is not longer than 4 characters and only when requested by configuration:
- per dataflow in its annotation, see [LAYOUT_FLAG entry here](/dotstatsuite-documentation/using-de/sdmx-annotations/#user-managed-annotations), otherwise
- per Data Explorer scope in its settings, see [here](/dotstatsuite-documentation/configurations/de-configuration/#coded-attributes-returned-as-flags)

**Notes**  
Displays a star icon `*` at the appropriate places as documented [here](/dotstatsuite-documentation/using-de/viewing-data/preview-table/footnotes/). The related attribute values are displayed on mouse-over in a tooltip bubble.  
Attributes are displayed through notes only if they should have been displayed through flags but could not because the code ID of the attribute value is longer than 4 characters or when requested by configuration:
- per dataflow in its annotation, see [LAYOUT_NOTE entry here](/dotstatsuite-documentation/using-de/sdmx-annotations/#user-managed-annotations), otherwise
- per Data Explorer scope in its settings, see [here](/dotstatsuite-documentation/configurations/de-configuration/#coded-and-uncoded-attributes-returned-as-notes)

**Information icon and side panel**  
Displays an information icon `(i)` at the appropriate places and the related attribute and referential metadata values are displayed on mouse-over in an information side panel as documented [here](/dotstatsuite-documentation/using-de/viewing-data/preview-table/information-panel).  
All attributes and referential metadata are displayed with an information icon `(i)` unless:
- they are already displayed through flags (see above),
- they are already displayed through notes (see above) or
- they are defined to not to be displayed through the related dataflow annotation, see [NOT_DISPLAYED entry here](/dotstatsuite-documentation/using-de/sdmx-annotations/#user-managed-annotations).  


*Configuration examples:* 

Configuration in dataflow annotations:
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

Configuration in Data Explorer configuration settings:  
```json
"sdmx": {
    "attributes": {
      "flags": ["OBS_STATUS", "CONF_STATUS"],
      "notes": ["NOTE"]
    },
}
```

#### The following display rules are applied with ascending prevalence for any attribute
(7) The DE configuration `notes` defines which attributes are displayed as `note`.  
(6) The DE configuration `flags` defines which attributes are displayed as `flag`.   
(5) The DF annotation `LAYOUT_NOTE` fully overwrites the list in DE configuration `notes` and instead defines which attributes are displayed as `note`.  
(4) The DF annotation `LAYOUT_FLAG` fully overwrites the list in DE configuration `flags` and instead defines which attributes are displayed as `flag`.  
(3) The DF annotations `UNIT_MEASURE_CONCEPTS`, `DRILLDOWN_CONCEPTS` and `DRILLDOWN` define which attributes are displayed differently due to other (already existing, being implemented or planned) features, even if they have been listed in any of the previously mentioned settings.  
(2) The DF annotation `NOT_DISPLAYED` defines which attributes are **not displayed** at all even if they have been listed in any of the previously mentioned setting.  
(1) All attributes not defined by the previously listed settings are indicated by an information icon `(i)` and shown in the `information` side panel. 

**Rule's exception for Flags**  
If the value ID of an attribute that is defined as flag is longer than 4 characters, then this value will not be displayed as a flag but as a note.

---

### Display of hierarchical dimensions
>*Version history:*
> Display empty parents as empty rows and columns since [December 20, 2023 Release .Stat Suite JS yay](/dotstatsuite-documentation/changelog/#december-20-2023)  
> Single-item selection displayed in sub-header since [September 20, 2023 Release .Stat Suite JS 'xray'](/dotstatsuite-documentation/changelog/#september-20-2023)  
> Indentation on column headers since [December 5, 2022 Release .Stat Suite JS 'spin'](/dotstatsuite-documentation/changelog/#december-5-2022)  
> Extended to all dimensions + dots with [December 14, 2021 Release .Stat Suite JS 11.0.0](/dotstatsuite-documentation/changelog/#december-14-2021)  
> Introduced in [October 8, 2019 Release .Stat Suite JS 2.0.0](/dotstatsuite-documentation/changelog/#october-8-2019) 

**On the row axis:**
- All **dimensions with hierarchies** on the row axis are **indented** (one middle dot `"·"` and figure space `" "` per level of indentation) according to the level of hierarchy.
- In case of long titles (two lines or more), then all lines are indented (all lines would start at the same place as the first one).
**Hierarchies on row axis with empty parents:**
- Selected parents without observations are displayed in the table as a separate empty rows. Their value cells are empty (instead of .. which is used for observations without observation values).

![Table with hierarchical dimensions](/dotstatsuite-documentation/images/de-table-empty-parent-rows.png)
  
**On the column axis:**
- All column header cells are top-aligned including the dimension label cell
- All **dimensions with hierarchies** on the column axis are **vertically indented** (middle dot `"·"` with a line break per per level of indentation)

![Table with hierarchical dimensions](/dotstatsuite-documentation/images/DE_table_hierarchy_column.PNG)

**Hierarchies on column axis with empty parents:**
- Selected parents without observations are displayed in the table as a separate empty columns. Their value cells are empty (instead of .. which is used for observations without observation values).
- Each parent with empty observations is still vertically indented. 

![Table with hierarchical dimensions](/dotstatsuite-documentation/images/de-table-empty-parent-columns.png)

**On the row section axis:**
- In case when a child with an observation value is displayed in the table along with its selected parent, then the parent name is displayed as prefix of the child followed by ">" 'greater than'.
- In case of multiple parents' levels, then only the direct parent of a child is displayed as a breadcrumb (as prefix).

**Hierarchies on row section axis with empty parents:**
- When a hierarchical dimension is displayed on the row section axis, and a parent of a selected child is also selected and has no data, then the display is the same as when the parent has data.

**Additional rules for empty parents:**
- `NOT_DISPLAYED` (see [Hide information of a data view](/dotstatsuite-documentation/using-de/viewing-data/preview-table/custom-data-view/not-displayed/#hide-information-of-a-data-view)) continues to be applied only to single fixed dimensions or with the (`CODE1+CODE2`) syntax. Those values remain hidden.
- If a parent (of a selected child) is marked as `NOT_DISPLAYED` but is selected, then both parent and child are displayed.
- However, independently from the selections, `NOT_DISPLAYED` continues to be always applied within combined dimensions (see [Combined concepts](/dotstatsuite-documentation/using-de/viewing-data/preview-table/combined-concepts/)).
- In general for Combined dimensions, whenever an empty hierarchical parent is added, then it is added only once and all following dimensions in the combination are omitted from that combination.
- Rows of combinations at root level are omitted if they have no data. The (grand-)parent(s) row without data are also omitted if there are no child rows to be displayed.

See more details about [Selectable empty parent in hierarchical filters](/dotstatsuite-documentation/using-de/viewing-data/filters/#hierarchical-content/selectable-empty-parent-in-hierarchical-filters) and [Automated selected parents](/dotstatsuite-documentation/using-de/viewing-data/filters/#hierarchical-content/automated-selected-parents)

---

### Display of advanced hierarchies
See https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/advanced-hierarchies/

---

### Management of empty columns
Whenever a column is empty, it is automatically excluded from the table, **except** for selected empty parent(s) of a hierarchical dimension (see [this section](#display-of-additional-information) above).

---

### Management of empty rows
Whenever a row is empty, it is automatically excluded from the table, **except** for selected empty parent(s) of a hierarchical dimension (see [this section](#display-of-additional-information) above).

---

### Management of empty row sections
Whenever a complete row section is empty, it is automatically excluded from the table.  

---

### Horizontal scroll
>*Version history:*  
> Optimized in order to simplify the general page behavior with [August 3, 2022 Release .Stat Suite JS 'quark'](/dotstatsuite-documentation/changelog/#august-3-2022)  
> Enhanced with [March 4, 2022 Release .Stat Suite JS 13.0.0](/dotstatsuite-documentation/changelog/#march-4-2022)  
> Introduced in [January 13, 2022 Release .Stat Suite JS 12.0.0](/dotstatsuite-documentation/changelog/#january-13-2022)

If the table cannot horizontally fit on the available screen, then the screen allows horizontal scrolling.  
When scrolling horizontally, only the filter area and the table move. The page header, page footer and the toolbar menu positions are frozen. The table header (title and subtitle), row header column(s) and the row section header(s) move only until reaching the edge of the browser window (they are defined as "css-sticky"), unless there is not enough space for the remaining data columns, in which case it/they keep(s) individually scrolling as much as possible. The table footer position is frozen.

Freezing table parts is not available when [Accessibility support](/dotstatsuite-documentation/using-de/general-layout/#web-content-accessibility-support) is enabled.

![DE table horizontal scrolling](/dotstatsuite-documentation/images/de-table-horizontal-scroll.GIF)

---

### Vertical scroll
If the table cannot vertically fit on the available screen, then the screen allows vertical scrolling (but infinite dynamic scroll is not implemented).  
When scrolling vertically, the whole page content scrolls but the column header row(s) and the row section header(s) move only until reaching the edge of the browser window (as they are defined as "css-sticky") and the row section header row(s) stop(s) scrolling before covering the column header row(s).

Freezing table parts is not available when [Accessibility support](/dotstatsuite-documentation/using-de/general-layout/#web-content-accessibility-support) is enabled.

![DE table vertical scrolling](/dotstatsuite-documentation/images/de-table-vertical-scroll.GIF)

---

### Scroll back arrows
> Introduced in [March 4, 2022 Release .Stat Suite JS 13.0.0](/dotstatsuite-documentation/changelog/#march-4-2022)

A "fast-forward left" button and a "fast-forward top" button appear when the user has started scrolling whther horizontally or vertically. Using one of these buttons, the user can quickly go back to the initial horizontal or vertical scroll position.  
Once the user is back to the initial horizontal scroll position, then the "fast-forward left" button disappears.  
Once the user is back to the initial vertical scroll position, then the "fast-forward top" button disappears.

![DE table scroll and arrows](/dotstatsuite-documentation/images/de-table-scroll-arrows.png)

---

### Horizontal merged column header cells
> Released in [May 19, 2021 Release .Stat Suite JS 8.0.0](/dotstatsuite-documentation/changelog/#may-19-2021)

When 2 or more dimensions are positioned on the Column axis, and if 2 or more horizontally neighboured cells have the same value (dimension item), then **these cells are merged**.  
Merging is not applied to cells that have different cells in rows above them, thus never to cells in the last (lowest) column header row.  
The merged column header labels are centered by default, but whenever the table width is larger than the width of the table display space, then it sufficiently moves within the cell to the left or right in order to stay visible even **when scrolling horizontally**.

![DE table merged header cells](/dotstatsuite-documentation/images/de-table-merged-cells.PNG)

**Note** that this feature doesn't apply to the [html WCAG table](/dotstatsuite-documentation/using-de/general-layout/#web-content-accessibility-support).

---

### Highlighted cells, rows and columns
> Released in [April 1, 2021 Release .Stat Suite JS 7.2.0](/dotstatsuite-documentation/changelog/#april-1-2021)

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

For more information, see [here](/dotstatsuite-documentation/using-de/viewing-data/microdata-preview-table/).
