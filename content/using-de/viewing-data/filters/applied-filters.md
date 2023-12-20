---
title: "Applied filters panel and data points"
subtitle: 
comments: false
weight: 2250
keywords: [
  'Applied filters panel', '#applied-filters-panel',
  'Data points', '#data-points',
]
---

#### Table of Content
- [Applied filters panel](#applied-filters-panel)
- [Data points](#data-points)

---

### Applied filters panel
Since [April 20, 2023 Release .Stat Suite JS unicorn](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-20-2023), the 'Used filters' panel has been renamed to 'Applied filters' and moved above the data table.   
   
The 'Applied filters' panel displays all currently selected items per dimension of the data table. 

This panel provides an overview of the current selection and an easy mean to unselect individual dimension items or whole dimension selections:
* one single item by clicking on the `x` next to the item label, or
* all items for a given dimension by clicking on the `x` next to the dimension label, or finally 
* all selections by clicking on `Clear all filters`.  

Selected root items are displayed ordinarily. Selected child items are displayed prefixed with `...>` and the details of the full parent hierarchy are shown in a tooltip.

![Hierarchical contents](/dotstatsuite-documentation/images/de-viewingdata-filters-hierarchicalcontent-used-filters-1.png)    

To ease the readibility of the applied filters when 15 or more items are selected in a facet, the display of the individual selected items is replaced by a number being the number of selected items for the specific facet.

![Applied filters](/dotstatsuite-documentation/images/de-filters5.png)  

![Applied filters](/dotstatsuite-documentation/images/de-viewingdata-filters-usedfilters-selecteditemsmorethan15-1.png)

When viewing the microdata table, the 'Applied filters' panel is not displayed.

---

### Data points
> Released with [December 20, 2023 Release .Stat Suite JS yay](/dotstatsuite-documentation/changelog/#december-20-2023)

The number of currently selected data points is displayed below the "Applied filters" label. The data points number is obtained from the available constraint obtained from the current user selection. The number of data points is dynamically calculated each time the user modify the current selection.

![Data points](/dotstatsuite-documentation/images/de-data-points1.png)  

Note that, when there are no filters selected and the "Applied filters" panel is hidden, then the data points number is displayed above the toolbar's grey line.

![Data points](/dotstatsuite-documentation/images/de-data-points2.png)  
