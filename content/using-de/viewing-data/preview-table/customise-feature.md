---
title: "Customise feature for table"
subtitle: 
comments: false
weight: 2650
---

#### Table of Content
- [General behavior](#general-behavior)
- [Time Period reverse order](#time-period-reverse-order)
- [Layout variations from user selection](#layout-variations-from-user-selection)
- [Accessibility](#accessibility)

---

> This section describes how to customise the **table preview layout**. For the customisation of the chart views, please see [this section](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/charts/) of the documentation.

### General behavior
The DE user is able to customise the table preview by using the **"Customise"** option from the toolbar. It is thus possible to customise how the data is positioned in the table preview by moving (dragging and dropping) the available dimensions between the Columns, Rows and Row Sections axis.  
Upon clicking on "Customise", the following area is displayed (moving the table preview downwards):

![Customise](/images/de-customise1.png)

The `Drag & Drop` feature allows to:
* Move any dimension from one axis to another;
* Move any dimension from one position to another in the same axis (moving its position up or down).

**Exception:** the `Rows` axis **cannot** be empty, otherwise the application cannot construct a data table grid. Thus, when there is only one dimension set to `Rows`, a `Forbidden` icon is displayed instead of the usual *hand* mouse icon.

**Table preview**  
The `Table preview` area automatically shows what the user modifies, allowing him to anticipate the changes in the table grid. The `Table preview` feature displays the corresponding localised dimension names in the correct location, but not the dimension values (replaced by `Xxxx`).

**Cancel/Apply**  
The modifications made in the "Customise" option are applied only when the user clicks on `Apply Layout`. When doing so, the "Customise" toolbar option is collapsed and the table preview layout is updated with the new modifications.  
Clicking on `Cancel changes` will set all dimensions back to the previous state, meaning the state as it was set when the user originally clicked on "Customise".

---

### Time Period reverse order
All data displayed in the data table preview are shown with a Time Period (when defined is the Dataflow by the Data Producer).  
The default representation of the Time Period is:
* When Time Period is displayed in Column, it shows the oldest value on the left side, and the latest value on the right side;
* When Time Period is displayed in Row on Row Section, it shows the oldest value on the top of the table, and the latest value on the bottom of the table.
It is possible to change that representation in order to display the time period in **reverse mode**, so that the latest value comes first in any layout option.  
This option is managed by a selection box always embedded to the Time Period dimension in the Customise option:

![Time period reverse](/images/de-time-period-reverse1.png)

The option is always set to `Descending` by default. When the user changes it to `Ascending`, it automatically reverses the Time Period values accordingly.

![Time period reverse](/images/de-time-period-reverse2.png)

![Time period reverse](/images/de-time-period-reverse3.png)

---

### Layout variations from user selection
Independently from the the "Customise" option, if the user changes the selection(s), it can impact the data table preview if a dimension has more than 1 or exactly one item, and so if it is displayed in the data table preview or in the data table sub-title.  
The following rules apply when the user makes filter selection changes:
* The current layout position of the any dimension for which the number of available items (selected or returned) has not changed (between one and many), is not modified;
* When the number of available items (selected or returned) changes from many to one, then the corresponding dimension moves from wherever it is in the table preview into the table sub-title;
* When the number of available items (selected or returned) changes from one to many, then the corresponding dimension moves from the table sub-title into the table preview.

---

### Accessibility
*Under construction...*  
As part of the [Web Content Accessibility compliance](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/general-layout/#web-content-accessibility-compliance), the user can also use keyboard's shortcuts instead of the DFrag & Drop feature in order to customise the table layout.  
To do so, the user needs to focus the dimension she/he wishes to move using the `Tab` key. Once done, she/he can select it by clicking on  the `Space` bar. At this stage, she/he can use the `up`, `down`, `right` and `left` control arrow keys in order to move the selected item to the appropriate place in the same area, or in another axis ("Rows", "Columns", "Row sections").  
To unselect the item, she/he can click on the `Space` bar again.
