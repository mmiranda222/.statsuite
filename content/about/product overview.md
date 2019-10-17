---
title: "Product overview and tentative high-level roadmap"
subtitle: 
comments: false
weight: 12
---

# Table of Content
- [introduction](#introduction)
- [details about the main .stat suite modules](#details-about-the-main-stat-suite-modules)
- [tentative high-level .stat suite product roadmap](#tentative-high-level-stat-suite-product-roadmap)

## Introduction

The .Stat Suite is a standard-based, componentised, open source platform for the efficient production and dissemination of high-quality statistical data. The product is based on the General Statistical Business Process Model (GSBPM) and the Statistical Data and Metadata eXchange (SDMX) standards and is driven by the Statistical Information System Collaboration Community (SIS-CC).

The .Stat Suite has three **main modules**: 

* **.Stat Data Explorer**: A front-office application for easy finding, understanding and using of data through an efficient well-tuned navigation and search approach, appropriate data previews and contextual metadata, and download in standard formats, APIs or share features.

* **.Stat Data Lifecycle Manager**: A set of adaptive back-office modules to efficiently and timely produce and (re-)use high quality statistical data by defining, running, automating, controlling and evaluating the underlying data processes.
 
* **.Stat Core**: A highly performing, secure SDMX Data Store based on standard protocols, to store and retrieve statistical data, structural and referential metadata, data process information and security settings.
 
![3 main modules](/images/home_splash.png)

---

## Details about the main .Stat Suite modules


### .Stat Data Explorer (DE)

**Functional vision from the user's perspective**: “*Let me easily access the organisation’s statistical data. Let me find, understand and use the data I need.*”

**Data user's needs**:

* Find the data through an efficient well-tuned navigation and search approach,
* Understand the data to make sure that the data found fits the user’s needs through appropriate data previews and contextual metadata,
* Use the data through downloadable standard formats, APIs or share features.

**Main features**:

* Faceted search (inspired from online libraries, the OECD Data Portal and e-commerce sites)
  * Free-text search (AND)
  * Browsing (through categories)
  * Results are datasets or other objects (charts…)
  * Fine-tuning results through dynamic facets
* Dataset View
  * Dataset overview
  * Table view
  * Chart view
  * Fine-tuning data selection through filters
  * Table/chart customisations
  * Downloads (comma-separated text, Excel, SDMX)
  * Sharing of table/chart
  * Developer API
  * Full screen view
* Beyond the features
  * Branding: easily integrate in organisation’s own web site, brand/localise
  * responsive design: adapt to device
  * fast response times
  * high web accessibility

**Landing page** with access to free-text search or to browsing by configurable concepts (e.g. browse by topic, referance area, data source).<br>
**Search result page** with access to browsing by content types and indexed concepts, instant drill-down within search results (through dynamic filtering), and direct download (e.g. full .csv data files).<br>
**Dataset view page** with automated (metadata-driven) selections of dimensions, instant data pre-view in easily comprehensive basic table formats and basic chart types, allow for continued drill-down and selection changes, configurable or automated table and chart layout options, downloads, share and Open Data API (SDMX query generator) features.<br>
**Configure** to a specific context managing various deployment modes, multiple data portals, integration with existing tools and applications, and different API endpoints.<br>

---

### .Stat Data Lifecycle Manager (DLM)

**Functional vision from the user's perspective**: “*Let me easily produce the organisation’s statistical data.Let me define, run, automate, control and evaluate the data processes I need.*”

**Statistical data producer's needs**:

* *Define* the data structures and processes with sufficient guidance and minimal pain according to the Generic Statistical Production Process (GSBPM)
* *Run* the processes in non-automatable situations
* *Automate* the processes through scheduled, metadata-driven workflows
* *Control* the processes using reports, notifications and non-automatable validations
* *Evaluate* the processes with help of activity report, usage & usability statistics

**The .Stat Data Lifecycle Manager is...**

* **...an adaptive back-office...** 

  1. The Data Lifecycle Manager (DLM) has the possibility of building the ‘*Enterprise resource planning (ERP) of official statistics*’ for usage around the globe
  1. But while functional requirements seem converging across the board in statistical organisations, and across the different steps of the data lifecycle, there exists *wide gaps in statistical and data modelling skills* under users, who have therefore *diverging levels of needs for guidance, terminology and automation or hiding of more advanced choices*. Indeed, methodology advisers (who usually are SDMX experts) need access to very advanced data modelling options, while many statisticians, especially in countries with lower capacity are more used to mainly deal with ad-hoc data tables.
  1. The DLM takes the huge challenge to provide features, approaches and terminologies that adapt to the strongly diverging needs of the users.

  Note: Enterprise resource planning (ERP) is defined as the ability to deliver an integrated suite of applications.     ERP tools share a common process and data model, covering the broad and deep end-to-end processes

* **...for statisticians, statistical assistants, data reporters, database managers, data scientists, economists/analysts, methodology advisers and release officers...**

* **...to efficiently and timely...**

  1. User efficiency is directly impacted by *user-friendliness* and the degree of *autonomy* that the user interface allows for. It must be intuitive, clear, pro-active, guiding & well-termed. Whenever possible, integration of well-known and appreciated tools (e.g. Excel, R) takes precedence over redevelopment of features. Times for training and user support can so be minimized.
  1. In the past, highest deficiencies of many tools were observed in the domains of data structure modelling and data collection (agreement of structures, entering/exchange of data). These should be the main areas to focus on.
  1. Timeliness refers to how quickly the data are available after the event or phenomenon they describe within the time period that permits the data to be of value and still acted upon. Currently, and with many private data providers emerging in this new digitalised economy, the speed with which statistical organisations deliver their data becomes mission critical. 
  1. Both efficiency and timeliness can be optimised by implementing a maximum degree of *automation* especially of lower-level tasks performed by users, as well as *high computing and algorithmic performance*.

* **...produce and (re-)use...**

  1. The business process steps for producing official statistical data have been standardised in the Generic Statistical Business Process Model (GSBPM): *specify needs, design, build, collect, process, analyse, disseminate, evaluate*.
  1. These steps are not necessarily linear. Users also often have different roles and intervene at different steps of the process. The current *process status* and *needs for actions* must therefore always be clear to all users, even if they are only involved partially.
  1. The DLM aims at progressively covering all of the GSBPM processes and sub-processes, so that users do not have to constantly switch between different tools. However, this will surely take some time. Meanwhile, *overall usability* and *coherence* must be assured, and it should be clear which *process steps* are *currently supported*.
  1. General increased integration within organisations between different specific statistical process flow instances and even with processes outside the scope of official statistical data production adds the need for an *open* approach with the DLM. It should facilitate the (re)use of the data by *combining and linking of data from different domains* and improve *data accessibility* both technically and humanly.

* **...high quality...**

  1. *Quality Assurance by design*, an ultimate objective of the .Stat Suite will be to enable organisations to bring further value as ‘Trusted quality data’ producers
  2. It includes:
      * Fully functional data design encouraging the application of *high-quality modelling standards* (SDMX Content-Oriented Guidelines) and therefore a high degree of *data structure harmonisation* at all levels;
      * Fully functional process design to execute the data cycle;
      * Reduced manual interventions through *automation* of data maintenance and lower-level tasks performed by users;
      * Assisting users in QA activities (such as VTL coded validations);
      * *Robust* data operations, including for large volumes, and fully assured *data integrity*;
      * UX Analytics to drive product design and quality task management.
  1. *Quality management* is an overarching process in GSBPM.

* **...statistical data...**

  1. *SDMX* was chosen as standard to model statistical data. It includes the following main structures:  
      * Multi-dimensional *cube* (DSD);
      * Dimension names (Concepts) and elements (Codelists);
      * *Views* on sub-cubes (Dataflows + Allowed Content Constraints);
      * Ownership (Agencies): only owners (users/user groups) can modify or delete a structure object;
      * Topics/themes (Categories);
      * *Data mapping rules* (Structure Sets);
      * Referential metadata (MSD).
    To foster harmonisation, all users within the organisation should have a general structure read access.
  1. In the future, *SDMX 3.0* should allow to fully model also *disaggregated data* (microdata) and its *geospatial location*, which will allow for extending the coverage of the data lifecycle towards original data collection. The appropriate management of confidentiality to protect privacy and personally identifiable information will then be very important.
  1. Users need to be able to easily *import, create, edit, transfer* and *export* these data structures. The underlying statistical business process in GSBPM is *design*.

* **...by defining,...**

  1. It’s the definition of the *data processes* (besides the definition of data structures) that will need the highest degree of *user guidance*. This corresponds to the statistical business process *build* in GSBPM.
  1. Data processes need always to be defined, independently from whether they are executed manually or automatically, and only once or in a repetitive manner. 
  1. The definition contains information about *what* needs to be done with *which data*, in other words:
      * What and where are the input data? How are they structured? What are the pre-requisites?
      * What actions should be performed on the input data, what parameters should be taken into account when executing these actions? Should actions be performed by *other users* (or user group)?
      * What should happen with the output data? In which way and where should they be stored? Who can *access* the output data and when?
      * What are the success/failure criteria for the data process?
  1. Special users should have the possibility to *limit certain actions* to certain (types/groups of) *users*.
  1. The user should be able to *store* the definition, so that it can be used at later or be reused by others. Due to the increasing amount of those definitions, they should be easily *manageable*.

* **...running,...**

  1. Once a *data process* is defined, the user can run it *manually*. 
  1. During the execution (especially for more time-intensive data processes) the user needs to be kept aware about the *progress status*. But most importantly, at the end of the data processing, the user needs to be fully informed in a convenient way about its *outcome* (full success, success with warnings, partial failures [this should be rare as transactional execution is preferable], complete failure). 
  1. If an error occurred, after correcting the underlying reason, it should be straightforward for the user to *rerun* the data process.
  1. Manual execution is mainly used in non-automatable situations, e.g. when the data source of the process is volatile, in one-off scenarios, or to test the correctness of the definition or the source data. 

* **...automating,...**

  1. Today’s statistical data production is globally still very much manual. Statisticians and other users execute most of the tasks themselves, including editing and moving of files, sending/receiving data per email, entering or uploading data into the system, etc. This can, and needs to be addressed and progressively replaced by automated executions. It is pre-conditioned by the availability and large widespread of tools like the DLM and so through a ground-breaking technology upgrade, but also by a change of standards and habits from organisational to the personal level. With automation, the role of the user changes from an executor to a definer and controller: defining and controlling the execution of processes are indeed more added-value tasks than executing them manually. Therefore more time can be spent on quality aspects of the data production.
  1. Automation requires the *definition of a trigger* for the automated execution of an already defined *data process*. It could be a specific *time schedule* or the *successful achievement of another* (preceding) *data process*, maybe combined with *a specific state of its output data* (so-called “metadata-driven” workflow). Indeed, this strong need contributed to empowering the ‘Metadata Management’ to an overarching GSBPM process.
  1. In automated scenarios, it is not appropriate that the user gets systematically informed about a full success. Here the “*management by exception*” principle applies allowing the user to get disturbed and be invited to intervene only when things go wrong.

* **...controlling,...** 

  1. The user needs *dashboard*-like features to allow him to fully understand at any point in time the current *progress and quality status* of the statistical data production *across all involved data processes*. 
  1. Some examples are: 
      * What were the *outcomes* (full success, success with warnings, partial failures [this should be rare as transactional execution is preferable], complete failure) of already executed data processes?
      * What is the current data process being executed or waiting for execution?
      * Which data reporters have already successfully submitted their data and when?
      * Are there currently any *data quality issues* in any step that need intervention?
      * What’s the current dissemination *status*?
      * *Who* has done *what* and *when*? (low-level activity report)
  1. Some situations require the generation of specific *data reports*, often building on *visual representations* (e.g. trend charts for plausibility analysis), e.g. in cases where validations are not currently automatable.

* **...and evaluating...** 

  1. This means the evaluation of a *specific instance of a statistical business process* in terms of *success compared to initial production goals*, and contributes to *identifying and prioritising potential improvements*.
  1. In the past, evaluation has often been seen as an optional extra. But it actually became one of the major *statistical business process* phases in GSBPM. The DLM should give this step the prominence it deserves. This is also part of the ‘Quality Assurance by design’. 
  1. Evaluation material can be produced in any other phase of the statistical business process instance or sub-process. It may take many forms, including feedback from users (surveys and UX analytics), process metadata (paradata), and system metrics (process performance, overall timeliness). Indeed, since timeliness is measurable, the DLM should provide prominent features to *track time-related bottle-necks* in the statistical business process instance and its data processes.
  1. *Dashboard*-like features include *high-level quality reports*, *high-level activity reports*, and *usage & usability statistics*. It must be possible to see the *progress* of the current statistical business process success *over time*.

* **...the underlying data processes...**

  1. Data processes are a subset of the statistical business processes defined in GSBPM: *collect, process, analyse, disseminate*. These are those that deal with the *actual statistical data* and *referential metadata*.
  1. The currently prioritised main data processes are:
      * Collect: Data *import* from various sources, *transfer, export* – with and w/o *structure mappings*;
      * Collect: Data *capture* (survey/collection/scraping; online/offline);
      * Collect: Data *editing* (grid);
      * Process: Data *validations* with VTL and reports;
      * Process: Data *calculations* (conversions, aggregations, estimations, indicator calculations) with VTL;
      * Analyse: Data *access* for internal data analysis and reuse;
      * Disseminate: Data *dissemination* and embargo management;
  1. Most often, these processes are executed in a very *repetitive* manner because data are being produced at specific rhythms, the most frequent ones being multi-annual, annual, quarterly, monthly and daily.

* **...powered by the .Stat Suite.**

  1. The DLM is one of the major components of the .Stat Suite, an open-source, *SDMX-based*, *web-based* modular platform covering the complete end-to-end data lifecycle.
  1. The DLM is composed of a set of back office modules and combines all data lifecycle management activities into *one user interface*. It is relying on a strong, robust and efficient SDMX backbone (.Stat CORE) through *standard protocols*. Due to the nature of the application, web accessibility and responsiveness are not prioritised, but some future modules, e.g. for data collection, might have stronger accessibility requirements. *Cloud-readiness* is mandatory.
  1. Different data versions throughout the statistical production process (e.g. test data, collected non-validated data, validated data not ready for dissemination, staging data, disseminated data, etc.) are managed through *data spaces*, which are logically fully separated SDMX endpoints/databases. These data spaces need to be defined to a high-level of flexibly depending on the specific needs of the instance of a statistical business process or organisational needs. It is very important that the user is always very clear about the data space (s)he is currently dealing with.
  1. The .Stat Suite is modular and open (architecture) by design. *Reusability* is also a key architectural principle. Thus, components such as *.Stat Data Explorer* should be reused also in the DLM to cover user needs when they are similar. Some adaption/configuration might be necessary to clarify the context.


**The .Stat Data Lifecycle Manager will consist of several functional modules**:

##### **Model** of SDMX data structures

* Multi-dimensional cubes (DSDs)
* Dimension names (Concepts)
* Views on sub-cubes (Dataflows + Allowed Content Constraints)
* Ownership (Agencies)
* Topics/themes (Categories)
* Data mapping rules (Structure Sets)
* Referential Metadata (MSDs)

Requires features for import, create, edit, transfer & export of data structures.

##### **Get**

* Data import, transfer & export with and without structure mappings from various sources
* Data capture (surveys/collection/scraping; online/offline)

##### **Edit**

* data grid data editing
* referential metadata edting

##### **Calculate**

* Data validations and reports
* Data calculations (conversions, aggregations, estimations, indicator calculations) with VTL

##### **Analyse**

* find, understand, reuse data (internal)

##### **Disseminate**

* --> see .Stat Data Explorer

##### **Flow**

* Workflows
* Data embargo

##### **Script**

* Task automation

##### **Track**

* Monitoring of processes
* Overall production evaluation

---


### .Stat Core

Highly performing and secure [SDMX](http://sdmx.org/) Data Stores based on standard protocols to store and retrieve statistical data, structural and referential metadata, data process information and security settings.

* **Store** structural artefacts (DSDs, codelists, Category Schemes, etc.), statistical data and attributes values, and referential metadata.
* **Secure** through strong encryption methods, choose a preferred authentication provider, manage user roles and permissions.
* **Localise** to enable users to browse in their preferred language, for both content and user interface elements supporting Latin and non-Latin characters types (English, French, Arabic, Spanish, etc.).
* **SDMX service(s)** ([based on NSI Web Service implementation](https://ec.europa.eu/eurostat/web/sdmx-web-services) that is part of Eurostat's SDMX Reference Infrastructure) for structure, data, attributes, and referential metadata.

---


## Tentative high-level .Stat Suite product roadmap

*Status of March 2019. Current projected roadmap open to adjustment depending on +/- change in resource capacity and Community member priorities:*

![Product roadmap](/images/Product_Roadmap.png)

