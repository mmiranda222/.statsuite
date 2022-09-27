---
title: "Upload data from an SDMX file (xml/csv)"
subtitle: 
comments: false
weight: 320
keywords: [
 'Upload data file', '#upload-data-file',
 'Notifications', '#notifications',
 'Maximum upload file size', '#maximum-upload-file-size',
 'Successful, warning, multi-status, failure', '#successful-warning-multi-status-failure',
]
---

#### Table of Content
- [Upload data file](#upload-data-file)
- [Notifications](#notifications)
  - [Maximum upload file size](#maximum-upload-file-size)
  - [Successful, warning, multi-status, failure](#successful-warning-multi-status-failure)

---

### Upload data file
The "Upload data & referential metadata" feature supports uploading data files in **[SDMX-ML](https://github.com/sdmx-twg/sdmx-ml)** and **[SDMX-CSV](https://github.com/sdmx-twg/sdmx-csv/blob/master/data-message/docs/sdmx-csv-field-guide.md)** file formats.  

As **pre-requisites**, uploading data must be performed **only after** having uploaded the targeted dataflow, and your data file content must include (according to the SDMX standard of the format used) the full identification of the dataflow (agency, id, version) for which data are uploaded. Therefore it is not necessary to indicate the target dataflow. Only the target data space needs to be selected.

To upload a data file:
* Choose the data file to be uploaded using the `(+) Add files...` button that displays a file open dialog box or by dragging & dropping the data file in the dashed area. (1)
* **Alternatively** tick the option `Use a file path of a shared folder ...` and enter/paste the full file path or URL of the upload file in the related text box. (2)
* Then select one or several target data space(s).
* Click on the "Upload" button to launch the data file upload (3)

![dlm-upload-data-form](/dotstatsuite-documentation/images/dlm-upload-data-sdmx-form.png)

(1) The size of the uploaded file is limited (30MB by default). For more information, see [Maximum upload file size](#maximum-upload-file-size).    

(2) When using a file path or URL, the file **must** be accessible through this path or URL by the data upload engine. Technically spoken, the service account under which the transfer service runs must have read access permissions to the file on the shared folder or URL.   

(3) The data upload executes in **2 subsequent phases**:  
1) The file or its path/URL is submitted to the data upload engine. The data upload engine makes a preliminary file content consistency check. If the check is successful then the file upload request gets attributed a request ID, is added to a queue and treated when there are sufficient server resources available. If the check fails, the data upload is cancelled. In both cases the user is informed about the outcome through a [notification](#notifications) at the bottom of the DLM screen.
2) When the queued file upload request has been executed, the user is informed via an e-mail about the progress and outcome of the file upload, which could again be successful or failing. For more details see [E-mail notifications for data management](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/message-through-mail/). The e-mail address being used is the one linked to the account under which the user has logged in the DLM.  

Clicking on "Reset" discards all current selections and resets the UI to its default state. 

---

### Notifications
#### Maximum upload file size
If the upload file size is **bigger than 30MB** (default configuration), then a notification appears next to the filename:

![dlm-upload-data-file is too big](/dotstatsuite-documentation/images/dlm-upload-data-sdmx-too-big-file.png)

It is possible to compress the data file using the 'zip' format, and upload the compressed file. In this case the size limitation acts on the zipped file.

The file size limit is configurable by an administrator. Please see [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/dlm-configuration/#upload-size-limit) for more information.

Files submitted through their path or URL do not have a specific size limit. However, the data upload engine always has internal hardware-related limitations.

#### Successful, warning, multi-status, failure
Each time the user performs an upload of data in the DLM, a colour-coded notification with a request ID or an error message is returned:  
* green: the data upload request has been **successfully registered** (queued)
* red: the file content submission or the preliminary file content validation **failed** and the data upload has been cancelled

*Note:* If you target several data spaces at the same time then the notification messages appear all at once but are distinguished by data space.

**Example of successful data upload request:**

![dlm-upload-data-sdmx-success](/dotstatsuite-documentation/images/dlm-upload-data-sdmx-success.png)

**Example of failed data upload request *(due to e.g. a not found dataflow target)*:**

![dlm-upload-data-sdmx-failure](/dotstatsuite-documentation/images/dlm-upload-data-sdmx-failure.png)
