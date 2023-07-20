# How to create monitoring dashboards

## Intro
These are the steps for building periodic reports of the Solution team's activity in respect to delivering the .Stat Suite product.  
It is made by using 2 main components:
- **[GitLab REST API](https://docs.gitlab.com/ee/api/api_resources.html)**
- **Power BI** Query Editor & Desktop

## Get raw data
### Power BI Desktop
- Open Power BI Desktop
- Select "Get data" > "Web" > "Connect"
- Select "Advanced"
- Fill in the form with as many URL parts as necessary with mandatory and optional parameters:
  - https://gitlab.com/api/v4/groups/3863470/issues? *(fixed query targeting the SIS-CC group and type=issues)*
  - &private_token=N *(where "N" is you private GitLab personal access token)*
  - &per_page=100 *(max. limit of pagination)*
  - &state=closed *(closed tickets)*
  - &updated_after=2022-12-31 *(for all tickets related to year 2023)*
  - &order_by=updated_at
  - &page=1 *(**WARNING:** you will need to query for several pages if you have more than 100 results)*

With the above examples, you get the full query https://gitlab.com/api/v4/groups/3863470/issues?&private_token=N&per_page=100&state=closed&updated_after=2022-12-31&order_by=updated_at&page=1

- Launch the query by clicking "OK"

### Power Query Editor
The query result is, by default, display as a list of records. In the "Queries" left panel, double-click on your query and rename it, e.g. `"all-issues-YEAR-pageN"`.

In the menu header, select "Convert To Table", leave delimiter as "None" and extra columns as "Show as errors", then click "OK".  
Before converting the results into a flat table, you need to duplicate the query.

#### Duplicate the query for additional pages
> **This step must be applied when there are more than 100 results in the first query.**

Since the GitLab API is paginated and one page is limited to return a maximum of 100 records, it is necessary to query for several pages :
- Right-click on the query in the left-side panel and select "Duplicate" --> a new query with the same parameters is created
- From this new query, go to the right-side panel in "APPLIED STEPS", select the first step "Source" and click on the "edit" nut icon
- In the edit parameter dialog box, change "&page=1" to "&page=2", then click "OK"
- double-click on the query name and rename it, similarly to the first query, and with the matching page number.

Repeat the same steps as above in order to create a total of **8 pages**. This is an acceptable number for a report of one year of production, because the Solutions team has an average of 660 closed tickets per year for the last 3 years.

#### Append all queries
Before any data transformation, you need to append all queries' results into one single table:
- in the left panel, right-click and select "New Query" > "Combine" > "Append Queries as New"
- In the dialog box, select "Three or more tables"
- select all "Available tables" and click on "Add" in order to see all tables in the right "Tablesd to append" box
- click "OK"
- Rename the appended query e.g. "all-issues-YEAR"

**Note:** after this step, your data query should be finalized and left untouched for a given period (e.g. reporting an entire year of activity). For instance, every time a ticket is closed in the GitLab source, refreshing the data from the Power BI dashboard will autiomatically refresh the above prepared queries accordingly.

## Transform data
The following steps describe how to transform the raw data into *dashboardable* data.

#### Attributes removal/keep
> **Instead, it is possible to keep columns w=if there are fewer than the ones to remove.**

The final combined query displays a list of record into a single column. In the column header, click on the double-arrow and unselect the following (useless) attributes:
- id
- project_id
- description
- state *(if all values are identical, e.g. "closed")*
- updated_at
- closed_by
- assignees
- author
- type *(if all values are identical, e.g. "ISSUE")*
- assignee
- user_notes_count
- merge_requests_count
- due_date
- confidential
- discussion_locked
- issue_type

- time_stats.time_estimate
- time_stats.human_time_estimate

- task_completion_status.count
- task_completion_status.completed_count
- weight
- blocking_issues_count
- has_tasks
- task_status
- _links
- references
- severity
- service_desk_reply_to
- iteration
- health_status

Click "OK". The result is displays as a flat table with all kept attributes into columns and each result/ticket into rows.

#### Attributes transformation
Some attributes types need to be changed, or their values need to be transformed/sanitized, in order to be used by the dashboard builder:

**created_at** 
- Right-click "Change Type" > "Date/Time"
- Right-click "Transform" > "Date only"

**closed_at**  
- Right-click "Change Type" > "Date/Time"
- Right-click "Transform" > "Date only"

**labels**  
- Click on the double-arrow expand filter in the column header and select "Expand values"
- Select delimiter to "Comma" and click "OK"

**milestone**  
- Click on the double-arrow expand filter in the column header
- Select only "title" and keep "Use original column name as prefix" selected
- Click "OK"

**time_stats**  
- Click on the double-arrow expand filter in the column header
- Select on "total_time_spent" and unselect "Use original column name as prefix"
- Click "OK"

**Note** that this "total_time_spent" value is reported in seconds.

> **How to transform this second number into days/hours/minutes/seconds**

**epic**  
- Click on the double-arrow expand filter in the column header
- Select only "title" and keep "Use original column name as prefix" selected
- Click "OK"

#### Tickets exclusion
The GitLab API parameters does not allow to fine-tune the source query as accurate as needed, therefore it is necessary to exclude some of the returned tickets during this "transformation" step.

**Exclude SDMX Tools tickets**  
- Go to the "web_url" column and click on the filter arrow in the header
- Select "Text Filters" > "Does Not Begin With"
- In "Keep rows where 'web_url' does not begin with", enter the value "https://gitlab.com/sis-cc/sdmx-tools"
- Click "OK"

*Add an exclusion of "https://gitlab.com/groups/sis-cc/debt-transparency-platform"*

**Exclude tickets closed before current year**  
- Go to the "closed_at" column and click on the filter arrow in the header
- Select "Date Filters" > "Year" > "This Year"

**Note** that this step is necessary because the GitLab API does not support a parameter for e.g. "closed_after", only a "updated_after" parameter.

#### Close & apply
Once the raw data are prepared, clicking on "Close & Apply" (top-left menu option) closes the Query Editor and generates the transformed data into the "Data" panel of Power BI Desktop. All queries (combined and uncombined) that return data are displayed in this panel. 

---

**Brainstorm necessary for creating a calendar table**