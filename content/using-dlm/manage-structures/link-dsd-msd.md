---
title: "Define referential metadata attributes for a data structure"
subtitle: 
comments: false
weight: 269

---

> Released with [August 3, 2022 .Stat Suite JS quark](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#august-3-2022)

Referential metadata attributes can be defined for a data structure by linking the Data Structure Definition (DSD) to one Metadata Structure Definition (MSD) on behalf of an *SDMX* annotation of type `METADATA` (see [specifications](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/manage-data/upload-data/upload-referential-metadata/)), which subsequently enables uploading referential metadata values to an .Stat Core data space.

To define such a link, users can click on "Add ref. metadata link" in the contextual menu of the DSD. This option is only available for DSDs belonging to an internal data space, and only for DSDs without an already existing MSD link.

![dlm DSD link MSD](/dotstatsuite-documentation/images/dlm-dsd-link-msd1.png)

The menu item is also available in the multi-selection menu:

![dlm DSD link MSD](/dotstatsuite-documentation/images/dlm-dsd-link-msd2.png)

When clicking on "Add ref. metadata link", a popup window opens with the list of currently available MSDs of the related data space.  
**Note** that if the underlying DSD is "final", then the list will display only "final" MSDs too.

![dlm DSD link MSD](/dotstatsuite-documentation/images/dlm-dsd-link-msd3.png)

When the user selected one MSD and clicks on "Link", the corresponding DSD structure(s) is/are automatically updated, after which the popup window closes and the DLM indicates the success/failure of the link creation with a green/red icon next to the DSD's contextual menu and with the appropriate detailed information.

![dlm DSD link MSD](/dotstatsuite-documentation/images/dlm-dsd-link-msd4.png)

The DLM will also run, automatically, the dataflow(s) initialization method on all related dataflows immediately subsequently after the successful linkage to the MSD. The success/failure of this automated action is indicated with a second green/red icon next to the DSD's contextual menu and with the appropriate detailed information.

![dlm DSD link MSD](/dotstatsuite-documentation/images/dlm-dsd-link-msd5.png)
