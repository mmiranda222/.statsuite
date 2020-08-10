---
title: "Customise chart layout"
subtitle: 
comments: false
weight: 3300
---

#### Table of Content
- [Chart series](#chart-series)
- [Chart size](#chart-size)
- [Highlight and Baseline](#highlight-and-baseline)
- [Axes scaling](#axes-scaling)

---

> This section describes how to customise the **chart layout** by using the **"Customise"** option from the toolbar. For the customisation of the table previews, please see [this section](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/customise-feature/) of the documentation.

### Chart series

The corresponding selectors allow changing: 
- The dimension and their values displayed on the x and y axes for `scatter plots`;
- The dimension used for symbols for `horizontal symbol chart` and `vertical symbol chart`;
- The dimension displayed on the x axis and whether observations are to be displayed as percentage or not for `stacked bar charts`.

---

### Chart size

The corresponding selectors allow changing:  
- The chart hight in pixels, including chart header and chart footer. The default chart height is predefined and configurable (application default: 400 pixels);
- the chart width in pixels. The default chart width is 100% horizontal screen space currently available.

---

### Highlight and Baseline

By default, all data elements (bars, columns, lines, dots, etc.) in the charts are displayed in a uniform, pre-defined, configurable colour (default: grey). In order to make certain elements visually standing out, the user can select one or several elements in two multi-selection drop-down lists: 
- Highlights: ordered list of elements to be coloured in a pre-defined, configurable sequence of colours;
- Baseline: maximum one item to be coloured in a separate pre-defined, configurable colour (default: #0B1E2D (almost black)).

---

### Axes scaling

The corresponding selectors allow changing:
- Minimum value, maximum value, pivot value and step size for the vertical axis (always non-time-period scale);
- Minimum value, maximum value, pivot value and step size for the horizontal axis (when non-time-period scaled, e.g. scatter plot).

**Note**: Currently, for timeline charts, the horizontal axis with its time-period scale cannot be customised. The time periods are taken from the Time Period & Frequency filter. The step size (grid) is automatically calculated from the time periods and the available space. 


