---
title: "Filters"
subtitle: 
comments: false
weight: 2100
keywords: [
  'Filter area', '#filter-area',
  'Multi-selection filters', '#multi-selection-filters',
  'Hierarchical content', '#hierarchical-content',
  'Selection of parents without data in hierarchical filters', '#selection-of-parents-without-data-in-hierarchical-filters',
  'Forced parent selection', '#forced-parent-selection',
  'Display of code descriptions', '#display-of-code-descriptions',
  'Advanced selection popup', '#advanced-selection-popup',
  'Data availability', '#data-availability',
  'Local search', '#local-search',
  'Keyboard selection options', '#keyboard-selection-options',
  'Frequency and Time period filter', '#frequency-and-time-period-filter',
  'Applied filters panel', '#applied-filters-panel',
]
---

#### Table of Content
- [Filter area](#filter-area)
- [Multi-selection filters](#multi-selection-filters)
  - [Hierarchical content](#hierarchical-content)
  - [Selection of parents without data in hierarchical filters](#selection-of-parents-without-data-in-hierarchical-filters)
  - [Forced parent selection](#forced-parent-selection)
  - [Display of code descriptions](#display-of-code-descriptions)
  - [Advanced selection popup](#advanced-selection-popup)
  - [Data availability](#data-availability)
  - [Local search](#local-search)
  - [Keyboard selection options](#keyboard-selection-options)
- [Frequency and Time period filter](#frequency-and-time-period-filter)
- [Applied filters panel](#applied-filters-panel)

> *Version history:*  
> Remove the display of total number of facet items as well as the 'all'-selection information since [June 13, 2024 Release .Stat Suite JS arc](/dotstatsuite-documentation/changelog/#june-13-2024)  
> Selection of parents without data in hierarchical filters and forced parent selection since [December 20, 2023 Release .Stat Suite JS yay](/dotstatsuite-documentation/changelog/#december-20-2023)  
> Facets values count numbers also count values with no data since [December 20, 2023 Release .Stat Suite JS yay](/dotstatsuite-documentation/changelog/#december-20-2023)  
> Change display of the 'Applied filters' area with [April 20, 2023 Release .Stat Suite JS unicorn](/dotstatsuite-documentation/changelog/#april-20-2023)  
> Bulk selection option is replaced by the 'advanced selection popup' feature since [April 20, 2023 Release .Stat Suite JS unicorn](/dotstatsuite-documentation/changelog/#april-20-2023)  
> Improved hierarchical filters with [April 20, 2023 Release .Stat Suite JS unicorn](/dotstatsuite-documentation/changelog/#april-20-2023)  
> Display of code descriptions introduced in [March 4, 2022 Release .Stat Suite JS 13.0.0](/dotstatsuite-documentation/changelog/#march-4-2022)  
> Checkboxes added to filter items since [October 5, 2021 Release .Stat Suite JS 10.0.0](/dotstatsuite-documentation/changelog/#october-5-2021)  
> keyboard selection options introduced in ([January 21, 2021 Release .Stat Suite JS 7.0.0](/dotstatsuite-documentation/changelog/#january-21-2021))  


**General note**: All content related to the filter area is localised. For more information, go to the [general documentation about Languages](https/dotstatsuite-documentation/using-de/general-layout/#language).

---

### Filter area
The left-hand side (right-hand in rtl mode) of the visualisation page shows a set of dimension filters that allow **dynamically filtering the dimension values** to be displayed in the preview table or chart, to be extracted through the download feature 'Filtered data in tabular text (CSV)' or to be applied in the auto-generated data query in 'Developer API' menu.

The current filters selection is summarised in the ['Applied filters' area](#applied-filters-panel), and displayed above the table/chart data representation.

A filter is created for each of the dimensions of the currently displayed dataflow based on data availability (see [documentation](/dotstatsuite-documentation/using-de/viewing-data/filters/data-availability/)), except if the dimension contains only one possible item or if it is configured to be hidden. In addition, the dimensions 'Frequency' and 'Time Period', when available, are automatically combined into a common 'Frequency & Time Period' filter (see the related [documentation](/dotstatsuite-documentation/using-de/viewing-data/filters/time-period/)).

The order of the filters respects the order of the dimensions as defined in the underlying data structure definition (DSD), except the ['Frequency & Time Period' filter](/dotstatsuite-documentation/using-de/viewing-data/filters/time-period/) panel, which is displayed second after the ['Applied filters' panel](#applied-filters-panel). 

The filter title contains the localised name of the dimension's concept. In case the filter has at least one selected item, then the number of currently selected filter items (surrounded by a frame) is added to the title.

![Multi selection filters](/dotstatsuite-documentation/images/de-filters12.png)

If the user has made selection(s) in the previous search result page, if a default selection is applied from an *SDMX* annotation (see [documentation](/dotstatsuite-documentation/using-dlm/custom-data-view/default-selection/)), or if the URL contains dimension selections, then these selections are automatically pre-applied in the filters.

---

### Multi-selection filters
All filters are standardised multi-selection filters, except the ['Frequency & Time Period' filter](/dotstatsuite-documentation/using-de/viewing-data/filters/time-period/). It means that the user can select multiple items per filter.  

![Multi selection filters](/dotstatsuite-documentation/images/de-filters1.png)

Each item of a filter is displayed with a **checkbox** on the left side in the filter list:
- when the item is not selected, the checkbox is empty;
- when the item is not selected and the mouse hovers it, the checkbox stays empty and the background is blue;
- when the item is selected, the checkbox is changed into a tick mark.

![de filter checkbox](/dotstatsuite-documentation/images/de-filters-checkbox.png)


When a filter contains 8 items or more, then:
- a vertical scrollbar is added to the filter
- a [local search](#local-search) (spotlight feature) box is displayed,
- an **advanced selection** button is displayed next to the local search box, which gives access to an [advanced selection popup](#advanced-selection-popup). A localised tooltip with the text "Use advanced selection modes" is displayed on mouse-over.

![Advanced selection button](/dotstatsuite-documentation/images/de-advanced-selection-button.png)

Any filter selection change will automatically trigger the update of the data view (table/chart/API query), and these changes will also be reflected in the ['Applied filters' panel](#applied-filters-panel).  

#### Hierarchical content
In case of a hierarchy in the items, they are shown as 'a tree', which means that the filter will display all the items with indentations according to the item level in the tree. A blue arrow next to an item indicates that this item is a parent of child item(s). Clicking this blue arrow switches its up/down direction and the related child items will respectively be hidden or become visible. By default, the tree is fully expanded so that all the items of all tree levels are visible (through scrolling if needed).

![Hierarchical contents](/dotstatsuite-documentation/images/de-viewingdata-filters-hierarchical-arrow-behaviour.png)

If for a parent (at any level) there are no data available (according to the Actual ContentConstraint related to the Dataflow), then the parent item is marked in light grey, but it can still be selectable with certain conditions: see [below](#selectable-empty-parent-in-hierarchical-filters). Still, the user can navigate to the children. 

![Hierarchical contents](/dotstatsuite-documentation/images/de-viewingdata-filters-hierarchicalcontent-root-without-data.png) 

For more information on how advanced hierarchies can be applied (using the *SDMX* Hierarchical Codelist), see [Advanced hierarchies](/dotstatsuite-documentation/using-de/viewing-data/filters/advanced-hierarchies).

#### Selection of parents without data in hierarchical filters
By default, if a parent at any level of a hierarchical codelist has no data available (according to the *SDMX* Actual ContentConstraint related to the Dataflow), then the parent item is marked in light grey and is not selectable. However, the following additional rules apply:
- When a parent item without data has at least one selected (grand-)child with data, then the user can (de)select this parent item (thus it is shown/hidden in the table view together with the (grand)child);
- When a parent item without data has no selected (grand-)children with data, then the parent item remains not selectable (to avoid ending up with an empty table view).

Selecting a parent without data will result in adding the parent item in the 'Applied filters' area. To deselect a parent without data its child(ren) need to be deselected first.

![Selectable empty parent](/dotstatsuite-documentation/images/de-filter-select-empty-parent.png)

These rules also apply to the relevant **advanced selection modes** in the ['Advanced selection popup'](#advanced-selection-popup).

#### Forced parent selection
Through defining the *SDMX* [`ALWAYS_DISPLAY_PARENTS` annotation](/dotstatsuite-documentation/using-de/sdmx-annotations/) for a dataflow, specific parent level(s) can be set to be automatically selected and displayed whenever a (grand)child with data is selected.

**Example:**  
For a dataflow with a hierarchical dimension named "ANALYTICAL_CATEGORIES", the data owner has defined the following forced selection of parents: `ANALYTICAL_CATEGORIES=LEVEL1+LEVEL2+LEVEL3+LEVEL4`.  
Whenever a child of any parent in these levels is selected in the filter, then automatically all the parents in the specified levels will be selected too, whether there is data or not for those parents.  
It will not be possible to deselect those parents unless all (grand)children are deselected first.  

![Forced parent selection](/dotstatsuite-documentation/images/de-filter-automated-selected-parent.png)

This behavior also applies to the relevant **advanced selection modes** in the ['Advanced selection popup'](#advanced-selection-popup).

#### Display of code descriptions
The localised descriptions of codes defined in a codelist of a dimension are displayed on mouse-over on the related filter items using a tooltip. These items are underlined with dots in order to inform the user of the availability of the description.

![Code descriptions](/dotstatsuite-documentation/images/de-codelist-description.png)

#### Advanced selection popup
Clicking the **advanced selection modes** button triggers the display of an **advanced selection popup**. It provides more advanced selection options especially for a longer or hierarchical list and refreshes the data view only once the new selection is validated by the user.  
The popup always provides a [local search](#local-search) (spotlight feature) box.  

Clicking the `Selection mode` button located next to the local search box opens a drawer with tiles for the different modes of selection:
- Single item
- Item and all items directly below
- Whole branch
- All items at the same level
- All items  

Once the user clicked one of the tiles, the drawer closes again upwards. All following filter selections apply the chosen selection mode.

![Hierarchical contents](/dotstatsuite-documentation/images/de-viewingdata-filters-multiselection-bulkselectionmenu-1.png)  

Additional features in the popup propose to `Expand all` items or to `Collapse all` items keeping only the root item(s) when the items are hierarchical.  
To apply the selection in the *Filters* area and refresh the data view, it is necessary to click on the `Apply` button, which closes the advanced selection popup.  

**Note** that, for all advanced selection modes, when relevant and aligned with the rules described [here](#selectable-empty-parent-in-hierarchical-filters), empty parents of child(ren) with data in a hierarchical filter can be (de)selected.

![Selectable empty parent in advanced mode](/dotstatsuite-documentation/images/de-filter-select-empty-parent-advanced-mode.png)

#### Data availability
In filters with hierarchical dimensions, parent values, for which no data exist, are still shown but marked specifically. For more information, see [Data availability](/dotstatsuite-documentation/using-de/viewing-data/filters/data-availability/).

#### Local search 
The local search (spotlight feature) helps to find specific items. Its hint text includes the number of filter items: "Search in all [XX] items below".

Typing some characters in the local search box dynamically reduces the displayed items to the ones containing the given set of characters. If the local search term has no hit in any item then the list is empty. 

![Local search example](/dotstatsuite-documentation/images/de-filters3.png)

Whenever the content of the local search box is changed, the items in hierarchical lists are fully expanded. When a local search terms has a hit in a child item, then all its above parent items will automatically be displayed, even if the search term was not found in these parent items. 

![Local search example with hierarchy](/dotstatsuite-documentation/images/de-filters4.png)

#### Keyboard selection options
The keyboard's **Ctrl** and **Shift** keys, as well as **holding mouse click**, can be used in the filters and in the advanced selection popup to ease multiple selections.  

- **Using the Shift key**:  
If you first press `Shift` and select an item of a list, then selecting another item while still holding `Shift` will result in selecting all intermediate items (between those 2 selections) of the list. The same principle will apply in de-selection mode. 
As long as the `ctrl` key is held, the data table is not updated.
- **Using the Ctrl key**:  
If you first press `Ctrl` and select an item of a list, then selecting another item while still holding `Ctrl` will result in selecting this second item too. You can keep on selecting new items as long as `Ctrl` is held.  
As long as the `ctrl` key is held, the data table is not updated.  
  *Remark*: The combination of `ctrl` and `shift` keys is not possible.   
- **Holding mouse click**:  
If you click on one item and hold the mouse button without releasing it, then moving the mouse cursor down/up to another item of the same list will select both items and all intermediate ones.  
As long as the mouse button is held, the data table is not updated.

*Note* that these keyboard selection options are not compatible with the web content accessibility support.  

---

### Frequency and Time period filter
See [here](/dotstatsuite-documentation/using-de/viewing-data/filters/time-period/) for details.

---

### Applied filters panel
See [here](/dotstatsuite-documentation/using-de/viewing-data/filters/applied-filters)
