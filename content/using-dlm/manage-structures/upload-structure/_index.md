---
title: "Upload structures from an SDMX file (xml)"
subtitle: 
comments: false
weight: 240
keywords: [
  'Upload structure file', '#upload-structure-file',
  'Notifications', '#notifications',
  'Maximum upload file size', '#maximum-upload-file-size',
  'Successful, warning, multi-status, and error', '#successful-warning-multi-status-and-error',
]
---

#### Table of Content
- [Upload structure file](#upload-structure-file)
- [Notifications](#notifications)
  - [Maximum upload file size](#maximum-upload-file-size)
  - [Successful, warning, multi-status, and error](#successful-warning-multi-status-and-error)

---

### Upload structure file

Structures can be uploaded using the main menu feature “Upload structures” available in the top banner of the DLM application.  

![dlm-upload-structure-1-banner](/dotstatsuite-documentation/images/dlm-upload-structure-1-banner.png)

The SDMX-ML file can contain one or several data structure artefact(s).

The required actions are to drop the data structure file in the dashed area, and select one or several destination dataspace(s). The user can also use the "+ Add files" option to insert the XML file (this option will open the file explorer).

To upload a structure file:
* Choose the structure file to be uploaded using the `(+) Add file...` button that displays a file open dialog box or by dragging & dropping the strucure file in the dashed area. (1)
* Then select one or several target data space(s).
* Click on the "Upload" button to launch the data file upload (2)

![dlm-upload-structure-2-AddFiles](/dotstatsuite-documentation/images/dlm-upload-structure-2-AddFiles.png)

![dlm-upload-structure-2-BeforeUpload](/dotstatsuite-documentation/images/dlm-upload-structure-2-BeforeUpload.png) 

(1) All SDMX-ML structure formats are supported. The size of the uploaded file is limited (30MB by default). For more information, see [Maximum upload file size](#maximum-upload-file-size).    

(2) The structure upload responds with a message that appears at the bottom of the screen and indicates the outcome of the upload.

---

### Notifications

#### Maximum upload file size
If the upload file size is **bigger than 30MB** (default configuration), then a notification appears next to the filename:

![dlm-upload-structure-3-Notifications](/dotstatsuite-documentation/images/dlm-upload-structure-3-TooBigFileSizeErrorMsg.png)

It is possible to compress the structure file using the 'zip' format, and upload the compressed file. In this case the size limitation acts on the zipped file.

The file size limit is configurable by an administrator. Please see [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/dlm-configuration/#upload-size-limit) for more information.

#### Successful, warning, multi-status, and error
Each time the user performs an upload (or transfer) action on structural objects in .Stat DLM, a comprehensive message with appropriate details is returned. All returned messages are defined as one of the following contextual notification:
* green **successful** notification
* orange **warning/multi-status** notification
* red **error** notification

**Note** that error notification contents are derived from the standard HTTP return codes, or the standard SDMX REST status/error codes https://github.com/sdmx-twg/sdmx-rest/blob/master/doc/status.md.

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

