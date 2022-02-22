---
title: "Information side panel"
subtitle: 
comments: false
weight: 2800

---


> Introduced in [February 21, 2022 Release .Stat Suite JS 12.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#february-21-2022)

The values of attributes not already shown in flags or notes and referential metadata are displayed in table views with an information icon '(i)' that opens on click the **information side panel**.

The information icon '(i)' indicates the availability of (non-flag and non-note) attributes or referential metadata at the appropriate level:
- Dataflow (empty coordinate)
  The '(i)' is shown behind the dataflow title.
- Partial coordinate (any number of dimensions > 0) depending on the table layout
  - if referantial metadata pertains to all observations in the row, the '(i)' is shown in the corresponding cell of the extra (information) column.
  - if referantial metadata pertains to all observations in the column, the '(i)' is shown in the corresponding cell of the extra (information) row.
  - if referantial metadata pertains to all observations in the table, the '(i)' icon is shown behind the dataflow title.
  - if referantial metadata pertains to the observation in a cell (some coordinate dimensions are in columns and others are in rows), the '(i)' is shown in the data cell.

Clicking on an '(i)' icon of the table view opens the information side panel with the attribute or referential metadata values. The panel is displayed on the right side (left side for rtl mode) of the web page as an overlay of the current view, and thus not impacting the layout of the current view. A clicked '(i)' icon becomes highlighted, and the entire web page content is frozen except the information side panel content.

The header of the side panel contains:
- the localised panel title 'Information'
- a button to expand or collapse all grouped attribute or referential metadata values (expanded by default)
- a button to download the current referential metadata contents with the SDMX-CSV (.csv) file format (the download of attributes will be added later)

Attributes or referential metadata are titled by their attachment:
- dataflow: dataflow title
- partial coordinate: similar to fixed dimensions in table sub-title  
Interface labels and coded values are displayed according to the current "Labels" option: 'Name', 'Identifier' or 'Both'.  
Each (group of) attribute or referential metadata can be expanded or collapsed individually.

The side panel closes when clicking the overlay, clicking the 'close' icon or pressing the Esc key. This cancels also the highlight state of the '(i)' icon.

![Information side panel](/dotstatsuite-documentation/images/de-side-panel.png)
