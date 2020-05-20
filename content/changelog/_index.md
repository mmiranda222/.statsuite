---
title: "Changelog"
subtitle: 
comments: false
weight: 120

---

<!-- 
ToC
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

![DE fixed issue for facet filter](/images/changelog-js4.2.0.png)

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

![DLM Excel-Addin](/images/dlm-wizard-01.png)

![DLM Excel-Addin](/images/dlm-wizard-02.png)

![DLM Excel-Addin](/images/dlm-wizard-03.png)

![DLM Excel-Addin](/images/dlm-wizard-04.png)

![DLM Excel-Addin](/images/dlm-wizard-05.png)

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

![MaxTexAttributeLength message](/images/maxtextattributelength.png)

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

