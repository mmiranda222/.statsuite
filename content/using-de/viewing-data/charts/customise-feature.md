---
title: "Customise chart layout"
subtitle: 
comments: false
weight: 3300
keywords: [
  'Chart series', '#chart-series',
  'Chart size', '#chart-size',
  'Highlight and Baseline', '#highlight-and-baseline',
  'Axes scaling', '#axes-scaling',
  'Timeline chart option for steps on horizontal axis', '#timeline-chart-option-for-steps-on-horizontal-axis',
  'Additional option for authenticated users', '#additional-option-for-authenticated-users',
]
---

#### Table of Content
- [Chart series](#chart-series)
- [Chart size](#chart-size)
- [Highlight and Baseline](#highlight-and-baseline)
- [Axes scaling](#axes-scaling)
- [Timeline chart option for steps on horizontal axis](#timeline-chart-option-for-steps-on-horizontal-axis)
- [Additional option for authenticated users](#additional-option-for-authenticated-users)

---

> This section describes how to customise the **chart layout** by using the **"Customise"** option from the toolbar. For the customisation of the table previews, please see [this section](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/customise-feature/) of the documentation.

### Chart series

The corresponding selectors allow changing: 
- The dimension and their values displayed on the x and y axes for `scatter plot chart`;
- The dimension used for symbols for `horizontal symbol chart` and `vertical symbol chart`;
- The dimension displayed on the x axis and whether observations are to be displayed as percentage or not for `stacked bar chart` and `stacked row chart`.

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

Note: For the following types, Timeline, Horizontal Symbool and Vertical Symbol, there is a size threshold for which, if the chart contains hilghlights or baseline, only these will be displayed.  
By default, these thresholds are height of 300px for the vertical axe of a Timeline or Horizontal Symbol, and width of 300px for the horizontal axe of a Vertical Symbol.  
You can customize these limits with the following options.

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json` under `chart` property

```css
  options = {
    base: {
      minDisplayWidth: 300,
      minDisplayHeight: 300,
    }
  }
```

You can also simply disable this mechanism with the following:

```css
  options = {
    serie: {
      responsiveFocusFilter: false
    }
  }
```

---

### Axes scaling

The corresponding selectors allow changing:
- Minimum value, maximum value, pivot value and step size for the vertical axis (always non-time-period scale);
- Minimum value, maximum value, pivot value and step size for the horizontal axis (when non-time-period scaled, e.g. scatter plot).

**Note**: Currently, for timeline charts, the horizontal axis with its time-period scale cannot be customised. The time periods are taken from the Time Period & Frequency filter. The step size (grid) is automatically calculated from the time periods and the available space. 

---

### Timeline chart option for steps on horizontal axis
> Released in [October 26, 2020 Release .Stat Suite JS 6.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#october-26-2020)

For Timeline chart representations, the user can set a step for labels based on the data frequency.  
The input value is taken into account :
* if the value is superior to the default value computed by the engine, and
* if the value is a multiple of the step value of the minor ticks of the axis.

![chart custom timeline option](/dotstatsuite-documentation/images/chart-custom-timeline-option.png)

---

### Additional option for authenticated users
> Released in [October 26, 2020 Release .Stat Suite JS 6.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#october-26-2020)

When Data Explorer users are authenticated (see the [Login](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/general-layout/#login) specifications), the configuration options for chart include:
* Title, Subtitle, and Source label editing boxes;
* The option to remove the logo;
* The option to remove the copyright logo + link.

**Title, Subtitle, and Source label editing boxes**  
By default, the original title, subtitle and source labels are auto-generated in each corresponding text boxes.  
Editing one of the editable labels will be automatically applied when pressing the `Enter` keyboard, or when navigating to another location of the web browser.  
Once the user starts editing one of the editable labels, a 'Reset' button option appears in the text bow (right aligned) allowing to reset the label to its original state.  
After editing a title, a footnote associated to the dataflow name is kept. After editing a subtitle, footnotes associated to the dimension items are merged into one single footnote at the end of subtitle:

![chart custom merged footnotes](/dotstatsuite-documentation/images/chart-custom-merged-footnotes.png)

This is applicable also when generating a share view ([share specifications](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/toolbar/#share)).

**Option to remove the logo**  
A tick box option allows the user to remove the organisation logo from the chart footer placeholder in the current view.  
This is also applied when generating a share view ([share specifications](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/toolbar/#share)).

**Option to remove the copyright logo + link**  
A tick box option allows the user to remove the copyright logo and the underlying hyperlink from the chart footer placeholder in the current view.  
This is also applied when generating a share view ([share specifications](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/toolbar/#share)).

![chart custom auth users option](/dotstatsuite-documentation/images/chart-custom-auth-users-option.png)
