---
title: "Information side panel"
subtitle: 
comments: false
weight: 2800

---

> *Version history:*  
> Allow enlarging the side panel for voluminous metadata reading since [June 13, 2024 Release .Stat Suite JS arc](/dotstatsuite-documentation/changelog/#june-13-2024)  
> Enhanced order of display with [April 4, 2024 Release .Stat Suite JS zoo](/dotstatsuite-documentation/changelog/#april-4-2024)  
> 'i' icon is centered in the row sections since [April 20, 2023 Release .Stat Suite JS unicorn](/dotstatsuite-documentation/changelog/#april-20-2023)  
> Referential metadata hierarchy display with [April 11, 2022 Release .Stat Suite JS 14.0.0](/dotstatsuite-documentation/changelog/#april-11-2022)  
> Introduced in [February 21, 2022 Release .Stat Suite JS 12.1.0](/dotstatsuite-documentation/changelog/#february-21-2022)

The values of attributes not already shown in flags or notes and referential metadata are displayed in table views with an information icon '(i)' that opens on click the **information side panel**.

The information icon '(i)' indicates the availability of (non-flag and non-note) attributes or referential metadata at the appropriate level:
- Dataflow (empty coordinate)
  The '(i)' is shown behind the dataflow title.
- Partial coordinate (any number of dimensions > 0) depending on the table layout
  - if referantial metadata pertains to all observations in the row, the '(i)' is shown in the corresponding cell of the extra (information) column.
  - if referantial metadata pertains to all observations in the column, the '(i)' is shown in the corresponding cell of the extra (information) row.
  - if referantial metadata pertains to all observations in the table, the '(i)' icon is shown behind the dataflow title.
  - if referantial metadata pertains to the observation in a cell (some coordinate dimensions are in columns and others are in rows), the '(i)' is shown in the data cell.

**Exception:** when the '(i)' is displayed in the row section, then it is always displayed in the middle of the row section without being stick to or overlapping the text of this area, and regardless the number of rows to be displayed:

![Information side panel](/dotstatsuite-documentation/images/de-side-panel-row-section.png)

Clicking on an '(i)' icon of the table view opens the information side panel with the attribute or referential metadata values. The panel is displayed on the right side (left side for rtl mode) of the web page as an overlay of the current view, and thus not impacting the layout of the current view. A clicked '(i)' icon becomes highlighted, and the entire web page content is frozen except the information side panel content.

The header of the side panel contains:
- the localised panel title 'Information'
- a button to expand or collapse all grouped attribute or referential metadata values (expanded by default)
- a button to download the current referential metadata contents with the SDMX-CSV (.csv) file format (the download of attributes will be added later)
- a button to enlarge the width of the side panel

Attributes or referential metadata are titled by their attachment:
- dataflow: dataflow title
- partial coordinate: similar to fixed dimensions in table sub-title  

Note that for partial coordinates titles, the list of dimensions will not display dimensions and dimension values for which there is a specific 'Hide' rule: see more details [here](/dotstatsuite-documentation/using-de/viewing-data/preview-table/custom-data-view/not-displayed/#).

Interface labels and coded values are displayed according to the current "Labels" option: 'Name', 'Identifier' or 'Both'.  
Each (group of) attribute or referential metadata can be expanded or collapsed individually.

The side panel closes when clicking the overlay, clicking the 'close' icon or pressing the Esc key. This cancels also the highlight state of the '(i)' icon.

![Information side panel](/dotstatsuite-documentation/images/de-side-panel.png)

Clikcing the "enlarge" button will extend the witdh of the panel to better read voluminous metadata information:

![Information side panel](/dotstatsuite-documentation/images/de-side-panel-enlarge.png)

Attributes are grouped under the parent "Data Characteristics", which can be configured and localised.

**Exception rule of display:**  
When clicking on the **dataflow-level 'i' icon**, then referential metadata is displayed **in descending order of attachment** e.g., dataflow-level referential metadata first, followed by the fixed dimensions displayed in the sub-title, respecting the same order. 

Referential metadata can be represented with a hierarchy if such is defined in the corresponding *SDMX* Metadata Structure Definition (MSD). Note that currently only one child level is supported, and that the parent metadata of child metadata cannot have data themselves, the parents being "presentational-only" elements. For details see [here](/dotstatsuite-documentation/using-api/ref-metadata/#hierarchial-referential-metadata).

The hierarchy is expressed in the information side panel using a tree structure and all tree branches are expanded by default.

![Information side panel](/dotstatsuite-documentation/images/de-side-panel2.png)
