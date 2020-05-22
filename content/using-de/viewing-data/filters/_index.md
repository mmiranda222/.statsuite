---
title: "Filters"
subtitle: 
comments: false
weight: 2100

---

#### Table of Content
- [Multi selection filters](#multi-selection-filters)
- [Hierarchical contents](#hierarchical-contents)
- [Spotlight](#spotlight)
- [Used filters](#used-filters)

**General note**: all content related to the filter area is localised. For more information, go to the [general documentation about Languages](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/general-layout/#language).

### Multi selection filters
The visualisation pages for data table/chart views are dynamically filtered using the filters on the left side of the page. All filters are mutli-selection filters, except for Frequency (see the [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/time-period/) related to the specific functional requirements and behaviors of the **Frequency and Time-Period** selectors).  

![Multi selection filters](/images/de-filters1.png)

All dimensions of a selected data view are returned as filters, and based on data availability (see [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/data-availability/)).  
The user can select dimension items, including Frequency and time period ranges, from the list of available filter values to be shown in the data view. Each selection will automatically trigger the update of the data view.  
If the user has made selection(s) in the previous search result page, or if a default selection is applied from an *SDMX* annotation (see [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/custom-data-view/default-selection/)), then these selections will appear in the "Used filters" area by default.  
**Note** that, as a generic behavior, when no element of a filter is selected, then it acts as if all were selected.  
A numbering feature, next to the filter name, indicates for each filter the number of selection per total selectable items(`n/t`).

![Multi selection filters](/images/de-filters12.png)

### Hierarchical contents
In case of a hierarchy in the dimension items, the filter will display the root parents' list at first. A blue arrow next to an item and right-aligned will indicate when this item is a parent of sub-item(s).

![Hierarchical contents](/images/de-filters2.png)

If some of the root parents have children, then by clicking on the arrow, the children of this root parent will be displayed instead. The same behaviour is applied if some of the children also have a sub-children list.  

![Hierarchical contents](/images/de-filters21.png)

**Functional behaviors**:
* When selecting a parent, the selected parent is added to the "Used filters" area and, in the filter, the selected parent is shown with a (light blue) background.
* Its children are visible only if the user clicks on the arrow placed to the right of the parent label. **Note** that the arrow closed to a parent label can be clicked even if the parent has not been previously selected.
* Once the arrow is clicked, the children list appears. Above this list, the parent appears (with a blue background if previously selected, or without background if not selected) in a distinct zone separated by a thick light grey line, named "children breadcrumb".
* Selecting a sub-child will act the same way, but in the "Used filters area" the user will see the selected sub-child item prefixed with `...>` and the details of the parent information is displayed in a tooltip.
* The "dots" line is also visible in the "children breadcrumb" to allow the user going back to a previous level corresponding to the underlined item. For each item, there is a similar tooltip "Back to this level" meaning that by click, the user goes back to the level of the list where the item belongs.

### Spotlight
The spotlight filter appears only when the list of items exceeds a configurable number (e.g. more than 7 that represents the limit, in default layout, before a scrollbar option is introduced in the filter area). The spotlight filter dynamically reduces the returned number items when the user types some text in it.  

![Spotlight](/images/de-filters3.png)

For hierarchical contents, it dinamically acts on all contents at once when using it from the root level, so that it displays the list of results in one single and flat list, regardless their position in the hierarchy, with the information of the root(s) in light grey:

![Spotlight 2](/images/de-filters4.png)

But, when using spotlight on hierarchical contents from a sub-level, then it will ONLY act on the current visible level.

### Used filters
The "Used filters" area displays all current selected items, per dimension, for a given data view.  
The top right *green* numbering feature counts the total number of selected items for all dimensions.  
Used filters are ranked and displayed by dimension type.  
Users can unselected:
* one single item by clicking on the `x` next to the item label, or
* all items for a given dimension by clicking on the `x` next to the dimension label, or finally 
* all selections by clicking on `Clear all filters`.

![Used filters](/images/de-filters5.png)
