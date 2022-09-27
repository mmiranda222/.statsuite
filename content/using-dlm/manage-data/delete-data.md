---
title: "Delete data"
subtitle: 
comments: false
weight: 400
keywords: [
 'Introduction', '#introduction',
 'Null values by empty import', '#null-values-by-empty-import',
 'Advanced delete operations', '#advanced-delete-operations',
 'Examples', '#examples',
]
---

#### Table of Content
- [Introduction](#introduction)
- [Null values by empty import](#null-values-by-empty-import)
- [Advanced delete operations](#advanced-delete-operations)
  - [Examples](#examples)

---

### Introduction
Data, meaning **observations values** and **attribute values**, can be deleted by using the feature [“Upload data & referential metadata”](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/manage-data/upload-data/) available from the top banner of the DLM.

Data deletion is supported with the following formats:
- for limited delete operation
  - [SDMX-CSV version 1.0](https://github.com/sdmx-twg/sdmx-csv/tree/v1.0/data-message/docs/sdmx-csv-field-guide.md)
  - [SDMX-ML](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/manage-data/upload-data/upload-data-sdmx-file/) (2.1 generic and data-specific formats, 2.0 generic and compact formats)
  - [Excel data](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/manage-data/upload-data/upload-data-edd/)
- for advanced delete operations
  - [SDMX-CSV version 2.0](https://github.com/sdmx-twg/sdmx-csv/tree/v2.0.0/data-message/docs/sdmx-csv-field-guide.md)
  - [SDMX-ML](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/manage-data/upload-data/upload-data-sdmx-file/) (2.1 generic and data-specific formats, 2.0 generic and compact formats)

**Current limitation**:   
It is not possible yet to "transfer" (copy) the deletion of data from one data space to another.
The following scenario does thus not work:
1) User loads data into a Space A
2) User transfer data to another space (Space B)
3) User deletes data in Space A by loading empty observations
4) User transfers data from Space A to Space B (e.g. without filter)  
--> Deleted data is not present in Space A, but still is in Space B

---

### Null values by empty import
Data can be set to 'Null' through a specifying **empty observations in import files**. This limited feature is supported in SDMX-CSV version 1.0, SDMX-ML, and Excel. Empty observations should be loaded through direct imports into the required data space.  

**NOTE:** this method does not allow to delete attributes.

---

### Advanced delete operations
> Release in [September 22, 2022 Release .Stat Suite .NET 'blueberry'](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#september-22-2022)

**Disclaimer:** SDMX-ML file format for data deletion is not yet available (will be relased with GitLab ticket [#277](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/277)). 

**SDMX-CSV version 2.0** and **SDMX-ML** files can contain specific actions, including **Delete 'D'**. In CSV v2.0 files, an **'ACTION'** column is set for each individual row (observation or attribute(s)).

**D: Delete** actions are assumed to take place at the lowest level of detail provided in the message. However:
- **Dimension can be omitted**. This means that the value of this dimension doesn't matter. With this, whole datasets, any slices of whole observations for dimension groups such as time series or individual whole observations can be deleted.
- Apart from dimensions, whenever only specific values for measures or attributes are provided, then only these values are deleted (within the given dimensional scope), otherwise all non-dimension component values related to the given dimensional scope are deleted. Instead of real values for non-dimensional components, it is sufficient to use any valid place-holder or **"missing" value**.
- All observations and attributes impacted by the delete action change their **timestamp**.
- The following convention is used to indicate **presence** and **omission** of components in delete actions:

| Format | Dimension value is | Measure or attribute value is |  | 
|:-------------|:-------------|:-------------|:-------------|
|  | omitted | omitted | present |
| XML | xml element/attribute is absent | xml element/attribute is absent | Any valid value or Numeric: NaN, String: <empty> |
| CSV v2.0 | <empty> or column is absent | <empty> or column is absent | Any valid value or #N/A |

#### Examples
DSD structure components:
- dimensions: DIM_1,DIM_2,TIME_PERIOD   
- measures: OBS_VALUE   
- attributes: DF_ATTR (defined at dataflow level), GR_ATTR, (defined at group level: DIM_2), TS_ATTR (defined at time series level), OBS_ATTR (defined at observation level)

structures file: [OECD-DF_TEST_DELETE-1.0-all_structures.xml](/dotstatsuite-documentation/OECD-DF_TEST_DELETE-1.0-all_structures.xml)  
data file: [OECD-DF_TEST_DELETE-1.0-all_data.csv](/dotstatsuite-documentation/OECD-DF_TEST_DELETE-1.0-all_data.csv)

The table below illustrates what are the possible basic delete actions for observation and attribute values:

| Delete                                                                                             | STRUCTURE | STRUCTURE_ID     | ACTION | DIM_1 | DIM_2 | TIME_PERIOD | OBS_VALUE | OBS_ATTR | TS_ATTR | GR_ATTR | DF_ATTR |
|----------------------------------------------------------------------------------------------------|-----------|------------------|--------|-------|-------|-------------|-----------|----------|---------|---------|---------|
| - whole content of the dataflow                                                                    | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      |       |       |             |           |          |         |         |         |
| - all observations of the dataflow and the observation-level attributes                            | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      |       |       |             | *         | *        |         |         |         |
| - all observation values of the dataflow                                                           | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      |       |       |             | *         |          |         |         |         |
| - all attributes of the dataflow                                                                   | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      |       |       |             |           | *        | *       | *       | *       |
| - attributes attached at dataflow level                                                            | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      |       |       |             |           |          |         |         | *       |
| - everything related to DIM_2=B                                                                    | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      |       | B     |             |           |          |         |         |         |
|                                                                                                    | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      |       | B     |             | *         | *        | *       | *       |         |
| - everything attached to DIM_2=B                                                                   | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      |       | B     |             |           |          |         | *       |         |
| - all observations (and its observation-level attributes) related to DIM_2=B                       | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      |       | B     |             | *         | *        |         |         |         |
| - all time series attributes                                                                       | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      |       |       |             |           |          | *       |         |         |
| - whole time series DIM_1=A,DIM_2=B                                                                | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      | A     | B     |             |           |          |         |         |         |
| - the attributes attached to time series DIM_1=A,DIM_2=B                                               | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      | A     | B     |             |           |          | *       |         |         |
| - observation values & observation-level attributes for time series DIM_1=A,DIM_2=B                | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      | A     | B     |             | *         | *        |         |         |         |
| - observation (and its observation-level attributes) attached to key DIM_1=A,DIM_2=B,TIME_PERIOD=2021 | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      | A     | B     | 2021     |           |          |         |         |         |
| - observation value attached to key DIM_1=A,DIM_2=B,TIME_PERIOD=2021                                  | dataflow  | OECD:DF_TEST_DELETE(1.0) | D      | A     | B     | 2021     | *         |          |         |         |         |


**Scenario 1: delete whole content of the dataflow**  
csv file [OECD-DF_TEST_DELETE-1.0-case_1__delete_whole_content_of_the_dataflow.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_1__delete_whole_content_of_the_dataflow.csv?inline=false)  
xml file [OECD-DF_TEST_DELETE-1.0-case_1__delete_whole_content_of_the_dataflow.xml](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_1__delete_whole_content_of_the_dataflow.xml?inline=false)

**Scenario 2: delete all observations of the dataflow and the observation-level attributes**  
csv file [OECD-DF_TEST_DELETE-1.0-case_2__delete_all_observations_of_the_dataflow_and_the_observation-level_attributes.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_2__delete_all_observations_of_the_dataflow_and_the_observation-level_attributes.csv?inline=false)  
xml file **NOT POSSIBLE** because XML requires at least one dimension value

**Scenario 3: delete all observation values of the dataflow**  
csv file [OECD-DF_TEST_DELETE-1.0-case_3__delete_all_observation_values_of_the_dataflow.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_3__delete_all_observation_values_of_the_dataflow.csv?inline=false)  
xml file **NOT POSSIBLE** because XML requires at least one dimension value

**Scenario 4: delete all attributes of the dataflow**  
csv file [OECD-DF_TEST_DELETE-1.0-case_4__delete_all_attributes_of_the_dataflow.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_4__delete_all_attributes_of_the_dataflow.csv?inline=false)  
xml file **NOT POSSIBLE** because XML requires at least one dimension value

**Scenario 5: delete attributes attached at dataflow level**  
csv file [OECD-DF_TEST_DELETE-1.0-case_5__delete_attributes_attached_at_dataflow_level.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_5__delete_attributes_attached_at_dataflow_level.csv?inline=false)  
xml file [OECD-DF_TEST_DELETE-1.0-case_5__delete_attributes_attached_at_dataflow_level.xml](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_5__delete_attributes_attached_at_dataflow_level.xml?inline=false)

**Scenario 6: delete everything related to DIM_2=B**  
csv file [OECD-DF_TEST_DELETE-1.0-case_6-1__delete_everything_related_to_DIM_2_B_way1.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_6-1__delete_everything_related_to_DIM_2_B_way1.csv?inline=false) or [OECD-DF_TEST_DELETE-1.0-case_6-2__delete_everything_related_to_DIM_2_B_way2.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_6-2__delete_everything_related_to_DIM_2_B_way2.csv?inline=false)  
xml file [OECD-DF_TEST_DELETE-1.0-case_6-1__delete_everything_related_to_DIM_2_B_way1.xml](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_6-1__delete_everything_related_to_DIM_2_B_way1.xml?inline=false) or [OECD-DF_TEST_DELETE-1.0-case_6-2__delete_everything_related_to_DIM_2_B_way2.xml](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_6-2__delete_everything_related_to_DIM_2_B_way2.xml?inline=false)

**Scenario 7: delete everything attached to DIM_2=B**  
csv file [OECD-DF_TEST_DELETE-1.0-case_7__delete_everything_attached_to_DIM_2_B.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_7__delete_everything_attached_to_DIM_2_B.csv?inline=false)  
xml file [OECD-DF_TEST_DELETE-1.0-case_7__delete_everything_attached_to_DIM_2_B.xml](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_7__delete_everything_attached_to_DIM_2_B.xml?inline=false)

**Scenario 8: delete all observations (and its observation-level attributes) related to DIM_2=B**  
csv file [OECD-DF_TEST_DELETE-1.0-case_8__delete_all_observations__and_its_observation-level_attributes__related_to_DIM_2_B.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_8__delete_all_observations__and_its_observation-level_attributes__related_to_DIM_2_B.csv?inline=false)  
xml file [OECD-DF_TEST_DELETE-1.0-case_8__delete_all_observations__and_its_observation-level_attributes__related_to_DIM_2_B.xml](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_8__delete_all_observations__and_its_observation-level_attributes__related_to_DIM_2_B.xml?inline=false)

**Scenario 9: delete all time series attributes**  
csv file [OECD-DF_TEST_DELETE-1.0-case_9__delete_all_time_series_attributes.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_9__delete_all_time_series_attributes.csv?inline=false)  
xml file **NOT POSSIBLE** because XML requires at least one dimension value

**Scenario 10: delete whole time series DIM_1=A,DIM_2=B**  
csv file [OECD-DF_TEST_DELETE-1.0-case_10__delete_whole_time_series_DIM_1_A_DIM_2_B.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_10__delete_whole_time_series_DIM_1_A_DIM_2_B.csv?inline=false)  
xml file [OECD-DF_TEST_DELETE-1.0-case_10__delete_whole_time_series_DIM_1_A_DIM_2_B.xml](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_10__delete_whole_time_series_DIM_1_A_DIM_2_B.xml?inline=false)

**Scenario 11: delete the attributes attached to time series DIM_1=A,DIM_2=B**  
csv file [OECD-DF_TEST_DELETE-1.0-case_11__delete_the_attributes_attached_to_time_series_DIM_1_A_DIM_2_B.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_11__delete_the_attributes_attached_to_time_series_DIM_1_A_DIM_2_B.csv?inline=false)  
xml file [OECD-DF_TEST_DELETE-1.0-case_11__delete_the_attributes_attached_to_time_series_DIM_1_A_DIM_2_B.xml](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_11__delete_the_attributes_attached_to_time_series_DIM_1_A_DIM_2_B.xml?inline=false)

**Scenario 12: delete observation values & observation-level attributes for time series DIM_1=A,DIM_2=B**  
csv file [OECD-DF_TEST_DELETE-1.0-case_12__delete_observation_values___observation-level_attributes_for_time_series_DIM_1_A_DIM_2_B.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_12__delete_observation_values___observation-level_attributes_for_time_series_DIM_1_A_DIM_2_B.csv?inline=false)  
xml file [OECD-DF_TEST_DELETE-1.0-case_12__delete_observation_values___observation-level_attributes_for_time_series_DIM_1_A_DIM_2_B.xml](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_12__delete_observation_values___observation-level_attributes_for_time_series_DIM_1_A_DIM_2_B.xml?inline=false)

**Scenario 13: delete observation (and its observation-level attributes) attached to key DIM_1=A,DIM_2=B,TIME_PERIOD=2021**  
csv file [OECD-DF_TEST_DELETE-1.0-case_13__delete_observation__and_its_observation-level_attributes__attached_to_key_DIM_1_A_DIM_2_B_TIME_PERIOD_2021.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_13__delete_observation__and_its_observation-level_attributes__attached_to_key_DIM_1_A_DIM_2_B_TIME_PERIOD_2021.csv?inline=false)  
xml file [OECD-DF_TEST_DELETE-1.0-case_13__delete_observation__and_its_observation-level_attributes__attached_to_key_DIM_1_A_DIM_2_B_TIME_PERIOD_2021.xml](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_13__delete_observation__and_its_observation-level_attributes__attached_to_key_DIM_1_A_DIM_2_B_TIME_PERIOD_2021.xml?inline=false)

**Scenario 14: delete observation value attached to key DIM_1=A,DIM_2=B,TIME_PERIOD=2021**  
csv file [OECD-DF_TEST_DELETE-1.0-case_14__delete_observation_value_attached_to_key_DIM_1_A_DIM_2_B_TIME_PERIOD_2021.csv](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_14__delete_observation_value_attached_to_key_DIM_1_A_DIM_2_B_TIME_PERIOD_2021.csv?inline=false)  
xml file [OECD-DF_TEST_DELETE-1.0-case_14__delete_observation_value_attached_to_key_DIM_1_A_DIM_2_B_TIME_PERIOD_2021.xml](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/tree/master/static/OECD-DF_TEST_DELETE-1.0-case_14__delete_observation_value_attached_to_key_DIM_1_A_DIM_2_B_TIME_PERIOD_2021.xml?inline=false)
