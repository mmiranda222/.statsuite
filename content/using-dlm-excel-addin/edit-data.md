---
title: "Edit data"
subtitle: 
comments: false
weight: 850
keywords: [
  'Data management actions', '#data-management-actions',
  'Updating data or reference metadata', '#updating-data-or-reference-metadata',
  'Replacing data or reference metadata', '#replacing-data-or-reference-metadata',
  'Deleting data', '#deleting-data',
  'Deleting reference metadata', '#deleting-reference-metadata',
  'Delete highlight and warning', '#delete-highlight-and-warning',
  'Add new rows', '#add-new-rows',
  'Edit STRING and XHTML values', '#edit-string-and-xhtml-values',
  'Save data to data space', '#save-data-to-data-space',
]

---

> *Version history:*  
> SDMX **actions** introduced with [August 24, 2023 Release .Stat Suite .NET 'elote' / DLM Excel-addin v3.3.3](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#august-24-2023)  
> Allow saving data also when only observation values are retrieved (without attributes) since [October 26, 2022 Release .Stat Suite DLM Excel-addin v3.2.3](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#october-26-2022)  

#### Table of content
- [Data management actions](#data-management-actions)
  - [Updating data or reference metadata](#updating-data-or-reference-metadata)
  - [Replacing data or reference metadata](#replacing-data-or-reference-metadata)
  - [Deleting data](#deleting-data)
  - [Deleting reference metadata](#deleting-reference-metadata)
  - [Delete highlight and warning](#delete-highlight-and-warning)
- [Add new rows](#add-new-rows)
- [Edit STRING and XHTML values](#edit-string-and-xhtml-values)
- [Save data to data space](#save-data-to-data-space)

---

### Data management actions
Data or reference metadata values in a .Stat Suite CORE data space can be `M(erge)`, `R(eplace)` or `D(elete)`. To specify any of these actions defined by SDMX, the DLM Excel add-in (with the flat table layout) allows using either the full verb term, e.g. `Merge`, or just their first letter, e.g. `M`. The action needs to be entered in the corresponding cell of the new `ACTION` column (just after the `SID` column). **By default**, when this cell is left empty, the `M(erge)` action is used. The 'Time series across' and 'Time series down' table layouts currently always apply with the `M(erge)` action.

![DLM Excel-Addin add new rows](/dotstatsuite-documentation/images/dlm-excel-addin-edit-actions.png)

#### Updating data or reference metadata
**`M(erge)`** will only update in the data space the data or reference metadata values provided in the Excel table. Related empty Excel cells will not change the corresponding current value in the data space.

For more information, see [details of the `M(erge)` action for data](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/data/upload-data-sdmx-file/#details-of-the-merge-action) and [details of the `M(erge)` action for reference metadata](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/ref-metadata/upload-referential-metadata/#details-of-the-merge-action).

#### Replacing data or reference metadata
**`R(eplace)`** will fully replace in the data space whole observations with their observation (measure) value and their attributes defined at observation level provided in the Excel table. Related empty Excel cells will delete the corresponding current value in the data space. However, values of attributes attached at higher levels than observation will be `M(erge)`d.

For more information, see [details of the `R(eplace)` action for data](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/data/upload-data-sdmx-file/#details-of-the-replace-action) and [details of the `R(eplace)` action for reference metadata](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/ref-metadata/upload-referential-metadata/#details-of-the-replace-action).

#### Deleting data
**`D(elete)`** will delete in the data space the data or reference metadata values provided in the Excel table. Related empty Excel cells will not change the corresponding current value in the data space, unless all data or reference metadata values in the Excel row are left empty, which results in deleting the whole corresponding coordinate. `D(elete)` operations also allow for **bulk** deletions of ranges of observations or reference metadata by leaving the related dimension value(s) empty.

For more information, see [details of the `D(elete)` action for data](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/data/upload-data-sdmx-file/#details-of-the-delete-action).

#### Deleting reference metadata
**`D(elete)`** for reference metadata values works similarly to [`D(elete)` for data](#deleting-data). In addition in the .Stat Suite, it allows for **wildcard** deletions of ranges of reference metadata attached at a **specific set of dimensions**. This can be achieved by replacing in the Excel table the related dimension value(s) by the star character **`*`**. 

For more information, see [details of the `D(elete)` action for reference metadata](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/ref-metadata/upload-referential-metadata/#details-of-the-delete-action).

#### Delete highlight and warning
For data and reference metadata, the action cell **`Delete`** is highlighted with a red background:

![DLM Excel-Addin highlight delete](/dotstatsuite-documentation/images/dlm-excel-addin-delete-highlight.png)

*Current limitation:* the "highlight" feature does not apply when only the first `D` letter for "Delete" is used. 

For **`Delete`** action, whenever in at least one concerned row one dimension value is empty (empty coordinate of the **`SID`** cell column), then the user is warned with a yes/no pop-up message before being allowed to save the action: 'Warning: You are bulk deleting [data|metadata] when not specifying a dimension [DIM_X] value, in line [xx]. Did you intend doing this?'

![DLM Excel-Addin bulk delete warning](/dotstatsuite-documentation/images/dlm-excel-addin-delete-warning.png)

---

### Add new rows
New rows can be added at the end of the data or referential metadata table in order to add new data or referential metadata to the data space.

![DLM Excel-Addin add new rows](/dotstatsuite-documentation/images/dlm-excel-addin-new-rows.png)

---

### Edit STRING and XHTML values
Whenever a column in a referential metadata table contains a referential metadata attribute of type "XHTML" or "String", an **"Edit"** button is shown in the menu ribbon (also accessible in the right-click menu). This button triggers the display of a multi-lingual **metadata editor** in the Excel side panel. The screenshot below shows an example of text editor for STRING values:

![DLM Excel-Addin edit button](/dotstatsuite-documentation/images/dlm-excel-addin-edit-string-values.png)

The metadata editor displays localised text editing fields, one field for each language. The list of available languages is configured in the application instance of the DLM Excel-addin.

When a referential metadata attribute is of type "XHTML" (xml-compliant HTML), then the metadata editor provides a **rich-text editor menu** enabling (WYSIWYG) HTML editing. The included features are:  
- copy/cut/paste
- basic text formatting such as bold, italic, underline, strike, text colour, background colour, etc.
- advanced text formatting such as headings, text alignment, bulleted or numbered lists
- insert of hyperlinks, formatted tables, images, special characters

When the user has edited the content of a cell with the metadata editor, a "Save" button at the bottom-right of the editor is shown as green, and clicking on it will save the modification to the table (but not yet to the data space!). If no modification is made in a cell content, the "Save" button remains greyed.

The screenshot below shows an example of text editor for XHTML values:

![DLM Excel-Addin rich-text editor](/dotstatsuite-documentation/images/dlm-excel-addin-edit-html-values.png)

If the user has started to change values using the metadata editor, then navigating from one cell to another will trigger the display of a popup window asking: "Would you like to save your changes?". Clicking on "Yes" or "No" will respectively update or not the modifications in the cell or not and display the content of the new selected cell in the metadata editor. 

![DLM Excel-Addin save message](/dotstatsuite-documentation/images/dlm-excel-addin-save-message.png)  
The changes of XHTML or String values done through the Metadata editor panel can be updated with the `Update table cell` green button available on the bottom part of the panel.  


---

### Save data to data space
Depending on the user's access permissions, edited data and referential metadata can be saved back to the (internal) data space. When data or referential metadata are extracted from an external data source, the “Save to Database” button are not displayed.  
The user can alternatively:
- select a range of edited data or referential metadata and save back only the current selection by clicking on “Selected data”, or
- save all changes made on the current table by clicking on “Entire table”.

![DLM Excel-Addin save to data space](/dotstatsuite-documentation/images/dlm-excel-addin-save-data.png)

The edited data or referential metadata are then submitted to the transfer service, which will execute the saving to the database, and a pop-up notification message confirms the number of submitted row(s). The transfer service will send an email to the end-user once the execution of the data request is completed. See [Email notifications for data management](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/message-through-mail/) for more details.

Note: In order to allow the DLM Excel-Addin reading data (observation values) in the cells and saving this data with the appropriate decimal settings, it is necessary to use the native Excel options for system separators:

![DLM Excel-Addin system operator options](/dotstatsuite-documentation/images/dlm-excel-addin-system-separator-options.png)
