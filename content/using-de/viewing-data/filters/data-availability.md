---
title: "Data availability"
subtitle: "When actual content constraints for a dataflow have been provided/generated, then restrict the filter content to those dimensions items for which any data is available"
comments: false
weight: 2150

---

#### Table of Content
- [Intro](#intro)
- [Case 1: DE - The dataflow has some data](#case-1-:-de-the-dataflow-has-some-data-:-display-only-filter-values-for-which-data-exists)
- [Case 2: DE - The dataflow has no data](#case-2-de-the-dataflow-has-no-data-there-are-no-filter-values)
- [Case 3: DLM data preview - Allow displaying all filter values](#case-3-dlm-data-preview-allow-displaying-all-filter-values-whether-there-are-data-or-not)
- [Technical notes](#technical-notes)

---

### Intro
In order to reduce the risk for Data Explorer (DE) users to end up with an empty data table or chart, the filter values are limited to those items for which data actually exists.

### Case 1: DE - The dataflow has some data: Display only filter values for which data exists
Given that the dataflow has any data and that actual content constraints (with appropriate validity dates) exists that indicate the dimension items for which data exists, then the filter applies the actual content constraints and includes **only** items for which data actually exists.
Default item selections (from search, SDMX annotations, URL or in-built defaults) are not applied if they are not part of the actual content constraints. In the case that no data can be displayed because of a special selection combination for which no data exists, the data table/view is replaced with the text "There is no data for the current selection. Please change the selection.".  

### Case 2: DE - The dataflow has no data: There are no filter values
When navigating directly to the DE visualisation page (maybe from a saved link) of a dataflow that has no data, which is indicated by the fact that the actual content constraints are empty, then the filters are also empty (without values) and the data table/view is replaced with the text "There is no data available.". In this case default item selections (from search, SDMX annotations, URL or in-built defaults) are not applied.

### Case 3: DLM data preview - Allow displaying all filter values (whether there are data or not)
When navigating from the Data Lifecycle Manager (DLM) to the DE visualisation page (without previous search), then  
- the URL includes the parameter "dataAvailability=off" and 
- actual content constraints are not applied to the filter values and
- an additional "Data availability" filter with a checkbox option "Hide filter items without data" is added, where the checkbox is not checked.

In the case that data are not returned in the data call and:  
1) there is a current selection: then the data table/view is replaced with the text "There is no data for the current selection. Please change the selection." or  
2) there is no current selection: then the data table/view is replaced with the text "There is no data available."

When the user checks the option "Hide filter items without data" then 
- the actual content constraints are applied to the filters as described in cases 1 and 2 and
- the additional "Data availability" filter option "Hide filter items without data" is checked and
- the generated URL includes the parameter "dataAvailability=on".

The user can then again uncheck the option "Hide filter items without data" in order to revome again the application of actual content constraints on the filters.

### Technical notes
- Content constraints are distinguished between *Actual* and *Allowed* by the parameter **`type`**. Only *Actual* content constraints are considered.
- The validity of *Actual* content constraints can be temporarily limited. This time limitation is provided in the **`validFrom`** and **`validTo`** artefact parameters which are taken into account.  
- The content constraint's *CubeRegion* with property *include="true"* contains dimension values with available data. Only those dimension values are displayed. **Extreme case**: If any one of the included dimensions is empty (no values) then the whole dataflow has no data (Case 2).
- The content constraint's *CubeRegion* with property *include="false"* contains dimension values for which no data are available. These dimension values are excluded from the display. **Extreme case**: If for any one of those dimensions all values (as defined in the codelist) are excluded then the whole dataflow has no data (Case 2).
- Each dimension can only be part of one single *CubeRegion* definition, thus either use *include="true"* or use *include="false"*.  
- The constraint for TIME_PERIOD dimension range uses the property "isInclusive" and datetime variables, but they are applied on SDMX time periods like "2015" (means whole of year 2015) or "2015-11" (means whole of November of 2015).
  * **"isInclusive":"true"** indicates that this value should be the first (or last) datetime valid for the intended range, e.g. when dealing with an annual frequency, then the following syntax means: All time periods that start earliest 1990-01-01T00:00:00Z are included in the range: 1990, 1991, 1992, .... Any time period that starts before is excluded.
    ```
    "startPeriod": {
      "period": "1990-01-01T00:00:00Z",
      "isInclusive": true
    }
    ```
    The following syntax  means: All time periods that end latest on 2016-12-31T23:59:59Z are included in the range: ...,2014, 2015, 2016. Any time period that ends later is excluded.  
    ```
    "endPeriod": {
      "period": "2016-12-31T23:59:59Z",
      "isInclusive": true
    }
    ```
  * **"isInclusive": "false"** indicates that this value should be the last (or first) datetime non-valid for the intended range, e.g. the following syntax means: All time periods that start later than 1989-12-31T23:59:59Z are included in the range: 1990, 1991, 1992, .... Any time period that starts before or exactly at that datetime is excluded
    ```
    "startPeriod": {
      "period": "1989-12-31T23:59:59Z",
      "isInclusive": false
    }
    ```
    The following means: All time periods that end before 2017-01-01T00:00:00Z are included in the range: ...,2014, 2015, 2016. Any time period that ends exactly at that datetime or later is excluded
    ```
    "endPeriod": {
      "period": "2017-01-01T00:00:00Z",
      "isInclusive": false
    }
    ```
 
