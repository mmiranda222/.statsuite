---
title: Logbook
subtitle: 
comments: false
weight: 600
keywords: [
 'Logbook overview', '#logbook-overview',
 'Action log details', '#action-log-details',
 'Logbook filtering', '#logbook-filtering'
]

---

#### Table of content
- [Logbook overview](#logbook-overview)
- [Action log details](#action-log-details)
- [Logbook filtering](#logbook-filtering)

---

> Introduced in [December 5, 2022 Release .Stat Suite JS spin](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#december-5-2022)

### Logbook overview
The DLM allows the display of a **logbook** accesssible from the header menu and listing all past and ongoing logs for action requests of the transfer service (actions related to data and referential metadata uploads and database maintenance).

The landing page is an empty list with filters on the left side. If previously selected, then the (internal) dataspace(s) filter is selected. The current logged user is also selected if there is any log for a given internal dataspace.

![DLM Logbook overview](/dotstatsuite-documentation/images/dlm-logbook-overview.png)

The logbook presents one action log per line with the following information in the columns:
- **Space:** dataspace name with the corresponding color
- **Log id:** ID of the action log
- **Action:** action type `data change` or `maintenance`
- **User:** user's email address that initiated the logged action(s)
- **Structure id:** *SDMX* structure identifications `AGENCYID:ARTEFACTID(VERSION)` (when applicable)
- **Submission time:** date-time when the action request was submitted
- **Status:** action status `Queued`, `In progress`, `Completed`, `Timed out`, or `Canceled`
- **Outcome:** action outcome `Success` in green, `Warning` in orange, `Error` in red, or `None` in grey
- **Execution start:** start date-time of each log execution
- **Execution end:** end date-time of each log execution

The logbook content can be refreshed manually by clicking on the 'Refresh' button on the top left side of the page. 

Results are paginated, and the below feature allows navigating from page to page, and to jump to the next, previous, first or last page.

![DLM Logbook pagination](/dotstatsuite-documentation/images/dlm-logbook-pagination.png)

The logbook can be sorted on each column using the up/down arrows. By default, the list is sorted by 'Submission time' from newest to oldest.

Action log details are displayed by clicking on the arrow on the left side of each row and displaying the details in a drop-down view below.

---

### Action log details
When clicking for details of an action log registered by the transfer service (actions related to data and referential metadata imports and database maintenance), it displays the following information in columns:
- **Server:** server Id
- **Date:** date and time of each step of action
- **Status:** status (e.g. `NOTICE`, `WARNING`, `ERROR`) of each step of action
- **Message:** message detail of each step of action

![DLM Logbook transfer details](/dotstatsuite-documentation/images/dlm-logbook-transfer-details.png)

---

### Logbook filtering
The logbook can be filtered by:

| Filter description | Example | 
| --------- | ---------------- |
| **space:** multi-selection; if nothing selected, then the log list is empty. | ![DLM logbook filters](/dotstatsuite-documentation/images/dlm-logbook-filter-space.png) |
| **log id:** number edit field; empty by default. Clicking on 'Apply' will filter the log list. | ![DLM logbook filters](/dotstatsuite-documentation/images/dlm-logbook-filter-id.png) |
| **action:** multi-selection with `data change` for all actions (with a structure ID) related to data or referential metadata transactions, and `maintenance` for all other transfer actions. | ![DLM logbook filters](/dotstatsuite-documentation/images/dlm-logbook-filter-action.png) |
| **structure id:** multi-selection with a spotlight search listing the *SDMX* structure identifications `AGENCYID:ARTEFACTID(VERSION)`; it is (re-)generated from the current (filtered) logs for each selection. | ![DLM logbook filters](/dotstatsuite-documentation/images/dlm-logbook-filter-structure.png) |
| **submission time:** date-time range between a configurable start date `dd-MM-yyyy HH:mm:ss` and end date which is always set to the current date-time of the user's session. By default, the date-time range is set to the last 24 hours. Clicking on 'Apply' will filter the log list. See [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/dlm-configuration/#logbook-submission-time-boundaries) how to change the default time boundaries. | ![DLM logbook filters](/dotstatsuite-documentation/images/dlm-logbook-filter-time.png) |
| **user:** multi-selection with a spotlight search listing the users' email address dynamically generated from the log list; unfiltered by default. | ![DLM logbook filters](/dotstatsuite-documentation/images/dlm-logbook-filter-user.png) |
| **status:** single-selection list of the logs status `Queued`, `In progress`, `Completed`, `Timed out`, or `Canceled`; unfiltered by default. | ![DLM logbook filters](/dotstatsuite-documentation/images/dlm-logbook-filter-status.png) |
| **outcome:** single-selection list of the logs outcome `Success`, `Warning`, `Error`, or `None`. | ![DLM logbook filters](/dotstatsuite-documentation/images/dlm-logbook-filter-outcome.png) |

Each filter has a 'Clear all' rubber button, except for the 'Filter by action'.

The results are refreshed automatically when selecting a filter. When clicking on the 'Refresh' button on top of the Logbook the user's current selection is kept. 

----------

For more details about the data transfer transactions logs, see https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer#post-versionstatusrequest-get-the-request-information-by-transaction-id-and-dataspace.
