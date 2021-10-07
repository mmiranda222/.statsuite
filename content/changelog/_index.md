---
title: "Changelog"
subtitle: 
comments: false
weight: 120

---

<!-- 
ToC
- [October 5, 2021](#october-5-2021)
- [September 16, 2021](#september-16-2021)
- [September 03, 2021](#september-03-2021)
- [September 2, 2021](#september-2-2021)
- [August 17, 2021](#august-17-2021)
- [July 8, 2021](#july-8-2021)
- [June 16, 2021](#june-16-2021)
- [June 1, 2021](#june-1-2021)
- [May 19, 2021](#may-19-2021)
- [May 11, 2021](#may-11-2021)
- [April 27, 2021](#april-27-2021)
- [April 8, 2021](#april-8-2021)
- [April 1, 2021](#april-1-2021)
- [March 15, 2021](#march-15-2021)
- [March 10, 2021](#march-10-2021)
- [March 5, 2021](#march-5-2021)
- [January 25, 2021](#january-25-2021)
- [January 21, 2021](#january-21-2021)
- [December 2, 2020](#december-2-2020)
- [November 30, 2020](#november-30-2020)
- [November 24, 2020](#november-24-2020)
- [October 26, 2020](#october-26-2020)
- [October 7, 2020](#october-7-2020)
- [September 2, 2020](#september-2-2020)
- [August 25, 2020](#august-25-2020)
- [July 23, 2020](#july-23-2020)
- [July 7, 2020](#july-7-2020)
- [June 24, 2020](#june-24-2020)
- [June 23, 2020](#june-23-2020)
- [June 15, 2020](#june-15-2020)
- [May 18, 2020](#may-18-2020)
- [April 20, 2020](#april-20-2020)
- [April 2, 2020](#april-2-2020)
- [March 31, 2020](#march-31-2020)
- [March 29, 2020](#march-29-2020)
- [March 27, 2020](#march-27-2020)
- [March 05, 2020](#march-05-2020)
- [February 28, 2020](#february-28-2020)
- [February 17, 2020](#february-17-2020)
- [February 04, 2020](#february-04-2020)
- [January 31, 2020](#january-31-2020)
- [January 28, 2020](#january-28-2020)
- [January 8, 2020](#january-8-2020)
- [December 5, 2019](#december-5-2019)
- [December 02, 2019](#december-02-2019)
- [November 19, 2019](#november-19-2019)
- [November 13, 2019](#november-13-2019)
- [October 11, 2019](#october-11-2019)
- [October 08, 2019](#october-08-2019)
- [August 20, 2019](#august-20-2019)
- [August 13, 2019](#august-13-2019)
- [July 11, 2019](#july-11-2019)
- [June 4, 2019](#june-4-2019)
- [May 17, 2019](#may-17-2019)
- [April 25, 2019](#april-25-2019)
- [April 17, 2019](#april-17-2019)
- [April 11, 2019](#april-11-2019)
- [Release v0.5 - March 2019](#release-v05-march-2019)
- [Release v0.4 - February 2019](#release-v04-february-2019)
- [Release 14.12.2018](#release-14122018)
- [Release 28.09.2018](#release-28092018)
- [Release 10.07.2018](#release-10072018)
 -->

> **General disclaimer:** If you **upgrade a .Stat Suite installation from a .NET version below 5.0.0, to .NET v5.0.0 or higher**, you must follow the migration procedure explained as follows. **All MappingSets must be generated specifically in the context of the .Stat Suite**. This is to be done through the following methods:  
> - **Before** you generate the MappingSets (see next bullet), if during the migration/upgrade to version 5.0.0 or higher with the DBUP tool, some DSDs/Dataflows migrations fail (check the logs using the transfer service `/status/requests` method), then you should **migrate these dataflows manually** using the Transfer service method `/init/dataflow`. Note that this should happen only extremely rarely, and would be caused by previous inconsistencies in the DB state. In case the manual dataflow migration is still unsuccessful then it is recommended to delete the underlying DSD, cleanup the related DB objects (using the Transfer service method `/cleanup/dsd`), recreate the data structures and reload the related data. 
> - **Generate the MappingSets for all already existing dataflows when the .Stat Suite .NET version is migrated to 5.0.0 or higher, using the .Stat Suite Transfer service method `/init/allMappingsets`**. This method must be called manually as the very last step of the deployment of the new version (after all components are deployed/updated, and after the DBUP tool has run to update the databases). ([Documentation](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer#post-12versioninitallmappingsets-this-function-creates-mappingsets-of-all-dataflows-found-in-the-mappingstore-db))
> - **Generate the MappingSet for any newly added dataflow using the .Stat Suite Transfer service method `init/dataflow`**. This can be done using the Transfer service Swagger UI. ([Documentation](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer#post-12initdataflow-initializes-database-objects-of-a-dataflow-in-datastore-database))
> - **Generate the MappingSet for any newly added dataflow by uploading any data** (in DLM or with the .Stat Suite Transfer service). In other words, the MappingSet of a newly added dataflow will be automatically generated once you upload data for this dataflow.

---

### October 5, 2021
**[Release .Stat Suite JS 10.0.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/44)**
> This **major** release includes a new version of the **data-explorer**, **data-viewer**, and **data-lifecycle-manager** services.  
**nsiws compatibility:** tested and released in compatibility with the Eurostat **nsiws.net v8.5.0**.

**Performance evolutions of the DE data table** in this release: here below is a summary of comparison of the performance between the previous release and this one which introduces a new **HTML** table in the DE visualisations ([dotstatsuite-data-explorer#523](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/523)). Note that further performance improvements of the table are expected once we release [dotstatsuite-data-explorer#591](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/591) :

| DE table (version, content & layout) | Total | Scripting | Rendering | System |
|----------------|----------------|----------------|----------------|----------------|
| **JS 10.0.0** Table 250 observations | 468 ms | 347 ms | 33 ms | 87 ms |
| JS 9.0.2 Table 250 observations | 449 ms | 343 ms | 28 ms | 78 ms |
| **JS 10.0.0** Table 2500 observations | 4207 ms | 3817 ms | 102 ms | 288 ms |
| JS 9.0.2 Table 2500 observations | 5623 ms | 4245 ms | 1016 ms | 361 ms |
| **JS 10.0.0** Table 240 observations - Rows | 751 ms | 497 ms | 84 ms | 170 ms |
| JS 9.0.2 Table 240 observations - Rows | 713 ms | 502 ms | 81 ms | 129ms |
| **JS 10.0.0** Table 2500 observations - Rows | 5499 ms | 4869 ms | 248 ms | 382 ms |
| JS 9.0.2 Table 2500 observations - Rows | 6661 ms | 5398 ms | 817 ms | 446 ms |
| **JS 10.0.0** Table 2500 obs - Columns * 3 | 4860 ms | 4358 ms | 139 ms | 363 ms |
| JS 9.0.2 Table 2500 obs - Columns * 3 | 5754 ms | 4621 ms | 798 ms | 335 ms |
| **JS 10.0.0** Table 2500 obs - Sections (1 dimension) | 4747 ms | 4135 ms | 223 ms | 389 ms |
| JS 9.0.2 Table 2500 obs - Sections (1 dimension) | 14137 ms | 7422 ms | 2067 ms | 337 ms |
| **JS 10.0.0** Table 2500 obs - Sections (3 dimensions) | 15498 ms | 14796 ms | 198 ms | 504 ms |
| JS 9.0.2 Table 2500 obs - Sections (3 dimensions) | 16808 ms | 15158 ms | 963 ms | 687 ms |

major changes:

- **New translation keys** were added to the source code (DLM UI related). See the [i18n changelog](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/44#i18n-changelog). Note that these new keys do not all have a default translation provided in all the supported languages, hence you might have missing translations for some dinstinct (DLM) UI labels, unless you provide translations in your overrides, or you submit translations to the code source.
- [dotstatsuite-data-viewer#22](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/-/issues/22) Use i18n in the title of the data-viewer. It affects the `settings.json` file by removing the following property (moved to locales):
```json
"app": {
  "title": "SIS-CC .Stat Data viewer",
}
```

significant and minor changes:

- [dotstatsuite-data-explorer#487](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/487) Make the filter item (de-)selection features more intuitive. It includes the introduction of **checkboxes** for the facets/filters items' selection, and the adjustment of the pages' layout in order to give more space to the facets/filters areas.
- [dotstatsuite-data-explorer#523](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/523) Table cell mic-mac : **HTML table**.
- [dotstatsuite-data-explorer#561](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/561) Allow - by configuration - the DE to be **only accessible by authenticated users**. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/authentication/#how-to-allow-the-de-to-be-accessible-only-by-authenticated-users))
- [dotstatsuite-data-explorer#585](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/585) DE free text search `fts` should reset search. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/free-text-search/#free-text-search-reset))
- [dotstatsuite-data-explorer#249](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/249) Tracking events in data-explorer & data-viewer with **Google Tag Manager (GTM)**. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-analytics/google-tag-manager/))
- [dotstatsuite-data-lifecycle-manager#202](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/202) Extend the DLM with **advanced transfer features**: data validations & embargo release management. (Documentation for [data upload with embargo](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/upload-data/point-in-time/),  [data upload with data validations](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/upload-data/data-validation/) & [data transfer](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/copy-data/))
- [dotstatsuite-data-lifecycle-manager#210](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/210) Refactor and enhance how DLM retrieves the number of observations (or series) per dataflow. ([Updated Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/dlm_overview/#content-of-the-list))
- [dotstatsuite-data-explorer#514](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/514) Hide the "Time & Frequency" filter for dataflows without `TIME_PERIOD` time dimension or if a `NOT_DISPLAYED` annotation is defined for that dimension. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/time-period/#hiding-frequency-and-time-period-filters))
- [dotstatsuite-data-explorer#580](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/580) Keep the email between actions in DE share text field. ([Updated documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/share/#general-behavior))
- [dotstatsuite-data-explorer#577](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/577) Localised DE assets. ([Updated documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-customisation/#localised-common-site-logos))
- [dotstatsuite-components#6](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-components/-/issues/6) Enhance highlight filter mechanism for small Charts.
- [dotstatsuite-components#5](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-components/-/issues/5) Enhance the Stacked bar Chart.
- [dotstatsuite-data-explorer#568](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/568) Wrong default (end) time period selection.
- [dotstatsuite-d3-charts#5](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-d3-charts/-/issues/5) Remove chart logs for non-development version.
- [dotstatsuite-data-explorer#579](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/579) *(Refactoring)* Fix deprecated warning (material ui).
- [dotstatsuite-data-explorer#552](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/552) *(Refactoring)* Bad i18n usage in selector.
- [dotstatsuite-data-explorer#576](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/576) *(Refactoring)* Datasrouce `ds` in search `sfs` requests.
- [dotstatsuite-config-data#6](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/issues/6) *(Support)* Update Spanish i18n locale files.
- [dotstatsuite-shar#29](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/-/issues/29) *(Support)* SMTP mail configuration. ([Updated documentation](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/-/tree/master#smtp))
- [dotstatsuite-data-explorer#554](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/554) *(Support)* Number of last observations parameter from URL is not kept embedded when reusing the link.
- [dotstatsuite-docker-compose#26](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose/-/issues/26) *(Support)* *DockerCompose* Update config data for docker demo.
- [dotstatsuite-docker-compose#23](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose/-/issues/23) *(Support)* *DockerCompose* Error 404 indexing dataflows.
- [dotstatsuite-docker-compose#22](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose/-/issues/22) *(SUpport)* *DockerCompose* Search engine is offline causing data explorer to fail.
- [dotstatsuite-docker-compose#21](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose/-/issues/21) *(Support)* *DockerCompose* DLM demo is not loading : upgrade docker demo to latest v9.0.0.

patch changes:

- [dotstatsuite-sdmx-faceted-search#94](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/issues/94) `ORDER` annotation not working as expected for CategoryScheme.
- [dotstatsuite-data-explorer#592](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/592) Unnecessary search calls.
- [dotstatsuite-data-explorer#588](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/588) Narrow filter does not open in search page.
- [dotstatsuite-d3-charts#6](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-d3-charts/-/issues/6) Fix charts tooltip.
- [dotstatsuite-d3-charts#7](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-d3-charts/-/issues/7) Performance issue for Timeline charts rendering.
- [dotstatsuite-components#7](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-components/-/issues/7) Fix resize mechanism of the Charts.
- [dotstatsuite-data-viewer#23](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/-/issues/23) Missing translations in data viewer.
- [dotstatsuite-data-explorer#572](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/572) Chart config. component reset after changing the selection.

---

### September 16, 2021
**[Patch Release .Stat Suite .NET 7.0.1](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/42)**  
> This release includes a new *patch* version of the **core-transfer** and **core-data-access** services.  

patch changes:    
  
- [dotstatsuite-core-transfer#255](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/255) Component mapping errors found during the initialization of all mappingsets. 
- [dotstatsuite-core-data-access#76](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/76) Errors found in the AllowMissingComponents SQL migration script for the recreation of the DSD/DF views.
- [dotstatsuite-core-data-access#77](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/77) Errors found in the ChangeFactTableIndexes SQL migration script for the recreation of the Fact table indexes.

---

### September 03, 2021

**[Release .Stat Suite .NET 7.0.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/42)**
> This **major** release includes a new version of the **sdmxri-nsi-ws**, **core-transfer**, **core-data-access**, and **core-auth-management** services.  
**nsiws compatibility:** tested and released in compatibility with the Eurostat **nsiws.net v8.5.0**.

> **Disclaimers:**
> 1) With the release of [dotstatsuite-core-transfer#231](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/231) and the introduction of **pagination into the NSIWS for data requests**, and in order for the `/rest/data/...` queries to fully use the pagination mechanism (thus improving performance and properly using Range:start-end), the **mapping sets of the dataflows have to be reinitialized**. To do so, there are 3 options:  
**Option 1:** Initialize all mappingsets - Right after the release upgrade, run the transfer-service function `/init/allMappingsets`. **This should be ran when no other users are using the transfer-service** _The system administrator should schedule for some down time period_. The function might be long depending on the amount of dataflows.  
**Option 2:** Initialize the mappingset of specific dataflow - The initialization can be done per dataflow using the transfer-service function `/{version}/init/dataflow` for a given dataflow. _This option does not require a down time period._  
**Option 3:** Import data to initialize the mappingset of a specific dataflow - At the end of a data import, the mappingset will be initialized as part of the import process. _This option does not require a down time period._  
If none of the above is applied, the `/rest/data/...` queries will continue to work, but the performance will not be improved, nor the full pagination feature will work (only the first page will be retrieved).  
> 2) this latest version of the core-transfer service does not save the actual data db connection info into structure database by default, but instead it puts `‘NOT SAVED’` entries in the related `DB_CONNECTION` table.  
As a result, the **nsiws configuration must be extended** with the following two elements:  
`disseminationDbConnection.dbType`  
`disseminationDbConnection.connectionString`  
Please see the [related documentation](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/tree/master#data-database-connection-overriding-the-ones-stored-in-db_connection-table) for further information.

> **General advice on Dataflows deletion:** For a complete deletion of the MappingSet related to a dataflow, it is necessary, when deleting a dataflow, to either use the delete option from the DLM (the MappingSet cleanup is automatic), or manually delete the MappingSet using the Transfer Swagger UI (`https://transfer-env.tenant.org/swagger/`) before deleting the dataflow. This feature will be improved once releasing [dotstatsuite-core-sdmxri-nsi-ws#164](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/164).


**Known issues:** Be aware that this release has known issues described below. If you are concerned by one of these use cases, we suggest to upgrade using the next .NET Patch version.
- [dotstatsuite-core-data-access#76](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/76): the migration/upgrade script will throw an error for DSDs with non-coded attributes at dimensions/group level.
- [dotstatsuite-core-data-access#77](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/77): the migration/upgrade script will throw an error in the logs for DSDs with no Time dimension. There is no significant impact and should be ignored.
- [dotstatsuite-core-transfer#255](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/255): the migration/upgrade script can return errors on Dataflows such as : *`Incomplete mapping set. Please check if all dimensions, measure(s) and mandatory attributes are mapped: Dimension 'FREQ' is not mapped. Dimension 'REF_AREA' is not mapped ...`*  
This can happen when several dataflows related to the same DSD were previously deleted at once using the DLM, and it will result in failing to request the data view(s).
If so, running a) the `/cleanup/mappingsets` method, then b) the `/init/dataflow` method should fix the issue.

**Regression:**
- [dotstatsuite-core-sdmxri-nsi-ws#167](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/167): regression in the LastNObservations feature. Querying for LastNObservations will return the FirstNObservations. A fix will be submitted with high-priority to the SDMX source and integrated to the .Stat Suite with a future version of the nsiws.

major *(backward-incompatible)* changes:

- NSI web service uses **non-capital letters** for resource names in the structure queries, instead of capital letters, e.g. https://ws-entry-point/categoryscheme/all/all instead of https://ws-entry-point/CategoryScheme/all/all. See [SDMX reference](https://github.com/sdmx-twg/sdmx-rest/blob/master/v2_1/ws/rest/docs/4_3_structural_queries.md#resources)
- [dotstatsuite-core-transfer#210](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/210) **PointInTime release** to consider a **required time zone** for the release datetime. ([Updated documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/embargo-management/#prepare-a-new-pit-version))
- [dotstatsuite-core-data-access#75](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/75) Change **primary key** from `PERIOD_SDMX` to `PERIOD_START` and `PERIOD_END`. 

significant and minor changes:

- [dotstatsuite-core-sdmxri-nsi-ws#161](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/161) Deploy **NSI version 8.5.0** in DevOps.
- [dotstatsuite-core-sdmxri-nsi-ws#155](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/155) Deploy **NSI version 8.4.1** in DevOps.
- [dotstatsuite-core-sdmxri-nsi-ws#148](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/148) Deploy **NSI version 8.3.0** in DevOps.
- [dotstatsuite-core-common#21](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/-/issues/21) Support for **non-calendar year reporting**. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/typical-use-cases/#non-calendar-reporting-periods))
- [dotstatsuite-core-common#113](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/-/issues/113) & [dotstatsuite-data-explorer#164](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/164) Use **`REPORTING_YEAR_START_DAY`** in PERIOD_START & PERIOD_END value calculation, **support irregular "time range"** time periods & distinct points in time. Support of **high-frequency time periods** using SDMX annotation. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/api-main-features/#support-of-high-frequency-time-periods-using-sdmx-annotation)) **Known temporary limitation:** Allowed Containt Constraints should not yet contain TimeRange, otherwise data for last periods might not be displayed due to the wrong treatment of the `EndPeriod` property. This will be resolved with [dotstatsuite-core-sdmxri-nsi-ws#163](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/163).
- [dotstatsuite-core-transfer#231](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/231) Populate ORDER BY information in the [dbo].[DATASET] table in the mappingstore DB.
- [dotstatsuite-core-sdmxri-nsi-ws#117](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/117) Further **performance improvements for range requests**.
- [dotstatsuite-core-transfer#178](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/178) **Stream** as much as possible for **data upload** files.
- [dotstatsuite-core-transfer#237](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/237) Update mapping set creation logic to use PERIOD_END & PERIOD_START column in Eurostat's data retriever.
- [dotstatsuite-core-transfer#226](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/226) Add the number of observations to pre-generated actual content constraints.
- [dotstatsuite-core-sdmxri-nsi-ws#81](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/81) Implement **SDMX-JSON writer** for **StructureSets**, **MSD**, **Metadataflow** and **ProvisionAgreement**.
- [dotstatsuite-core-transfer#223](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/223) Improve the "batch" log message for large data uploads.
- [dotstatsuite-core-sdmxri-nsi-ws#137](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/137) Improve the successful message when updating a non-final codelist.
- [dotstatsuite-core-data-access#75](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/75) Change primary key from PERIOD_SDMX to PERIOD_START and PERIOD_END.
- [dotstatsuite-core-sdmxri-nsi-ws#123](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/123) Implement the **"available content constraint" in the *SDMX* API**. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/typical-use-cases/#dynamic-data-availability-for-a-specific-data-selection))
- [dotstatsuite-core-sdmxri-nsi-ws#115](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/115) Week numbers incorrectly treated by the nsiws. 
- [dotstatsuite-core-sdmxri-nsi-ws#121](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/121) Change the nsiws response code to 404 when mappingsets are missing.
- [dotstatsuite-core-transfer#212](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/212) Warning message (when initialising data DB) if a DSD has no measure representation.
- [dotstatsuite-core-transfer#242](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/242) Mapping Sets should be saved with no data db connection information.
- [dotstatsuite-quality-assurance#8](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-quality-assurance/-/issues/8) Add range request test cases to the performance tests.
- [dotstatsuite-quality-assurance#2](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-quality-assurance/-/issues/2) *(DevOps)* Collect performance test cases from OECD-ECO. (Documented in the [Performance objectives](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-quality-assurance/-/tree/master/PerformanceTests#performance-objectives))
- [dotstatsuite-core-auth-management#33](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/-/issues/33) *(Support)* Auth. with Azure AD.

patch changes:

- [dotstatsuite-core-sdmxri-nsi-ws#157](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/157) NSI uses wrong period end of the filter's endPeriod parameter & high-frequency values are ignored.
- [dotstatsuite-core-sdmxri-nsi-ws#147](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/147) Unabled to upload a non-final Metadata Structure Definition (MSD).
- [dotstatsuite-core-sdmxri-nsi-ws#146](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/146) Escape dimension column in sql query for dynamic actual constraint.
- [dotstatsuite-core-sdmxri-nsi-ws#134](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/134) AnnotationTitle is still limited to 70 characters when not attached to a dataflow (and all SDMX objects by extension).
- [dotstatsuite-core-sdmxri-nsi-ws#108](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/108) Replace `ReferencePeriod` by `CubeRegion-TimeRange` for Available Content Constraints.
- [dotstatsuite-core-sdmxri-nsi-ws#95](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/95) Incorrect HTTP status code returned for failed data queries.
- [dotstatsuite-core-transfer#215](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/215) SDMX-CSV file reader to allow for missing SDMX components (any attribute, measure) when updating data.
- [dotstatsuite-core-transfer#214](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/214) "Object reference not set to an instance of an object." error in the data upload e-mail.
- [dotstatsuite-core-transfer#238](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/238) Error "Component Mapping without constant value or columns is not valid for component `'DD_ID'` with parent `'50175'`".
- [dotstatsuite-core-transfer#245](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/245) Transfer failure : the given key was not present in the dictionary.

---

### September 2, 2021

**[Patch Release .Stat Suite JS 9.0.2](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/43)**  
> This release includes a new *patch* version of the **data-explorer** and **data-lifecycle-manager** services.  

patch changes:    
  
- [dotstatsuite-data-explorer#566](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/566) DE microdata viewer does not take the cell's time period value into account.
- [dotstatsuite-data-lifecycle-manager#216](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/216) Incorrect artefact clean up status displayed when deleting related artefacts.
- [dotstatsuite-data-lifecycle-manager#217](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/217) Error in structure deletion.

---

### August 17, 2021  
  
**[Patch Release .Stat Suite JS 9.0.1](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/43)**  
> This release includes a new *patch* version of the **data-explorer** service.  
  
patch changes:    
  
- [dotstatsuite-data-explorer#571](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/571) No data displayed because of wrong time period selected by the DE.    
   
---

### July 8, 2021
**[Release .Stat Suite JS 9.0.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/43)**
> This **major** release includes a new version of the **data-explorer**, **sdmx-faceted-search**, **data-viewer**, **config**, and **data-lifecycle-manager** services.  
**nsiws compatibility:** tested and released in compatibility with the Eurostat **nsiws.net v8.3.0**.

**TECHNICAL DISCLAIMERS:**  
Config folder contents significantly change: `tenants.json` contains more ; `settings.json` has no more relation to dataspace or datasource ; `datasources.json` is removed.

- **New tenant model:**
  - `tenants.json` is bigger with centralized spaces/datasources information
  - separation between **spaces** and **datasources** concepts
  - **new concept of scope** used to bind spaces/datasources to apps
  - references to datasources in `settings.json` moved in `tenants.json`
  - routes (when proxy is used) can use tenant slug: `<tenantId>` or `<tenantId>:<scopeId>`
- **Major change** in the search service (new tenant model adaptation):
  - reminder from previous release, a **collection** is required for each tenant ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/indexing-data/#how-to-create-a-collection))
  - clean and re-index all data for all tenants to avoid side-effects
- **`ROBOTS_POLICY`** env var in DE and DV to configure search engine indexation (default enabled), don't forget to override `robot.txt` file accordingly to the env var value
- **`AUTHZ_SERVER_URL`** env var is now used to bind the DLM to AUTHZ (previously in `settings.json`)
- **`TRANSFER_SERVER_URL`** env var **dropped** (was used in DLM) and **replaced by** `transferUrl` in `tenants.json` (at scope level): DLM is not bound to a transfer, it is the spaces used within its scope that are bound to a transfer (which is more flexible because different transfers can be used without deploying several DLM)
- **To override space** definition in search service:
  - temporary fix waiting for a better integration in the new tenant model
  - no more `datasources.json` file to mount at sfs level
  - define `searchUrl` in spaces definition, sfs will use it if defined in `tenants.json`
  - define `headers` in datasources definition in `tenants.json`

For your **migration/upgrade process**, think about:
1. datasources are inside the spaces
2. Define your datasources in `tenants.json`
3. From your `settings.json` file, retrieve your datasources IDs and add it in scope(s) inside your `tenants.json`, then once this is done, remove the obsolete datasources IDs from your `settings.json` file.
4. Then delete your `datasources.json` file (becoming useless).
5. When using proxy, change of root: the tenant identification is made of a tenant and a scope for applications supporting scopes: DLM, DE, but not DV.

major *(backward-incompatible)* changes:

- [dotstatsuite-config-data#4](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/issues/4) **New tenant model** adaptation. See above disclaimer and [Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/tenant-model/). Also available a [video record](https://oecdtv.webtv-solution.com/embed/8262/en/video) demoing and explaining the adaptation of this new tenant model.
- [dotstatsuite-sdmx-faceted-search#28](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/issues/28) Allow **individually adding new dataflows in the search index**. The previous `sfs` query to update an individual dataflow `PATCH /admin/dataflow` is replaced by the new 'upsert' `POST /admin/dataflow` query ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/indexing-data/#index-or-update-one-individual-dataflow)).
- [dotstatsuite-config#29](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/issues/29) *(Refactoring)* config data i18n follow up. Final migration of app configs from `.stat-suite/dotstatsuite-config` to `.stat-suite/dotstatsuite-config-data`

significant and minor changes:

- [dotstatsuite-data-explorer#536](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/536) Add option to avoid or enable indexing by **external search engine crawlers** through config. See the above technical disclaimer and [this documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/web-crawlers-optimisation/).
- [dotstatsuite-share#23](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/-/issues/23) Allow **parameterised share for smart embeds**. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/share/param-shared-views/))
- [dotstatsuite-data-explorer#163](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/163) Support for non-numeric and coded measures (observation values) in the DE.
- [dotstatsuite-sdmx-faceted-search#45](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/issues/45) Search **facet items ordered by explicit annotation "ORDER"**. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/facets/#facet-items-ordered-by-explicit-order-annotation))
- [dotstatsuite-data-explorer#510](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/510) Apply explicit order rules also to dimension items in data table and chart views. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/custom-data-view/implicit-explicit-order/#localized-order-in-data-message-for-de-filters-table-and-chart-views))
- [dotstatsuite-data-explorer#521](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/521) Make the `Shift` key usage in DE visualisation page similar to Excel. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/#keyboard-selection-options))
- [dotstatsuite-sdmxjs#7](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmxjs/-/issues/7) Allow configuring the required accept header per data space. [Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/dlm-configuration/#specific-accept-header-per-data-space)
- [dotstatsuite-data-explorer#494](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/494) Start & end period mismatch in the Time Period filter. ([Updated documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/time-period/#frequency-and-time-period-selectors))
- [dotstatsuite-data-explorer#538](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/538) Enhance understanding of filter count when a filter is not applied. (Documented [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/facets/#facet-information) and [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/#filter-area))
- [dotstatsuite-chart-generator-legacy#17](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-chart-generator-legacy/-/issues/17) Enhance the Time axis computing for Weekly, Daily, Hourly and Minutely frequencies in the Timeline charts.
- [dotstatsuite-data-explorer#516](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/516) Textual observation values in microdata tab displayed as `[undefined]`.
- [dotstatsuite-data-explorer#515](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/515) Issue with data visualisation when observation value is a long text containing special characters.
- [dotstatsuite-data-explorer#529](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/529) Move the "Fullscreen" action button in the DE action menu.
- [dotstatsuite-data-explorer#530](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/530) Share Privacy policy hyperlink should be localised.
- [dotstatsuite-data-explorer#528](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/528) Mismatch in default time period selection. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#default-time-period-boundaries-and-default-time-period-selection))
- [dotstatsuite-data-lifecycle-manager#183](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/183) Enhance the DLM deletion of related artefacts with preliminary check for access rights. ([Updated documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/delete-data-structures/#delete-an-artefact-and-its-related-structure-artefacts))
- [dotstatsuite-data-lifecycle-manager#99](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/99) Set a specific list of file extensions in "custom filter" settings of DLM file uploads.
- [dotstatsuite-config#32](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/issues/32) *(Refactoring)* Add warning in the script `"init:data"` when nothing happens.
- [dotstatsuite-data-explorer#542](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/542) *(Refactoring)* WCAG `defineMessages` & fix dynamic keys.
- [dotstatsuite-data-explorer#544](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/544) *(Support)* Remove blueprintjs unused dependency in Data Explorer.
- [dotstatsuite-data-explorer#540](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/540) *(Support)* CSS trying to serve up HTML displaying configs.
- [dotstatsuite-docker-compose#17](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose/-/issues/17) *(DevOps)* Docker upgrade solr 8.2 + create `sfs` collection.

patch changes:

- [dotstatsuite-data-explorer#547](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/547) Codelist labels displayed with 'invalid Date'.
- [dotstatsuite-data-lifecycle-manager#206](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/206) DLM Dump feature inconsistently downloads the wrong total of contents.
- [dotstatsuite-data-lifecycle-manager#209](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/209) Incorrect query for Metadata structure definitions (MSD) with references.
- [dotstatsuite-visions#25](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions/-/issues/25) WCAG drag & drop error whenusing the customise table feature.

---

### June 16, 2021
**[Release .Stat Suite .NET 6.4.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/41)**
> This release includes a new version of the **sdmxri-nsi-ws** service.  
**nsiws compatibility:** tested and released in compatibility with the Eurostat **nsiws.net v8.2.0**.

minor changes:

- [dotstatsuite-core-sdmxri-nsi-ws#139](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/139) Deploy **NSI version 8.2.0** in DevOps.
- [dotstatsuite-core-sdmxri-nsi-ws#140](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/140) **Improve performance** when getting the Frequency dimension from a DSD.
- [dotstatsuite-core-sdmxri-nsi-ws#138](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/138) **(Performance improvements)** Make rest data retrievals asynchronous.

patch changes:

- [dotstatsuite-core-sdmxri-nsi-ws#136](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/136) Unclear error message for content constraint with missing referenced dataflow.
- [dotstatsuite-core-sdmxri-nsi-ws#97](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/97) Treatments of `afterPeriod` and `beforePeriod` values are mixed up in the TimeRangeCore implementation.
- [dotstatsuite-core-data-access#73](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/73) Start Date of a `ContentConstraintObjectCore` instance can be changed to invalid value.
- [dotstatsuite-core-sdmxri-nsi-ws#119](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/119) Fix PointInTime related code in Eurostat's `maapi.net` library.

---

### June 1, 2021
**[Release .Stat Suite .NET 6.3.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/40)**
> This release includes a new version of the **sdmxri-nsi-ws** service.  
**nsiws compatibility:** tested and released in compatibility with the Eurostat **nsiws.net v8.1.3**.

minor changes:

- [dotstatsuite-core-sdmxri-nsi-ws#129](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/129) Deploy **NSI version 8.1.3** in DevOps.
- [dotstatsuite-core-sdmxri-nsi-ws#112](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/112) Support for **DSD without Time dimension** *(part 2 for appropriate SDMX-JSON export)*.
- [dotstatsuite-core-sdmxri-nsi-ws#105](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/105) **Performance improvements** for 0-0 range requests.
- [dotstatsuite-core-sdmxri-nsi-ws#99](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/99) Automatic deletion of mapping sets belonging to the dataflow when the dataflow is deleted. This is done with a new `autoDeleteMappingSets` variable (default value in the Docker image is set to `true`, which normally should not be changed).
- [dotstatsuite-core-sdmxri-nsi-ws#104](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/104) *(Support)* `SdmxRegistryService` URL configuration.
- [dotstatsuite-core-transfer#181](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/181) *(Support)* Data upload of large files.

patch changes:

- [dotstatsuite-core-sdmxri-nsi-ws#109](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/109) Values of attributes at group attachment level not written in series node in sdmx-json.
- [dotstatsuite-core-sdmxri-nsi-ws#107](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/107) Fix writing of `NULL` value in JSON data message.
- [dotstatsuite-core-sdmxri-nsi-ws#106](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/106) Last N periods wrongly selecting the first N periods (based on the `lastNObservations` parameter).
- [dotstatsuite-core-sdmxri-nsi-ws#101](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/101) Not possible to update parent relations in a non-final codelist used in a DSD. **Disclaimer:** additional enhancements for the successful returned message of this specific transaction will be followed with [dotstatsuite-core-sdmxri-nsi-ws#137](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/137).
- [dotstatsuite-core-sdmxri-nsi-ws#98](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/98) Allowed content constraint structure message validation to align with *SDMX* standards. **Disclaimer:** a remaining unclear message (when uploading a Content Constraint for which the referenced dataflow doesn't exist) will be followed with [dotstatsuite-core-sdmxri-nsi-ws#136](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/136).
- [dotstatsuite-core-sdmxri-nsi-ws#35](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/35) Improve error and status messages for all structure updates.
- [dotstatsuite-core-sdmxri-nsi-ws#31](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/31) Incorrect header sender/receiver ID in the SDMX messages.

**[Release .Stat Suite JS 8.0.1 - Keycloak](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/38)**
> This release **only** includes a new *custom* image of the **keycloak** Docker image.  
.Stat Suite compatibility to **[JS 8.0.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/38)** and **[.NET 6.3.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/40)**  
**nsiws compatibility:** tested and released in compatibility with the Eurostat **nsiws.net v8.1.3**.

significant change:

- **Connect Keycloak to Active Directory ADFS**.  This is a release of the new and 'custom' **Keycloak Docker image** including the new **plugin** that allows to connect an Active Directory ADFS as a third-party provider to Keycloak:
- [Docker hub image](https://hub.docker.com/layers/siscc/dotstatsuite-keycloak/v8.0.0/images/sha256-47e969faef79f1ae05e37e64ca6a1b7b7671a2498a626e74ecc108cdad8136ec)
- Newly made public [Keycloak project](https://gitlab.com/sis-cc/.stat-suite/keycloak/-/tree/master)
- [ADFS-to-keycloak plugin](https://gitlab.com/sis-cc/.stat-suite/keycloak/-/tree/master/src/main)
- [Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/authentication/third-party-providers/) on how to configure ADFS as a SAML provider to Keycloak

---

### May 19, 2021
**[Release .Stat Suite JS 8.0.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/38)**
> This **major** release includes a new version of the **data-explorer**, **sdmx-faceted-search**, **data-viewer**, **share**, **config**, and **data-lifecycle-manager** services.  
**nsiws compatibility:** tested and released in compatibility with the Eurostat **nsiws.net v8.1.2**.

major *(backward-incompatible)* changes:

- [dotstatsuite-sdmx-faceted-search#40](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/issues/40) **Solr upgrade to version 8.7**. (Updated [API documentation](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search#api-documentation))  
**Disclaimer:**
  - `sfs` is now multi-tenant, which means that each API call should include a **tenant**. Providing a tenant can be done in 2 ways:
    - as a query param: `&tenant=test`
    - as a header: `x-tenant=test`
  - _Existing data can be dropped, it is reindexed (new solr major version, no need to struggle with a migration). No need to create a SOLR Core anymore!_
  - **Create a Collection** in solr named `defaulttenant`: `http://0.0.0.0:8983/solr/admin/collections?action=CREATE&name=defaulttenant&numShards=1&collection.configName=_default`
  - **Add `DEFAULT_TENANT`** env. variable with the value `defaulttenant` to sfs
  - **Note** that sfs API is unchanged when using `DEFAULT_TENANT`, all calls without a tenant will use the value of `DEFAULT_TENANT` as a tenant
  - data-explorer will request sfs without a tenant until the upcoming new sfs model is released (see [this list of iteration D issues](https://gitlab.com/groups/sis-cc/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=JavaScript&label_name[]=search&label_name[]=i%3A%3Aiteration-D))
  - _On-premise installation: http call to solr api locally (since solr should be exposed)_
  - _Docker installation: http call to solr locally or from sfs container (see latest docker-compose)_
- [keycloak#8](https://gitlab.com/sis-cc/.stat-suite/keycloak/-/issues/8) & [keycloak#11](https://gitlab.com/sis-cc/.stat-suite/keycloak/-/issues/11) *(DevOps)* **Keycloak upgrade to version 12.0.4**.  
**Disclaimer:**
  -	Migration process to this new major version is quite sensitive even though not backward-incompatible
  -	**Backup your data** before processing with the upgrade!
  -	See [this tutorial page](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/authentication/keycloak-configuration/) about Keycloak configuration, and also Kubernetes strategy and historical migrations documented [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-rp/-/blob/master/keycloak.md) (as *source of inspiration* from our DevOps deployment process)
- [dotstatsuite-share#9](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/-/issues/9) *(Refactoring)* Remove hard-coded dependency on third-party mail service **MailGun**.  
**Disclaimer:**
  - This allows the **full SMTP setup** of the share service: see updated documentation about using [SMTP connection](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share#smtp).
  - **Add the new `MAIL_FROM`** env. variable with the contextual value `'"Share" share@your-domain.org'` (was previsouly hard-coded)
  - Mailgun API key is kept as a param for an extra period of time (until September 30, 2021). **After this date**, the Mailgun API key will be definitely removed from the source code.
- [dotstatsuite-data-explorer#525](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/525) *(Refactoring)* Align **i18n versions of data-viewer** with data-explorer.  
**Disclaimer:**
  - data-viewer i18n is now using the default translations similarly to the data-explorer, hence no need to create overrides specific to data-viewer.

**Additional disclaimer:** This release implies to *temporarily* retrieve any new and default i18n key and translation values in a new public project and from its `master` branch https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/tree/master/i18n. The fluid process of releasing i18n default translations as part of the open-source .Stat Suite source code will be complete with the next [iteration C delivery](https://gitlab.com/groups/sis-cc/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=JavaScript&label_name[]=i%3A%3Aiteration-C).

significant and minor changes:

- [dotstatsuite-data-explorer#11](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/11) In table view, **horizontally merge** column header cells and keep label visible when scrolling horizontally. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/#horizontal-merged-column-header-cells))
- [dotstatsuite-data-explorer#501](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/501) Label format options also applied to visualisation filters. ([Updated documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/toolbar/#labels))
- [dotstatsuite-data-explorer#99](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/99) Extend the behaviour of the **`DEFAULT` filter selections** by applying also hit terms from search *(part 2: use of search terms found in dimension values)*. ([Updated documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/search-results/#navigation-towards-the-de-visualisation-page))
- [dotstatsuite-data-explorer#407](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/407) Usability support **"You did not get the expected chart?"** ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/charts/))
- [dotstatsuite-data-explorer#526](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/526) Search enhancement of download both internal and external sources.
- [dotstatsuite-data-lifecycle-manager#148](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/148) Return meaningful error message in DLM for HTTP code "413 Request Entity Too Large".
- [dotstatsuite-data-lifecycle-manager#82](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/82) *(DevOps)* DLM (and other relevant components) allow using GitLab accounts. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/authentication/third-party-providers/#gitlab))
- [dotstatsuite-docker-compose#7](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose/-/issues/7) *(DevOps)* Upgrade Keycloak with version 12.0.4 in docker-compose.
- [dotstatsuite-components#4](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-components/-/issues/4) *(Refactoring)* Remove deprecated components and dependencies.
- [dotstatsuite-docker-compose#14](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose/-/issues/14) *(Support)* Script clones unavailable repository.
- [dotstatsuite-data-explorer#520](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/520) *(Support)* Change privacy policy text in share dialog.
- [dotstatsuite-data-explorer#384](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/384) *(Docker Compose)* Documenting mono & multi tenants with Docker (without exposing config).
- [dotstatsuite-data-explorer#505](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/505) SIS-CC license update.

patch changes:

- [dotstatsuite-data-explorer#518](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/518) Fix the unnecessary double search requests.
- [dotstatsuite-data-explorer#504](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/504) Bugs in weekly time selector.
- [dotstatsuite-data-explorer#511](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/511) We lost *(again)* the `Roboto Slab` font in the visualisation page.
- [dotstatsuite-data-explorer#512](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/512) Correct web accessibility issues.
- [dotstatsuite-data-explorer#517](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/517) Download in Excel isn't working anymore.
- [dotstatsuite-data-explorer#513](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/513) We lost the chart in the .png chart download.
- [dotstatsuite-data-explorer#355](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/355) Customise the colour of charts in DE.
- [dotstatsuite-data-explorer#519](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/519) Fix sharing of cutomized time axis labels for Timeline charts.
- [dotstatsuite-data-lifecycle-manager#203](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/203) DLM Filter by owner is out-of-service.

---

### May 11, 2021
**[Release .Stat Suite .NET 6.2.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/39)**
> This release includes a new minor version of the **core-data-access** service.  
**nsiws compatibility:** tested and released in compatibility with the Eurostat **nsiws.net v8.1.2**.

minor changes:

- [dotstatsuite-core-data-access#72](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/72) Add support for creation of **read only** user to DbUp scripts.
- [dotstatsuite-core-common#116](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/-/issues/116) *Support* .StatSuite has issues with Managed Azure SQL. ([Updated documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/install-source-code/windows-stat-core-services/#3-initialize-the-databases))
- [dotstatsuite-docker-compose#16](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose/-/issues/16) *Support* Cannot upload data file with demo instance.

---

### April 27, 2021
**[Release .Stat Suite .NET 6.1.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/37)**
> This release includes a new version of the **core-transfer**, **core-data-access**, **core-auth-management**, and **excel-addin** services.  
**nsiws compatibility:** tested and released in compatibility with the Eurostat **nsiws.net v8.1.2**.

minor changes:

- [dotstatsuite-core-transfer#123](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/123) Change the **validation process** for data uploads. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/api-main-features/#data-validation-process))
- [dotstatsuite-core-transfer#170](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/170) Allow deleting data DB objects for a DSD even if the DSD still exists.
- [dotstatsuite-excel-addin#18](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-excel-addin/-/issues/18) **DLM Excel-Addin** to support authentication with **third-party identity providers** and add "Log In/Out" button(s). ([Updated documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm-excel-addin/#authentication))
- [dotstatsuite-core-transfer#174](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/174) Create a transaction record in the `/init/allMappingsets` method.
- [dotstatsuite-core-config#4](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-config/-/issues/4) Update some error messages of the Transfer service.
- [dotstatsuite-core-auth-management#29](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/-/issues/29) Provide method/way to obtain only the permissions that apply to the calling user.
- [dotstatsuite-core-data-access#44](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/44) Generation of empty actual content constraint for "live" version when first data upload targets PIT release.
- [dotstatsuite-core-auth-management#31](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/-/issues/31) Set `CORS` in the AuthMgmt web service.
- [dotstatsuite-core-transfer#130](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/130) *(Refactoring)* Cleanup temporary files when upload is finished.
- [dotstatsuite-core-data-access#71](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/71) *(Refactoring)* SQL server compatible issues.

patch changes:

- [dotstatsuite-core-transfer#205](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/205) Dataflow Content Constraint not updated when transferring data between dataspaces.
- [dotstatsuite-core-transfer#201](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/201) Live to PIT SQL transfer fails.
- [dotstatsuite-core-transfer#198](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/198) Issue recreating DSDs with different data type and remaining shared codelist(s).
- [dotstatsuite-core-data-access#64](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/64) Dataflow initialization fails for some dataflows referencing non-final dsd and codelists.
- [dotstatsuite-core-transfer#160](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/160) Exception of type `DotStat.Db.Exception.KeyValueReadException` in Excel+EDD upload response.

---

### April 8, 2021

**[Patch Release .Stat Suite JS 7.2.1](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/36)**
> This release includes a new *patch* version of the **data-explorer** and **data-viewer** services.  
**nsiws compatibility:** tested and released in compatibility with the Eurostat **nsiws.net v8.1.2**.

patch changes:

- [dotstatsuite-data-explorer#507](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/507) Backward-Compatible `lt[rs|rw|cl]` layout parameter name *(replaced with `ly[rs|rw|cl]` in JS 7.2.0 release [dotstatsuite-data-explorer#473](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/473))*.
- [dotstatsuite-chart-generator-legacy#15](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-chart-generator-legacy/-/issues/15) Fix infinite loop for small timeline charts.

---

### April 1, 2021
**[Release .Stat Suite JS 7.2.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/36)**
> This release includes a new version of the **data-explorer**, **data-lifecycle-manager**, **data-viewer**, **share**, **config**, and **proxy** services.  
**nsiws compatibility:** tested and released in compatibility with the Eurostat **nsiws.net v8.1.2**.

**Disclaimer for .Stat Suite Docker setup:** as a result of [dotstatsuite-config#27](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/issues/27), a new Docker image needs to be used for Docker setup: `siscc/dotstatsuite-config-prod:master` ->  **`siscc/dotstatsuite-config:master`**. Note that the previous `siscc/dotstatsuite-config-prod:master` will still work and will be removed at some point in the future.  
In addition, the `i18n` translations were implicitly loaded, now it is done explicitly: folder `i18n` to mount `config/data/prod/i18n` ->  **`opt/i18n`**.

minor changes:

- [dotstatsuite-data-explorer#145](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/145) **Table view with highlight** of cells, rows and columns. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/#highlighted-cells-rows-and-columns))
- [dotstatsuite-share#20](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/-/issues/20) Options in emails to **list and delete all shared objects** related to the user's email address. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/share/#list-of-shared-objects))
- [dotstatsuite-data-explorer#481](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/481) Localise the "Terms and Conditions" URL (copyright icon).
- [dotstatsuite-data-explorer#473](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/473) Solve encoding conflict in DE URL parameter when sending links through HTML-encoded e-mail. The layout `lt[rs|rw|cl]` parameter name is replaced with **`ly[rs|rw|cl]`**. Note that The `lt` parameter will not be recognised as URL input anymore, and (older) URLs using it will not break but only generate the default dataflow view.
- [dotstatsuite-data-lifecycle-manager#194](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/194) Feature to **categorise a dataflow** in DLM. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/publish-data/#categorise-a-data-view))
- [dotstatsuite-data-lifecycle-manager#193](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/193) DLM to open artefact links in authenticated mode.
- [dotstatsuite-data-lifecycle-manager#173](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/173) Extend display of artefact identification information. ([Updated documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/dlm_overview/#contents-of-the-list))
- [dotstatsuite-config#27](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/issues/27) and [dotstatsuite-proxy#6](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy/-/issues/6) *(Refactoring)* config and proxy update/data
- [dotstatsuite-visions#21](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions/-/issues/21) *(Refactoring)* `DataHeader` like `DataFooter` (visions + components update).
- [dotstatsuite-visions#24](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions/-/issues/24) *(Refactoring)* Remove Vision deprecated code 5.x.

patch changes:

- [dotstatsuite-data-explorer#502](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/502) Time-Period filter returns a wrong total number in the visualisation page.
- [dotstatsuite-data-lifecycle-manager#187](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/187) Fix the spinner for DLM artefact transfer.
- [dotstatsuite-data-explorer#403](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/403) Table cell mic-mac for large selections, and enhancement of the **table limit's notification** ([Updated documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/incomplete-data/))
- [dotstatsuite-config#28](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/issues/28) *(Support)* Missing `i18n` values for both en/fr in dev and master branches.

---

### March 15, 2021
**[Patch Release .Stat Suite JS 7.1.1](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/35)**
> This release includes a new *patch* version of the **data-explorer** service.  
**nsiws compatibility:** tested and released in compatibility with the Eurostat **nsiws.net v8.1.2**.

patch change:

- [dotstatsuite-data-explorer#500](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/500) Search results additional downloads for external resources does not work. *All use cases for internally/externally stored dataflows, and externally stored materials to download must be handled.*

---

### March 10, 2021
**[Release .Stat Suite JS 7.1.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/35)**
> This release includes a new version of the **data-explorer**, **data-viewer**, **sdmx-faceted-search**, and **data-lifecycle-manager** services.  
**nsiws compatibility:** tested and released in compatibility with the Eurostat **nsiws.net v8.1.2**.

significant and minor changes:

- [dotstatsuite-data-explorer#221](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/221) **Microdata storage and display**. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/microdata-preview-table/))
- [dotstatsuite-data-explorer#483](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/483) In search results, add **additional downloads for external resources** through specific dataflow annotation. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/search-results/#optional-download-feature))
- [dotstatsuite-data-explorer#480](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/480) Keyboard selections in scopelist to instantly change highlight state.
- [dotstatsuite-data-explorer#334](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/334) Configurable alignment of the homepage facets. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#homepage-facets-alignment))
- [dotstatsuite-data-explorer#207](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/207) Backward navigation from the visualisation page to the search page needs too many clicks.
- [dotstatsuite-data-explorer#469](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/469) Unfiltered csv download in viz page must not include filter selection in csv file name.
- [dotstatsuite-data-explorer#493](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/493) Update sfs to node version 14.x.
- [dotstatsuite-data-explorer#387](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/387) Active/Hover table cell with colored frame instead of colored background.
- [dotstatsuite-data-lifecycle-manager#182](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/182) New option to **delete also referencing/referenced (thus "related") artefacts**. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/delete-data-structures/#delete-an-artefact-and-its-related-structure-artefacts))
- [dotstatsuite-data-lifecycle-manager#185](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/185) Run transfer's `mappingSet cleanup` method before deleting a dataflow.
- [dotstatsuite-docker-compose#10](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose/-/issues/10) *(Documentation) Docker-compose redis doc update.
- [dotstatsuite-data-explorer#474](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/474) *(Support)* Thousand separators not showing up when a particular category is selected.
- [dotstatsuite-data-explorer#225](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/225) *(Refactoring)* Improve and harmonise the identification of `frequency` and `ref_area` dimension.
- [dotstatsuite-data-explorer#402](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/402) *(Refactoring)* Update home facet layout on narrow view.
- [dotstatsuite-data-explorer#479](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/479) *(Refactoring)* Cascading requests (small) rework.
- [dotstatsuite-data-explorer#405](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/405) *(Refactoring)* `getIsRtl` origin.

patch changes:

- [dotstatsuite-data-viewer#19](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/-/issues/19) Issues with shared charts when not displayed and/or with incorrect size.
- [dotstatsuite-data-explorer#488](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/488) Switching language while viewing a chart freezes the data explorer.
- [dotstatsuite-data-explorer#485](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/485) Legend of a chart is not correctly updated when changing the chart type.
- [dotstatsuite-data-explorer#442](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/442) Decimals and thousand separators format are incorrect after changing the language of the UI.
- [dotstatsuite-data-explorer#436](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/436) Error of interpretaiton in the data explorer between "timeDimensions" and "concepts".
- [dotstatsuite-data-explorer#392](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/392) Side layout with unexpected scroll in the "Used filters" area.

---

### March 5, 2021
**[Release .Stat Suite .NET 6.0.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/34)**
> This **major** release includes a new version of the **core-transfer**, **core-sdmxri-nsi-ws**, **core-auth-management**, and **core-data-access** services.  
**nsiws compatibility:** tested and released in compatibility with the Eurostat **nsiws.net v8.1.2**.

**Disclaimer on the performance evolutions** in this release. Here below is a summary of comparison of the performance before and after using the SDMX-RI NSI web service default data plugin in .Stat Suite (all performance tests processes, definitions and types are  [documented here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-quality-assurance/-/blob/master/PerformanceTests/README.md)). Although a series of improvements can already be noticed with this release, **it does not yet meet the expected performance improvements** for high-load situations (many parallel data queries). Additionally required improvements (related mainly to the default nsi-ws-plugin) are being addressed with [dotstatsuite-core-sdmxri-nsi-ws#111](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/111).  

- ***Comparison of the performance before and after using the SDMX-RI NSI web service default data plugin***  
  Smoke-test data imports (time increase by 15%)  
  ```
  data_import_time................: avg=16.85s --> avg=19.42s  
  ✓ { datasetSize:extraSmall }....: avg=2.36s --> avg=2.6s  
  ✓ { datasetSize:small }.........: avg=31.34s --> avg=36.24
  ```
  Smoke-test data extractions (time decrease by 20%)  
  ```
  http_req_duration...............: avg=227.65ms --> avg=182.51ms
  ```
  Load-test data extractions (**time increase by 605%**)  
  ```
  http_req_duration...............: avg=1.33s --> avg=8.05s  
  ✓ { datasetSize:extraSmall }....: avg=1.6s --> avg=7.07s  
  ✓ { datasetSize:small }.........: avg=1.39s --> avg=8.85s
  ```
  Stress-test data extractions (**time increase by 29%**)  
  ```
  http_req_duration................: avg=1.89s --> avg=2.43s  
  ✓ { datasetSize:extraSmall }.....: avg=2.27s --> avg=2.3s  
  ✓ { datasetSize:small }..........: avg=1.99s --> avg=2.63s
  ```
  Spike-test data extractions (time decrease by 3%)  
  ```
  http_req_duration................: avg=3.8s --> avg=3.68s  
  ✗ { datasetSize:extraSmall }.....: avg=4.25s --> avg=4.11s  
  ✗ { datasetSize:small }..........: avg=3.88s --> avg=3.76s 
  ```
  Soak-test data extractions (**time increase by 97%**)  
  ```
  http_req_duration..........: avg=670.42ms --> avg=1.32s
  ```

major *(backward-incompatible)* changes:

- [dotstatsuite-core-sdmxri-nsi-plugin#37](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/-/issues/37) **Always protect non-public data**. Whether openid-connect authentication is turned ON or OFF in the NSI web-service configuration, anonymous users ALWAYS only get data that is especially made public (through appropriate permissions).  
  This represents a major change from previous releases, where with NSI openid-connect authentication was turned OFF, all users (necessarily unauthenticated) could get all data.
  **Now**, Docker image with authorization is **enabled (turned ON) by default**.  
- **Known limitation**: the current DLM feature for viewing artefact content (in xml format) in a new web-browser tab by clicking on the (hyperlinked) name of an artefact does not work anymore with the new nsi-ws authentication in place, unless a generic *CanReadStructures* permission is granted to all users incl. anonymous users. ([Updated documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/manage-user-access/))
- [dotstatsuite-core-transfer#124](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/124) Allow for **non-numeric and coded measures** (observation values) in .Stat CORE. Now, according to the SDMX standard, **`String` is the default SDMX data TextType format** when it is not specified in the data structure definition (previsouly, `Float` was the default TextType format). ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/core-data-model/#data-type-definitions))

minor changes:

- [dotstatsuite-core-data-access#16](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/16) **Data model review** of the current codelist-based approach of **time dimension**. All standard time period formats can now be used, e.g. daily or weekly time periods, without maintaining an internal time period code table.
- [dotstatsuite-core-sdmxri-nsi-ws#84](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/84) Support for DSD without Time dimension.
- [dotstatsuite-core-transfer#159](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/159) Allow for attributes at group-level that includes the time dimension (part 1). *First partial implementation of this feature, which will be completed once [dotstatsuite-core-transfer#189](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/189) is released.*
- [dotstatsuite-core-transfer#167](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/167) *(DevOps)* Validate the data database version used by the transfer-service.

patch changes:

- [dotstatsuite-core-data-access#50](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/50) *(Refactoring)* Storage of non-observation attributes at series and observation levels. This improves performance.
- [dotstatsuite-core-data-access#57](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/57) *(Refactoring)* Modify the `IObservation` producers to allow SQL bulk insert in a single process. This improves performance.
- [dotstatsuite-core-data-access#51](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/51) *(Refactoring)* Performance improvement: Remove ROW_ID from DSDs with less than 34 dimensions. This improves performance for data structures with many dimensions.
- [dotstatsuite-core-data-access#67](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/67) Manage `ExecutionTimeout` with DbUp.
- [dotstatsuite-core-data-access#69](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/69) *(DevOps)* Run dbup upgrade in a single user mode. 
- [dotstatsuite-core-auth-management#25](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/-/issues/25) Authorisation management : permissions `ID=0` and `ID=1` not working as expected. ([Updated documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/manage-user-access/#basic-permissions))
- [dotstatsuite-core-sdmxri-nsi-ws#90](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/90) SdmxSource csv & xml generic readers do not support dataflows without Time dimension.
- [dotstatsuite-core-transfer#168](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/168) Issues with data upload and data retrieval when `CoreRepresentation` and `LocalRepresentation` use different versions of the same codelist.
- [dotstatsuite-core-transfer#136](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/136) Incorrect error when uploading data with attributes (while data is fully ok and also importing same data in slices is ok).
- [dotstatsuite-core-transfer#60](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/60) Improve error messages for mistakes in the csv layout.
- [dotstatsuite-core-sdmxri-nsi-ws#96](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/96) Issue with ESTAT:DEMOGRAPHY(2.3).
- [dotstatsuite-core-data-access#68](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/68) Fix datetime format issue in `UpdateMappingSet`.
- [dotstatsuite-quality-assurance#1](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-quality-assurance/-/issues/1) *(DevOps)* Migrate performance tests out of the dotstatsuite-core-sdmxri-nsi-plugin repository.
- [dotstatsuite-data-lifecycle-manager#156](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/156) *(Support)* Attribute attached to time dimension : Dimension not found in management db.

---

### January 25, 2021
**[Release .Stat Suite .NET 5.0.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/27)**
> This **major** release includes a new version of the **core-transfer**, **core-sdmxri-nsi-ws**, **core-auth-management**, and **core-data-access** services.  
**nsiws compatibility:** tested and released in compatibility with the Eurostat **nsiws.net v8.1.2**.

> **WARNING:** While this first .Stat Suite Core (.NET) version using the SDMX-RI NSI web service default data plugin approach (according to the [DB model review](https://gitlab.com/groups/sis-cc/.stat-suite/-/epics/15) step 1) includes the related basic features such as PIT features, authorisations and new REST features, it does not contain yet the necessary [performance enhancements](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/50) foreseen in step 2. This does not represent an issue for data structure definitions that have only a few dimensions and attributes, but those with more dimensions and attributes are now too slow for production mode. These performance enhancements of step 2 are expected to be released very soon. We therefore **recommend to not use this release in production mode** but to wait for the next .Stat Suite Core (.NET) release, especially if you manage dataflows with many dimensions and attributes.

> **DISCLAIMER:** Starting with this release, the SDMX-RI NSI web service within the .Stat Suite will use the default NSI data plugin instead of the previous .Stat Suite-specific data plugin. This requires the usage of a SDMX-RI MappingSet object (stored in the MappingStore structure database) for each of the dataflows. Except for MappingSets that are manually entered by the user through the SDMX-RI MappingAssistant, **all MappingSets must be generated specifically in the context of the .Stat Suite**. This is to be done through the following methods:
>
> - **Before** you generate the MappingSets (see next bullet), if during the migration/upgrade to version 5.0.0 with the DBUP tool some DSDs/Dataflows migrations fail (check the logs using the transfer service `/status/requests` method), then you should **migrate these dataflows manually** using the Transfer service method `/init/dataflow`. Note that his should happen only extremely rarely, and would be caused by previous inconsistencies in the DB state. In case the manual dataflow migration is still unsuccessful then it is recommended to delete the underlying DSD, cleanup the related DB objects (using the Transfer service method `/cleanup/dsd`), recreate the data structures and reload the related data. 
> - **Generate the MappingSets for all already existing dataflows when the .Stat Suite .NET version is migrated to 5.0.0 using the .Stat Suite Transfer service method `/init/allMappingsets`**. This method must be called manually as the very last step of the deployment of the new version (after all components are deployed/updated, and after the DBUP tool has run to update the databases). ([Documentation](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer#post-12versioninitallmappingsets-this-function-creates-mappingsets-of-all-dataflows-found-in-the-mappingstore-db))
> - **Generate the MappingSet for any newly added dataflow using the .Stat Suite Transfer service method `init/dataflow`**. This can be done using the Transfer service Swagger UI. ([Documentation](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer#post-12initdataflow-initializes-database-objects-of-a-dataflow-in-datastore-database))
> - **Generate the MappingSet for any newly added dataflow by uploading any data** (in DLM or with the .Stat Suite Transfer service). In other words, the MappingSet of a newly added dataflow will be automatically generated once you upload data for this dataflow.

> **Important NOTE:** From this release on, any new/additional attribution of an admin permission (AdminRole) to the authorization service must use the new **permission id:4095** (see major change below).

major *(backward-incompatibility)* changes:

- [dotstatsuite-core-sdmxri-nsi-plugin#48](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/-/issues/48) **Remove the custom .Stat Suite nsi-plugin** (Replace NSI-Plugin).
- [dotstatsuite-core-auth-management#20](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/-/issues/20) **AdminRole permission id** is changed from '2047' to '4095' in auth DB.
- The [nsiws.net v8.1.2](https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored/-/blob/master/CHANGELOG.md#nsiwsnet-v812-2021-01-08-msdb-v612-authdb-v10) included a bug correction SDMXRI-1443 *Support of observation values with string data type at SDMX-JSON data writers* with a major impact in .Stat Suite. Whenever observation values are of **`String`** type, then the SDMX-JSON messages generated in SDMX-RI NSI extractions use the (correct) `String` type. It also means that string data types are now correctly exposed as string types in the SDMX-RI NSI extractions, and the DE also shows strings as strings without altering concepts such as thousand or decimal separators.

minor changes:

- [dotstatsuite-core-sdmxri-nsi-ws#103](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/103) Deploy NSI version 8.1.2.
- [dotstatsuite-core-sdmxri-nsi-ws#91](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/91) Deploy NSI version 8.1.1.
- [dotstatsuite-core-sdmxri-nsi-ws#92](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/92) Support of **allowed content constraints** in the NSI WS. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/restful/#data-queries))
- [dotstatsuite-core-transfer#173](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/173) Allow listing logs of `init-type` transactions via the Swagger UI of the transfer service.
- [dotstatsuite-core-sdmxri-nsi-ws#54](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/54) Implement the **PIT feature in the nsiws** *(Replace NSI-Plugin)*. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/embargo-management/))
- [dotstatsuite-core-transfer#120](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/120) Feature to consult the status of the data imports/transactions.
- [dotstatsuite-core-data-access#21](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/21) Add **"lastNObservations"** and **"firstNObservations"** query parameters. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/typical-use-cases/#retrieve-the-data-corresponding-to-the-current-de-filters-from-the-sdmx-api))
- [dotstatsuite-core-sdmxri-nsi-ws#69](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/69) Allow referencing **non-final codelists in a non-final hierarchical codelist**.
- [dotstatsuite-core-sdmxri-nsi-ws#8](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/8) Implement observer interface for structure updates.
- [dotstatsuite-core-transfer#154](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/154) For transfers, check existence of target dataflow and necessary permissions before responding with transaction ID.
- [dotstatsuite-core-transfer#152](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/152) Ability to transfer data **from Live to PIT** data version.
- [dotstatsuite-kube-core-rp#12](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-kube-core-rp/-/issues/12) *(DevOps)* Automate **performance tests** for Transfer data uploads and for NSI data retrievals.
- [dotstatsuite-core-data-access#48](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/48) *(Refactoring)* Automatically create the database views for DSDs and dataflows *(Replace NSI-Plugin)*.
- [dotstatsuite-core-data-access#49](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/49) *(Refactoring)* Automatically create mapping sets in the mapping store database *(Replace NSI-Plugin)*.
- [dotstatsuite-core-common#108](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/-/issues/108) *(Refactoring)* Use **ESTAT PermissionType** (includes one new permission type `id:2048 CanReadPitData` : Can read Point-in-Time (PiT) Data). ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/manage-user-access/#list-of-available-permissions))
- [dotstatsuite-core-transfer#161](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/161) *(Refactoring)* Fix the data views for Non-mandatory attributes at DSD level.
- [dotstatsuite-core-auth-management#23](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/-/issues/23) *(Refactoring)* Authorization Management & Transfer : update ESTAT NuGet references to nsiws v8.1.1.
- [dotstatsuite-core-auth-management#17](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/-/issues/17) *(Refactoring)* Authorization Management : update ESTAT NuGet references to v8.1.
- [keycloak#7](https://gitlab.com/sis-cc/.stat-suite/keycloak/-/issues/7) *(Refactoring)* Disable implicit code flow for Keycloak in the transfer service.
- [dotstatsuite-core-transfer#149](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/149) *(Support)* Upload issue of uncoded dataset attributes using the EDD mechanism.
- [dotstatsuite-core-sdmxri-nsi-ws#67](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/67) *(Support)* Possibility to delete a code from a non-final codelist.
- [dotstatsuite-core-sdmxri-nsi-ws#68](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/68) *(Support)* Issues related to the management of Metadata Structure Definition.
- [dotstatsuite-core-data-access#58](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/58) *(Support)* Incorrect Content-Range response header in the ESTAT nsiws.
- [dotstatsuite-core-transfer#142](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/142) *(Support)* Update Transfer-service references to NSI version 7.13.0 (incl. 7.12.2).

patches:

- [dotstatsuite-core-data-access#65](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/65) Add dbup functionality to clear orphan records in Artefact table.
- [dotstatsuite-core-data-access#66](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/66) Fix of bug in `SqlManagementRepository.CleanUpDsd` deleting extra data tables.
- [dotstatsuite-core-sdmxri-nsi-ws#17](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/17) Deletion of several artefacts at once fails.
- [dotstatsuite-core-sdmxri-nsi-ws#75](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/75) Annotation update issue & wrong HTTP status code for structure requests.
- [dotstatsuite-core-common#110](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/-/issues/110) Validation of the allowed content constraint for coded-attributes in upload requests.
- [dotstatsuite-core-sdmxri-nsi-ws#88](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/88) Fix bug with select statements having **reserved SQL words**.
- [dotstatsuite-core-sdmxri-nsi-ws#63](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/63) Data query returns "Error executing generated SQL and populating SDMX model".
- [dotstatsuite-core-sdmxri-nsi-ws#62](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/62) **Foreign Key constraint violation** exception when creating SDMX artefacts.
- [dotstatsuite-core-sdmxri-nsi-ws#82](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/82) Mappingsets with "valid to" as max datetime fails in the context of the Point in Time release feature.
- [dotstatsuite-core-transfer#165](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/165) Transfer fix/allDataflows fails with a Timed-Out error.
- [dotstatsuite-core-transfer#163](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/163) Re-creation of dataflow view fails for dataflows with no dataset-level attributes.
- [dotstatsuite-core-sdmxri-nsi-ws#48](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/48) **Querying actual constraint or allowed constraint by version** fails.
- [dotstatsuite-core-data-access#63](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/63) Fix issues with Mappingsets initialisation in transfer service.
- [dotstatsuite-core-data-access#59](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/59) Automatically created mapping sets do not work for dataflows with **full ID longer than 30 characters**.
- [dotstatsuite-core-transfer#166](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/166) "Error while trying to create the MappingSet" error in the data transfer e-mail (when data upload is successful).
- [dotstatsuite-core-data-access#12](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/12) Authenticated / role based restrictions in default NSI plugin for both Live and Point-in-time data.
- [dotstatsuite-core-transfer#157](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/157) Mappingsets of Point in Time data fails when no release time is provided.
- [dotstatsuite-core-transfer#133](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/133) Failure in data upload for some dataflows due to auto-generated categories (with same ID but different level).
- [dotstatsuite-core-sdmxri-nsi-ws#70](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/70) When StartPeriod is 'March' in monthly data query, data for January and February are also returned.
- [dotstatsuite-core-auth-management#20](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/-/issues/20) Update **Admin permission id** from '2047' to '4095' in auth DB.
- [dotstatsuite-core-transfer#61](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/61) Some **CSV load behaviours** are incorrect and do not respect the SDMX-CSV standard.
- [dotstatsuite-core-transfer#113](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/113) **Free-text attributes with special caracters** (?) cut during the SDMX-CSV data upload.
- [dotstatsuite-core-transfer#148](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/148) Missing rights for dostatwriter db user to create views.
- [dotstatsuite-core-transfer#105](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/105) SDMX-CSV upload from **remote URL** is not working.
- [dotstatsuite-core-transfer#140](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/140) Loading XML data file returns a misleading successful e-mail with 0 observation processed (instead of numerous observations values).
- [dotstatsuite-core-transfer#99](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/99) Observation values disappear when uploading SDMX-ML data with `dimensionAtObservation=AllDimensions` format.

---

### January 21, 2021
**[Release .Stat Suite JS 7.0.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/33)**
> This **major** release includes a new version of the **data-lifecycle-manager**, **data-explorer**, **data-viewer**, **sdmx-faceted-search**, and **share** services.  
*Tip:* we also recommend that you upgrade your **config** and **proxy** services, even though no changes were made for those services directly resutling in modifications to the .Stat Suite product.  
**nsiws compatibility:** tested and released in compatibility with the Eurostat **nsiws.net v8.1.2**.

major *(**backward-incompatibility**)* changes:
- [dotstatsuite-data-explorer#472](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/472) DE **search result download is now optional** (New entry in Javascript settings `search.downloadableDataflowResults`). Since this option is not compatible with the indexation of externally defined/stored dataflows (see related [specifications](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/indexing-data/#indexing-externally-defined-dataflows)), thus **this feature is disabled by default**. When upgrading to this release, you must set this new configuration to `true` if you want to keep the download option on the search result page. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#enabled-download-option-on-the-search-result-page))
- [dotstatsuite-share#24](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/-/issues/24) New dedicated *redis* **databases for share and sfs** services ([Documentation](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose/-/tree/master/#redis-db-configuration)). Share and sfs are using a redis service to store objects (`REDIS_HOST`, `REDIS_PORT`). **Until now**, share and sfs were using the same database by default, which is an issue when sfs flushes its data. **From now on**, share and sfs will have their **dedicated databases (`REDIS_DB`)**:
  *  share will use the existing database by default (0) to keep existing data
  * sfs will use a new database by default (1) and a re-index will restore previous data  
Notes:
  * `REDIS_HOST`, `REDIS_PORT` and `REDIS_DB` are environment variables than can be overridden
  * `REDIS_DB` is an integer (up to 15 without creating new databases in redis)
  * by default means that **without changing anything**, restarting sfs and share will apply the update
- [dotstatsuite-data-explorer#456](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/456) & [dotstatsuite-share#12](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/-/issues/12) **Translations keys** have changed and been updated (here below with default English examples):
  * 1 key was deleted `"vx.no.data.available": "There is no data available."` and replaced by 3 new keys: `"log.error.sdmx.404": "There is no data available."`, `"log.error.sdmx.40x": "You are not permitted to see this data. Please try again after logging in with another account."`, and `"log.error.sdmx.xxx": "Whoops, something went wrong on our side. We are working to solve this. Please try again later."`
  * 2 keys were deleted `"de.app.viewer.owner": "SIS-CC"`, `"de.app.viewer.term.label": "Terms & Conditions"` and replaced by 3 new keys: `"de.viewer.copyright.label": "©"`, `"de.viewer.copyright.content.label": "SIS-CC {link}"`, and `"de.viewer.copyright.content.link.label": "Terms & Conditions"`
  * 2 new keys were added for the data-viewer in order to better handle error notifications: `"data.not.found": "Oops, the view you are looking for doesn't exist. Make sure to use a correct and complete link."`, `"data.pending": "Oops, this view isn't accessible yet. Make sure to validate the related email address first."`

significant & minor changes:

- [dotstatsuite-data-explorer#456](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/456) Update of settings: table/chart **footer logo *(asset)* is localisable**. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-customisation/#table-and-chart-footer-logo))
- [dotstatsuite-data-lifecycle-manager#180](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/180) DLM new feature for a **tree visualisation of related artefacts**. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/list-related-data-structures/))
- [dotstatsuite-data-lifecycle-manager#163](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/163) Display a proper error message when a user does not have the rights to upload data to a dataflow.
- [dotstatsuite-data-explorer#454](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/454) Define, by configuration, one **homepage facet to be expanded by default**. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#auto-expanded-homepage-facet))
- [dotstatsuite-data-explorer#131](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/131) DE **filters with advanced selection features on scopelists** (visualisation page only). ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/#multi-selection-filters))
- [dotstatsuite-data-explorer#462](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/462) DE **filters with keyboard selection options** on scopelists (visualisation page only). ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/#keyboard-selection-options))
- [dotstatsuite-data-explorer#463](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/463) Bulk selections (level 1, level 2, etc.) shown in the 'Used filters' area.
- [dotstatsuite-data-explorer#285](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/285) Implement the new design of the scopelist component.
- [dotstatsuite-data-explorer#76](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/76) Ease usage and understanding of search filters through hiding impact-less filter options. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/facets/#facets-on-the-search-result-page))
- [dotstatsuite-data-explorer#458](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/458) The 'used filters' component shows path(s) in a tooltip.
- [dotstatsuite-data-explorer#256](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/256) Display better error messages on DE visualisation page when the nsi-ws requests fail. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/error-messages/))
- [dotstatsuite-share#12](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/-/issues/12) Share service to return clear error messages.
- [dotstatsuite-data-explorer#453](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/453) Enhance DE labels (including slogan).
- [dotstatsuite-core-data-access#60](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/60) *(DevOps)* Limit the amount of RAM used by the MSSQL. (Updated documentation on Infrastructure recommendations [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/getting-started/infrastructure-requirements/#stat-core-data-store))
- [dotstatsuite-config#21](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/issues/21) *(Support)* Repair/Improve API queries tab on the DE, by moving 'Developer API' to the main menu level & displaying (again) the API documentation link.
- [dotstatsuite-data-explorer#456](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/456) *(Refactoring)* Migrate table/chart footer to Visions & apply UI doc/Charte Graphique styles.
- [dotstatsuite-d3-charts#3](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-d3-charts/-/issues/3) *(Refactoring)* Errors in map rendering.
- [dotstatsuite-data-lifecycle-manager#175](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/175) *(Refactoring)* Breaking change in nsiws.net v8.1.1 in ErrorMessage format.

patches:

- [dotstatsuite-data-explorer#476](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/476) GoogleAnalytics fails to return PNG download & shared objects' name.
- [dotstatsuite-data-explorer#472](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/472) Gix GoogleAnalytics troubleshoot and misc.
- [dotstatsuite-data-explorer#468](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/468) Decimals in table views are not applied.
- [dotstatsuite-data-explorer#464](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/464) Default `TimePeriod` and `DEFAULT` annotations for `LastNObs` are not applied.
- [dotstatsuite-share#24](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/-/issues/24) Shared objects become invalid after a release update.
- [dotstatsuite-data-explorer#471](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/471) Constraints from the search result make the visualisation page empty.
- [dotstatsuite-data-lifecycle-manager#181](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/181) Categories are not always applied on DLM artefact request.
- [dotstatsuite-data-lifecycle-manager#164](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/164) Translated French labels are not (always) displayed in DLM and in DE when switching locale to French.
- [dotstatsuite-data-explorer#477](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/477) fix `JS` rendering error.
- [dotstatsuite-visions#23](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions/-/issues/23) Tooltip in the data-header freezes the web-browser for shared views.

---

### December 2, 2020
**[Patch Release .Stat Suite JS 6.1.1](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/32)**
> This **patch release** includes a new minor version of the **data-explorer** service.

patches:

- [dotstatsuite-data-explorer#457](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/457) Fix choropleth map translations.

---

### November 30, 2020
**[Release .Stat Suite JS 6.1.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/32)**
> This release includes a new version of the **data-explorer**, **data-viewer**, **data-lifecycle-manager**, **sdmx-faceted-search**, and **share** (patch version 6.1.1) services.  
nsiws compatibility: tested and released in compatibility with the Eurostat **nsiws.net v7.13.2**.

significant (non-major) and minor changes:

- [dotstatsuite-data-explorer#320](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/320) Make **DE authentication optional**. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/authentication/#optional-authentication-of-de))
- [dotstatsuite-share#4](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/-/issues/4) **Cleanup** feature for outdated **share db objects**. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/toolbar/#cleanup-feature-for-outdated-shared-objects))
- [dotstatsuite-sdmx-faceted-search#38](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/issues/38) **Hub feature** allowing to index externally defined dataflows. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/indexing-data/#indexing-externally-defined-dataflows))
- [dotstatsuite-data-explorer#96](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/96) **Hub feature** allowing to visualize and download externally defined dataflows. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/#externally-defined-dataflows))
- [dotstatsuite-data-explorer#433](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/433) **Shortening the DE browser URL.** ([Updated documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/general-layout/#url-parameters))
- [dotstatsuite-data-lifecycle-manager#170](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/170) *(Refactoring)* Migrate i18n localised elements of the DLM to the tenantless level (same as DE). ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/localisation/#technical-architecture))
- [dotstatsuite-sdmx-faceted-search#84](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/issues/84) SDMX Faceted Search supports **API Keys**. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/sfs-api-keys/))
- [dotstatsuite-data-explorer#400](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/400) Enhance the default chart's width field and ease chart size/axis editing options.
- [dotstatsuite-data-explorer#434](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/434) Quarterly end time periods should always be included in pre-selections.
- [dotstatsuite-data-explorer#319](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/319) Add `BOM` to support the Excel display of accentuated characters in the CSV exports.
- [dotstatsuite-data-explorer#432](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/432) Remaining chart enhancements based on the original [business rules and Charte Graphique](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/charts/chart-generation-business-rules/).
- [dotstatsuite-data-explorer#314](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/314) Enhance DE header options for accessibility, localisation and login.
- [dotstatsuite-data-viewer#9](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/-/issues/9) Chart responsiveness for small chart sizes where chart title should be replaced by the (i) icon.
- [dotstatsuite-data-lifecycle-manager#166](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/166) DLM filters reordering and increase of width.
- [dotstatsuite-data-explorer#404](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/404) Style enhancements of the data table's row height when including footnotes/flags.
- [dotstatsuite-visions#20](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions/-/issues/20) Correct the default styles for dataflow title and subtitle.
- [dotstatsuite-data-explorer#446](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/446) *(Refactoring)* Remove unused translations.
- [dotstatsuite-sdmx-faceted-search#87](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/issues/87) *(Support)* Remove default ILO's excludedCategorySchemeFacets.
- [dotstatsuite-data-explorer#419](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/419) *(Support)* Change to footer text 'Built by SIS-CC using .Stat Suite'.
- [dotstatsuite-config#19](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/issues/19) *(Support)* Complement topic icons and facet configs.

patches:

- [dotstatsuite-data-explorer#439](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/439) GoogleAnalytics rejects the @ character from the dataflow names or ID. ([Updated documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-analytics/#google-analytics-default-events))
- [dotstatsuite-data-explorer#241](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/241) Data Explorer does not open in Microsoft Edge.
- [dotstatsuite-data-explorer#393](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/393) WCAG AA contrast level is incorrect at column header placeholder for footnotes.
- [dotstatsuite-data-explorer#408](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/408) When downloading csv using the 'Unfiltered data in tabular format' option, the `Labels=Identifier` selection is not taken into account.
- [dotstatsuite-data-lifecycle-manager#159](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/159) Data transfer is indicated in DLM as 'successful' when it is not necessarily the case.
- [dotstatsuite-data-explorer#418](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/418) Email share content misses the DE logo.
- [dotstatsuite-data-explorer#437](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/437) 'Pinned' filters are not always correctly ordered.
- [dotstatsuite-data-explorer#441](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/441) DE full csv download fails (generating wrong content).
- [dotstatsuite-data-explorer#443](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/443) Broken frequency pre-selection in default views when the frequency is not Annual.
- [dotstatsuite-data-explorer#445](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/445) Encodage Search issue returns the wrong highlighted information from a free text search. 
- [dotstatsuite-data-explorer#447](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/447) The URL of a data visualisation page is wrongly generated when triggered as new tab from the search result.
- [dotstatsuite-data-explorer#450](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/450) Period invalid dates and empty dates in some use cases with content constraints.
- [dotstatsuite-share#21](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/-/issues/21) 'Share latest data' view is generated with broken names (header and footer).
- [dotstatsuite-data-lifecycle-manager#174](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/174) Data availability option is wrongly set to false when opening a data preview from the DLM.
- [dotstatsuite-data-explorer#455](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/455) Filter 'data availability' occasionally appears in DE.

deprecations:

- [dotstatsuite-config#17](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/issues/17) Make remaining UI labels translatable by deprecating 2 tenants' configurations. (Updated documentation [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-customisation/#site-logo) and [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-customisation/#table-and-chart-footer-terms-and-conditions))

---

### November 24, 2020
**[Patch Release .Stat Suite .NET 4.4.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/31)**
> This **patch release** includes a new version of the **core-sdmxri-nsi-ws** service. This version resolves a change of default properties in the configuration of the nsiws. This applies ONLY to our custom nsiws plugin (on top of the nsiws.net v7.13.2), and this should be obsolete/by-design in the next versions of both nsiws.net (v8.x) and generic nsi plugin.  
Find more about the nsiws.net configurations [here](https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored/-/blob/master/doc/CONFIGURATION.md).

patches:

- [dotstatsuite-core-sdmxri-nsi-ws#72](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/72) Set the nsiws configurations `createStubCategory` to "false" and `StructureUsage` to "dataflow".
- [dotstatsuite-core-sdmxri-nsi-ws#73](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/73) `structureUsage.structureType`nsiws config. is not applied.

---

### October 26, 2020
**[Release .Stat Suite JS 6.0.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/30)**
> This release includes a new major version of the **data-explorer**, **data-viewer**, **data-lifecycle-manager**, and **sdmx-faceted-search** services.  
nsiws compatibility: tested and released in compatibility with the Eurostat nsiws.net v7.13.2

major *(**backward-incompatibility**)* changes:

- [dotstatsuite-sdmx-faceted-search#83](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/issues/83) Indexing of dataflows in sub-categories misses adding the sub-category to the categoryscheme facet.  
**NB:** This results from the introduction in the SDMX-JSON format of a change on the `link-type` property (replaced by a `mime-type`) that was not parsed by the data-explorer as expected in the previous [JS5.4.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#october-7-2020) release, causing the disappearance of the indexed categories (loss of the categories in the DE homepage 'browse by').

minor changes:

- [dotstatsuite-data-explorer#288](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/288) Visualisation **url to include table layout** customisation. ([Updated documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/))
- [dotstatsuite-data-explorer#226](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/226) **New design** of the DE chart customisations.
- [dotstatsuite-data-explorer#386](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/386) **Chart customisations** allowing authenticated users to change the header and footer. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/charts/customise-feature/#additional-option-for-authenticated-users))
- [dotstatsuite-chart-generator-legacy#8](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-chart-generator-legacy/-/issues/8) Timeline charts: enhance axis label step configuration. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/charts/customise-feature/#timeline-chart-option-for-steps-on-horizontal-axis))
- [dotstatsuite-chart-generator-legacy#6](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-chart-generator-legacy/-/issues/6) Improve automated and manual chart time axis scale management.
- [dotstatsuite-data-lifecycle-manager#146](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/146) Remove dataflow selection in the DLM SDMX data upload feature.
- [dotstatsuite-data-explorer#435](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/435) Add **German locale** to .Stat DE.
- [dotstatsuite-config#18](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/issues/18) *(Support)* Cleanup obsolete DE i18n overwrites.
- [dotstatsuite-data-explorer#218](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/218) *(Support)* Create aliases for staging environments.
- [dotstatsuite-data-explorer#396](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/396) *(Support)* Request for BFS tenanted deploy of DE.
- [dotstatsuite-data-explorer#423](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/423) *(Support)* Reindex STATEC tenant of DE.
- [dotstatsuite-data-lifecycle-manager#165](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/165) *(Support)* DLM (in QA) fails to return information about data from (some) external sources.

patches:

- [dotstatsuite-data-explorer#421](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/421) Units of Measure: header regression. ([Updated documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/unit-of-measure/))
- [dotstatsuite-data-explorer#409](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/409) Attributes returned as DE flags are displayed in upper case when the actual ID is in lower case.
- [dotstatsuite-data-lifecycle-manager#157](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/157) Text attributes truncated to the first colon character.
- [dotstatsuite-chart-generator-legacy#5](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-chart-generator-legacy/-/issues/5) Repair and improve automated and manual chart axis scale management for time and numeric scales.

---

### October 7, 2020
**DISCLAIMER for [Release .Stat Suite .NET 4.3.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/28)** and **[Release .Stat Suite JS 5.4.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/29)**

> Both releases of the **.NET and JS services** of the .Stat Suite include **backward-incompatible** changes due to an update of the underlying **SDMX-JSON format** to its [first official version within the SDMX standard](https://github.com/sdmx-twg/sdmx-json). This update was included in ESTAT **NSIWS v7.13.1** (deployed along with v7.13.2 here), and implied changes also in the JS services and applications.  
It is therefore **absolutely necessary**, when upgrading your .Stat Suite instances to any future version, to **simultaneously upgrade the .NET and JS services at least to versions .NET 4.3.0 and JS 5.4.0**, in order to prevent misbehaviour or functional issues due to a backward-incompatibility of either of these services.  
> If your deployment topology does not include the .Stat Suite CORE (.NET) services (e.g. when only deploying the Data Explorer and its underlying services), you need either to align your NSIWS version to v7.13.1 minimum (v7.13.2 at best), or use an SDMX web service that is compatible with the [official SDMX-JSON release version](https://github.com/sdmx-twg/sdmx-json).

> **.Stat DLM Excel-Addin:**
> The .NET v4.3.0 release also contains a new version of the .Stat DLM Excel-addin, namely **v3.0.0.5**, including the various changes and patches mentionned in the list below.  
> *Reminder:* The .Stat DLM Excel-addin is an Excel-based application (using the ClickOnce deployment technology) to be installed individually on each client machine. Therefore there is no Docker image produced for this component, and you need to retrieve it directly from its [GitLab master branch](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-excel-addin).

> **Known limitations and/or deprecating behaviors:**
> * Inconsistent rendering of DE table views with **Unit of Measure** information. Some cases described in the [functional specifications](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/unit-of-measure/) may not always behave yet as expected. Note that the Unit of Measure feature behaviour can be temporarily 'switched off' through the [DE configuration settings](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#unit-of-measure-support) (by emtpying the `UNIT_MEASURE_CONCEPTS` annotation).
> * The table/chart views generated from the DE **Share "Latest available data for the period defined"** option are not always consistent with the original views in the DE browser (e.g. especially in use cases compiling Unit of Measure information).

**[Release .Stat Suite .NET 4.3.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/28)**  
> This release includes a new version of the **core-sdmxri-nsi-plugin** and **dlm-excel-addin** services.  

*significant* (non-major) changes:

- [dotstatsuite-core-sdmxri-nsi-ws#66](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/66) Deploy **NSIWS v7.13.2**, including **v7.13.1**. Non backwards compatible changes/breaking changes have been introduced in the **SDMX-JSON message output** following the nsiws v7.13.1 release. Details can be found [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/-/blob/7.13.2/CHANGELOG_NSIWS.md#nsiwsnet-v7131-2020-07-23-msdb-v610-authdb-v10).

minor changes:

- [dotstatsuite-core-sdmxri-nsi-ws#33](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/33) *(Refactoring)* Remove logs per observation in the SDMX-JSON data export.
- [dotstatsuite-core-sdmxri-nsi-ws#38](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/38) Zip file download, allowing obtaining extractions compressed as zip file format attachment.
- [dotstatsuite-docker-compose#4](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose/-/issues/4) Review of the [Docker Compose installation documentation](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose/-/blob/master/README.md).
- [dotstatsuite-excel-addin#13](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-excel-addin/-/issues/13) *(Refactoring)* Update keycloak server url in DLM Excel-addin.

patches:

- [dotstatsuite-core-sdmxri-nsi-ws#46](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/46) Correct the **SDMX-JSON message format**.
- [dotstatsuite-core-sdmxri-nsi-ws#59](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/59) Error *"Only maintainable are supported by this implementation"* when submitting data structures.
- [dotstatsuite-data-lifecycle-manager#142](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/142) Hierarchical codelist successfully uploaded does not show in the .Stat DLM list.
- [dotstatsuite-excel-addin#12](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-excel-addin/-/issues/12) Correct DLM Excel-addin menu label and help menu with link to documentation.
- [dotstatsuite-excel-addin#15](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-excel-addin/-/issues/15) Error messages/inappropriate info in DLM Excel-addin.
- [dotstatsuite-excel-addin#10](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-excel-addin/-/issues/10) Allowed content constraints are not applied in the DLM Excel-Addin filters of the selector.


**[Release .Stat Suite JS 5.4.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/29)**  
> This release includes a new version of the **data-explorer**, **data-viewer**, **sdmx-faceted-search** and **data-lifecycle-manager** services.  

*significant* (non-major) changes:

- [dotstatsuite-sdmxjs#4](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmxjs/-/issues/4) JS parsers update according to the **SDMX-JSON format changes** (see related .NET issue [dotstatsuite-core-sdmxri-nsi-ws#46](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/46)).

minor changes:

- [dotstatsuite-config#8](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/issues/8) and [dotstatsuite-data-explorer#342](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/342) Ease **management of localisations**. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/localisation))
- [dotstatsuite-data-explorer#354](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/354) Configure visibility of DE Share option, allowing to **hide the 'Share' feature** from the end-user. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#disabled-share-option))
- [dotstatsuite-data-explorer#308](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/308) Complement the **Unit-of-Measure** (UoM) feature with **additional use cases** (with still knwon limitations, see the disclaimer above). ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/unit-of-measure/))
- [dotstatsuite-data-lifecycle-manager#47](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/47) **Export all** structures and data from a DLM dataspace in **dump mode**.
- [dotstatsuite-chart-generator-legacy#7](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-chart-generator-legacy/-/issues/7) Show bar/row/stacked-bar labels not only for huge charts.
- [dotstatsuite-data-lifecycle-manager#133](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/133) Subsequently run transfer cleanup method when deleting a dsd in the DLM.
- [dotstatsuite-data-explorer#297](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/297) Complement i18n DE for Dutch, Arabic, and Khmer languages.
- [dotstatsuite-data-lifecycle-manager#150](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/150) *(Refactofing)* DLM should not send token to external datasources.
- [dotstatsuite-data-explorer#394](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/394) *(Refactoring)* Migrate react-intl to latest.

patches:

- [dotstatsuite-data-explorer#406](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/406) Issues found following the recent 'SDMX-JSON format changes'.
- [dotstatsuite-share#19](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/-/issues/19) Shared 'Latest Data' table misses subtitle footnotes and the 'Unit of Measure' information is incorrectly displayed.
- [dotstatsuite-data-explorer#397](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/397) Header information not correctly displayed in DE Excel exports.
- [dotstatsuite-data-explorer#413](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/413) Fix the 'used filters' behavior in the search result page.
- [dotstatsuite-data-lifecycle-manager#153](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/153) Information about dataflow categorisation(s) is sometimes incorrect in DLM.

---

### September 2, 2020
**[Release .Stat Suite .NET 4.2.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/25)**
> This release includes a new minor version of the **core-sdmxri-nsi-plugin** service and a major [3.0.0.4 version](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-excel-addin/-/blob/master/CHANGELOG.md) of the **dlm-excel-addin**. 

minor changes:

- [dotstatsuite-excel-addin#3](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-excel-addin/-/issues/3) DLM Excel-Addin: save back edited observation and attribute values in a flat or time-series oriented table view. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm-excel-addin/))
- [dotstatsuite-excel-addin#4](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-excel-addin/-/issues/4) Add a compiled executable (.zip) version of the DLM Excel-Addin, with a self-signed certificate for test and demo purposes. ([ready-made file](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-excel-addin/-/tree/master/install))
- [dotstatsuite-excel-addin#6](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-excel-addin/-/issues/6) Add a refresh button to clean-up the cache in the DLM Excel-Addin. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm-excel-addin/#get-data-step-1-select-data))
- [dotstatsuite-excel-addin#7](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-excel-addin/-/issues/7) DLM Excel-Addin icons.

patches:

- [dotstatsuite-core-sdmxri-nsi-ws#65](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/65) NSIWS no longer creates log files in the log folder.
- [dotstatsuite-excel-addin#8](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-excel-addin/-/issues/8) CPU usage too high when auto-refresh formulae is on.

---

**[Release .Stat Suite JS 5.3.1](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/26)**
> This **patch release** includes a new minor version of the **data-explorer** service.

minor changes:

- [dotstatsuite-data-explorer#328](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/328) How to customize the DE layout theme with pre-built packages. ([Updated documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-customisation/#general-theme-settings) and new following [sections](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-customisation/#theme-settings-how-to-override-mixins))
- [dotstatsuite-data-explorer#337](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/337) Missing label for `datasource` filter.

patch:

- [dotstatsuite-data-explorer#388](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/388) Units of measure is displayed 2 times in the DE table view *(issue resulting from the last JS v.5.3.0 release)*.

---

### August 25, 2020
**[Release .Stat Suite JS 5.3.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/24)**
> This new release includes a new minor version of the **data-explorer**, **data-viewer** and  **data-lifecycle-manager** services.

> **Disclaimer**: This new version of the .Stat Suite JavaScript services now uses the **Keycloak access_token** instead of the **id_token**. It is therefore required to change the **Keycloak configuration** accordingly. A good technical procedure is available [here](https://gitlab.com/-/snippets/2000699).

minor changes:

- [dotstatsuite-data-explorer#265](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/265) Enhance the **attribute display** configuration logic. The **footnotes parameter is removed** from the DE configuration. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#coded-and-uncoded-attributes-returned-as-footnotes))
- [dotstatsuite-data-explorer#327](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/327) Make the **second-level home facet** values **selectable**. This new feature is enabled by a new configuration parameter (see the related [configuration documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#selectable-second-level-homepage-facet-values) and the full [functional specifications](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/facets/#) of the homepage facets).
- [dotstatsuite-data-explorer#307](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/307) Adjust the theme and some components to reach the **WCAG AA contrast** compliancy level.
- [dotstatsuite-data-explorer#211](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/211) *(Refactoring)* Refactoring and documentation update necessary for **GoogleAnalytics plugged to .Stat DE**. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-analytics/))
- [dotstatsuite-data-explorer#237](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/237) Empty observation with and without attributes are shown differently.
- [dotstatsuite-data-explorer#278](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/278) Update the UI Design of the pinned facets.
- [dotstatsuite-data-explorer#302](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/302) Remove buttons ripple.
- [dotstatsuite-data-explorer #376](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/376) Additional style corrections.
- [dotstatsuite-data-explorer#383](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/383) Enable Data Explorer focus only in accessible mode.
- [dotstatsuite-visions#18](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions/-/issues/18) *(Refactoring)* .Stat DE **Theme** moving into `mixins` what is not in the `default` theme of material UI. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-customisation/#main-theme-how-to-override-mixins))
- [dotstatsuite-data-explorer#309](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/309) *(Support)* **UI improvements** following the release JS v5.0.0.
- [dotstatsuite-data-explorer#323](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/323) *(Support)* .Stat DE becomes non-responsive when viewing footnotes (in specific cases, after several mouse hovers).
- [dotstatsuite-data-explorer#352](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/352) *(Support)* In the .Stat DE viz page, the green filter selection's count for Time Period should display 0 when no time period is selected.
- [dotstatsuite-visions#19](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions/-/issues/19) *(Support)* Flags hover (quick correction).

patches

- [dotstatsuite-data-explorer#368](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/368) Style issues in the 'External resources' link of the 'Download' menu.
- [dotstatsuite-data-explorer#366](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/366) Wrong legend fonts in chart(s).
- [dotstatsuite-data-explorer#359](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/359) Download chart incompatibility with Firefox and Microsoft EDGE.
- [dotstatsuite-data-explorer#358](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/358) .Stat DE becomes non-responsive when viewing a Vertical Symbol chart.
- [dotstatsuite-data-explorer#252](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/252) The DECIMALS setting is not applied correctly: the 0-padding is missing.

---

### July 23, 2020
**[Release .Stat Suite JS 5.2.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/23)**  
> This new release includes a new version of the **data-explorer** and **data-lifecycle-manager** services.  

> **Disclaimer**: Support and use of the **Proof Key for Code Exchange** (PKCE) in both DE & DLM by ensuring .Stat Suite using Keycloak v7+ (PKCE is supported from Keycloak v.7).  
If Keycloak does not support pkce (below version 6), then everything will work properly (because pkce from .Stat DE and .stat DLM will be ignored).  
When Keycloak is configured to enforce pkce, then non-compliant clients will break.

minor changes:

- [dotstatsuite-data-explorer#116](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/116) **Download charts** in .png image format (allowing for high-quality resolution). ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/toolbar/#download))
- [dotstatsuite-data-explorer#326](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/326) Add a link to the .Stat DE top-left logo. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-customisation/#add-hyperlink-on-header-logo))
- [dotstatsuite-data-lifecycle-manager#48](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/48) View artifacts per category (topic/domain) in .Stat DLM.
- [dotstatsuite-data-lifecycle-manager#141](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/141) *(Refactoring)* DLM refactoring including code base conception cleaning, and `SDMX` parsing to `sdmxjs`.
- [dotstatsuite-data-lifecycle-manager#149](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/149) *(Refactoring)* Remove in .Stat DLM 'references=all' from query for category filter when no Category[Scheme] is selected.
- [dotstatsuite-visions#16](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions/-/issues/16) Blueprint migration & integration.
- [.stat-suite/keycloak#6](https://gitlab.com/sis-cc/.stat-suite/keycloak/-/issues/6) *(DevOps)* Update to **Keycloak version 7** in qa/staging environments.
- [dotstatsuite-data-lifecycle-manager#119](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/119) *(Confidential)*
- [dotstatsuite-data-explorer#331](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/331) *(DevOps)* Update pipeline with **Docker tag**.
- [dotstatsuite-config#13](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/issues/13) and [dotstatsuite-config#12](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/issues/12) *(Support)* Update all i18n dev/prod, including new keys.
- [dotstatsuite-config#14](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/issues/14) *(Support)* .Stat DE configuration changes for OECD staging.

patches:

- [dotstatsuite-data-explorer#341](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/341) Navigation in filter with hierarchy: no root (/parent?) values displayed.
- [dotstatsuite-data-explorer#299](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/299) When applying DECIMALS=0 on integers, thousands separator wrongly disappears.
- [dotstatsuite-data-explorer#351](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/351) Crash for a specific dataflow (because it has only one observation).
- [dotstatsuite-data-explorer#324](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/324) Dataset-level attribute is not displayed next to the title (Dataflow header).
- [dotstatsuite-data-explorer#349](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/349) Reversed number for right to left languages when using thousand separator.
- [dotstatsuite-data-explorer#339](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/339) wcag wrongly automatically enabled on .Stat DE viz. page.
- [dotstatsuite-data-lifecycle-manager#85](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/85) Show the correct status of the artifact deletion in .Stat DLM.

---

### July 7, 2020
**[Release .Stat Suite .NET 4.1.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/22)**
> This new release includes a new version of the **core-sdmxri-nsi-plugin** service, with the release of the Eurostat's **NSI-WS version 7.13.0**.

minor changes:

- [dotstatsuite-core-sdmxri-nsi-ws#53](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/53) Deploy NSI version 7.13.0 (incl. 7.12.2). The task also included the creation, upon Eurostat authorization to the SIS-CC, of a new sub-group called **Eurostat SDMX-RI components** into GitLab for hosting Read-Only copies (*manually mirrored*) of some of the Eurostat components:
>* [nsiws.net.mirrored](https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored)
>* [maapi.net.mirrored](https://gitlab.com/sis-cc/eurostat-sdmx-ri/maapi.net.mirrored)
>* [authdb.sql.mirrored](https://gitlab.com/sis-cc/eurostat-sdmx-ri/authdb.sql.mirrored)
- [dotstatsuite-core-sdmxri-nsi-plugin#8](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/-/issues/8) Load of the Concept Scheme CoreRepresentation.
- [dotstatsuite-core-sdmxri-nsi-ws#49](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/49) Add the database version number to the NSI-WS health page.
- [dotstatsuite-core-sdmxri-nsi-ws#50](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/50) *(DevOps)* Update default MSDB variable and use default settings in `kube` & `docker-compose`.

patches:

- [dotstatsuite-core-sdmxri-nsi-ws#29](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/29) Query for dataflows as references to a particular category wrongly returns also other dataflows. This fix enables to properly filter dataflows in the DLM by category [dotstatsuite-data-lifecycle-manager#48](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/48).

---

### June 24, 2020
**[Release .Stat Suite .NET 4.0.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/20)**
> This new release includes a new **major** version of the **core-transfer** service, with an upgrade to the **.NET core version 3.1**.  
It also includes a minor version of the **core-auth-management** service.

major changes:

- [dotstatsuite-core-transfer#93](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/93) Upgrade the remaining `.statsuite-core` components to **.NET core 3.1**.

minor changes:

- [dotstatsuite-core-transfer#101](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/101) Harmonise the construction of coordinates in user messages.
- [dotstatsuite-core-transfer#94](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/94) Make the **API cleanup** feature more robust.
- [dotstatsuite-core-transfer#48](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/48) Review the text of all current localised transfer error messages.
- [dotstatsuite-core-transfer#78](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/78) Add API feature to **initialise Data DB objects** when a dataflow was created. ([Documentation](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/tree/master#post-12initdataflow-initializes-database-objects-of-a-dataflow-in-datastore-database))
- [dotstatsuite-core-transfer#95](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/95) *(Refactoring)* Remove the feature and usage of external spaces by ID in the transfer service.
- [dotstatsuite-core-transfer#100](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/100) *(Refactoring)* Error messages are missing in the `config/localization.json` file.
- [dotstatsuite-core-transfer#108](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/108) *(Refactoring)* Remove the "See details" feature from the current implementation of the transfer service log messages.
- [dotstatsuite-core-transfer#112](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/112) *(Refactoring)* Remove the unit test examples of xml files with no dataflow reference.
- [dotstatsuite-core-transfer#117](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/117) *(Refactoring)* Transfer service breaks with latest version of data access nuget.
- [dotstatsuite-core-transfer#118](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/118) *(DevOps)* Add database version numbers to the Transfer service healthcheck page.

patches:

- [dotstatsuite-core-transfer#111](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/111) Dataflow not found in the mapping store.
- [dotstatsuite-core-transfer#107](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/107) After uploading data for a free-text dataset attribute, the value provided in exports is wrongly wrapped in single quotes.
- [dotstatsuite-core-transfer#106](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/106) DLM data import with **Excel+EDD** fails because it expects a mandatory `LanguageCode` parameter.
- [dotstatsuite-core-transfer#102](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/102) Add **API feature** to cleanup the Data DB from all orphan content *(garbage collection)*. ([Documentation](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/tree/master#delete-12cleanuporphans-full-cleanup-of-the-data-db-when-related-dsds-and-artefacts-doesnt-exist-in-the-mapping-store-db))
- [dotstatsuite-core-transfer#96](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/96) Calling `PITInfo` on `PITController` falsely claims that times are UTC.
- [dotstatsuite-core-transfer#83](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/83) No `MIME-Type` validation of file uploads.
- [dotstatsuite-core-transfer#79](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/79) Database failure during first import leaves the data database in inconsistent state.
- [dotstatsuite-core-transfer#29](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/29) Remove request target dataflow from SDMX import request (because the destination is defined already in the SDMX import file).
- [dotstatsuite-core-data-access#47](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/issues/47) Add reference to `dotstat-common` dependency.
- [dotstatsuite-core-auth-management#12](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/-/issues/12) *(Confidential)*

---

### June 23, 2020
**[Release .Stat Suite JS 5.1.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/21)**
> This new release includes a new version of the **data-explorer**, **sdmx-faceted-search** and **data-lifecycle-manager** services.  

minor changes:

- [dotstatsuite-data-explorer#148](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/148) Data Explorer web accessibility support according to **WCAG 2.1 level AA** and [dotstatsuite-data-explorer#209](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/209) Web-accessible alternative for table layout drag&drop. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/general-layout/#web-content-accessibility-support))
- [dotstatsuite-sdmx-faceted-search#30](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/issues/30) Restrict search facets to items with data, using to the current **data availability**. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/facets/#what-information-is-presented-as-facets))
- [dotstatsuite-sdmx-faceted-search#75](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/issues/75) Adding (again) hierarchical parents without data to search facets when their children have data - to align with approach in viz page filters, see below).
- [dotstatsuite-data-explorer#305](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/305) Correct display of hierarchical parents without data to viz page filters when their children have data.
- [dotstatsuite-sdmx-faceted-search#73](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/issues/73) Exclude dimensions of a dataflow from the indexing that have more values than a new configurable limit. (Documentation is [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#limit-for-indexing-dimensions-per-dataflow) and [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/indexing-data/#conditions-and-exceptions))
- [dotstatsuite-sdmx-faceted-search#77](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/issues/77) Exclude dataflows from the indexing when its Actual Content Constraint is empty. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/indexing-data/#conditions-and-exceptions))
- [dotstatsuite-data-lifecycle-manager#145](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/145) When calling the DE preview in the DLM, use `dataAvailability=on` instead of `off`. ([Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/preview-data/))

patches:

- [dotstatsuite-data-explorer#312](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/312) Clicking on the scopelist parent arrow refreshes the table instead of displaying children items.
- [dotstatsuite-data-explorer#270](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/270) `NAMAIN_FLASH_Q` Dataflow with Q freq. data gets a wrong Time-Period selector set on Annual (not possible to switch to Quarterly).
- [dotstatsuite-data-explorer#313](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/313) DE fullscreen error page appears on click.
- [dotstatsuite-data-explorer#276](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/276) DE fullscreen feature looses chart customisations.
- [dotstatsuite-data-explorer#336](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/336) Missing label pagination.
- [dotstatsuite-data-explorer#322](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/322) Repair: Hide filter with one value.
- [dotstatsuite-data-explorer#321](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/321) data-explorer link in story crash.
- [dotstatsuite-core-sdmxri-nsi-ws#36](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/36) In DLM, clarify the text for 'number of observations' when data request returns `404`.
- [dotstatsuite-data-lifecycle-manager#107](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/107) In DLM, display the correct structure upload status based uniquely on `NSI HTTP` return code (e.g. "200", "201", ...) and always display the full status message.

---

### June 15, 2020
**[Release .Stat Suite .NET 3.9.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/19)**
> This release includes a new minor version of the **core-sdmxri-nsi-ws** service, with the deployment of the **Eurostat's NSIWS v7.12.1** that contains the upgrade of the **Mappingstore database to v6.9**.  
**Disclaimer**: you will need to upgrade to **NSIWS v7.12.1** if you want to benefit from all the latest features/fixes in the .Stat Suite context. I you don't have access to the Eurostat repository, you can check their full release note from [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/-/blob/master/CHANGELOG_NSIWS.md).  

> Both **source-code** and **Docker images** are concerned by this release.  

minor changes:

- [dotstatsuite-core-sdmxri-nsi-ws#41](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/41) Deploy **NSI version 7.12.1** in DevOps.

patches:

- [dotstatsuite-core-sdmxri-nsi-ws#11](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/11) Default GenericData message response is defined with DSD while the data query is for Dataflow.
- [dotstatsuite-core-sdmxri-nsi-plugin#19](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/-/issues/19) NSI-Web-Service recognises attributes attached to TIME_PERIOD as observation level attributes. 
- [dotstatsuite-core-sdmxri-nsi-ws#45](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/45) `Access-Control-Allow-Origin` header is missing in the 404 data response.
- [dotstatsuite-core-sdmxri-nsi-plugin#47](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/-/issues/47) Performance issue when downloading/retrieving data.
- [dotstatsuite-core-sdmxri-nsi-ws#24](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/24) AnnotationTitle is (still) fixed to 70 characters. 

---

### May 18, 2020
**[Release .Stat Suite JS 5.0.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/18)**
> This new release includes a new major version of the **data-explorer**, **data-viewer**, **sdmx-faceted-search** and **data-lifecycle-manager** services.  

> This version **does not** introduce backward incompatibility, but it brings **significant changes** in the `css API` and DE design.  
**WARNING**: this release changes and extends how the Data Explorer **Theme** is customised and will result in your custom styles being lost (if you previously modified the default one). Please see [this updated documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-customisation/#main-theme) for how to reapply your styles.  

> Both **source-code** and **Docker images** are concerned by this release.  

major changes:

- [dotstatsuite-data-explorer#263](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/263) Adjust some UI design in Data Explorer (**Material UI v4** migration).
- [dotstatsuite-data-explorer#245](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/245) Data-explorer Visions component's integration (part of MUI v4 migration).
- [dotstatsuite-data-explorer#150](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/150) Apply **new Design to DE** (based on usability tests performed across the SIS-CCommunity). See the [UI reference documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/general-layout/#user-interface-design).
- [dotstatsuite-data-explorer#264](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/264) **Last N periods** feature display should be **configurable**. This new configuration parameter allows, **per datasource**, to hide or display the LastNperiod feature of the application (from the filter area of the visualisation page). [Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#lastnobservations-support)

minor changes:

- [dotstatsuite-data-explorer#117](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/117) DE data views: Limit the displayed filter values according to the current **data availability**. [Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/data-availability/)
- [dotstatsuite-data-explorer#113](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/113) Full **Unit of measure** display in data table views. [Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/unit-of-measure/)
- [dotstatsuite-data-explorer#261](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/261) **DE Image background** on March 2020 release. This resulted in improving the customisation method. [Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-customisation/#homepage-background-image)
- [dotstatsuite-data-explorer#82](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/82) Time range selector: current period selected in drop-down but not visible.
- [dotstatsuite-visions#17](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions/-/issues/17) DE toolbar with icon loader for the download options.
- [dotstatsuite-data-explorer#281](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/281) **Efficient** handling of **big codelists** in DE search results facets and visualisation page filters.
- [dotstatsuite-data-explorer#160](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/160) Add support of **Khmer** language in DE.
- [dotstatsuite-data-explorer#251](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/251) and [dotstatsuite-data-explorer#254](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/254) Add support of **Dutch** language in DE and DLM.
- [dotstatsuite-data-explorer#75](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/75) More clearly indicate the "Filter by" features in the facets of the search and the filters in the visualisation.
- [dotstatsuite-data-explorer#259](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/259) Healthcheck in DE.
- [dotstatsuite-data-explorer#300](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/300) Inconsistent behavior of ascending/descending custom option for time period table view.
- [dotstatsuite-data-explorer#277](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/277) Update labels according to new design, and aligning all supported localised version of the DE.
- [dotstatsuite-sdmx-faceted-search#63](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/issues/63) Handling **facet names in solr containing special characters**.
- [dotstatsuite-chart-generator-legacy#4](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-chart-generator-legacy/-/issues/4) Add time period to data tooltip.
- [dotstatsuite-visions#13](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions/-/issues/13) *(Refactoring)* Final migration to **Material UI** v4.
- [dotstatsuite-data-viewer#16](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/-/issues/16) Viewer table updates as part of the Material UI migration.
- [dotstatsuite-data-lifecycle-manager#117](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/117) *(Refactoring)* Remove feature and usage of external spaces by ID in transfer service.
- [dotstatsuite-data-explorer#273](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/273) *(Refactoring)* Lint Data-explorer.
- [dotstatsuite-visions#12](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions/-/issues/12) *(Refactoring)* Backport allow configuring icons associated to facet values into Visions.
- [dotstatsuite-docker-compose#2](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose/-/issues/2) JS Docker-Compose uses config URLs that will not work.
- [dotstatsuite-data-explorer#306](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/306) Change the default **thousand separator** to non-breaking space. [Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#localised-observation-values-separators-for-thousands-and-decimals)

patches:

- [dotstatsuite-data-explorer#246](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/246) Filtered CSV download must not be restricted by http range header.
- [dotstatsuite-data-explorer#262](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/262) No reaction on Excel download.
- [dotstatsuite-data-explorer#268](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/268) Time Zone: invalid time period boundaries.
- [dotstatsuite-data-explorer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/294) Full page error on search in filter in table view.
- [dotstatsuite-data-explorer#274](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/274) Reapply the behaviour of the `DEFAULT` filter selections by also applying items from search (*part 1: use of search facet selections*).
- [dotstatsuite-data-explorer#279](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/279) Table cell limit warning continues to be shown while refreshing the table even for a different dataflow.
- [dotstatsuite-data-explorer#284](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/284) Error in DE on Entering Table/Chart View *"Whoops something went wrong on our end"*.
- [dotstatsuite-data-lifecycle-manage#121](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/121) **DLM filter** by `AgencyScheme` or by `Categorisation` does not return any result.
- [dotstatsuite-data-lifecycle-manager#84](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/84) Display the **correct message in the DLM** after a data upload if any issue.
- [dotstatsuite-data-explorer#298](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/298) Wrong frequency when visiting table view is permanent.

---

### April 20, 2020
**[Release .Stat Suite .NET 3.5.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/17)**
> This new release includes a new minor version of the **transfer** and **auth-management** services.  
Both **source-code** and **Docker images** are concerned by this release.  

minor changes:

- [dotstatsuite-core-transfer#65](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/65) Add API feature to cleanup the Data DB when a DSD was deleted.
- [dotstatsuite-core-transfer#62](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/62) Add source file path/name to notification message content sent to user via e-mail.
- [dotstatsuite-core-transfer#97](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/97) *(Refactoring)* Increase Transfer response consistency by applying `lowerCamelCase` across all messages.
- [dotstatsuite-core-transfer#84](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/84) *(Refactoring)* Actual Content Constraint with `ReleaseVersion=PointInTime` generated during the first data upload.
- [dotstatsuite-core-auth-management#13](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/-/issues/13) *(Confidential)*
- [dotstatsuite-core-transfer#58](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/58) *(Documentation)* Improved documentation for Restoration service (see in [README.md](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/blob/master/README.md#new-methods) file).
- [dotstatsuite-core-common#103](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/-/issues/103) *(Documentation)* Add a [README](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/-/blob/develop/README.md) explaining the purpose of the repository.

patches:

- [dotstatsuite-core-transfer#3](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/3) Not possibe to upload data after the DSD is re-uploaded with a different structure (this is resolved by implementing [dotstatsuite-core-transfer#65](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/65)).
- [dotstatsuite-core-transfer#47](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/47) Wrong row id in the data transfer error log.

---

### April 2, 2020
**[Release .Stat Suite JS 4.2.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/16)**
> This new release includes a new minor version of the .Stat Suite **sdmx-faceted-search** service.  
Both **source-code** and **Docker images** are concerned by this release.  

patch: 

- [dotstatsuite-sdmx-faceted-search#67](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/issues/67) Use of **`referencepartial` parameter** in dataflow queries for indexing.  
This fix resolves the issue that caused the .Stat Data Explorer to return all dataflows in all categories.  
With this solved, dataflows are only retrieved through the CategoryScheme facet value in which they are categorised.  
This feature needs at least **nsiws.net v7.11.3** to fully function, and nsiws.net v7.11.0 to not break the request.

![DE fixed issue for facet filter](/dotstatsuite-documentation/images/changelog-js4.2.0.png)

---

### March 31, 2020
**[Release .Stat Suite .NET 3.4.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/14)**
> This new release includes a new minor version of the .Stat Suite **core-transfer** and **core-data-access** services.  
Both **source-code** and **Docker images** are concerned by this release.  

minor changes:

- [dotstatsuite-core-transfer#91](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/91) *(Refactoring)* Replace usage of AnnotationText by Title in MAXTEXTATTRIBUTELENGTH annotation. [Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/upload-structure/text-attribute-length/)
- [dotstatsuite-core-transfer#92](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/92) *(Refactoring)* Refactor actual constraints generation method.
- [dotstatsuite-core-transfer#80](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/80) *(Refactoring)* Update project with the latest data-access nuget package.
- [dotstatsuite-core-transfer#77](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/77) *(Refactoring)* Transfer Service should not need write permission on import files.
- [dotstatsuite-core-transfer#54](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/54) *(DevOps)* Test docker images created in pipelines.
- [dotstatsuite-core-sdmxri-nsi-plugin#42](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/-/issues/42) Race condition in plugin.
- [dotstatsuite-core-transfer#82](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/82) *(Refactoring)* *(Confidential)*

patches:

- [dotstatsuite-core-transfer#88](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/88) Loading PIT data without having done a live load fails.
- [dotstatsuite-core-transfer#86](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/86) `isInclusive` parameter and `EndPeriod` value in generated actual content constraints.
- [dotstatsuite-core-transfer#85](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/85) Generated actual content constraints do not take into account empty observation values with existing attributes.
- [dotstatsuite-core-transfer#76](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/76) Wrong `TimeRange` in actual content constraint if the TIME_PERIOD is not a last dimension in a DSD.
- [dotstatsuite-core-transfer#75](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/75) Transfer fails and no email notifications are received.
- [dotstatsuite-core-transfer#71](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/issues/71) PITController does not work with authentication switched on.

---

### March 29, 2020
**[Release .Stat Suite .NET 3.3.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/13)**
> This new release includes a new minor version of the .Stat Suite **core-sdmxri-nsi-ws** and **core-sdmxri-nsi-plugin** services.  
Both **source-code** and **Docker images** are concerned by this release.  

> **DISCLAIMER**: This release includes an unofficial **nsiws.net v7.11.3-hotfix** version of NSI webservice, until the resolution of Eurostat's *SDMXRI-1315* issue is made available in the next NSIWS v7.11.5 (see [details](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/-/blob/master/CHANGELOG_NSIWS.md#nsiwsnet-v7113-hotfix-2020-03-25-by-oecd-msdb-v68-authdb-v10)).

minor changes:

- [dotstatsuite-core-sdmxri-nsi-ws#34](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/34) Deploy **NSI version 7.11.3** (incl. 7.11.2) in DevOps.
- [dotstatsuite-core-sdmxri-nsi-ws#28](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/28) Implement partial CategorySchemes through **detail=referencepartial** parameter.
- [dotstatsuite-core-sdmxri-nsi-ws#23](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/23) ShowPII set to True in NSI OpenId Middleware.
- [dotstatsuite-core-sdmxri-nsi-plugin#34](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/-/issues/34) Add commit hash in /health.
- [dotstatsuite-core-sdmxri-nsi-ws#32](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/32) *(Refactoring)* Change default logging level to WARN.
- [dotstatsuite-core-sdmxri-nsi-ws#25](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/25) *(Refactoring)* Make mapping.store `InsertNewItems` parameter configurable for one specific NSI instance.

patches:

- [dotstatsuite-core-sdmxri-nsi-ws#42](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/42) Apply **hotfix** on NSI WS version 7.11.3. See [documentation](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/-/blob/master/CHANGELOG_NSIWS.md#nsiwsnet-v7113-hotfix-2020-03-25-by-oecd-msdb-v68-authdb-v10).
- [dotstatsuite-core-sdmxri-nsi-ws#30](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/30) .Stat DLM filter by types does not always return the expected list of artifacts (**Note** that an knwon issue on JavaScript side still causes a failure for the DLM end-user: [dotstatsuite-data-lifecycle-manager#121](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/121)).
- [dotstatsuite-core-sdmxri-nsi-ws#21](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/-/issues/21) Not possible to update labels/annotations in the artifacts that are referenced by other artifacts.
- [dotstatsuite-core-sdmxri-nsi-plugin#45](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/-/issues/45) Data query response wrongly contains time periods that should be excluded when applying Allowed Content Constraint with `TimeRange`.

---

### March 27, 2020
**[Release .Stat Suite JS 4.1.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/15)**
> This new release includes a new minor version of the .Stat Suite **data-explorer**, **config** and **data-lifecycle-manager** services.  
This release has been tested and is running with the **NSI WebService v7.11.1**.  
Both **source-code** and **Docker images** are concerned by this release.   

minor changes:

- [dotstatsuite-data-explorer#210](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/210) **RTL mode** xlsx-populate, this allowing to programmatically switching the layout of a downloaded Excel data table between left-to-right and right-to-left.

patches:

- [dotstatsuite-data-explorer#240](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/240) Broken **RTL style** table.
- [dotstatsuite-data-explorer#255](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/255) Empty filters in the .Stat DE visualisation page.
- [dotstatsuite-data-lifecycle-manager#123](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/123) **.Stat DLM** Preview icon is displayed even if a DE Url is not provided.
- [dotstatsuite-data-lifecycle-manager#124](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/-/issues/124) **.Stat DLM** unauthenticated requests.

---

### March 05, 2020
**[Release .Stat Suite JS 4.0.1](https://gitlab.com/groups/sis-cc/-/milestones/4?milestone%5Btitle%5D=Release+.stat+suite+JS+v4.0.1)**  
> This new release includes a new patch version of the .Stat Suite **sdmx-faceted-search**, **config** and **data-explorer** services.  
This release has been tested and is running with the **NSI WebService v7.11.1**.  
Both **source-code** and **Docker images** are concerned by this release.  

minor changes:

- [dotstatsuite-data-explorer#228](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/228) Add **Data Explorer authentication**. This is the first version of the Data Explorer auhtentication feature. The Data Explorer now works in both anonymous and authenticated modes. The same authenticated session (through Keycloak) is used when logging in DLM and DE. See [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/authentication/).

patches:

- [dotstatsuite-data-explorer#230](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/230) **Decimals** set in the configuration are not applied in the Data Explorer.
- [dotstatsuite-data-explorer#243](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/issues/243) Repeating dataflows in the Data Explorer search results.

---

### February 28, 2020
**[Release .Stat Suite JS 4.0.0](https://gitlab.com/groups/sis-cc/-/milestones/3?milestone%5Btitle%5D=Release+.stat+suite+JS+v4.0.0)** with **[SFS 2.0](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/issues?milestone_title=SFS+2.0&state=closed)**

>This new **MAJOR** release includes a new version of the .Stat Suite **sdmx-faceted-search**, **config**, **data-explorer**, **dotstatsuite-proxy**, **dotstatsuite-share**, **dotstatsuite-data-viewer** and **data-lifecycle-manager** services.  
The new version of the sdmx-faceted-search service requires **nodejs version 13.3.x** (mandatory to upgrade when installing/upgrading .Stat Suite from source-code).  
This release has been tested and is running with the **NSI WebService v7.11.1**.  
Both **source-code** and **Docker images** are concerned by this release.  

>**Important DISCLAIMER**: There is a known dependency issue that causes the .Stat Data Explorer to return all dataflows in all categories.  
This issue is addressed in [dotstatsuite-core-sdmxri-nsi-ws#28](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/issues/28) and fix was released by Eurostat in the latest NSI WebService v7.11.2 ([issue#34](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/issues/34) for its integration to .Stat Suite).  

>From this release on, incremental **semantic version** is also used in this changelog for categorising changes and bug fixes:  
  **major**: incompatible API change was introduced  
  **minor**: functionality was added in a backwards-compatible manner  
  **patch**: backwards-compatible bug fixes were applied  

major changes:

- [dotstatsuite-sdmx-faceted-search#41](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/issues/41) (*Sdmx Faceted Search*) Redefine Document ID and Datasource definitions.
- [dotstatsuite-sdmx-faceted-search#47](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/issues/47) (*Sdmx Faceted Search*) Index facets' names instead of ID and remove i18n.
- [dotstatsuite-sdmx-faceted-search#48](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/issues/48) (*Sdmx Faceted Search*) All facets are hierarchical.
- See [README.md](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/blob/master/README.md), [SFS changelog](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/blob/master/CHANGELOG.md) and [config.documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#homepage-facets) for additional details on major impacts.

minor changes:

- [dotstatsuite-sdmx-faceted-search#44](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/issues/44) Highlight facet values in DE search results.
- [dotstatsuite-sdmx-faceted-search#42](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/issues/42) Create facets for all CategorySchemes of a dataflow. **DISCLAIMER: There is a known dependency issue** that causes the .Stat Data Explorer to return all dataflows in all categories. This issue is addressed in [dotstatsuite-core-sdmxri-nsi-ws#28](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/issues/28) and fix was released by Eurostat in the latest NSI WebService v7.11.2 ([issue#34](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/issues/34) for its integration to .Stat Suite).
- [dotstatsuite-sdmx-faceted-search#21](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/issues/21) **Search terms** with space should act like *AND* operator.
- [dotstatsuite-sdmx-faceted-search#37](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/issues/37) Allow updating or deleting individual dataflows in the search index. See [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/indexing-data/#when-and-how-to-index).
- [dotstatsuite-data-explorer#111](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/111) Allow configuring **icons** associated to facet values. See [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-customisation/#add-icons-to-specific-facet-values).
- [dotstatsuite-data-explorer#153](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/153) .Stat DE with the right-to-left (RTL) mode for the table view. 
- [dotstatsuite-data-explorer#101](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/101) Indicate in the table/chart subtitle when displayed data are incomplete. See [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/incomplete-data/).
- [dotstatsuite-data-explorer#170](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/170) In visualisation page, display the dataflow's title and table/chart footer even when there is no data available.
- [dotstatsuite-data-explorer#188](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/188) Column widths, alignment and wrapped texts for row/column header cells in the **Excel download**.
- [dotstatsuite-data-explorer#199](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/199) **Excel download** with data including comma separators.
- [dotstatsuite-data-explorer#197](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/197) **Excel download** includes the right-to-left (RTL) mode. The downloaded table including Arabic localised data from the .Stat DE is automatically displayed in RTL mode **only if** the targetted environement (for instance the end-user's PC) has Windows Excel configured by default with the Right-to-left option ([reference](https://support.office.com/en-us/article/using-right-to-left-languages-in-office-17d8a34d-36d6-49ad-b765-257cb7cd22e2)). 
- [dotstatsuite-data-lifecycle-manager#101](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/issues/101) Remove the .Stat DLM "upload data" shortcut feature from the list view (not working and confusing).
- [dotstatsuite-data-lifecycle-manager#95](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/issues/95) Add a **logout** feature to .Stat DLM. See [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/log-in-dlm/#log-out).
- [dotstatsuite-data-lifecycle-manager#80](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/issues/80) Improve the text of user instructions on .Stat DLM "upload data" page for Excel option.
- [dotstatsuite-sdmx-faceted-search#51](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/issues/51) *(support)* Solr issue with JS milestone 7 and Core 2.1.0 update. this issue led to update Docker-Compose to target `master` versions of the Docker images instead of `develop`.
- [dotstatsuite-sdmx-faceted-search#58](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/issues/58) *(support)* HomefacetId for French locale is not applied.
- [dotstatsuite-data-explorer#223](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/223) *(refactoring)* Code quality updated (Pretify src/web).
- [dotstatsuite-data-lifecycle-manager#111](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/issues/111) *(refactoring)* .Stat DLM Codebase cleaning.
- [dotstatsuite-data-lifecycle-manager#110](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/issues/110) *(refactoring)* When getting the number of observations, only request for the first observation.
- [dotstatsuite-data-explorer#206](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/206) *(refactoring)* Frequency and Time Period engine.
- [dotstatsuite-data-lifecycle-manager#92](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/issues/92) *(refactoring)* Refactor datasources after sfs2.0 update in all applications (DE+DLM) that require those from the config. service.
- [dotstatsuite-sdmx-faceted-search#26](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/issues/26) *(refactoring)* Report is sometimes unreadable and buggy.
- [dotstatsuite-documentation#47](https://gitlab.com/sis-cc/dotstatsuite-documentation/issues/47) *(documentation)* .Stat DLM installation guidelines from source code need to be updated. See updated documentation including .Stat DLM and Keycloak in all [source code approahces](https://sis-cc.gitlab.io/dotstatsuite-documentation/install-source-code/).
- [dotstatsuite-documentation#19](https://gitlab.com/sis-cc/dotstatsuite-documentation/issues/19) *(documentation)* **Guidance on Sdmx-Faceted-Search** Index Job. See [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/indexing-data/) and [README.md](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/-/blob/master/README.md).
- [dotstatsuite-visions#11](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions/issues/11) *(documentation)* Alter README to Explain Purpose of Repository.
- [dotstatsuite-documentation#50](https://gitlab.com/sis-cc/dotstatsuite-documentation/issues/50) *(documentation)* Update copyright date to 2020 in licence file.
- [dotstatsuite-data-explorer#203](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/203) *(documentation)* Update README to describe Data Explorer.
- [dotstatsuite-data-explorer#212](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/212) *(test)* Add tests for the Excel download feature.
- [dotstatsuite-ui-components#8](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-ui-components/issues/8) *(test)* Add tests for the Scopelist feature.
- [dotstatsuite-sdmx-faceted-search#50](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/issues/50) *(refactoring)* *(confidential)*
- [dotstatsuite-share#15](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/issues/15) *(refactoring)* *(confidential)*
- [dotstatsuite-d3-charts#1](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-d3-charts/issues/1) *(refactoring)* *(confidential)*

patches:

- [dotstatsuite-data-explorer#187](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/187) Missing behaviours for the data table **footnote attributes** displayed at the highest possible level.
- [dotstatsuite-sdmx-faceted-search#23](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/issues/23) Indexing dataflows that are categorised in Categories at lower levels of the CategoryScheme. **DISCLAIMER: There is a known dependency issue** that causes the .Stat Data Explorer to return all dataflows in all categories. This issue is addressed in [dotstatsuite-core-sdmxri-nsi-ws#28](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/issues/28) and fix was released by Eurostat in the latest NSI WebService v7.11.2 ([issue#34](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/issues/34) for its integration to .Stat Suite).
- [dotstatsuite-sdmx-faceted-search#27](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/issues/27) **Duplicates of dataflow** in the search index. Resolving this issue now implies:
  * One dataflow categorised in two different categories is returned only once in the .Stat DE search result;
  * Two dataflows with the same Agency/ID/version but from different sources are both returned in the .Stat DE search result and differentiated with their `sourceID`. 
- [dotstatsuite-data-explorer#20](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/20) Concepts should be merged into one single facet if their localised name are the same.
- [dotstatsuite-data-explorer#17](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/17) Text search does not return 2 distinct dataflows from 2 different endpoints when they have the same identity (ID, Agency, Version).
- [dotstatsuite-data-explorer#59](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/59) Free-text search hits within codes of codelists are not returned as highlights in the search results.
- [dotstatsuite-sdmx-faceted-search#56](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/issues/56) Localisation fails in DE search result page.
- [dotstatsuite-data-explorer#167](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/167) We lost the defaults for layout (when there are no or only partial related SDMX annotations or selections from search).
- [dotstatsuite-data-viewer#4](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer/issues/4) No horizontal scroll in the Arabic table layout.
- [dotstatsuite-data-explorer#222](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/222) Right-to-left (RTL) view of the DE table returns a wrong data display mode (when displaying in Arabic language).
- [dotstatsuite-data-explorer#21](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/21) Search result filtered on hierarchical codelist returns an error in the visualisation page.
- [dotstatsuite-data-explorer#235](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/235) Search filter selections not applied in visualisation page anymore.
- [dotstatsuite-data-explorer#216](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/216) Broken hamburger menu of the visualisation page (in narrow mode).
- [dotstatsuite-data-explorer#217](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/217) Broken choropleth map view in .Stat DE.
- [dotstatsuite-data-lifecycle-manager#112](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/issues/112) .Stat DLM Avoid unnecessary reload of the application.
- [dotstatsuite-data-lifecycle-manager#87](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/issues/87) .Stat DLM Missing .csv format in the "custom filter" settings of the SDMX file upload.

---

### February 17, 2020
**[Release .Stat Suite .NET 3.2.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/12?milestone%5Btitle%5D=Release+.Stat+Suite+.NET+v3.2.0)**
>This new release includes a new version of the .Stat Suite **core-sdmxri-nsi-ws**, **core-sdmxri-nsi-plugin** and **core-data-access** services.  
Both **source-code** and **Docker images** are concerned by this release.  

Changes:

- [dotstatsuite-core-sdmxri-nsi-plugin#36](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/issues/36) Deployment of the Eurostat's **NSI web service version 7.11.1** in DevOps (Eurostat's changelog is included in GitLab's ticket), now running on **.NET Core 3.1**.

Bug fixes:

- [dotstatsuite-core-sdmxri-nsi-plugin#40](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/issues/40) (original ticket: [dotstatsuite-core-common#27](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/issues/27)) Bug in the NSI web service with referencepartial parameter *"String or binary data would be truncated"*.
- [dotstatsuite-core-sdmxri-nsi-plugin#39](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/issues/39) Load of Hierarchical Codelist results in timeout.
- [dotstatsuite-core-data-access#41](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/issues/41) Dataflows with *allowed* Content Constraints applied return 'restricted' data if a user queries it directly.
- [dotstatsuite-core-data-access#40](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/issues/40) Internal error when invalid dimension code is provided in the query filter.
- [dotstatsuite-core-sdmxri-nsi-plugin#32](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/issues/32) Data retrieval in .Stat DE fails for some dataflows: *"Error during writing response"*.
- [dotstatsuite-core-sdmxri-nsi-ws#14](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/issues/14) Referencepartial parameter for request with references does not work anymore.
- [dotstatsuite-core-sdmxri-nsi-ws#13](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/issues/13) "Semantic Error - Duplicate language `it` for TextType" when using referencepartial.
- [dotstatsuite-core-sdmxri-nsi-plugin#28](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/issues/28) Calling the Content Constraint with "children" or "descendants" references does not return the related artifacts (for the dataflow that it is constraining).
- [dotstatsuite-core-sdmxri-nsi-ws#5](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/issues/5) Not possible to delete or update allowed Content Constraint (found in *NSI WS 7.8.0.0*).
- [dotstatsuite-core-sdmxri-nsi-ws#22](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/issues/22) Increase the UploadSizeLimit to 50MB for structures in the Transfer service.
- [dotstatsuite-core-sdmxri-nsi-ws#7](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/issues/7) Mechanism to set the NSI ws URL in returned stub artefacts (stored in full in MASTORE).

---

### February 04, 2020
**[Release .Stat Suite .NET v3.1.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/11)**
>This new release includes a new version of the .Stat Suite **core-sdmxri-nsi-ws** and **core-sdmxri-nsi-plugin** services.  
Both **source-code** and **Docker images** are concerned by this release.  

Major changes:

- [dotstatsuite-core-sdmxri-nsi-ws#15](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/issues/15) Allow **configurable authenticated and/or anonymous access** to a single instance of the NSI service. This is enabled by a new configuration parameter of the authentication `auth.json` with following content:  
```
{
    "auth": {
        ...
        "allowAnonymous": true,
        ...
    }
}
```   
The following kind of user rule is from now on required to be configured using the authorisation web service in order to allow public read access to anonymous users (.Stat DE users):  
```
{
      "userMask": "*",      --> anonymous users
      "isGroup": false,
      "dataSpace": "staging:SIS-CC-stable",     --> data space 
      "artefactType": 0,
      "artefactAgencyId": "*",
      "artefactId": "*",
      "artefactVersion": "*",
      "permission": 3       --> allowed to read structure and data
}
```
You can check [this page](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/manage-user-access/)  of the documentation in order to get the full list of available pemrissions.

- [dotstatsuite-core-sdmxri-nsi-plugin#35](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/issues/35) Update nsi-plugin for **NSI v7.10.10** as intermediate step before 7.11.

---

### January 31, 2020
**[Release .Stat Suite .NET v3.0.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/10)**
>**Disclaimer**: This major version contains breaking changes in the **dotstatsuite-core-transfer** and **dotstatsuite-core-auth-management** services with changes to the authentication management ([dotstatsuite-core-transfer#66](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/issues/66), [dotstatsuite-core-transfer#52](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/issues/52) & [dotstatsuite-core-auth-management#7](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/issues/7)). All impacted services are: core-transfer, core-auth-management, core-sdmxri-nsi-ws, core-data-access, and core-sdmxri-nsi-plugin.  
This release has been tested and is running with the **NSI WebService v7.10.8**.  
Both **source-code** and **Docker images** are concerned by this release.  

Major changes:

- [dotstatsuite-core-transfer#66](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/issues/66) **Unify the auth config** between the transfer service, the authentication service, and the NSI webservice. the Kubernetes strategy is also updated in order to use the authentication in the NSI WS.
- [dotstatsuite-core-sdmxri-nsi-ws#19](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/issues/19) Deploy the **NSI version 7.10.8** in DevOps. Including the following details from the [Eurostat changelog](https://webgate.ec.europa.eu/CITnet/stash/projects/SDMXRI/repos/nsiws.net/browse/CHANGELOG.md):
  * *Allow admin user to access all mapping store, to avoid having the administrator to logout and login everytime there is a new Mapping Store. OAuth2 caches the user with the mapping store.*  
  * *The keyword `latest` at version is not allowed when deleting artefacts.*  
  * *Fix SOAP 2.1 structure requests with CodeWhere and Stubs.*  

Minor changes:

- [dotstatsuite-core-sdmxri-nsi-plugin#25](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/issues/25) *(documentation)* Enhance documentation of the [source code installation](https://sis-cc.gitlab.io/dotstatsuite-documentation/install-source-code/) for NSI web service and Structure Database.
- [dotstatsuite-core-sdmxri-nsi-plugin#22](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/issues/22) Suggested in-lined user-defined function in structure database.

Bug fixes:

- [dotstatsuite-core-auth-management#7](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/issues/7) Authorisation rules do not respect the defined space.
- [dotstatsuite-core-transfer#52](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/issues/52) Not possible to **delete observation values from a DSD with mandatory group/series attributes**.
- [dotstatsuite-core-sdmxri-nsi-ws#12](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-ws/issues/12) Invalid child element `Value` in TimeRange of Actual Content Constraint.
- [dotstatsuite-core-data-access#31](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/issues/31) Actual Content Constraints with TimePeriod constrained cause exception to be thrown from `FillIdsFromDisseminationDb`.
- [dotstatsuite-core-sdmxri-nsi-plugin#27](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/issues/27) Deleting artefact using version of latest (*Trying to delete an artefact 'latest' version targets v1.0 instead of the actual latest*).
- [dotstatsuite-core-sdmxri-nsi-plugin#24](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/issues/24) **Enable authorisation check** on data download.
- [dotstatsuite-core-sdmxri-nsi-plugin#12](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/issues/12) Bug for not supporting multi-datasets in SDMX-JSON data.

---

### January 28, 2020
**[Release .Stat Suite .NET v2.3.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/9)**  
>**Disclaimer**: This release contains breaking changes in the dotstatsuite-core-transfer service with a new entry in the `dataspaces.private.json` and the introduction of `localization.json` via the Dotstat.config nuget package.  
Both **source-code** and **Docker images** are concerned by this release.  

Major changes:

- [dotstatsuite-data-lifecycle-manager#50](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/issues/50) Download selected data in Excel format (with simple layout).  
The original scope of this issue was extended in order to deliver a new component of the .Stat Suite: the **.Stat DLM Excel-Addin**.  
The **DLM Excel-Addin** is delivered as a ClickOnce application and is deployed using the common procedure for [deployment of ClickOnce applications](https://msdn.microsoft.com/en-us/library/t71a733d.aspx).  
You can access the installation files from [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-excel-addin). A best practice is to install it on a shared network folder.  
The DLM Excel-Addin is made for configuring a single or multiple connection endpoints, in order to retrieve data within Excel tables with simple layout. This first version supports **flat**, **time series down**, and **time series across** layouts.  
You can find more information about deployment, set up and configuration [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-excel-addin/blob/master/README.md).  

![DLM Excel-Addin](/dotstatsuite-documentation/images/dlm-wizard-01.png)

![DLM Excel-Addin](/dotstatsuite-documentation/images/dlm-wizard-02.png)

![DLM Excel-Addin](/dotstatsuite-documentation/images/dlm-wizard-03.png)

![DLM Excel-Addin](/dotstatsuite-documentation/images/dlm-wizard-04.png)

![DLM Excel-Addin](/dotstatsuite-documentation/images/dlm-wizard-05.png)

Minor changes:

- [dotstatsuite-docker-compose#1](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose/issues/1) *(DevOps)* Update docker-compose for core services after localization changes.

Bug fixes:

- [dotstatsuite-core-transfer#67](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/issues/67) ERROR Invalid column name 'DSD_MAX_TEXT_ATTR_LENGTH'.
- [dotstatsuite-core-common#102](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/issues/102) Allow uploading data with long textual attribute values for dataflows in first and subsequent uploads.  
A configuration parameter is used as a default setting for MaxTextAttributeLength, and **its default value is 150.**  
A *new* DSD annotation of type **`MAXTEXTATTRIBUTELENGTH`** can be set by the user for a specific DSD (in its definition).  
At first data upload, the default MaxTextAttributeLength is used if the annotation MAXTEXTATTRIBUTELENGTH is not provided.  
Whenever a *DSD-specific* MaxTextAttributeLength is increased after a first data upload, then the new length is applied.  
When adding the annotation type **`MAXTEXTATTRIBUTELENGTH`** to a DSD definition:  
```
  <structure:DataStructure id="SPS_ATT_TEST_TFWithNoRelationship_DSD" agencyID="OECD" version="11.1" isFinal="false">  
                 <common:Annotations>  
                     <common:Annotation>  
                         <common:AnnotationType>MAXTEXTATTRIBUTELENGTH</common:AnnotationType>  
                         <common:AnnotationText xml:lang="en">500</common:AnnotationText>  
                     </common:Annotation>  
                 </common:Annotations>  
                 <common:Name xml:lang="en">Attribute test dsd scenario with TIME_FORMAT attribute relationship on dimensions ETA and SESSO</common:Name>  
                 <structure:DataStructureComponents>
```
Then the textual attribute value can be longer in its display than the default length.  
The user is also notified through the email of the transfer action in the DLM:  

![MaxTexAttributeLength message](/dotstatsuite-documentation/images/maxtextattributelength.png)

---

### January 8, 2020
**[Release .Stat Suite .NET v2.2.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/8)**  
>This new release includes a new version of the .Stat Suite **.NET/SQL services**.  
Both **source-code** and **Docker images** are concerned by this release.  

Major changes:

- [dotstatsuite-core-transfer#21](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/issues/21) **Improved error message content** sent to user via e-mail.

E-mail notifications from the transfer service for data transfer activities and made by .Stat DLM users are received with clearer and well-formulated information.

The following two groupings/categories now describe the issue, its origin and it also identifies responsibility or who may be concerned by the type of issue:
> * Type of issues
>> * System transaction
>> * Database connection
>> * Database structure
>> * User Import/Transfer
>> * Data Modelling
> * Level of issues
>> * WARNING
>> * ERROR <br>

More details can be found [**here**](https://gitlab.com/snippets/1908874) (descriptive types of known issues, causes and solutions).

Several tasks remain to be done for providing some of the messages with more comprehensive, non-technical descriptions of the cause, and descriptions of the possible remedy solutions in case of failure.
- [dotstatsuite-core-data-access#15](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/issues/15) **Stress testing** of NSI and Transfer for upload and download. See the test report [here](https://community.oecd.org/docs/DOC-166958).  

Minor changes:
- [dotstatsuite-core-data-access#36](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/issues/36) *(Test)* Create a nuget for shared test classes and unit test sample files.
- [dotstatsuite-core-transfer#55](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/issues/55) *(DevOps)* Latest docker image misses the localization.json in a config folder.
- [dotstatsuite-core-data-access#33](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/issues/33) (*Refactoring*) Refactor SdmxObservationReader & ObservationValidator.

Bug fixes:

- [dotstatsuite-core-transfer#49](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/issues/49) Import from URL (of SDMX web service) doesn't work anymore.
- [dotstatsuite-core-transfer#47](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/issues/47) Wrong row id in the data transfer error log.
- [dotstatsuite-core-data-access#32](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/issues/32) SdmxObservationReader writes dimensions into db with wrong order when order of dimensions in serieskey do not match structure.
- [dotstatsuite-core-transfer#4](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/issues/4) Issues when importing data from SDMX-ML files (*Eurostat issue ID SDMXRI-1093*).

---

### December 5 2019
**[Release .Stat Suite .NET v2.1.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/5?milestone%5Btitle%5D=Release+.Stat+Suite+.NET+v2.1.0)**  
>This new release includes a new version of the **.NET/SQL services** .Stat Suite.  
This release has been tested with and is using the **NSI WebService v7.10.3**.  
Both **source-code** and **Docker images** are concerned by this release.  

Minor changes:

- [dotstatsuite-core-common#98](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/issues/98) *(Refactoring)* Common location of localization.json.
- [dotstatsuite-core-transfer#43](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/issues/43) Enhance logging mechanism with option for stdout.

Bug fixes:

- [dotstatsuite-core-transfer#42](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/issues/42) Cannot upload data when dataflow is not final.
- [dotstatsuite-data-lifecycle-manager#90](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager/issues/90) "Retrieve the number of observations" is not working correctly. 
- [dotstatsuite-core-transfer#44](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/issues/44) Transfer projects appear to allow old version of Common Nuget.
- [dotstatsuite-core-common#60](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-common/issues/60) Generic solution for "An invalid column length from the bcp client for colid" error.

---

### December 02, 2019
**[Release .Stat Suite JS milestone 7](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/7)**
>This new release concerns the **JavaScript JS** part of .Stat Suite, exclusively the **data-explorer** application.<br>

Major changes:

- [dotstatsuite-data-explorer#171](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/171) **Excel download with styles and colors** applied from the original Data Explorer table view.
- [dotstatsuite-data-explorer#128](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/128) **Additional downloads for external resources** can be added at the Dataflow level by using the SDMX annotation type **EXT_RESOURCE**.<br>
It is possible to relate a specific dataflow, in the SDMX Dataflow structure definition, to one or several materials (any type of file format) that are stored externally (outside .Stat Suite). The feature is supported by the SDMX annotation EXT_RESOURCE type, that is localised and defined at the dataflow level.<br>
<br>

**In the following example**, the dataflow structure definition contains 3 annotations of EXT_RESOURCE type for localised (in English and French) externally stored files to link to the datalfow. Each hyperlink can be enriched with a link to an image for its display as an icon of the link in the final representation: <br>

![Dataflow structure with external resources](/dotstatsuite-documentation/images/changelog_ext_res01.png)

Once published in the Data Explorer, the external resources related to the dataflow are available from the visualisation page (table and chart views) under the "Download" option, and in addition to the default data download links:

![Dataflow display with external sources](/dotstatsuite-documentation/images/changelog_ext_res02.png)

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

### November 19, 2019
**[Release .Stat Suite JS v3.0.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/6)**
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

### November 13, 2019
**[Release .Stat Suite .NET v2.0.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/issues?scope=all&utf8=%E2%9C%93&state=all&milestone_title=Release%20.Stat%20Suite%20.NET%20v2.0.0)**
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

### October 11, 2019
**Release .Stat Suite CORE services (GitLab milestone [Release BE 1](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/3))**

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

### October 08, 2019
**[Release .stat suite JS v2.0.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/2)**
>**NSI WS compatible versions**: this new release concerns only the JavaScript JS part of the .Stat Suite and is compatible with the NSI WS versions from **v7.xx to v7.8**. <br>

Major changes:

- [dotstatsuite-sdmx-faceted-search#32](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search/issues/32) Adapt the search service to use the new format of **localised elements in SDMX-JSON** formats
- [dotstatsuite-data-explorer#13](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/13) Table view with **indented children** for hierarchies in rows <br>
![RowLimit1](/dotstatsuite-documentation/images/Indented_Table.png)
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
![RowLimit1](/dotstatsuite-documentation/images/RowLimit1.png)
- [dotstatsuite-data-explorer#71](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/71) Extend the behavior of the **DEFAULT filter selections** by applying also items from search ; the sdmx DEFAULT annotation rule is combined with the end-user's selections from the search result page.

Minor changes:

- [dotstatsuite-data-explorer#81](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/81) **Time-Range selector** missing filter title and navigation bar
- [dotstatsuite-core-transfer#9](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/issues/9) **Performance test** scaling resources for Transfer and NSI webservices
- [dotstatsuite-data-explorer#88](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/88) The number of selected items of the **Time-Range selector** filter is displayed in the visualisation page.
- [dotstatsuite-share#2](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share/issues/2) Style, content and layout enhancements of the content of the **Share email** validation request
- [dotstatsuite-data-explorer#73](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/73) Change "Code" option in "Label format" to "Identifier" <br>
![Identifier](/dotstatsuite-documentation/images/Identifier.png)

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
![Time Period Selector](/dotstatsuite-documentation/images/TimePeriodSelector.png)
- [dotstatsuite-data-explorer#26](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/issues/26) **Share API** and publication workflow.<br>
The new Share service for table and chart sharing views (including url and embedded codes) relies on a **email validation workflow** process detailed [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share#publication-workflow).<br>
The end-user needs to provide a valid email address in order to receive a validation email along with the url and embedded code of the shared table or chart view.<br>  
![Share email](/dotstatsuite-documentation/images/ShareMail.png)
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

