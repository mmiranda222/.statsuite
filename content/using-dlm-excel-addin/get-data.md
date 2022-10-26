---
title: "Get data"
subtitle: 
comments: false
weight: 830
keywords: [
  'Selection wizard', '#selection-wizard',
  'Select data', '#select-data',
  'Specify output', '#specify-output',
  'Table contents', '#table-contents',
  'Data table content', '#data-table-content',
  'Referential metadata table content', '#referential-metadata-table-content',
  'Refresh', '#refresh',
  'Change selection', '#change-selection',
]
---

> *Version history:*  
> Time period boundaries in the filter selector since [October 26, 2022 Release .Stat Suite DLM Excel-addin v3.2.3](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#october-26-2022)  
> Data availability on dimension values since [April 28, 2022 Release .Stat Suite .NET 8.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-28-2022)

#### Table of Content
- [Selection wizard](#selection-wizard)
  - [Select data](#select-data)
  - [Specify output](#specify-output)
- [Table contents](#table-contents)
  - [Data table content](#data-table-content)
  - [Referential metadata table content](#referential-metadata-table-content)
- [Refresh](#refresh)
- [Change selection](#change-selection)
---


### Selection wizard
Clicking on "Get data: New table" allows first selecting a source data space, both internal and external, through a dropdown box. The data spaces displayed are to be configured per installation package (see more details [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-excel-addin#available-connections-and-connection-parameters)). 

![DLM Excel-Addin select source data space](/dotstatsuite-documentation/images/dlm-excel-addin-select-data-source.png)

If the Excel-addin is configured to get data from external sources, then clicking on "New table > External sources..." will open a second list of data sources in a popup window with the list of those external data sources.

![DLM Excel-Addin select external data source](/dotstatsuite-documentation/images/dlm-excel-addin-select-external-data-source.png)

Once a data space is selected, the Selection wizard guides the user through a two-steps process:
- Step 1 - Select data
- Step 2 - Specify output

#### Select data
The step 1 of the Selection wizard provides a dropdown selector of dataflows for the selected data source. It is possible to:
- filter the dataflow list by "favorites" or "all" with a radio button (all by default)   
- filter the dataflow list by keyword(s)

![DLM Excel-Addin select data](/dotstatsuite-documentation/images/dlm-excel-addin-select-data.png)

**Favorites**  
The user can add a dataflow to its favorites by clicking on the star icon once a dataflow is selected. Clicking on "EDIT FAVORITES" opens an extra window with the list of dataflows already flagged as favorites (with a yellow star) and all other dataflows from the same data source not flagged as favorites (with a grey star). Clicking on a grey star makes it yellow and thus the related dataflow is flagged as favorite, and vice-versa.  
It is also possible to filter the list to show only favorites. The user can unflag favorites dataflows by clicking on "CLEAR", or confirm its list of favorites by clicking on "SAVE".

![DLM Excel-Addin edit favorites](/dotstatsuite-documentation/images/dlm-excel-addin-edit-favorites.png)

**Cache clean-up**    
The DLM Excel-Addin has an in-built cache with 2 functions:
- Caching structures for the duration of 3 days,
- Caching data for the duration of the current Excel session (only for the case that the user changes the table layout but not the data selection).

In order to allow you getting fresher structures than those in the current cache, clicking the **cache clean-up** refresh button **empties the cache for all structures**.

**Edit filters**  
Selecting a dataflow automatically displays the list of corresponding dimensions and the current filters. To edit filters, by clicking on the "EDIT FILTERS" button, the user can:
- Modify the default "all" selection for a given dimension filter by selecting elements one by one;
- Select all elements or none for a given dimension filter;
- Search for a specific element (spotlight feature) in a dimension filter;
- Show only selected elements per dimension filter;
- Apply the user's final selection(s), or cancel all (No filter, re-applying the "all" default setup).

![DLM Excel-Addin edit filters](/dotstatsuite-documentation/images/dlm-excel-addin-edit-filters.png)

**Only dimension values with available data** are displayed in the edit filters panel. It means that, if e.g. a dataflow has only annual data but it is using a codelist with more frequency values (e.g. Monthly, or Daily), then only Annual frequency will appear in the Frequency selector.  
Similarly, when the dataflow has a **time** dimension, the default start and end periods reflect the current data availability by applying the related values in the *SDMX* actual content constraint as default time period boundaries (e.g. start:2017 end:2022). If the dataflow has no actual content constraint, then the time period start and end values are empty by default.

Once the user has applied a filter selection(s), it is possible to view and directly modify it/them by editing the "Current filters" fields (add/remove).  
The dataflow selection, including filtered dimensions, is also displayed at the bottom of the wizard using [SDMX Rest syntax](https://github.com/sdmx-twg/sdmx-rest/blob/v1.5.0/v2_1/ws/rest/docs/4_4_data_queries.md), and the user can edit this query directly in the field and apply the desired modifications. The filter selections will then be updated accordingly in the above data filters.

Clicking on "Next step" will display the step 2 of the selection wizard.

#### Specify output
The step 2 provides output options for the selected data or referential metadata. The user can:
- Choose in which Excel cell the output table should start;
- Specify the output table layout as "Flat", "Time series down", or "Time series across";
- Choose whether to return the localised names (labels) for dimensions and dimension members, with or without excluding the underlying codes (IDs). The language of the localised names can be picked from the ones that are available in the sourced data.

**Content type**  
The user can choose one of the following content type (combinations):
- **Values** for observations values
- **Values and Attributes** for observation and attributes values
- **Referential metadata** if they are available for the selected dataflow

![DLM Excel-Addin specify output](/dotstatsuite-documentation/images/dlm-excel-addin-specify-output.png)

If there are no referential metadata defined for a selected dataflow (in case that the DSD doesn't have the `METADATA` annotation type), and/or if the configuration of the data source is not set with the paramater `isMetadata="true"` (see the installation documentation [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-excel-addin#genericrestconnection)), then the option to return referential metadata is disabled. Instead, this option has a question mark icon added, which shows the tooltip message on mouse-over: "See here for information on how to define referential metadata" with a link to the [related documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/manage-data/upload-data/upload-referential-metadata/#prerequisite).

![DLM Excel-Addin ref metadata hyperlink](/dotstatsuite-documentation/images/dlm-excel-addin-link-ref-metadata.png)

*Note* that for attribute values defined at higher level than the observation value, those high-level attribute values are retrieved and replicated for each time-series in the 2 time-series formats, and for each observation in the flat format.

**Query syntax**  
The DLM Excel-Addin also generates the user selection in various supported formats by clicking on "SHOW QUERY SYNTAX" (also accessible in the right-click menu):
- SDMX Rest query
- STATA
- Eviews
- SAS
- SQL
- R

Clicking on **"Get data"** generates the Excel table filled with all available observations values or referential metadata for the given selection.

---

### Table contents

#### Data table content
The data table generated by the DLM Excel-addin includes a header row with several well-ordered columns:
- first column: **SID** (stands for "Series Identifier"). 
- one column for the ID of each dataflow dimension
- one column OBS_VALUE 
- one column for the ID of each dataflow attribute (if selected and if any)

After the header row, the data table has one row per observation, which contains:
- SID column: contains the full coordinate (key) of each time series constructed as the combination of the IDs of the values of each dimension, except the Time Period dimension, separated with '.', e.g. **`AUS.D2S1.CXC`**
- Dimension column: ID of the corresponding dimension value
- OBS_VALUE column: the corresponding observation value (no value: empty)
- Attribute column: the corresponding attribute value (coded: ID, non-coded: value, no value: empty)

![DLM Excel-Addin data table content](/dotstatsuite-documentation/images/dlm-excel-addin-data-table-content.png)

**Notes**
- The SID is mandatory for adding new observation or attribute values.
- When data are not available while trying to retrieve them, and if the user has write access to the data space for this dataflow, then a warning message *"No (meta)data available for this selection"* is displayed and only the header row of the data table is generated. This allows the user immediately [adding new rows with new data](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm-excel-addin/edit-data/#add-new-rows).

#### Referential metadata table content
A referential metadata table generated by the DLM Excel-addin includes a header row with several well-ordered columns:
- first column: **SID** (stands for "Series Identifier")
- one column for the ID of each dataflow dimension
- one column for the ID of each referential metadata attribute

After the header row, the referential metadata table has one row per attachment, which contains:
- SID column: contains the full or partial coordinate (key) of the attachment constructed as the combination of the IDs of the values of each dimension, and except the Time Period dimension, separated with '.'. The positions of dimensions to which the referential metadata are not attached remain empty, e.g. **`AUS..CXC`**
- Dimension column: if the referential metadata is attached to this dimension then the ID of the corresponding dimension value, otherwise the cell is empty.
- Referential metadata attribute column: the corresponding attribute value (coded: ID, non-coded: value, no value: empty)

![DLM Excel-Addin ref metadata table content](/dotstatsuite-documentation/images/dlm-excel-addin-ref-metadata-table-content.png)

**Notes**
- The SID is mandatory for adding new referential metadata values.
- The SID of referential metadata attached at dataflow level is only composed of a number of dots (depending on the number of non-time-period dimensions, e.g. '.' or '...').
- When referential metadata are not available while trying to retrieve them, and if the user has write access to the data space for this dataflow, then a warning message *"No (meta)data available for this selection"* is displayed and only the header row of the referential metadata table is generated. This allows the user immediately [adding new rows with new referential metadata](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm-excel-addin/edit-data/#add-new-rows).

---

### Refresh
The "Refresh" section of the Excel-addin ribbon provides two options to whether
- request to refresh the data or referential metadata tables in your “Current Sheet”, or
- all data or referential metadata tables in “All Sheets”.

![DLM Excel-Addin refresh](/dotstatsuite-documentation/images/dlm-excel-addin-refresh-data.png)

Clicking one of the options will fully refresh the data or referential metadata table(s) with updated values from the underlying source(s).

---

### Change selection
Clicking on “Get Data - Change Selection” re-opens the selection wizard back to [Step 1 (Select data)](#select-data) where the user can modify the current selection and filter(s).  
Applying new options all the way through Step 2 (Specify output) and “Get data” will generate a new Excel table thus replacing the previous one.

![DLM Excel-Addin change selection](/dotstatsuite-documentation/images/dlm-excel-addin-change-selection.png)
