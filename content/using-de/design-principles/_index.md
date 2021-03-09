---
title: "Design principles & functional vision"
subtitle: 
comments: false
weight: 200
keywords: [
  'Background and main objectives', '#background-and-main-objectives',
  'Navigation flow and information architecture', '#navigation-flow-and-information-architecture',
  'Design principles', '#design-principles',
  'Task performance', '#task-performance',
  'User autonomy', '#user-autonomy',
  'Feature criteria', '#feature-criteria',
  'Approach to regressions from .Stat V7 Web Browser', '#approach-to-regressions-from-stat-v7-web-browser',
  'Functional vision', '#functional-vision',
  'Page types', '#page-types',
  'Landing page', '#landing-page',
  'Search results', '#search-results',
  'Visualisation page', '#visualisation-page',
  'Data Explorer Search approach', '#data-explorer-search-approach',
  'Data Explorer Visualisation approach', '#data-explorer-visualisation-approach',
  'Data table visualisation', '#data-table-visualisation',
  'Functional evolutions', '#functional-evolutions',
  'Site search', '#site-search',
  'Spotlight search in navigation tree', '#spotlight-search-in-navigation-tree',
  'Theme tree navigation', '#theme-tree-navigation',
  'Popular queries', '#popular-queries',
  'Welcome text', '#welcome-text',
  'Language choice, login, contact information, user guide, home link, getting started', '#language-choice-login-contact-information-user-guide-home-link-getting-started',
  'Customise data selection for tables and charts', '#customise-data-selection-for-tables-and-charts',
  'Customise table layout', '#customise-table-layout',
  'Data download', '#data-download',
  'Developer query', '#developer-query',
  'Table sharing/embedding or bookmarking', '#table-sharing-embedding-or-bookmarking',
  'Full screen mode', '#full-screen-mode',
  'Hierarchical dimension selection', '#hierarchical-dimension-selection',
  'Responsiveness', '#responsiveness',
  'Web accessibility', '#web-accessibility',
  'Language support', '#language-support',
  'Charts', '#charts',
  'Table pagination', '#table-pagination',
  'Response time', '#response-time',
  'Annex 1: User personas of the OECD Data Portal', '#annex-1-user-personas-of-the-oecd-data-portal',
  'About these personas', '#about-these-personas',
  'Policy Advisor', '#policy-advisor',
  'Business Analyst', '#business-analyst',
  'Researcher / Statistician', '#researcher-statistician',
  'University Librarian', '#university-librarian',
  'Journalist', '#journalist',
  'NGO / Citizen with cause', '#ngo-citizen-with-cause',
  'Undergraduate Student', '#undergraduate-student',
  'Information Officer', '#information-officer',
  'PhD Student', '#phd-student',
  'General user', '#general-user',
  'General business user', '#general-business-user',
  'Annex 2: Use cases identified for the OECD Data Portal', '#annex-2-use-cases-identified-for-the-oecd-data-portal',
  'Preparing for a conference', '#preparing-for-a-conference',
  'Client business advice', '#client-business-advice',
  'Data crunching for a report', '#data-crunching-for-a-report',
  'Assisting advanced data query', '#assisting-advanced-data-query',
  'Creating a topical graphic', '#creating-a-topical-graphic',
  'Financial trends report', '#financial-trends-report',
  'Digging into the data', '#digging-into-the-data',
]

---

#### Table of Content

- [Background and main objectives](#background-and-main-objectives)
  - [Navigation flow and information architecture](#navigation-flow-and-information-architecture)
- [Design principles](#design-principles)
  - [Task performance](#task-performance)
  - [User autonomy](#user-autonomy)
  - [Feature criteria](#feature-criteria)
  - [Approach to regressions from .Stat V7 Web Browser](#approach-to-regressions-from-stat-v7-web-browser)
- [Functional vision](#functional-vision)
  - [Page types](#page-types)
  - [Landing page](#landing-page)
  - [Search results](#search-results)
  - [Visualisation page](#visualisation-page)
  - [Data Explorer Search approach](#data-explorer-search-approach)
  - [Data Explorer Visualisation approach](#data-explorer-visualisation-approach)
  - [Data table visualisation](#data-table-visualisation)
- [Functional evolutions](#functional-evolutions)
  - [Site search](#site-search)
  - [Spotlight search in navigation tree](#spotlight-search-in-navigation-tree)
  - [Theme tree navigation](#theme-tree-navigation)
  - [Popular queries](#popular-queries)
  - [Welcome text](#welcome-text)
  - [Language choice, login, contact information, user guide, home link, getting started](#language-choice-login-contact-information-user-guide-home-link-getting-started)
  - [Customise data selection for tables and charts](#customise-data-selection-for-tables-and-charts)
  - [Customise table layout](#customise-table-layout)
  - [Data download](#data-download)
  - [Developer query](#developer-query)
  - [Table sharing/embedding or bookmarking](#table-sharing-embedding-or-bookmarking)
  - [Full screen mode](#full-screen-mode)
  - [Hierarchical dimension selection](#hierarchical-dimension-selection)
  - [Responsiveness](#responsiveness)
  - [Web accessibility](#web-accessibility)
  - [Language support](#language-support)
  - [Charts](#charts)
  - [Table pagination](#table-pagination)
  - [Response time](#response-time)
- [Annex 1: User personas of the OECD Data Portal](#annex-1-user-personas-of-the-oecd-data-portal)
  - [About these personas](#about-these-personas)
  - [Policy Advisor](#policy-advisor) | [Business Analyst](#business-analyst) | [Researcher / Statistician](#researcher-statistician) | [University Librarian](#university-librarian) | [Journalist](#journalist) | [NGO / Citizen with cause](#ngo-citizen-with-cause) | [Undergraduate Student](#undergraduate-student) | [Information Officer](#information-officer) | [PhD Student](#phd-student) | [General user](#general-user) | [General business user](#general-business-user)
- [Annex 2: Use cases identified for the OECD Data Portal](#annex-2-use-cases-identified-for-the-oecd-data-portal)
  - [Preparing for a conference](#preparing-for-a-conference) | [Client business advice](#client-business-advice) | [Data crunching for a report](#data-crunching-for-a-report) | [Assisting advanced data query](#assisting-advanced-data-query) | [Creating a topical graphic](#creating-a-topical-graphic) | [Financial trends report](#financial-trends-report) | [Digging into the data](#digging-into-the-data) 

---

### Background and main objectives

The OECD and the SIS-CC have together invested significantly in the past years to develop and maintain an advanced statistical data dissemination solution, .Stat, which has gained high international recognition. One of the main reasons for the past success among many organisations is its features richness. Many features of the current [.Stat V7 end-user interface, the Web Browser](https://stats.oecd.org/), became popular and are highly appreciated under statisticians and experts groups, such as navigate through a statistical theme tree, display default views of highly-structured statistical tables with value flagging and referential metadata availability and view, and with the possibility to change selections (advanced dimension selector), adapt the table layout (e.g. pivot data dimensions on the table axes) and download the data in various formats (Excel, CSV and open data API query generator). These features are thus worthwhile to reconsider or maintain in future evolutions of the .Stat Suite. 

However, constant user feedback collected directly through the system, user surveys as well as specific tests have highlighted a number of usability issues in the .Stat v7 Web Browser. This clearly highlighted a number of drawbacks in the .Stat V7 Web Browser’s design and some feature overload leading to insufficient accessibility, comprehension and re-usability of the data. For instance, the dimension selector was not sufficiently prominent and underused. The table options and the query management were too complicated to access, sometimes confusing and thus rarely used by end-users. In situations where simpler table structures would be possible and desirable, the unique table design made such tables often too complex and difficult to read.

We cannot ignore these findings. One of the opportunities of the SDMX-based redevelopment of the .Stat Suite was an in-depth review of its features and design. Indeed, there might be better ways of achieving previous functionalities, e.g. through a better data modelling (decimals, scaling, empty rows/columns), a revisited table design for auto-generated tables (dimension hierarchies, empty axes, freezing panes) or through the usage of out-of-the-box browser’s functionality (query management through bookmarks and share feature).

Previous studies also contributed to this redesign. So did the work on the “OECD Data Portal”, a specific key indicator dissemination tool that presents the entry point at the OECD web site for accessing statistics. This [OECD Data Portal](https://data.oecd.org/) was developed from 2012 to 2014 in the context of a major programme to get OECD’s data open, accessible and free. The main differences between the OECD Data Portal and the .Stat Data Explorer in the OECD context are the scope of the data, the .Stat Data Explorer aiming at providing access to all of the organisation’s statistical data rather than to only key indicators, and providing additional features for specialised audiences, such as statistical experts. In other organisations’ contexts the .Stat Data Explorer might need to fulfil both of these scopes and features. The user personas and their use cases defined for the OECD Data Portal were therefore very useful contributions to the .Stat Data Explorer design. They can be found in:

- [Annex 1: User personas of the OECD Data Portal](#annex-1-user-personas-of-the-oecd-data-portal)
- [Annex 2: Use cases identified for the OECD Data Portal](#annex-2-use-cases-identified-for-the-oecd-data-portal)

Based on these studies, the objective of the .Stat Data Explorer can also be defined through the following user personas and use cases that correspond each to a typical user journey:

| User persona - Use case                                                                                                                                                                                                          |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Policy Advisor - Use case: Preparing for a conference**                                                                                                                                                                                                          |
| _Goal_: get further knowledge on a specific issue and latest thinking and research; looking for headline points but also supporting data and charts  <p/>                                                                                                           _Needs_: easy, straightforward navigation/search to appropriate recent data and charts with structured search results, quick comparison between countries, get also interim data, data download                                                                |
| **Business Analyst - Use case: Client business advice**                                                                                                                                                                                                            |
| _Goal_: get knowledge on specific situation, trends and forecasts, with comparison to other countries  <p/>                                                                                                                                                          _Needs_: easy, straightforward navigation/search to appropriate data, download for off-line processing, check of appropriate methodology, browse for related information                                                                                       |
| **Researcher / Statistician - Use case: Data crunching for a report**                                                                                                                                                                                              |
| _Goal_: compare specific countries' figures over time  <p/>                                                                                                                                                                                                          _Needs_: easy, straightforward navigation/search to appropriate data, download with clean data formats needed for working with professional software, bookmarking a link to a data view                                                                        |
| **University Librarian - Use case: Assisting advanced data query**                                                                                                                                                                                                 |
| _Goal_: compare specific data across different countries over time  <p/>                                                                                                                                                                                             _Needs_: easy, straightforward navigation/search to appropriate data, clear and comprehensive documentation, long time series, knowing when any new data comes out, ease data download in simple format                                                        |
| **Journalist - Use case: Creating a topical graphic**                                                                                                                                                                                                              |
| _Goal_: get informed about news and releases, and related data  <p/>                                                                                                                                                                                                 _Needs_: easy, straightforward navigation/search to appropriate data, news and related things (reports/charts), quick data enquiries for further exploration                                                                                                   |
| **NGO / Citizen with cause - Use case: Financial trends report**                                                                                                                                                                                                   |
| _Goal_: get trend reports on specific topic  <p/>                                                                                                                                                                                                                    _Needs_: easy, straightforward navigation/search to appropriate data, search results with well-identified content types, reports for context and locating further data, easy data download, notifications for data updates                                     |
| **Undergraduate Student - Use case: Digging into the data**                                                                                                                                                                                                        |
| _Goal_: knowledge in trends in specific topic and for significant breakdown data  <p/>                                                                                                                                                                               _Needs_: easy, straightforward navigation/search to appropriate data, assurance having found the right data, clearly explained default settings (like default selections), easy understanding of all available filters, clear levels of granularity/breakdowns |


These user personas and use cases are not necessarily fully complete and do not represent 100% truth. Specific user needs, especially those based on the particular expertise of statisticians who know best the statistical content to be disseminated, might not yet be correctly captured. But without harming related particular requirements, a systematically repeated, thus general, highly important need is a universal, easy and straightforward navigation and search capability to the appropriate data. From the point of view of all end-users, the needs can be summarised as:

### “Let me _easily_ access the organisation’s _statistical data_.
### Let me _find, understand and use the data I need_.”

The main goals of the .Stat Data Explorer are thus to make as easy as possible for every user:

- Finding the data through an efficient well-tuned navigation and search approach,
- Understand the data to make sure that the data found fit the user’s needs through appropriate data previews and contextual metadata
- Use the data through download in standard formats, APIs or share features.

To serve this need is the main objective of the .Stat Data Explorer design. While this expectation is easily pronounced and agreeable, it needs an in-depth and critical review of the previous .Stat V7 Web Browser functionality and a very innovative (if not revolutionary) and state-of-the-art approach for .Stat Data Explorer in order to achieve that challenging objective and to maintain the high international reputation of the .Stat Software in a fast evolving connected world. In order to achieve the necessary universality and simplicity, a careful parsimonious selection of the required features and their redesign is necessary. The .Stat Data Explorer can thus not be an exact copy of the .Stat v7 Web Browser. 

In this context, the application name “Data Explorer” might seem a bit misleading. The main goal of the application is actually not to provide a tool to the user to explore data exposed by the organisation. There are already many feature-rich tools available on the market or as open source software allowing for an optimal in-depth data exploration and analysis in the user’s own environments. It seems not sufficiently beneficial to provide today similar advanced data exploration functionality in the .Stat data dissemination software. A more precise, but less attractive name according to the main goals might have been “Data Grabber”. Another name could have been “Data Discovery Portal”.

The organisation’s data owners, such as statisticians or database specialists, while strongly contributing with their expertise to the design and choice of features, have function-related navigation and data display needs that can be quite different from the most external end-users. Therefore, ideally external users, and dissemination specialists should also be involved in the redesign, user acceptance and usability tests of the .Stat Data Explorer.

#### Navigation flow and information architecture

![DE navigation flow](/dotstatsuite-documentation/images/de-navigation-flow.png)

The combined navigation and search approach allows indexing and serving different content types. Statistical standard content can be served through CSV files and dynamically built easy-to-consume table and chart visualisations, as intended through the Visualisation page, while specialised expert content with particular requirements could be served through specific content types, e.g. statistical content requiring advanced highly-complex table structures could be served as ready-made tables and delivered easily directly as Excel tables rather than through expensive online features. Easy-to-consume tables is however not an attempt to oversimplify or abandon statistical completeness. The goal of the redesign is an increase of accessibility for a wider audience by fully preserving the full scope of the contained statistical information.

---

### Design principles

These have been presented and validated during the SIS-CC Annual workshop in April 2018 (see the [highlights report](https://siscc.org/wp-content/uploads/2018/10/sis-cc-workshop-2018-highlights-report.pdf)).

#### Task performance

- The long-term goal is to concentrate the UI on the added-value tasks of the users & (metadata-driven) automation of the rest. This is a difficult task, needs a lot of innovation and some time. In the short term, when otherwise not possible, conventional features are implemented.
- Reusing components and building on proven features of popular industry-standard tools such Excel, R, SDMX-RI, internet browsers, e.g. internet browser bookmark feature instead of self-built personal query management.

#### User autonomy

- Intuitive, clear, pro-active, guiding & well-termed user interfaces

To convey the quality of the data provided by the organisation, the visual appearance of the site frames the data content with whitespace, avoids visual clutter and ornaments, and guides the user’s eye visually to the relevant information.

#### Feature criteria

- It solves a problem the users actually have
- It's usable
- It isn't creating clutter

>“_Features are a double-edged sword. Releasing a great one could be the defining moment that takes your product to the next level. Explosive growth, overjoyed users, investor money raining down from the sky... (maybe.) 
But more often than not, new features become just another item in your ever-expanding navigation bar. One that's distracting your users away from the main reason they're there. As the list of features you add to your product grows, so does the impact they have on your UX, on your budget, and on the effectiveness of your team._” (https://info.usertesting.com/Features-Users-Want.html)

#### Approach to regressions from .Stat V7 Web Browser

Because the .Stat Data Explorer seeks for universality and simplicity and thus cannot be an exact copy of the .Stat v7 Web Browser, it becomes evident that a number of previous features need alternative approaches or in a few cases should be dropped completely. This might sometimes be disruptive, but such disruptions should be allowed if the simplicity and user-friendliness of the new approach allows for a quick adaption by the end-users. Also, specific very advanced features for expert audiences can be maintained though specific approaches, e.g. if a dataset needs specific advanced table formatting features, those features can be provided using the pivot table feature of Excel, a widespread popular industry-standard tool. Appropriate Excel files can be (pre-)generated upstream by the system based on the data owner’s formatting instructions (e.g. in SDMX annotations).

It is also to note that intense data remodelling work of data migrated from .Stat V7 to .Stat V8 is not an absolute requirement. Data from .Stat V7 can be visualised with a sufficient quality in the .Stat Data Explorer. However, the user experience and data accessibility can be increased also through an optimal data (re)modelling, e.g. by defining non-sparse dataflows and switching off non-used dimensions.

---

### Functional vision

- easily integrate in organization’s own web site, brand/localize,
- easily locate data from different (SDMX) sources (hub functionality),
- easily preview data (allowing validate the selection) and chart data in an assisted way that makes the data easily understandable
- easily download (Excel, CSV, API) small selections or complete datasets (dataflows)
- easily share (data selections) and embed (small data tables, charts)
- provide very advanced features for expert audiences through specific content types (e.g. ready-made Excel pivot tables)

#### Page types

We would like to keep the required page types for the Data Explorer to a minimum. This ensures a clear structure and a clearer and more coherent user journey. This is achieved by a consistent page layout and design whenever possible even if each page type has its own features, requirements and states. 

##### Landing page

- access to free-text search
- access to browsing by category, by concepts (e.g. country) and/or by data source

##### Search results

- access to browsing by content type (e.g. datasets, key indicators, ready-made tables, etc.)
- allow for instant drill-down within search results (through dynamic facets)
- direct download (e.g. complete CSV files, ready-made Excel pivot tables)

##### Visualisation page

- automated (metadata-driven) selections of dimensions
- instant data pre-view in easily comprehensive table format and basic chart types with configurable or automated layout
- allow for continued drill-down (e.g. through dynamic filter options) and selection changes
- allow for basic table and chart layout options
- allow for download in most common file formats (Excel with layout, CSV without layout) and Open Data API (SDMX web service query generator)

#### Data Explorer Search approach

The .Stat Data Explorer search must allow end-users to find the data.

The .Stat Data Explorer search design was strongly inspired by the OECD Data Portal design (https://data.oecd.org/, 2013-2014) complemented with state-of-the-art facetted search features successfully used today by many online library and most e-commerce sites. 

Facetted search is a technique which involves augmenting traditional search techniques with a facetted navigation system, allowing users to narrow down search results by applying multiple filters based on facetted classification of the items. A faceted classification system classifies each information element along multiple explicit dimensions, called facets, enabling the classifications to be accessed and ordered in multiple ways rather than in a single, pre-determined, taxonomic order. Facets correspond to properties of the information elements. 

>"_They are often derived by analysis of the text of an item using entity extraction techniques or from pre-existing fields in a database such as author, descriptor, language, and format. Thus, existing web-pages, product descriptions or online collections of articles can be augmented with navigational facets. Within the academic community, faceted search has attracted interest primarily among library and information science researchers, and to some extent among computer science researchers specializing in information retrieval. In 1933, the noted librarian Ranganathan proposed a faceted classification system for library materials, known as colon classification. In the pre-computer era, he did not succeed in replacing the pre-coordinated Dewey Decimal Classification system. Modern online library catalogs, also known as OPACs, have increasingly adopted faceted search interfaces. Noted examples include the North Carolina State University library catalog (part of the Triangle Research Libraries Network) and the OCLC Open WorldCat system. The CiteSeerX project at the Pennsylvania State University allows faceted search for academic documents and continues to expand into other facets such as table search. Faceted search has become later also a popular technique in commercial search applications, particularly for online retailers. An increasing number of enterprise search vendors provide software for implementing faceted search applications. Online retail catalogues pioneered the earliest applications of faceted search, reflecting both the faceted nature of product data (most products have a type, brand, price, etc.) and the ready availability of the data in retailers' existing information-systems. In the early 2000s retailers started using faceted search._"  (see https://en.wikipedia.org/wiki/Faceted_search) 

Examples of such online library and e-commerce sites are:

- https://onlinelibrary.wiley.com/
- https://catalogue.bnf.fr/index.do
- https://www.amazon.com/
- https://www.sarenza.com/

Facetted search has thus proven its high usability and user-friendliness already be the fact of its success in e-commerce sites those business success strongly depends on the usability of the web site.

In the .Stat Data Explorer context, facets can be easily built out of dataflow’s concepts and codelists, out of any categorisations, as well as out of other pieces of information such as data source (in the case of a hub) or content type (datasets, ready-made tables, key indicator, etc.).

The traditional statistical navigation through categorisations (topic or theme trees) remains one of the possible navigation scenarios in facetted search. However, this navigation is augmented with possibilities to combine with free-text search and filtering by other common data characteristics.

A rather new, promising but challenging feature idea, elaborated during the SIS-CC 2017 workshop, was dynamic facets. Facets are created out of the data dimensions which can largely differ from one dataset to another, and so also for the datasets returned in current search results. It is proposed to display the most common dimensions valid for the current search results. The challenge to be mastered here is a sufficient consistency in the navigation experience necessary for the user’s comprehension.

For consistency reasons to ease user comprehension, it is recommended to fix certain key facets, such as categorisations, time period and frequency, in a specific pre-defined (configurable) order.

The .Stat V7 Web Browser’s theme tree can be preserved conveniently as one of the .Stat Data Explorer facets. Classical navigation through a theme tree is thus still possible and remains intuitive. The theme tree facet can be configured to be displayed already on the landing page, and as (one of) the first facet(s) on the search result page. In the latter case, its facet could be opened automatically when arriving on the search result page. The so-called “Hub”-features, where data from different sources can be exposed with the .Stat Data Explorer, include also the possibility to expose other facets directly on the landing page, such as the data source facet or a facet created from a concept.

#### Data Explorer Visualisation approach

In order to assure a user journey that is the most consistent possible and thus easy to understand, the general layout of the visualisation page reuses the layout of the search result page: The facets are turned into filters for the specific dimensions of the visualised dataset, and kept at the same position. Data selection or filtering is thus always presented to the user at the same page position and with the same graphical design. The search result list is replaced with the dataset’s visualisation, either a table or a chart.

The data visualisation page visualises the data of a specific data entity, e.g. a dataflow, a ready-made table, an indicators, etc. The goal is not anymore to navigate between data entities, as in the search before, but to concentrate on one specific one. The filters in the .Stat Data Explorer visualisation must allow end-users to continue finding the data. Therefore, all search facets that do not represent the current data dimensions are hidden on the visualisation page, such as categorisations or data source. Also filters for data dimensions with only one possible value are hidden. Breadcrumbs and other links permit, however, to return easily to a navigation between data entities.

For consistency reasons to ease user comprehension, it is recommended to fix certain key filters, such as time period and frequency, in a specific pre-defined (configurable) order.

When navigating from the search result page to the visualisation page, the previous user selections or inputs (search terms, facet selections) should be maintained as appropriate. For instance, if the user searched for “France”, then “France” should be auto-selected in the Reference Area filter of the visualisation page. If the user selected “Monthly” in the frequency search facet, then the “Monthly” filter option in the visualisation page is auto-selected.

In addition, default selections in dimensions (e.g. defaults in break-down dimensions) made by the data owner per data entity (dataflow, ready-made table, indicator, etc.), and through automated business rules (e.g. based on data availability) should assure that the default table always shows the most appropriate data or at least a data selection that most likely helps and guides the user to further drill-down to the required data.

Users could also be forwarded from other sites (Google, links in organisation’s web site, etc.). The current visualisation context outside of a Data Explorer search and navigation needs thus to be completely clear.

The Data Explorer URL adapts as much as possible to the current visualisation state. This allows re-use of the browser’s bookmark functionality to easily retrieve the current visualisation (with its data entity, selections, and main layout settings) at a later point in time, or even to share the visualisation with other users through the URL link.

##### Data table visualisation

The .Stat Data Explorer online data table visualisation must allow end-users to understand the data.

The goal of the data table on the visualisation page is to provide a quick and easily understandable data preview rather than to push advanced publication-quality data tables to the end-user. The data table should allow the user in a glance to recognise the data (the measures, scope and quality), and to decide if the data fits his/her needs. It needs to be highly performant and very clear and sober. Overwhelming feature-richness of the standard pages would be penalising. In this context, performance is preferable to exhaustiveness. E.g., if the data selection is huge, then a fast preview of a first data slice is better than letting the user wait too long for a big table with the complete set of data points. However, it is important that the user is made aware when the data table is incomplete. Richer and more advanced features could be provided through specific menus and navigation paths, however they represent an investment and would also need to be maintained. 

The default layout of dynamic data tables can be defined by the data owner in the DLM through SDMX annotations, which means which dimensions should be positioned on which axis, provided that these dimensions have more than 1 value. Dimensions with only one value are shown in the table sub-title. For all dimensions without a default layout configuration, business rules based on SDMX concept roles automate the definition of the default layout. The table layout can still be changed interactively by the end-user.

The data owner should define (also in the DLM through SDMX annotations) the default selections of dimension values that are applied whenever the end-user has not done his own selections during the previous search or through URL parameters. It is recommended that data owners pre-select “Total” or “All” for all break-down dimensions, default reference areas, default indicators/variables/series and a default frequency for multi-frequency datasets. Note that “Not applicable” for switched-off dimensions would anyway be the only dimension value and doesn’t need to be preselected.

The data owner can (also in the DLM through SDMX annotations) define switched-off dimensions for which the single value (often “Not applicable”) is not shown in the table sub-title.

Also default language-dependent dimension value orders and alternative localised dimension value names that include the hierarchy information can be defined by the data owner in the DLM through SDMX annotations.

***Data table usability issue: Huge merge of cells combined with scrolling***

The most important usability issue in the previous table implementation was the possible _huge merge of cells together with scrolling_ that made tables complex and too difficult to read. In the below example, due to the dimension hierarchy and scrolling, it is cumbersome and sometimes impossible to see to which values of “Transaction” the figure '42 106.0' relates to:

![V7 vertical cell merge](/dotstatsuite-documentation/images/v7-vertical-cell-merge.png)

Similar for the horizontal axis:

![V7 horizontal cell merge](/dotstatsuite-documentation/images/v7-horizontal-cell-merge.png)

Freezing header rows or header columns would help to understand at least to which dimensions correspond the rows and columns. However, it still doesn’t allow to easily identify the precise dimension values of a specific data point.

The complexity induced by merged cells requires some significant intellectual gymnastics that statisticians and experts are used to (e.g. from Excel pivot tables), but cannot be imposed on every external user. Statisticians might be comfortable with an advanced statistical layout, but ordinary external users have a hard time with such tables. While e.g. ready-made Excel pivot tables can be provided for expert audiences for specific datasets requiring advanced features, the default online dynamic data tables for the large public could profit from a clearer design.

*Proposed approach:*

Vertically merged row header cells due to multiple dimensions on the vertical axis would be replaced by row section headers. This approach allows reducing the number of columns used for row headers, making the table narrower and reducing the need for horizontal scroll. When vertically scrolling, the current row section header together with the column headers can be frozen at the top of the table, which allows always being aware about the dimension values of the currently displayed cells.

In order to retain the information of the dimension hierarchy, or more precisely of the parents of the dimension values, row section headers can use the alternative dimension value names that include this information. The dimension hierarchy in the (last remaining) row header is preserved through indentation. 

Horizontally merged cells due to hierarchies in horizontal dimensions could be replaced by a flat list of values per dimension and using the alternative dimension value names.

**Comparison example** for the display of the same data in .Stat V7 Web Browser and .Stat Data Explorer: 

This example highlights that with the new layout data cells keep their exact order in the data grid, but that for each cell the context is always perfectly clear because the column headers (medium blue) and the row section header (dark blue) are sticky (frozen) at the top of the table.
This new table layout still allows putting several dimensions into the row headers when this is a requirement or eases the comprehension (especially when only certain row dimension combinations have data):

.Stat V7 Browser table:  
![v7-comparison-table.png](/dotstatsuite-documentation/images/v7-comparison-table.png)

.Stat Suite V8 Data Explorer table:  
![v8-comparison-table.png](/dotstatsuite-documentation/images/v8-comparison-table.png)

.Stat V7 Browser table 2:  
![v7-comparison-table2.png](/dotstatsuite-documentation/images/v7-comparison-table2.png)

.Stat Suite V8 Data Explorer table 2:  
![v8-comparison-table2.png](/dotstatsuite-documentation/images/v8-comparison-table2.png)

*Note*: The table element styles used here do not represent the final .Stat Data Explorer table element styles, and are customisable (brandable).

***Data table usability issue: Horizontal scrolling***

Horizontal scrolling represents a significant burden to an interface, and is discouraged for the design of the new .Stat Data Explorer. This is even more important when looking at the responsiveness requirements and the need to support smaller devices, especially tablets or even smartphones, where horizontal scrolling should be switched off. In this case, the .Stat Data Explorer should automatically pivot dimensions as required from the horizontal axis to the vertical axis when horizontal space is insufficient. Scrolling on those small device screens remains then consistently vertical. This setting is recommended even for larger screen sizes. The DE implementation should allow for a configuration of the screen size (from 0 to infinity) below which horizontal scrolling is automatically avoided by automated pivoting.

***Data table usability issue: multiple different, confusing selection features (customise menu, pivot table dropdowns)***

A further table simplification allowing to improve usability consists in replacing and merging the v7 ‘page’ dimensions dropdowns in the table header cells by the standard and always visible dimension selection bar on the left/right side of the .Stat Data Explorer visualisation page. In this way, all data selections are done in a single and clearer manner.
 
For specific dataflows where an easy switching between single dimension values is required, e.g. for expert audiences, this feature could still be provided. Also, for specific embedded views that need that feature, advanced embeddable tables could be generated and shared through the DLM.

***Data table usability issue: vertical sorting as overwhelming, rarely used feature***

Sorting is a presentational feature that is only very rarely used by external users. Considered rather clutter, it is not included in the original scope of the new data table.
 
In specific cases where vertical sorting is required for expert audiences, ready-made advanced (Excel Pivot) tables could be provided.

***General table formatting wireframe***

![de-general-table-formatting-wireframe.png](/dotstatsuite-documentation/images/de-general-table-formatting-wireframe.png)

_Note_: It is recommended to use only one single dimension at row level (light blue background). All other dimensions on the vertical axis should be displayed as row section headers (dark blue background), unless this is required by the underlying data, e.g. when 2 dimensions are correlated (and thus have mutually exclusive value pairs). This should be pre-configured per dataflow by the data owner in the DLM through SDMX annotations.
Like for .Stat V7 data tables, an extra row and column (grey background) are systematically shown to allow including links to some attributes and referential metadata.

In the .Stat Data Explorer table, empty rows and columns should always, if technically possible and performant enough, be hidden. This contributes to the goal, that the user would never be presented an empty (or almost empty) table.

---

### Functional evolutions

This section compares one by one the corresponding features of .Stat V7 Web Browser and .Stat V8 Data Explorer

#### Site search

- **.Stat V7 Web Browser**: This feature searches in all structural metadata and referential metadata. Only results in ready-made public (default) view are presented. Data not included in those views cannot be found. The previous feature that dynamically generated tables was replaced because it had no guarantee that the result tables contain any data and because it was too slow.

- **.Stat Data Explorer**: This feature searches in all structural metadata (for which related data are available) including descriptions defined for any of the indexed dataflows. At a later stage, result links could point to different content types (key indicators, dynamic views, ready-made advanced statistical tables). Search results can be further filtered on most common concepts of the current search results (facetted search). The filters take data availability into account and are applied when generating tables. Therefor, there is a higher chance that the finally displayed tables actually contain data.

#### Spotlight search in navigation tree

- **.Stat V7 Web Browser**: This feature searches within all theme texts.

- **.Stat Data Explorer**: This feature allows searching within the text of items of any given facet including the theme facet.

#### Theme tree navigation
 
- **.Stat V7 Web Browser**: This feature allows listing (and navigating to) all datasets that belong to a specific theme tree leaf.

- **.Stat Data Explorer**: This feature allows listing (and navigating to) all dataflows that belong to a specific theme tree leaf. It is made very prominent on the home page as one of the navigation features.

#### Popular queries

- **.Stat V7 Web Browser** Alternative tree navigation to the theme tree. 

- **.Stat Data Explorer**: Navigation through any additional facet, such as 'Popular queries', can be defined through categorisation within a category scheme.

#### Welcome text

- **.Stat V7 Web Browser**: Placeholder for otherwise empty main area. 

- **.Stat Data Explorer**: Higher focus on introduction through specific configurable home page.
 
#### Language choice, login, contact information, user guide, home link, getting started
 
- **.Stat V7 Web Browser**: In page header

- **.Stat Data Explorer**: Remains mainly in page header, but with more space/visibility

  - Home link
  - Language choice
  - Login
  - Accessibility support (switch)
  - Contact information (feedback), terms and conditions, user guide or chat: Can be included in organisation-specific footer.
 
#### Customise data selection for tables and charts
 
- **.Stat V7 Web Browser**: Popup accessible from special table menu or selector inside table. Colour-coding for dynamic data availability. Range selections, including for time of specific frequencies. Multiple frequencies can be selected and displayed.

- **.Stat Data Explorer**: Selections are made consistently on the left hand panel, which is always visible and accessible. Also includes additional panel with a summary of all current selections. Colour-coding for actual data availability to be extended for dynamic data availability. Range selections. Selection (and display) of single frequencies only to ease table readibility and to simplify selection feature.

#### Customise table layout

- **.Stat V7 Web Browser**: Advanced Excel-style pivot table with filter axis. Popup accessible from special table menu.

- **.Stat Data Explorer**: Simplified pivot table with enhanced sub-title instead of filter axis but with row sections. Popup accessible from special table menu. Advanced statistical tables could later maintain Excel-style pivot tables.
  
#### Data download

- **.Stat V7 Web Browser**: Popup accessible from special table menu. Supported formats (current selection): Excel (only current table data), CSV, SDMX, PC-Axis

- **.Stat Data Explorer**: Popup accessible from special table menu. Supported formats (current selection): Excel, CSV, CSV (full download) 

#### Developer query

- **.Stat V7 Web Browser**: Popup accessible from special table menu. Registration suggested. Supported formats (current selection): SDMX structures, SDMX data

- **.Stat Data Explorer**: Popup accessible from special table menu. Without registration. Supported formats (current selection): SDMX structures, SDMX data

#### Table sharing/embedding or bookmarking

- **.Stat V7 Web Browser**: Popup accessible from special table menu. Login required. Management of currently saved queries. Browser bookmarks not supported.

- **.Stat Data Explorer**: Sharing/embedding: Popup accessible from special table menu. E-mail required. Bookmarking: through native web browser bookmarks (favorites). 

#### Full screen mode

- **.Stat V7 Web Browser**: Not supported.

- **.Stat Data Explorer**: Available for all data visualisations (table/chart) to maximum space available for bigger tables.

#### Hierarchical dimension selection

- **.Stat V7 Web Browser**: Fully expandable/collapsible tree with selectable branches and leafs, very slow for bigger dimensions. 

- **.Stat Data Explorer**: Scope list tree (only the current branch is visible) with selectable leafs, increasing performance for bigger dimensions. Level selections. Bulk selection (all current branch items). 

#### Responsiveness

- **.Stat V7 Web Browser**: None.

- **.Stat Data Explorer**: Fully responsive for small and large devices. Automated table pivoting on small screens to avoid horizontal scrolling.

#### Web accessibility

- **.Stat V7 Web Browser**: None.

- **.Stat Data Explorer**: Minimum AA WCAG compliance, largely AAA WCAG compliance.

#### Language support

- **.Stat V7 Web Browser**: En, Fr (overwritable).

- **.Stat Data Explorer**: Any interface and content language (configurable). Full RTL support.

#### Charts

- **.Stat V7 Web Browser**: Popup accessible from special table menu. Requires Adobe Flash player. Poor chart customisations. Only works with small selections.

- **.Stat Data Explorer**:  Popup accessible from special table menu. No special software requirements. Easy chart sizing and customisations. Downloading of charts as images. Large selections are supported (but not all data might be displayed).

#### Table pagination

- **.Stat V7 Web Browser**: Fully supported.

- **.Stat Data Explorer**: Should be fully supported (SDMX API dependence).

#### Response time

- **.Stat V7 Web Browser**: Mostly acceptable. Slow for large dimensions.

- **.Stat Data Explorer**: For small to medium (max. 2500 tabls cells) tables should be fully fluent. Default views need to be well-defined by the data owners. Preference is for fast, small data pre-views in opposite to slow, large, complete "publication-like" tables.

---

### Annex 1: User personas of the OECD Data Portal

#### About these personas

User personas are simplified descriptions of typical users of a website or service. They are used to help keep user needs central to the design process of a new website. They are not created in order to provide or define solutions at this stage of the process.

A word of warning: user personas should only be considered as a hypothesis and they should be tested against reality (i.e. real users of the Data Portal and online data services.)

These personas were created from workshops at the OECD and user telephone interviews between September and November 2012. 

Participants were drawn from across the OECD and external users. They were asked to identify and then describe potential users of the OECD website and also to describe their own job roles and online interactions.

#### Policy Advisor

![dp-persona-policy-advisor.png](/dotstatsuite-documentation/images/dp-persona-policy-advisor.png)

#### Business Analyst

![dp-persona-business-analyst.png](/dotstatsuite-documentation/images/dp-persona-business-analyst.png)

#### Researcher / Statistician

![dp-persona-researcher-statistician.png](/dotstatsuite-documentation/images/dp-persona-researcher-statistician.png)

#### University Librarian

![dp-persona-university-librarian.png](/dotstatsuite-documentation/images/dp-persona-university-librarian.png)

#### Journalist

![dp-persona-journalist.png](/dotstatsuite-documentation/images/dp-persona-journalist.png)

#### NGO / Citizen with cause

![dp-persona-ngo-citizen-with-cause.png](/dotstatsuite-documentation/images/dp-persona-ngo-citizen-with-cause.png)

#### Undergraduate Student

![dp-persona-undergraduate-student.png](/dotstatsuite-documentation/images/dp-persona-undergraduate-student.png)

#### Information Officer

Will perform similar roles (i.e. performing data queries on request and curating the company’s research intelligence) to the Business Analyst, but without going as far as performing such in-depth analysis.

In a public office the Information Officer performs a ‘curation and dissemination’ role to the general public, highlighting important data and responding to data enquiries.

The information officer demonstrates similar, if not quite as technical behaviour to the University Librarian.

#### PhD Student

Similar to Researcher/Statistician but in a strictly academic context. Likely to liaise with University Librarian persona for assistance with advanced data searches.

#### General user

Interested in doing single fact lookups or quick country comparisons. See NGO / Citizen with Cause and Undergraduate use cases for more sophisticated general data users.

#### General business user

A general business user will be looking to answer real-world business questions like the Business Analyst, but won’t be performing such advanced analysis. However like the NGO/ Citizen with cause they will be looking to build a case.

***Image attributions***

- PA http://www.flickr.com/photos/33093975@N06/4302963467/
- BA http://www.flickr.com/photos/45393120@N07/6022241266/ 
- R/S http://www.flickr.com/photos/48889087714@N01/2489612746/
- UL http://www.flickr.com/photos/34756977@N00/5469517670/ 
- J http://www.flickr.com/photos/highwaysagency/6021688217/in/photostream
- NGO http://www.flickr.com/photos/8383084@N06/4589721703/
- UG http://www.flickr.com/photos/58447230@N00/5041727169/ 

---

### Annex 2: Use cases identified for the OECD Data Portal

Each of the use cases correspond to the most typical user journey for each of the user personas above.

#### Preparing for a conference

![dp-use-case-1-policy-advisor.png](/dotstatsuite-documentation/images/dp-use-case-1-policy-advisor.png)![dp-use-case-2-policy-advisor.png](/dotstatsuite-documentation/images/dp-use-case-2-policy-advisor.png)

#### Client business advice

![dp-use-case-1-business-analyst.png](/dotstatsuite-documentation/images/dp-use-case-1-business-analyst.png)![dp-use-case-2-business-analyst.png](/dotstatsuite-documentation/images/dp-use-case-2-business-analyst.png)

#### Data crunching for a report

![dp-use-case-1-researcher-statistician.png](/dotstatsuite-documentation/images/dp-use-case-1-researcher-statistician.png)![dp-use-case-2-researcher-statistician.png](/dotstatsuite-documentation/images/dp-use-case-2-researcher-statistician.png)

#### Assisting advanced data query

![dp-use-case-1-university-librarian.png](/dotstatsuite-documentation/images/dp-use-case-1-university-librarian.png)![dp-use-case-2-university-librarian.png](/dotstatsuite-documentation/images/dp-use-case-2-university-librarian.png)

#### Creating a topical graphic

![dp-use-case-1-journalist.png](/dotstatsuite-documentation/images/dp-use-case-1-journalist.png)![dp-use-case-2-journalist.png](/dotstatsuite-documentation/images/dp-use-case-2-journalist.png)

#### Financial trends report

![dp-use-case-1-ngo-citizen-with-cause.png](/dotstatsuite-documentation/images/dp-use-case-1-ngo-citizen-with-cause.png)![dp-use-case-2-ngo-citizen-with-cause.png](/dotstatsuite-documentation/images/dp-use-case-2-ngo-citizen-with-cause.png)

#### Digging into the data

![dp-use-case-1-undergraduate-student.png](/dotstatsuite-documentation/images/dp-use-case-1-undergraduate-student.png)![dp-use-case-2-undergraduate-student.png](/dotstatsuite-documentation/images/dp-use-case-2-undergraduate-student.png)
