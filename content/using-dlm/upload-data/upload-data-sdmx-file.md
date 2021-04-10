---
title: "Upload data from an SDMX file (xml/csv)"
subtitle: 
comments: false
weight: 280
keywords: [
 'Data file format and size', '#data-file-format-and-size',
 'Upload data file', '#upload-data-file',
 'Notifications', '#notifications',
 'Size limit notification', '#size-limit-notification',
 'Successful, warning, multi-status, failure', '#successful-warning-multi-status-failure',
]
---

#### Table of Content
- [Data file format and size](#data-file-format-and-size)
- [Upload data file](#upload-data-file)
- [Notifications](#notifications)
  - [Size limit notification](#size-limit-notification)
  - [Successful, warning, multi-status, failure](#successful-warning-multi-status-failure)

---

### Data file format and size
Data can be uploaded by using the main menu feature "Upload data" available from the top banner of the DLM.

![dlm-upload-data-banner](/dotstatsuite-documentation/images/dlm-upload-data-sdmx-banner.png)

The "Upload data" feature supports **[SDMX-ML](https://github.com/sdmx-twg/sdmx-ml)** and **[SDMX-CSV](https://github.com/sdmx-twg/sdmx-csv/blob/master/data-message/docs/sdmx-csv-field-guide.md)** file formats.  
The file size limitation is set to 30MB by default (Note that this default size limitation can be changed through the configuration of the application). To work around the size limitation, the user can also compress the data file using the 'zip' format. In this case the size limitation acts on the zipped file.  

There is also the possibility to use a shared folder as long as the data file in that folder is accessible by the data upload engine. Technically spoken, the account under which the transfer service runs must have read access permissions to the file on the shared folder.

---

### Upload data file
As a **pre-requisite**, uploading data must be performed **only after** having uploaded the targeted dataflow. Your data file must specify (according to the SDMX standard of the format used) the full identification of the dataflow in the form `AGENCY:DATAFLOW_ID(VERSION)` for which data are uploaded. This is why it is not required to select the target dataflow with any user interface feature in the DLM, but only the target data space.

Once the pre-requisite is fulfilled, then you need to:
* Select the "SDMX file" type,
* Add (+) with the file explorer option / Drag & drop the data file in the dashed area **or**
* Select the **file path of a shared folder** option and provide the full path of the file in the text box, and
* Select one or several target data space(s).

![dlm-upload-data-form](/dotstatsuite-documentation/images/dlm-upload-data-sdmx-form.png)

Afterwards, clicking on the "Upload" button launches the data file upload, which acts in **2 subsequent phases**: 
1) The file content is submitted to the data upload engine. The data upload engine makes a preliminary file content consistency check. If the check is successful then the file upload request gets attributed a request ID, is added to a queue and treated when there are sufficient server resources available. If the check fails, the data upload is cancelled. In both cases the user is informed about the outcome through a [notification](#notifications) at the bottom of the DLM screen.
2) When the queued file upload request has been executed, the user is informed via an e-mail about the progress and outcome of the file upload, which could again be successful or failing. For more details see [E-mail notifications for data management](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/message-through-mail/). The e-mail address being used is the one linked to the account under which the user has logged in the DLM.  

Clicking on "Reset" discards all actions and reset the UI to its default state. 

---

### Notifications
#### Size limit notification
If the file size is **higher than 30MB**, then a notification appears next to the filename:

![dlm-upload-data-file is too big](/dotstatsuite-documentation/images/dlm-upload-data-sdmx-too-big-file.png)

#### Successful, warning, multi-status, failure
Each time the user performs an upload of data in the DLM, a colour-coded notification with a request ID or an error message is returned:  
* green: the data upload request has been **successfully registered** (queued)
* red: the file content submission or the preliminary file content validation **failed** and the data upload has been cancelled

*Note:* If you target several data spaces at the same time then the notification messages appear all at once but are distinguished by data space.

**Example of successful data upload request:**

![dlm-upload-data-sdmx-success](/dotstatsuite-documentation/images/dlm-upload-data-sdmx-success.png)

**Example of failed data upload request *(due to e.g. a not found dataflow target)*:**

![dlm-upload-data-sdmx-failure](/dotstatsuite-documentation/images/dlm-upload-data-sdmx-failure.png)
