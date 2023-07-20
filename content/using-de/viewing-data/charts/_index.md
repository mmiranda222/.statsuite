---
title: "Charts"
subtitle: 
comments: 
weight: 3000

---

All charts use the current selection, which can be modified using the filters.  
All charts are customisable, using the common Customise menu.  
All charts are downloadable in png format.  

The charts share a common header and footer with the preview-table. More information is available [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/common-header-and-footer/).

*(since [May 19, 2021 Release .Stat Suite JS 8.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#may-19-2021))* Below each chart, there is a collapsed localised help text with hints on what to do if the generated chart doesn't correspond to the chart that the user has expected.

![Hints](/dotstatsuite-documentation/images/chart-hints.png)  

By expanding this field, the help text indicates specifically for each type of chart how the user can change chart options or data selections in order to design the chart according to her/his needs under the given chart business rules.  
  
The following types of charts are supported:

![Toolbar](/dotstatsuite-documentation/images/de-toolbar-chart.jpg)

While the 'Chart' tab stays always active/enabled, the dropdown menu items (chart types) dynamically adapt to the characteristics of the currently available data. They stay temporarily disabled until the data has been retrieved from the data space.

- If the 'colour map' configuration is missing or if the data has no 'GEO' dimension, then the 'colour map' is hidden.
- If the data has no 'TIME_PERIOD' dimension, then the 'timeline' chart is hidden.
- Chart types are disabled if the current selection represents too few available data points to build a meaningful chart, e.g., if the data has only one 'TIME_PERIOD' value, then the 'timeline' chart is disabled, or if the filter selection doesn't allow for any value, then all displayed chart types are disabled until the selection changes and values become available.  

---

### Column
**Example**  

![bar chart](/dotstatsuite-documentation/images/chart-bar.png)

---

### Row
**Example**  

![row chart](/dotstatsuite-documentation/images/chart-row.png)

---

### Stacked column
**Example**  

![stacked bar chart](/dotstatsuite-documentation/images/chart-stacked.png)

**Note:** The colour palette for stacked column charts can be configured as described [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-customisation#chart-override-stacked-charts-palette).

---

### Stacked row
> Introduced in [December 14, 2021 Release .Stat Suite JS 11.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#december-14-2021) 

**Example**  

![stacked row chart](/dotstatsuite-documentation/images/chart-stacked-row.jpg)

**Note:** The colour palette for stacked row charts can be configured as described [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-customisation#chart-override-stacked-charts-palette).

---

### Scatter plot
**Example**  

![scatter plot chart](/dotstatsuite-documentation/images/chart-scatter.png)

---

### Horizontal symbol
**Example**  

![horizontal symbol chart](/dotstatsuite-documentation/images/chart-horizontal-symbol.png)

---

### Vertical symbol
**Example**  

![vertical symbol chart](/dotstatsuite-documentation/images/chart-vertical-symbol.png)

---

### Timeline
**Example**  

![timeline chart](/dotstatsuite-documentation/images/chart-timeline.png)

**Note:** Timeline charts are only shown for data that has a TIME_PERIOD dimension and at least 2 TIME_PERIOD values.
---

### Colour map
**Example**  

![choropleth map](/dotstatsuite-documentation/images/chart-choropleth.png)

**Note:** Colour maps need to be configured as described [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-customisation#chart-map-configuration).