---
title: "Filters"
subtitle: 
comments: false
weight: 2100

---

#### Table of Content
- [Filter area](#filter-area)
- [Multi selection filters](#multi-selection-filters)
- [Frequency & time period filter](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/time-period/)
- [Data availability](#data-availability)
- [Hierarchical content](#hierarchical-content)
- [Local search](#local-search)
- [Used filters panel](#used-filters-panel)

**General note**: All content related to the filter area is localised. For more information, go to the [general documentation about Languages](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/general-layout/#language).

---

### Filter area

The left-hand side (right-hand in rtl mode) of the visualisation page shows a set of dimension filters that allow dynamically filtering the dimension values to be displayed in the preview table or chart, to be extracted through the download feature 'Filtered data in tabular text (CSV)' or to be applied in the auto-generated data query in 'Developer API' menu.

The current filter selections are displayed as a summary in the ['Used filters' panel](#used-filters-panel), which is always the top-first panel in the filter area.

Other filter panels are created for each of the dimensions of the currently displayed dataflow based on data availability (see [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/data-availability/)), except if the dimension contains only one possible item, in which case the corresponding filter is hidden, and except for 'Frequency' and 'Time Period' dimensions, which are combined in a common 'Frequency & Time Period' filter (see the related [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/time-period/)).

The order of the filter panels respects the order of the dimensions as defined in the underlying data structure definition (DSD), except the ['Frequency & Time Period' filter](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/time-period/) panel, which is displayed second after the ['Used filters' panel](#used-filters-panel). 

Next to each filter name is an indication of the number of currently selected items against the number of available items (`selected/available`).

![Multi selection filters](/dotstatsuite-documentation/images/de-filters12.png)

If the user has made selection(s) in the previous search result page, if a default selection is applied from an *SDMX* annotation (see [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/custom-data-view/default-selection/)), or if the URL contains dimension selections, then these selections are automatically pre-applied in the filters.

Any filter selection change will automatically trigger the update of the data view (table/chart/API query), and these changes will also be reflected in the ['Used filters' panel](#used-filters-panel).  

**Note** that, as a generic behavior, when no element of a filter is selected, then it acts as if all items were selected. However, if a corresponding query is saved (e.g. bookmarked page, saved API query or shared dynamic table/chart), then the results may defer later in case the available dimension items evolve. Therefore, the number of selected items is displayed with '0' in case no item is selected, which is functionally different than having all items selected.    

---

### Multi-selection filters

All filters are standardised multi-selection filters, except the ['Frequency & Time Period' filter](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/time-period/), and the ['Used filters' panel](#used-filters-panel). It means that the user can select multiple items per filter.  

![Multi selection filters](/dotstatsuite-documentation/images/de-filters1.png)

---

### Frequency & time period filter

See [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/time-period/) for details.

---

### Data availability

The filters show by default only those items for which data exists anywhere in the Dataflow. There is only one exception to this rule for parent items without data (See [Hierarchical contents](#hierarchical-contents) for more information). In order to allow the filters taking into account the current data availability, the filters apply the Actual ContentConstraints related to the underlying Dataflow.

An additional filter for the 'Data availability' selection can be displayed by adding `dataAvailability=on` to the URL. This will apply the data availability information on the other filters, as is done by default. This URL parameter is added automatically by the DLM, when the DE is used for previewing data. 

![Hierarchical contents](/dotstatsuite-documentation/images/DE-data-availability-filter-on.png)

With `dataAvailability=off` in the URL, the additional 'Data availability' filter is shown. This filter is switched off and data availability is not applied. 

![Hierarchical contents](/dotstatsuite-documentation/images/DE-data-availability-filter-off.png)

When the user switches the filter check box, the URL automatically updates accordingly.

---

### Hierarchical content

In case of a hierarchy in the dimension items, they are shown as 'scope list', which means that the filter will display at first only the root parents' list. A blue arrow next to an item indicates that this item is a parent of sub-item(s).

![Hierarchical contents](/dotstatsuite-documentation/images/de-filters2.png)

By clicking on the arrow, which doesn't require the parent to be selected first, the child items of that parent item will be displayed instead. Above the children list, the parent appears (with a blue background if previously selected, or without background if not selected) in a distinct zone separated by a thick light grey line, named 'children breadcrumb'.

The same behaviour is applied if some of the child items have themselves child items.  The 'children breadcrumb' is progressively extended with each new parent (which is clickable and has the tooltip "Back to this level") while descending in the hierarchy. This allows the user going back to a previous parent at any level.     

![Hierarchical contents](/dotstatsuite-documentation/images/de-filters21.png)

If for a parent (at any level) there are no data available (according to the Actual ContentConstraint related to the Dataflow), then the parent item is not selectable (and marked in light grey). Still, the user can navigate to the children and back to the parent again. 

Parents without data:  
![Hierarchical contents](/dotstatsuite-documentation/images/DE-filter-parents-without-data.png)

Children of parents without data:  
![Hierarchical contents](/dotstatsuite-documentation/images/DE-filter-children-of-parents-without-data.png)

Selected root items are displayed normally in the ['Used filters' panel](#used-filters-panel).Selected child items are displayed prefixed with `...>` in the ['Used filters' panel](#used-filters-panel) and the details of the parent hierarchy are available in a tooltip.

---

### Local search 

The local search (spotlight filter) box appears only when the list of items exceeds a configurable number (e.g. more than 7 that represents the limit, in default layout, before a scrollbar option is introduced in the filter area). The local search dynamically reduces the returned number items when the user types some text in it.  

![Local search example](/dotstatsuite-documentation/images/de-filters3.png)

For hierarchical contents, if used from the root level, then it dynamically searches on all filter content at once, and displays the list of results in one single and flat list, regardless the position of the results in the hierarchy, with the information of the root(s) in light grey:

![Local search example with hierarchy](/dotstatsuite-documentation/images/de-filters4.png)

But for hierarchical contents, if used from a sub-level, then it will ONLY act on the currently visible level.

---

### Used filters panel

The 'Used filters' panel displays all currently selected items per dimension.  

This panel provides an overview of the current selection and an easy mean to unselect individual dimension items or whole dimension selections:
* one single item by clicking on the `x` next to the item label, or
* all items for a given dimension by clicking on the `x` next to the dimension label, or finally 
* all selections by clicking on `Clear all filters`.

![Used filters](/dotstatsuite-documentation/images/de-filters5.png)
