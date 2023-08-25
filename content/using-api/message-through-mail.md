---
title: "Email notifications for data management"
subtitle: 
comments: false
weight: 8000
keywords: [
  'Process description', '#process-description',
  'Email subject', '#email-subject',
  'Email content', '#email-content',
  'Summary', '#summary',
  'Log details', '#log-details',
  'Meaningful colors in email content', '#meaningful-colors-in-email-content',
]

---

#### Table of Content
- [Process description](#process-description)
- [Email subject](#email-subject)
- [Email content](#email-content)
  - [Summary](#summary)
  - [Log details](#log-details)
- [Meaningful colors in email content](#meaningful-colors-in-email-content)

This section describes the features of the .Stat Suite transfer API for the management of email notifications for data requests, when performing actions over data by whether using directly the API, the .Stat Data Lifecycle Manager (DLM), or the DLM Excel-Addin.

---

### Process description

Each time the user performs an action over data (observation and attribute values) or referential metadata in .Stat DLM, or using the API, an acknowledgment message states that the request is being performed and registered with an ID of the request. Once the data request and associated action is complete, a meaningful message with appropriate details is sent in an email to the user's email address that is also used for its credentials. The content of the email is described below respecting the structure of the email content, its subject, and a summary of the action followed by the log details. 

*(Since [August 24, 2023 Release .Stat Suite .NET 'elote'](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#august-24-2023)*) An optional parameter `sendEmail` is available in all relevant transfer service methods that can send emails. This parameter allows the requester to decide to receive only emails only for unsuccessful requests (`ifError` (2)), `never` (1) or `always` (0). By default, the parameter is set to always send the email (0).

---

### Email subject
The subject of the email will display the status of the request: **`successfully completed`** or **`failed`**, followed by the full ID of the related SDMX dataflow artefact (`agencyID:artefactID(version)`) impacted by the request, its related datasource and the request ID.  

![message-through-mail-subject](/dotstatsuite-documentation/images/dlm-mail-subject.png)  

---

### Email content
The email content is split into two parts: a summary of the request status, and the log details.

#### Summary
The summary of the message shows information about the action:
* **Request ID:** The ID of the data request
* **Data source:** Relates to the data source information. It can be a file name or a rest query (when related to a datasource) 
  * **CSV file**   a SDMX-CSV data or referential metadata file
  * **XML file**   a SDMX-ML data file
  * **EDD files**  an EDD XML file with its related Data Excel file
  * **Zip file**   a zip file of data XML file or of data or referential metadata CSV file
  * **Rest query** a rest query to get the data or referential metadata from a specific datasource
* **Destination data space:** Refers to the dataspace location where data or referential metadata is being uploaded, copied, deleted
* **Dataflow:** The triple information (AgencyID:ArtefactID(version)) of the SDMX dataflow artefact impacted by the data or referential metadata request
* **User:** Email address of the end-user
* **Completion status:** The final status of the request

![message-through-mail-summary](/dotstatsuite-documentation/images/dlm-mail-summary.png)

#### Log details
The log details part will display each timestamped step of the processed request, with the status of each, and a explanation with some guidance when a step has failed.  
Below is a list of examples that can be encountered during a data request:

* **status of the ID registration**:  
12/03/2020 15:47:05 `   NOTICE   ` The request with ID 154 was successfully registered.  
* **status of the structure upload**:  
12/03/2020 15:47:05 `   NOTICE   ` The structure information of dataflow IT1:264D_264_SALDI2_2(2.0) was successfully loaded from dataspace qa:reset.  
* **status of the data process**:  
12/03/2020 15:47:09 `   NOTICE   ` 101 observations have been processed, of which 101 observations were inserts, 0 observations were updates and 0 observations were deletions.  
12/02/2020 10:54:06 `   WARN     ` The processing of observations was stopped and dropped due to one or more errors. Please read the details of the error(s) to see how to resolve it/them.  
* **final status**:  The final status can be success status or an unsucessdul status. For a failed staus, details on the error are described and some guidance given for any correction.  
12/03/2020 15:47:10 `   NOTICE   ` The request was successfully processed.  
12/02/2020 10:54:06 `   ERROR    ` The attribute METADATA_EN is not defined in the data structure IT1:264D_264_SALDI2_2(2.0). The DLM Excel-add-in can be used to see the data structure.  
12/01/2020 10:01:24 `   ERROR    ` The value for dimension REF_AREA:0077 at observation 28509 (for CSV file imports located at row 28510) is incorrect. Please correct the imported data and re-submit the request.  
                                   The value 0077 of component REF_AREA at coordinate REF_AREA:0077,MEASURE:CASES_D,SEX:_T,AGE:_T,RESULT:N,DATE:2020-02-05,FREQ:M,UNIT_MEASURE:CASES is incorrect. Please correct the coordinate and re-submit the request.

![message-through-mail-log](/dotstatsuite-documentation/images/dlm-mail-logs-message.png)

---

### Meaningful colors in email content
Meaningful colors are used to highlight the final status of an action:
* **Green** color for every declination of `success`. Green color is used in the "Completion status" of the summary part of the email message.
* **Orange** color for every declination of `warning`. Orange color is used in the "Completion status", but also in the "log messages" part whenever the general status of the message is a **WARN**ing.
* **Red** color for every declination of `error`. Red color is used in the "Completion status" and in the "log messages" part whenever the general status of the message is an **ERROR**.
