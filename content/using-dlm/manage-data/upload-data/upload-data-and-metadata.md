---
title: "Upload data or referential metadata from an SDMX file"
subtitle: 
comments: false
weight: 320
keywords: [
 'Prerequisites', '#prerequisites',
 'Upload data or referential metadata file', '#upload-data-or-referential-metadata-file',
 'Notifications', '#notifications',
 'Maximum upload file size', '#maximum-upload-file-size',
 'Successful, warning, multi-status, failure', '#successful-warning-multi-status-failure',
]
---

#### Table of Content
- [Prerequisites](#prerequisites)
- [Upload data or referential metadata file](#upload-data-or-referential-metadata-file)
- [Notifications](#notifications)
  - [Maximum upload file size](#maximum-upload-file-size)
  - [Successful, warning, multi-status, failure](#successful-warning-multi-status-failure)

---

> Referential metadata support introduced in the DLM in [February 21, 2022 Release .Stat Suite JS 12.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#february-21-2022)

### Prerequisites
In .Stat Suite Core, data and referential metadata cannot be uploaded together (at the same time). They have to be uploaded through separate import files.  

Data or referential metadata can be uploaded **only after** having uploaded the targeted dataflow in the same data space.  

According to the SDMX standard formats, the data or referential metadata file must contain the full identification of the dataflow (agency, id, version) for which data or referential metadata are uploaded. Therefore it is not necessary to indicate the target dataflow in the DLM. Only the target data space needs to be selected.

#### Additional requirements for referential metadata
Referential metadata can be uploaded **only after** having uploaded the related Metadata Structure Definition (MSD) and its concepts (in one or more Concept Schemes) in the same data space and having linked the underlying Data Structure Definition (DSD) to that MSD by adding the annotation of type **`METADATA`** with the appropriate MSD-URN to the DSD, e.g.

```xml
<structure:DataStructure agencyID=“XXX“ id=“XXX" version=“1.0">
   <common:Annotations>
  	<common:Annotation>
  		 <common:AnnotationTitle>urn:sdmx:org.sdmx.infomodel.metadatastructure.MetadataStructure=AGENCY:MSD_ID(1.0)</common:AnnotationTitle>
  		<common:AnnotationType>METADATA</common:AnnotationType>
  	</common:Annotation>
  </common:Annotations>
  <common:Name xml:lang="en">XXX</common:Name>
  <structure:DataStructureComponents>
  	...
  </structure:DataStructureComponents>
</structure:DataStructure>
```

Note that, as for measures and attributes in the DSD, the concepts used for the MSD define the name and types of the metadata attributes (html, string, number, coded value, etc.).

[Here attached](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/blob/master/content/OECD_SNA_TABLE1_1.0_structures.xml) is an example of a full *SDMX* structure file allowing to upload referential metadata, and containing
- a dataflow
- a list of codelists
- a list of concept schemes
- a metadata structure definition (MSD)
- a data strcuture definition (MSD) with the `METADATA` annotation

---

### Upload data or referential metadata file
The "Upload data & referential metadata" feature supports uploading the following SDMX file formats:
- data: [SDMX-ML](https://github.com/sdmx-twg/sdmx-ml) (2.1 generic and data-specific formats, 2.0 generic and compact formats)
- data: [SDMX-CSV version 1.0](https://github.com/sdmx-twg/sdmx-csv/tree/v1.0/data-message/docs/sdmx-csv-field-guide.md)
- data & referential metadata: [SDMX-CSV version 2.0](https://github.com/sdmx-twg/sdmx-csv/tree/v2.0.0/data-message/docs/sdmx-csv-field-guide.md)

For more information about the supported SDMX formats and upload actions (Merge, Replace, Delete), please consult:
- [Upload data from an SDMX-CSV or SDMX-ML file](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/data/upload-data-sdmx-file/).
- [Upload referential metadata from an SDMX-CSV file](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/ref-metadata/upload-referential-metadata/).

To upload a data or referential metadata file:
* Choose the file to be uploaded using the `(+) Add files...` button that displays a file open dialog box or by dragging & dropping the file in the dashed area. (1)
* **Alternatively** tick the option `Use a file path of a shared folder ...` and enter/paste the full path or URL of the file in the related text box. (2)
* Then select one or several target data space(s).
* Click on the "Upload" button to launch the file upload. (3)

![dlm-upload-data-form](/dotstatsuite-documentation/images/dlm-upload-data-sdmx-form.png)

(1) The size of the uploaded file is limited (30MB by default). For more information, see [Maximum upload file size](#maximum-upload-file-size).    

(2) When using a file path or URL, the file **must** be accessible through this path or URL by the upload engine. Technically spoken, the service account under which the transfer service runs must have read access permissions to the file on the shared folder or URL.   

(3) The data upload executes in **2 subsequent phases**:  
1) The file or its path/URL is submitted to the upload engine. The upload engine makes a preliminary file content consistency check. If the check is successful then the file upload request gets attributed a request ID, is added to a queue and treated when there are sufficient server resources available. If the check fails, the upload is canceled. In both cases the user is informed about the outcome through a [notification](#notifications) at the bottom of the DLM screen.
2) When the queued file upload request has been executed, the user is informed via an e-mail about the progress and outcome of the file upload, which could again be successful or failing. For more details see [E-mail notifications for data management](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/message-through-mail/). The e-mail address being used is the one linked to the account under which the user has logged in the DLM.  

Clicking on "Reset" discards all current selections and resets the UI to its default state. 

---

### Notifications
#### Maximum upload file size
If the upload file size is **bigger than 30MB** (default configuration), then a notification appears next to the filename:

![dlm-upload-data-file is too big](/dotstatsuite-documentation/images/dlm-upload-data-sdmx-too-big-file.png)

It is possible to compress the file using the 'zip' format, and upload the compressed file. In this case the size limitation acts on the zipped file.

The file size limit is configurable by an administrator. Please see [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/dlm-configuration/#upload-size-limit) for more information.

Files submitted through their path or URL do not have a specific size limit. However, the upload engine always has internal hardware-related limitations.

#### Successful, warning, multi-status, failure
Each time the user performs an upload of data or referential metadata in the DLM, a colour-coded notification with a request ID or an error message is returned:  
* green: the upload request has been **successfully registered** (queued)
* red: the file content submission or the preliminary file content validation **failed** and the upload has been cancelled

*Note:* If you target several data spaces at the same time then the notification messages appear all at once but are distinguished by data space.

**Example of successful data upload request:**

![dlm-upload-data-sdmx-success](/dotstatsuite-documentation/images/dlm-upload-data-sdmx-success.png)

**Example of failed data upload request *(e.g. due to a not found dataflow target)*:**

![dlm-upload-data-sdmx-failure](/dotstatsuite-documentation/images/dlm-upload-data-sdmx-failure.png)
