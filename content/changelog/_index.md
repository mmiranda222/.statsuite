---
title: "Changelog"
subtitle: 
comments: false
weight: 120

---

### December 02, 2019 [Release .Stat Suite JS milestone 7](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/7)
>This new release concerns the **JavaScript JS** part of .Stat Suite, exclusively the **data-explorer** application.<br>

Major changes:

- [dotstatsuite-data-explorer#171](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/171) **Excel download with styles and colors** applied from the original Data Explorer table view.
- [dotstatsuite-data-explorer#128](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/128) **Additional downloads for external resources** can be added at the Dataflow level by using the SDMX annotation type **EXT_RESOURCE**.<br>
It is possible to relate a specific dataflow, in the SDMX Dataflow structure definition, to one or several materials (any type of file format) that are stored externally (outside .Stat Suite). The feature is supported by the SDMX annotation EXT_RESOURCE type, that is localised and defined at the dataflow level.<br>
<br>

**In the following example**, the dataflow structure definition contains 3 annotations of EXT_RESOURCE type for localised (in English and French) externally stored files to link to the datalfow. Each hyperlink can be enriched with a link to an image for its display as an icon of the link in the final representation: <br>

![Dataflow structure with external resources](/images/changelog_ext_res01.png)

Once published in the Data Explorer, the external resources related to the dataflow are available from the visualisation page (table and chart views) under the "Download" option, and in addition to the default data download links:

![Dataflow display with external sources](/images/changelog_ext_res02.png)

Switching the language of the Data Explorer from English to French will make the localised external files available for download (acccording to the dataflow structure definition).

Bug fixes:

- [dotstatsuite-data-explorer#190](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/190) Time Period displayed in table view is incorrect (not matching with SDMX response) when time period values are non-ordered.
- [dotstatsuite-data-explorer#189](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/189) NOT_DISPLAYED annotation is not applied to Attribute when it is defined at the dataflow level.
- [dotstatsuite-data-explorer#180](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/180) NOT_DISPLAYED annotation is not applied to Dimension when it is defined at the dimension level.
- [dotstatsuite-data-explorer#181](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/181) NOT_DISPLAYED annotation is not applied to Dimension values when it is defined in the codelist.
- [dotstatsuite-data-explorer#178](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/178) Frequency missing case (issue found when a dataflow has no Frequency dimension).
- [dotstatsuite-data-explorer#179](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/179) **First default selection** is not applied in .Stat DE visualisation page.
- [dotstatsuite-data-explorer#184](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/184) Hierarchical codelists are displayed as flat facets in the search result page.
- [dotstatsuite-data-explorer#154](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/154) and [dotstatsuite-data-explorer#183](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/183) **Tooltips** in .Stat DE table views are not completely shown in some edge cases.

---

### November 19, 2019 [Release .Stat Suite JS v3.0.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/6)
>This new release concerns the **JavaScript JS** part of .Stat Suite, especially the data-explorer, data-viewer and config. applications.<br>
This release has been tested with the **NSI WebService v7.10.1 and v7.10.3**. <br>

Major changes:

- [dotstatsuite-data-explorer#98](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/98) **Download data in Excel** from the .Stat Data Explorer data views.<br>
This first version of the Excel download feature allows the users to download their current filtered and customised data view into an Excel table (.xlsx extension format). It is triggered from the visualisation page's drop-down "Download" option (in addition to the .csv formats and in both table and chart views).<br>
It includes the layout of the table view, but not yet the colors in the table (to be done with [#171](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/171)).<br>
Attributes in flags and footnotes are also included in the downloaded Excel file, as internal links into a second sheet with exactly the same layout, but without any of the values and with flags in the cells instead of the values.
- [dotstatsuite-data-explorer#8](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/8) **Attributes in footnotes can be displayed at the always highest possible level in the .Stat DE data table**.<br>
Depending on the scenario and whenever the attribute value is the same in a section of the table, and in order to not repeat an unnecessary same information, then an attribute will be displayed in a footnote at the observation value level, time series level, grouping of dimension members level, or dataflow level. 
- [dotstatsuite-data-explorer#35](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/35) The **NOT_DISPLAYED SDMX annotation** allows to hide dimensions, dimension values, attributes, or attribute values from the .Stat Data Explorer table and chart representations, including from the dimension filters when relevant.
- [dotstatsuite-data-explorer#45](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/45) Add a UI feature for **changing the LastNObservations parameter**. See details [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/45) and [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/33) about the behavior of the LastNObservations feature.
- [dotstatsuite-data-explorer#125](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/125) Reintroducing the **choropleth map chart** to .Stat Data Explorer, including writing the instructions for the setup and configuration of a chart map. Documentation is available [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-customisation/#map-chart-configuration).
- [dotstatsuite-data-explorer#62](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/62) Integrate the **Time Period selections into the Used Filters area** of the .Stat Data Explorer visualisation pages.

Minor changes:

- [dotstatsuite-data-explorer#165](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/165) (*Refactoring*) Modify accept header to still allow retrieving urn in structure requests.
- [dotstatsuite-data-explorer#127](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/127) Dimension labels on COLUMN is not the same style as the labels on ROW. All dimension labels are now displayed in bold in the table views.

Bug fixes:

- [dotstatsuite-data-explorer#168](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/168) Bug in the **time range filter** where frequency, start year and end year are not shown.
- [dotstatsuite-data-viewer#7](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/issues/7) Viewer Google Analytics undefined.
- [dotstatsuite-ui-components#7](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-components/issues/7) Text color in the Frequency & Time Period filters is not coherent with the other components.
- [dotstatsuite-data-explorer#162](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/162) .Stat Data Explorer **CSV download** does not include the labels/codes option anymore.
- [dotstatsuite-data-explorer#156](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/156) **Subsequent new filter selections** are not taken into account while the data retrieval from the previous selection is still executing.
- [dotstatsuite-data-explorer#154](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/154) Footnotes are not shown completely especially towards end of table.

---

### November 13, 2019 [Release .Stat Suite .NET v2.0.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/issues?scope=all&utf8=%E2%9C%93&state=all&milestone_title=Release%20.Stat%20Suite%20.NET%20v2.0.0)
>This new release includes a new version of the **.NET/SQL services** the .Stat Suite. <br>


Major changes:

- [dotstatsuite-core-common#50](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/issues/50) **Generic OpenID Connect authentication** mechanism in the NSI WebService withint .Stat Suite.
- [dotstatsuite-core-sdmxri-nsi-ws#4](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/issues/4) and [dotstatsuite-core-common#96](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/issues/96) Add configuration to authentication to disable SSL and token issuer (required for OpenID Connect [#50](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/issues/50)).

Minor changes:

- [dotstatsuite-core-common#46](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/issues/46) Refactoring the logging mechanism for the .Stat instances of SDMX-RI web service and Transfer service.
- [dotstatsuite-core-sdmxri-nsi-ws#2](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/issues/2) **DevOps** Create a pipeline to build on-demand "vanilla" NSI WS Docker image directly from the Eurostat repository.
- [dotstatsuite-core-transfer#34](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/issues/34) **DevOps** Add SMTP server to the Docker image of the Transfer service in order to enable the email mechanism for .Stat DLM.
- [dotstatsuite-core-auth-management#4](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/issues/4) and [dotstatsuite-core-transfer#24](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/issues/24) **DevOps** Build the pipelines and Docker files for the Auth-management and Transfer services.
- [dotstatsuite-core-transfer#39](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/issues/39), [dotstatsuite-core-auth-management#5](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/issues/5) and [dotstatsuite-core-data-access#29](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/issues/29) **DevOps** Auth-management, Transfer and Data-access services: Update pipelines to push images with "latest" for master branch and "develop" for develop branch.
- [dotstatsuite-core-common#74](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/issues/74) **Test** Increase of Unit Test coverage.
- [dotstatsuite-core-data-access#27](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/issues/27) **Test** Integration tests with database inited from dbup scripts, in order to increase test coverage to at least 50%.

Bug fixes:

- [dotstatsuite-core-transfer#17](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/issues/17) InvalidCastException in SqlToSqlTransferManager.
- [dotstatsuite-core-transfer#5](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/issues/5) Dimension/Group attribute issues depending on the order of series keys reported in SDMX-ML and CSV files.
- [dotstatsuite-core-transfer#40](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/issues/40) SqlBulkCopy error.
- [dotstatsuite-core-data-access#28](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/issues/28) Missing rights for service account(s).
- [dotstatsuite-core-data-access#19](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/issues/19) Log table, Include update scripts.
- [dotstatsuite-core-transfer#38](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/issues/38) Transfer from external source feature is missing from .Stat DLM.

---

### October 11, 2019 Release .Stat Suite CORE services (GitLab milestone [Release BE 1](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/3))

Major changes:

- [dotstatsuite-core-common#10](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/issues/10) Implementation of the **Point In Time** release (see the PIT methods [documentation](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer#new-methods))
- [dotstatsuite-core-data-access#13](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/issues/13) Point In Time: configuration option to remove the ability to access PIT data on a per-service basis
- [dotstatsuite-core-common#6](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/issues/6) Porting of code from .NET Framework to **.NET Core**
- [dotstatsuite-core-transfer#2](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/issues/2) Database structure performance improvement

Minor changes:

- [dotstatsuite-kube-core-rp#1](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-core-rp/issues/1) **DevOps** *(confidential)* Manage ports, logins and passwords
- [dotstatsuite-core-common#36](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/issues/36) Health check call in Transfer Service 
- [dotstatsuite-core-transfer#25](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/issues/25) **DevOps** Create docker-compose files for all services (files of two topologies + variables are available [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-core-rp/blob/master/docker-compose%20Examples/README.md#file-overview))

Bug fixes:

- [dotstatsuite-core-sdmxri-nsi-plugin#16](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/issues/16) DotStatRetrieverFactory Constructor does not work with newer NSI Services
- [dotstatsuite-core-transfer#12](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/issues/12) & [dotstatsuite-core-data-access#5](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/issues/5) *(confidential)* Security fixes
- [dotstatsuite-core-data-access#25](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/issues/25) Moderate Data-Retrieval load causes "Error writing response" problems

---

### October 08, 2019 [Release .stat suite JS v2.0.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/2)
>**NSI WS compatible versions**: this new release concerns only the JavaScript JS part of the .Stat Suite and is compatible with the NSI WS versions from **v7.xx to v7.8**. <br>

Major changes:

- [dotstatsuite-sdmx-faceted-search#32](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/issues/32) Adapt the search service to use the new format of **localised elements in SDMX-JSON** formats
- [dotstatsuite-data-explorer#13](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/13) Table view with **indented children** for hierarchies in rows <br>
![RowLimit1](/images/Indented_Table.png)
- [dotstatsuite-data-explorer#9](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/9) DataExplorer table preview in the **Drag&Drop feature**
- [dotstatsuite-data-explorer#4](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/4) Set a limit of cells in the DataExplorer table view
- [dotstatsuite-data-explorer#50](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/50) Time Dimension labels in DataExplorer for **monthly frequency** (see the new configuration rules [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/getting-started/installation/de-customisation-configuration/#localised-time-period-values-for-monthly-frequency))

Minor changes:

- [dotstatsuite-data-explorer#151](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/151) Add Italian localised language of static DataExplorer elements
- [dotstatsuite-data-explorer#109](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/109) In DataExplorer visualisation pages, display the dataflow title and table/chart footer already before the data query is executed
- [dotstatsuite-visions#3](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions/issues/3) DataExplorer-splash: migration to Material UI
- [dotstatsuite-visions#2](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions/issues/2) DataExplorer-search-facet: migration to Material UI
- [dotstatsuite-visions#1](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions/issues/1) Import header and footer to [Vision]
- [dotstatsuite-data-explorer#124](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/124) DataExplorer unit tests
- [dotstatsuite-data-explorer#44](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/44) DevOps Use "qa" env for "qa" step (dev branch) and "staging" env for "release" step (master branch)

Bug fixes:

- [dotstatsuite-data-explorer#147](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/147) Source of charts could not be undefined
- [dotstatsuite-data-explorer#146](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/146) Last N observation should not be undefined
- [dotstatsuite-ui-components#6](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-components/issues/6) Table view with a render issue when layout is changed
- [dotstatsuite-data-explorer#129](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/129) Customise dimensions in rows is not easy nor possible sometimes when dragging and ordering dimensions
- [dotstatsuite-data-explorer#123](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/123) Arabic visualisation page layout with insufficient RTL features
- [dotstatsuite-data-explorer#122](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/122) DataExplorer Time Range selector and Share dialog with missing translations
- [dotstatsuite-data-explorer#119](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/119) Change DataExplorer localised-text-elements

---

### August 20, 2019
Major changes:

- [dotstatsuite-core-common#13](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/issues/13) and [dotstatsuite-data-explorer#67](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/67) **SDMX-JSON structure and data messages** retrieve all localised elements (names, descriptions, texts) according to the latest publicly released SDMX-JSON message format version with the new localised text elements (see sdmx references of both [structure](https://github.com/sdmx-twg/sdmx-json/blob/develop/structure-message/docs/1-sdmx-json-field-guide.md#localised-text-elements) and [data](https://github.com/sdmx-twg/sdmx-json/blob/master/data-message/docs/1-sdmx-json-field-guide.md#localised-text-elements) messages).

Minor changes:

- [dotstatsuite-core-common#37](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/issues/37) Adding script for the scheduled update of table statistics and rebuilding indexes; the related technical [documentation](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access#index-maintenance-and-optimization) is updated accordingly.

Bug fixes:

- [dotstatsuite-core-common#1](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/issues/1) **.Stat DLM** Wrong response when querying for an empty dataflow

---

### August 13, 2019
Major changes:

- [dotstatsuite-data-explorer#89](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/89) **Drag&Drop feature** is restricted to minimum of 1 dimension on row. The last dimension set to Row cannot be removed. <br>
![RowLimit1](/images/RowLimit1.png)
- [dotstatsuite-data-explorer#71](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/71) Extend the behavior of the **DEFAULT filter selections** by applying also items from search ; the sdmx DEFAULT annotation rule is combined with the end-user's selections from the search result page.

Minor changes:

- [dotstatsuite-data-explorer#81](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/81) **Time-Range selector** missing filter title and navigation bar
- [dotstatsuite-core-transfer#9](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/issues/9) **Performance test** scaling resources for Transfer and NSI webservices
- [dotstatsuite-data-explorer#88](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/88) The number of selected items of the **Time-Range selector** filter is displayed in the visualisation page.
- [dotstatsuite-share#2](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/issues/2) Style, content and layout enhancements of the content of the **Share email** validation request
- [dotstatsuite-data-explorer#73](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/73) Change "Code" option in "Label format" to "Identifier" <br>
![Identifier](/images/Identifier.png)

Bug fixes:

- [dotstatsuite-core-common#5](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/issues/5) Services do not return JSON but string and add a BOM as first character of the body
- [dotstatsuite-data-explorer#97](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/97) Incorrect count number in the used filter area
- [dotstatsuite-core-common#53](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/issues/53) **Security fixes** for Heap Inspection and Improper Resource Shutdown or Release
- [dotstatsuite-data-explorer#103](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/103) dataquery with several frequencies is not possible (e.g. select Annual AND Monthly from search result and display related dataflow result)
- [dotstatsuite-data-explorer#104](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/104) LAYOUT_ROW and LAYOUT_COLUMN are not respected for some dataflow cases
- [dotstatsuite-data-explorer#78](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/78) In the data table view, do not scroll the table header row containing the row dimension labels
- [dotstatsuite-data-explorer#92](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/92) Dataflow description is not displayed in the search result when using the 'browse by' feature from the homepage
- [dotstatsuite-data-explorer#19](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/19) Not possible to open a visualisation page in a new tab from the search result
- [dotstatsuite-data-explorer#106](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/106) API queries are incorrect
- [dotstatsuite-data-explorer#91](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/91) Wrong data retieval queries in visualisation page
- [dotstatsuite-data-explorer#107](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/107) Filename of CSV download is too long in some cases and fails to open in Excel ; solution is implemented to cut and limit the downloaded filenames to 184 characters max (before the Excel limit of 185 characters).
- [dotstatsuite-data-explorer#100](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/100) Issue in range header configuration (from the settings.json file)

---

### July 11, 2019
Major changes:

- [dotstatsuite-core-common#33](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/issues/33) Convert **authorization** service to .NET Core
- [dotstatsuite-data-explorer#48](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/48) When displaying footnote popup in data views, also show **attribute ID:name** (according to the code/label/both option)
- [dotstatsuite-core-sdmxri-nsi-plugin#3](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/issues/3) **SDMX-RI** implementation for .Stat Suite
- [dotstatsuite-data-explorer#60](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/60) **Empty "homeFacetIds"** should return zero homepage facet.<br>
This configuration (in the settings.json file of the DataExplorer config.) allows to configure an instance of the Data Explorer where the homepage has no facets to browse by, and only a free text search box.
- [dotstatsuite-data-explorer#9](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/9) **Table preview** in the Drag&Drop feature

Minor changes:

- [dotstatsuite-data-explorer#43](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/43) Remove "Search in" dropdown feature from the search result header
- [dotstatsuite-core-common#13](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/issues/13) Change of localised text in the SDMX-JSON data and structures messages (in SDMX source, not yet applied to front-end application such as .Stat DE)
- [dotstatsuite-data-explorer#89](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/89) Drag&Drop is restricted to a minimum of 1 dimension on row axis
- [dotstatsuite-share#3](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/issues/3) Security review: Unsafe use of target blank

Bug fixes:

- [dotstatsuite-core-common#5](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/issues/5) Services do not return JSON but string instead, and add a BOM as first character of the body
- [dotstatsuite-data-explorer#80](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/80) Time range selector for multiple frequencies: the selected frequency is not apply to data query
- [dotstatsuite-data-explorer#79](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/79) Bug in the time range selector with Monthly data
- [dotstatsuite-data-explorer#81](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/81) Time range selector with missing filter title and navigation bar

---

### June 4, 2019
Major changes:

- [dotstatsuite-data-explorer#23](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/23) **Time period range selection** with annual and non-annual frequencies.<br>
This new feature of the Data Explorer visualisation page is **replacing the time range slider** and enables the end-user to select a time frequency and an corresponding range of time period values for a given dataflow view.<br>
![Time Period Selector](/images/TimePeriodSelector.png)
- [dotstatsuite-data-explorer#26](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/26) **Share API** and publication workflow.<br>
The new Share service for table and chart sharing views (including url and embedded codes) relies on a **email validation workflow** process detailed [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share#publication-workflow).<br>
The end-user needs to provide a valid email address in order to receive a validation email along with the url and embedded code of the shared table or chart view.<br>
![Share email](/images/ShareMail.png)
- [dotstatsuite-data-explorer#33](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/33) **LastNObservations** default setting allowing to define a default number of latest time series observations per time series returned for table and chart views.<br>
This is implemented as an sdmx annotation parameter, but it should then be enhanced with a UI feature allowing the end-user to change this default parameter.
- [dotstatsuite-data-explorer#15](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/15) **.CSV download includes labels/codes option**.<br>
From the search result, .csv downloads include both codes and localised labels of dimensions and dimension members.<br>
From the visualisation pages, .csv downloads include codes only when "Code" option is set on the UI, and .csv downloads include both codes and localised labels when "Name" or "Both" options are set on the UI.

Minor changes:

- [dotstatsuite-data-explorer#34](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/34) Allow sdmx Attributes with 4 letter codes to be displayed as Flags
- [dotstatsuite-data-explorer#66](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/66)Theme SETTINGS. The new configuration file settings.json can include configuration the for Data Explorer layout, search header or splash logo.<br>
If these are added to the settings.json file, then it supersedes the default configuration.<br>
See more details in the [FAQ note](https://sis-cc.gitlab.io/dotstatsuite-documentation/getting-started/faqs/de-customisation-configuration/).
- [dotstatsuite-data-explorer#38](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/38) Chart configs (new configs + chnages in the Rules Driver API)
- [dotstatsuite-data-explorer#27](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/27) **_Legacy_** Fix apiqueries links
- [dotstatsuite-data-explorer#25](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/25) **_Legacy_** Fix visualisation reset state

Bug fixes:

- [dotstatsuite-data-explorer#22](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/22) Issues and remaining adaptations in the new search, configuration services and architecture
- [dotstatsuite-data-explorer#68](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/68) Update label in scope list

---

### May 17, 2019
Major changes:

- [dotstatsuite-data-explorer#24](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/24) Internet Explorer 10 & 11 compatible DataExplorer, with gracefully downgraded compatible features
- [dotstatsuite-sdmx-faceted-search#18](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/issues/18) Pagination of the search result pages. You can also configure the number of results per pages (see how from [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/getting-started/faqs/de-customisation-configuration/))

Bug fixes:

- [dotstatsuite-data-explorer#53](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/53) When no data in visualisation page, re-request returns an error
- [dotstatsuite-data-explorer#61](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/61) Incoherent state in the visualisation breadcrumb
- Various fixes on [layout](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/30), [annotations](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/55), [charts configs](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/38) and [attributes](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/54)

---

### April 25, 2019
Major changes:

- [dotstatsuite-data-explorer#42](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/42) Sdmx Faceted Search (sfs) UI adaptation, including configuration of home facets and reject and/or handle special facets in search results
- [dotstatsuite-data-explorer#38](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/38) Chart Configs
- [dotstatsuite-data-explorer#3](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/3) Table layout variations relative to user's actions

Minor changes:

- [dotstatsuite-data-explorer#28](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/28) **_Legacy_** Sort by order / by start all dimensions values
- [dotstatsuite-data-explorer#25](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/25) **_Legacy_** Fix visualization reset state
- [dotstatsuite-data-explorer#49](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/49) Setup "ILO" tenant on new front DevOps chain
- [dotstatsuite-data-explorer#30](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/30) **_Legacy_** Get default layout from sdmx data

Bug fixes:

- [dotstatsuite-data-explorer#32](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/32) The dataflow count is not visible for too long search filter values
- [dotstatsuite-data-explorer#27](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/27) **_Legacy_** Fix apiqueries links

---

### April 17, 2019
Minor changes:

- [dotstatsuite-data-explorer#29](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/29) **_Legacy_** Feature cascading sdmx requests
- [dotstatsuite-ui-components#2](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-components/issues/2) scope list search adaptation

Bug fixes:

- [dotstatsuite-data-explorer#39](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/39) unexpected characters in the DE URL

---

### April 11, 2019
Major changes:

- [dotstatsuite-data-lifecycle-manager#37](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/issues/37) .Stat DLM list artefacts feature enhancements, including information about data and observation number for a given dataflow, data preview and dataflow categorisation under the same expand/collapse feature.

Minor changes:

- [dotstatsuite-data-explorer#1](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/1) Update translation files

Bug fixes:

- [dotstatsuite-data-explorer#6](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/6) Impossible to add dimension to Section when default codes

---

### Release v0.5 - March 2019
Release notes and known limitations in [Github](https://github.com/cis-itn-oecd/dotstat-services/tree/development/docs/Release%20v0.5%20-%20March%202019)

---

### Release v0.4 - February 2019
Release notes and known limitations in [Github](https://github.com/cis-itn-oecd/dotstat-services/tree/development/docs/Release%20v0.4%20-%20February%202019)

---

### Release 14.12.2018
Release notes and known limitations in [Github](https://github.com/cis-itn-oecd/dotstat-services/tree/development/docs/Release%2014.12.2018)

---

### Release 28.09.2018
Release notes and known limitations in [Github](https://github.com/cis-itn-oecd/dotstat-services/tree/development/docs/Release%2028.09.2018)

---

### Release 10.07.2018
Release notes and known limitations in [Github](https://github.com/cis-itn-oecd/dotstat-services/tree/development/docs/Release%2010.07.2018)

