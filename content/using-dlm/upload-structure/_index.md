---
title: "Upload data structures"
subtitle: 
comments: false
weight: 240

---

#### Table of Content
- [Upload data structure file](#upload-data-structure-file)
- [Notifications](#notifications)
  - [Size limit notification](#size-limit-notification)
  - [Successful, warning, multi-status, and error](#successful-warning-multi-status-and-error)

---

Data structures can be uploaded using the main menu feature “Upload structures” available in the top banner of the DLM application.  

![dlm-upload-structure-1-banner](/dotstatsuite-documentation/images/dlm-upload-structure-1-banner.png)

The "Upload structures" feature supports the SDMX-ML 2.1 format with a limit size of 30MB. The SDMX-ML file can contain one or several data structure artefact(s).

### Upload data structure file

The required actions are to drop the data structure file in the dashed area, and select one or several destination dataspace(s). The user can also use the "+ Add files" option to insert the XML file (this option will open the file explorer).

![dlm-upload-structure-2-AddFiles](/dotstatsuite-documentation/images/dlm-upload-structure-2-AddFiles.png)

![dlm-upload-structure-2-BeforeUpload](/dotstatsuite-documentation/images/dlm-upload-structure-2-BeforeUpload.png) 

After selecting the file and dataspace(s), clicking on the "Upload" button launches the data structure file upload and a contextual notification will appear at the bottom of the screen.

---

### Notifications

#### Size limit notification
When dragging or adding in the dashed area a file with a size **higher than 30MB**, a notification appears next to the filename:

![dlm-upload-structure-3-Notifications](/dotstatsuite-documentation/images/dlm-upload-structure-3-TooBigFileSizeErrorMsg.png)

#### Successful, warning, multi-status, and error
Each time the user performs an upload (or transfer) action on structural objects in .Stat DLM, a comprehensive message with appropriate details is returned. All returned messages are defined as one of the following contextual notification:
* green **successful** notification
* orange **warning/multi-status** notification
* red **error** notification

**Note** that error notification contents are derived from the standard HTTP return codes, or the standard SDMX REST status/error codes https://github.com/sdmx-twg/sdmx-rest/blob/master/v2_1/ws/rest/docs/4_7_errors.md.

When you select multiple dataspaces, the notification messages appear all at once but split by type and dataspace.

![dlm-upload-structure-3-Notifications](/dotstatsuite-documentation/images/dlm-upload-structure-3-MultipleNotifications.png)

A **successful** notification for a given dataspace contains different types of successful information/meaning: 
* "created" message for each new artefact defined in the data structure file which did not yet exist in the destination dataspace;  
* "updated" message for an already existing artefact with successfully applied changes in its properties.

![dlm-upload-structure-3-Successfull](/dotstatsuite-documentation/images/dlm-upload-structure-3-Successful.png)  

An **error** notification for a given dataspace contains different types of error information/meaning:
* "not updated" message for already existing artefact with no change in its properties;
* structure validation error message.

![dlm-upload-structure-3-Error](/dotstatsuite-documentation/images/dlm-upload-structure-3-Error1.png)  

![dlm-upload-structure-3-Error](/dotstatsuite-documentation/images/dlm-upload-structure-3-Error2.png) 

A **warning** notification for a given dataspace can whether be of informative content, or a mix of both successful and error information 

![dlm-upload-structure-3-Warning](/dotstatsuite-documentation/images/dlm-upload-structure-3-Warning1.png)  

![dlm-upload-structure-3-Warning](/dotstatsuite-documentation/images/dlm-upload-structure-3-Warning2.png) 

