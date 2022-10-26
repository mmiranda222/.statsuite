---
title: "Edit data"
subtitle: 
comments: false
weight: 850
keywords: [
  'Add new rows', '#add-new-rows',
  'Edit STRING and XHTML values', '#edit-string-and-xhtml-values',
  'Save data to data space', '#save-data-to-data-space',
]

---

> *Version history:*  
> Allow saving data also when only observation values are retrieved (without attributes) since [October 26, 2022 Release .Stat Suite DLM Excel-addin v3.2.3](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#october-26-2022)  

#### Table of content
- [Add new rows](#add-new-rows)
- [Edit STRING and XHTML values](#edit-string-and-xhtml-values)
- [Save data to data space](#save-data-to-data-space)

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

![DLM Excel-Addin system operator options](https://sis-cc.gitlab.io/dotstatsuite-documentation/images/dlm-excel-addin-system-separator-options.png)
