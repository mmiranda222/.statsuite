---
title: "Filters"
subtitle: 
comments: false
weight: 2100
keywords: [
  'Filter area', '#filter-area',
  'Multi-selection filters', '#multi-selection-filters',
  'Hierarchical content', '#hierarchical-content',
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
  - [Display of code descriptions](#display-of-code-descriptions)
  - [Advanced selection popup](#advanced-selection-popup)
  - [Data availability](#data-availability)
  - [Local search](#local-search)
  - [Keyboard selection options](#keyboard-selection-options)
- [Frequency and Time period filter](#frequency-and-time-period-filter)
- [Applied filters panel](#applied-filters-panel)

**General note**: All content related to the filter area is localised. For more information, go to the [general documentation about Languages](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/general-layout/#language).

---

### Filter area

The left-hand side (right-hand in rtl mode) of the visualisation page shows a set of dimension filters that allow **dynamically filtering the dimension values** to be displayed in the preview table or chart, to be extracted through the download feature 'Filtered data in tabular text (CSV)' or to be applied in the auto-generated data query in 'Developer API' menu.

Since [April 20, 2023 Release .Stat Suite JS unicorn](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-20-2023), the current filters selection is summarised in the ['Applied filters' area](#applied-filters-panel), and displayed on the right-hand side (right-left in rtl mode) of the visualisation page.  

A filter is created for each of the dimensions of the currently displayed dataflow based on data availability (see [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/data-availability/)), except if the dimension contains only one possible item or if it is configured to be hidden. In addition, the dimensions 'Frequency' and 'Time Period', when available, are automatically combined into a common 'Frequency & Time Period' filter (see the related [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/time-period/)).

The order of the filters respects the order of the dimensions as defined in the underlying data structure definition (DSD), except the ['Frequency & Time Period' filter](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/time-period/) panel, which is displayed second after the ['Applied filters' panel](#applied-filters-panel). 

The **number of currently selected items** against the **number of available items** (`selected/available`) is displayed next to each filter name.

![Multi selection filters](/dotstatsuite-documentation/images/de-filters12.png)

If the user has made selection(s) in the previous search result page, if a default selection is applied from an *SDMX* annotation (see [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/custom-data-view/default-selection/)), or if the URL contains dimension selections, then these selections are automatically pre-applied in the filters.

Whenever there is no filter item selection, then it is indicated in the filter title by **"all"**, e.g. `"all/39"`. When all filter items are selected, the number of selected items is displayed instead `"39/39"`.  
Because making **no selections and complete selections return the same data**, the usage of "all" should help to clarify this effect, while there remains a visual distinction for the fact that a saved selection is static while the items concerned by no selection may evolve over time. Indeed, as a generic behavior, when no element of a filter is selected, then it acts as if all items were selected. However, if a corresponding query is saved (e.g. bookmarked page, saved API query or shared dynamic table/chart), then the results may defer later in case the available dimension items evolve.  
Therefore, while a full selection would always correspond to 39 items, for no filter selection the number of actually considered dimension items might increase, e.g. 40, 41 etc.

---

### Multi-selection filters

All filters are standardised multi-selection filters, except the ['Frequency & Time Period' filter](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/time-period/). It means that the user can select multiple items per filter.  

![Multi selection filters](/dotstatsuite-documentation/images/de-filters1.png)

*(since [October 5, 2021 Release .Stat Suite JS 10.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#october-5-2021))* Each item of a filter is displayed with a **checkbox** on the left side in the filter list:
- when the item is not selected, the checkbox is empty;
- when the item is not selected and the mouse hovers it, the checkbox stays empty and the background is blue;
- when the item is selected, the checkbox is changed into a tick mark.

![de filter checkbox](/dotstatsuite-documentation/images/de-filters-checkbox.png)

Since [April 20, 2023 Release .Stat Suite JS unicorn](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-20-2023), the *bulk selection* option has been replaced by the **advanced selection popup** feature. 

When a filter contains 8 items or more, then:
- a vertical scrollbar is added to the filter
- a [local search](#local-search) (spotlight feature) box is displayed,
- an **advanced selection** button is displayed next to the local search box, which gives access to an [advanced selection popup](#advanced-selection-popup). A localised tooltip with the text "Use advanced selection modes" is displayed on mouse-over.

![Advanced selection button](/dotstatsuite-documentation/images/de-advanced-selection-button.png)

Any filter selection change will automatically trigger the update of the data view (table/chart/API query), and these changes will also be reflected in the ['Applied filters' panel](#applied-filters-panel).  

#### Hierarchical content
In case of a hierarchy in the items, they are shown as 'a tree', which means that the filter will display all the items with indentations according to the item level in the tree. A blue arrow next to an item indicates that this item is a parent of child item(s). Clicking this blue arrow switches its up/down direction and the related child items will respectively be hidden or become visible. By default, the tree is fully expanded so that all the items of all tree levels are visible (through scrolling if needed).

![Hierarchical contents](/dotstatsuite-documentation/images/de-viewingdata-filters-hierarchical-arrow-behaviour.png)

If for a parent (at any level) there are no data available (according to the Actual ContentConstraint related to the Dataflow), then the parent item is not selectable (and marked in light grey). Still, the user can navigate to the children. 

![Hierarchical contents](/dotstatsuite-documentation/images/de-viewingdata-filters-hierarchicalcontent-root-without-data.png) 

For more information on how advanced hierarchies can be applied, please see [Advanced hierarchies](/dotstatsuite-documentation/using-de/viewing-data/filters/advanced-hierarchies).

#### Display of code descriptions
> Introduced in [March 4, 2022 Release .Stat Suite JS 13.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#march-4-2022)

The localised descriptions of codes defined in a codelist of a dimension are displayed on mouse-over on the related filter items using a tooltip. These items are underlined with dots in order to inform the user of the availability of the description.

![Code descriptions](/dotstatsuite-documentation/images/de-codelist-description.png)

#### Advanced selection popup
Clicking the **advanced filter selection** button triggers the display of an **advanced selection popup**. It provides more advanced selection options especially for a longer or hierarchical list and refreshes the data view only once the new selection is validated by the user.

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

#### Data availability
In filters with hierarchical dimensions, parent values, for which no data exist, are still shown but marked specifically. For more information, see [Data availability](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/data-availability/).

#### Local search 
The local search (spotlight feature) helps to find specific items.

Typing some characters in the local search box dynamically reduces the displayed items to the ones containing the given set of characters. If the local search term has no hit in any item then the list is empty. 

![Local search example](/dotstatsuite-documentation/images/de-filters3.png)

Since [April 20, 2023 Release .Stat Suite JS unicorn](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-20-2023), whenever the content of the local search box is changed, the items in hierarchical lists are fully expanded. When a local search terms has a hit in a child item, then all its above parent items will automatically be displayed, even if the search term was not found in these parent items. 

![Local search example with hierarchy](/dotstatsuite-documentation/images/de-filters4.png)

#### Keyboard selection options
> Released in ([January 21, 2021 Release .Stat Suite JS 7.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#january-21-2021))  

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
See [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/time-period/) for details.

---

### Applied filters panel
See [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/applied-filters)
