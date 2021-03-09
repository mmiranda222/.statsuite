---
title: "DLM product design & functional vision"
subtitle: 
comments: false
weight: 205
keywords: [
  'The vision', '#the-vision',
  'An adaptive back-office', '#an-adaptive-back-office',
  'Efficiently and timely', '#efficiently-and-timely',
  'Produce and (re)use', '#produce-and-re-use',
  'High quality', '#high-quality',
  'Statistical data', '#statistical-data',
  'The underlying data processes', '#the-underlying-data-processes',
  'Defining', '#defining',
  'Running', '#running',
  'Automating', '#automating',
  'Controlling', '#controlling',
  'Evaluating', '#evaluating',
  'Powered by the .Stat Suite', '#powered-by-the-stat-suite',
  'User personas', '#user-personas',
  'Methodology adviser', '#methodology-adviser',
  'Statistical assistant', '#statistical-assistant',
  'Statistician (manager of regular data cycle)', '#statistician-manager-of-regular-data-cycle',
  'Reporter', '#reporter',
  'Statistician (manager of high-frequency data cycle)', '#statistician-manager-of-high-frequency-data-cycle',
  'Database manager', '#database-manager',
  'Data scientist', '#data-scientist',
  'Economist / Policy analyst (through GUI)', '#economist-policy-analyst-through-gui',
  'Economist / Policy analyst (through programming)', '#economist-policy-analyst-through-programming',
  'Release officer', '#release-officer',
  'Past pain points', '#past-pain-points',
  'User journeys', '#user-journeys',
  'User Journey #0: a content manager (methodological adviser) maintains common artefacts, monitors content and reviews all structures', '#user-journey-0-a-content-manager-methodological-adviser-maintains-common-artefacts-monitors-content-and-reviews-all-structures',
  'User Journey #1A: a content manager helps the statisticians in the creation of the new project (specific statistical business process instance)', '#user-journey-1a-a-content-manager-helps-the-statisticians-in-the-creation-of-the-new-project-specific-statistical-business-process-instance',
  'User Journey #1B: a statistician designs new data structure(s)', '#user-journey-1b-a-statistician-designs-new-data-structures',
  'User Journey #1B-Bis: a statistician derives new data (sub) structure(s)', '#user-journey-1b-bis-a-statistician-derives-new-data-sub-structures',
  'User Journey #1C: a statistician designs new data views(s)', '#user-journey-1c-a-statistician-designs-new-data-viewss',
  'User Journey #1D: a statistician edits data structure(s)', '#user-journey-1d-a-statistician-edits-data-structures',
  'User Journey #1E: a statistician edits data view(s)', '#user-journey-1e-a-statistician-edits-data-views',
  'User Journey #2: a statistician runs a data and metadata collection', '#user-journey-2-a-statistician-runs-a-data-and-metadata-collection',
  'User Journey #3: a reporter submits data and metadata', '#user-journey-3-a-reporter-submits-data-and-metadata',
  'User Journey #4A: a statistician collects data and metadata manually (data import)', '#user-journey-4a-a-statistician-collects-data-and-metadata-manually-data-import',
  'User Journey #4B: a statistician creates a mapping', '#user-journey-4b-a-statistician-creates-a-mapping',
  'User Journey #5: a statistician enters data and metadata manually (data grid editing)', '#user-journey-5-a-statistician-enters-data-and-metadata-manually-data-grid-editing',
  'User Journey #6: a statistician validates data', '#user-journey-6-a-statistician-validates-data',
  'User Journey #7: a statistician calculates data (conversions, aggregations, estimations, indicator calculations) with VTL', '#user-journey-7-a-statistician-calculates-data-conversions-aggregations-estimations-indicator-calculations-with-vtl',
  'User Journey #8: a policy analyst accesses data (for internal data analysis and reuse)', '#user-journey-8-a-policy-analyst-accesses-data-for-internal-data-analysis-and-reuse',
  'User Journey #9: a statistician launches the data dissemination and manages embargo', '#user-journey-9-a-statistician-launches-the-data-dissemination-and-manages-embargo',
  'User Journey #10: a release officer controls public dissemination', '#user-journey-10-a-release-officer-controls-public-dissemination',
  'User Journey #11: a statistician automates and controls data processes', '#user-journey-11-a-statistician-automates-and-controls-data-processes',
  'User Journey #12: a statistician evaluates the project outcome at the end of the production cycle', '#user-journey-12-a-statistician-evaluates-the-project-outcome-at-the-end-of-the-production-cycle',
  'DLM navigation tree', '#dlm-navigation-tree',
]
---

#### Table of Content
- [The vision](#the-vision)
  - [An adaptive back-office](#an-adaptive-back-office)
  - [Efficiently and timely](#efficiently-and-timely)
  - [Produce and (re)use](#produce-and-re-use)
  - [High quality](#high-quality)
  - [Statistical data](#statistical-data)
  - [The underlying data processes](#the-underlying-data-processes)
  - [Defining](#defining)
  - [Running](#running)
  - [Automating](#automating)
  - [Controlling](#controlling)
  - [Evaluating](#evaluating)
  - [Powered by the .Stat Suite](#powered-by-the-stat-suite)
- [User personas](#user-personas)
  - [Methodology adviser](#methodology-adviser) | [Statistical assistant](#statistical-assistant) | [Statistician (manager of regular data cycle)](#statistician-manager-of-regular-data-cycle) | [Reporter](#reporter) | [Statistician (manager of high-frequency data cycle)](#statistician-manager-of-high-frequency-data-cycle) | [Database manager](#database-manager) | [Data scientist](#data-scientist) | [Economist / Policy analyst (through GUI)](#economist-policy-analyst-through-gui) | [Economist / Policy analyst (through programming)](#economist-policy-analyst-through-programming) | [Release officer](#release-officer)
- [Past pain points](#past-pain-points)
- [User journeys](#user-journeys)
  - [User Journey #0: a content manager (methodological adviser) maintains common artefacts, monitors content and reviews all structures](#user-journey-0-a-content-manager-methodological-adviser-maintains-common-artefacts-monitors-content-and-reviews-all-structures) | [User Journey #1A: a content manager helps the statisticians in the creation of the new project (specific statistical business process instance)](#user-journey-1a-a-content-manager-helps-the-statisticians-in-the-creation-of-the-new-project-specific-statistical-business-process-instance) | [User Journey #1B: a statistician designs new data structure(s)](#user-journey-1b-a-statistician-designs-new-data-structures) | [User Journey #1B-Bis: a statistician derives new data (sub) structure(s)](#user-journey-1b-bis-a-statistician-derives-new-data-sub-structures) | [User Journey #1C: a statistician designs new data views(s)](#user-journey-1c-a-statistician-designs-new-data-viewss) | [User Journey #1D: a statistician edits data structure(s)](#user-journey-1d-a-statistician-edits-data-structures) | [User Journey #1E: a statistician edits data view(s)](#user-journey-1e-a-statistician-edits-data-views) | [User Journey #2: a statistician runs a data and metadata collection](#user-journey-2-a-statistician-runs-a-data-and-metadata-collection) | [User Journey #3: a reporter submits data and metadata](#user-journey-3-a-reporter-submits-data-and-metadata) | [User Journey #4A: a statistician collects data and metadata manually (data import)](#user-journey-4a-a-statistician-collects-data-and-metadata-manually-data-import) | [User Journey #4B: a statistician creates a mapping](#user-journey-4b-a-statistician-creates-a-mapping) | [User Journey #5: a statistician enters data and metadata manually (data grid editing)](#user-journey-5-a-statistician-enters-data-and-metadata-manually-data-grid-editing) | [User Journey #6: a statistician validates data](#user-journey-6-a-statistician-validates-data) | [User Journey #7: a statistician calculates data (conversions, aggregations, estimations, indicator calculations) with VTL](#user-journey-7-a-statistician-calculates-data-conversions-aggregations-estimations-indicator-calculations-with-vtl) | [User Journey #8: a policy analyst accesses data (for internal data analysis and reuse)](#user-journey-8-a-policy-analyst-accesses-data-for-internal-data-analysis-and-reuse) | [User Journey #9: a statistician launches the data dissemination and manages embargo](#user-journey-9-a-statistician-launches-the-data-dissemination-and-manages-embargo) | [User Journey #10: a release officer controls public dissemination](#user-journey-10-a-release-officer-controls-public-dissemination) | [User Journey #11: a statistician automates and controls data processes](#user-journey-11-a-statistician-automates-and-controls-data-processes) | [User Journey #12: a statistician evaluates the project outcome at the end of the production cycle](#user-journey-12-a-statistician-evaluates-the-project-outcome-at-the-end-of-the-production-cycle)
- [DLM navigation tree](#dlm-navigation-tree)

---

### The vision

#### *"Let me efficiently and timely produce and (re)use high quality statistical data, taking into account my specific needs. Let me define, run, automate, control and evaluate the data processes I need."*

Building the .Stat Data Lifecycle Manager (DLM) as an **adaptive back-office**  
For statisticians, data reporters, database managers, data scientists, economists/analysts, methodology advisers and release officers  
To **efficiently and timely produce and (re)use high quality statistical data**  
By defining, running, automating, controlling, and evaluating the **underlying data processes**  
Powered by the **.Stat Suite**.

#### An adaptive back-office
1.	The DLM has the possibility of building the **‘Enterprise resource planning ERP(*) of official statistics’** for usage around the globe.
2.	But while functional requirements seem converging across the board in statistical organisations, and across the different steps of the data lifecycle, there exists **wide gaps in statistical and data modelling skills** under users, who have therefore **diverging levels of needs for guidance, terminology and automation or hiding of more advanced choices**. Indeed, methodology advisers (who usually are SDMX experts) need access to very advanced data modelling options, while many statisticians, especially in countries with lower capacity are more used to mainly deal with ad-hoc data tables.
3.	The DLM takes the huge challenge to provide features, approaches and terminologies that adapt to the strongly diverging needs of the users.

(*) Enterprise resource planning (ERP) is defined as the ability to deliver an integrated suite of applications. ERP tools share a common process and data model, covering the broad and deep end-to-end processes.

#### Efficiently and timely
1.	User efficiency is directly impacted by **user-friendliness** and the degree of autonomy that the user interface allows for. It must be intuitive, clear, pro-active, guiding & well-termed. Whenever possible, integration of well-known and appreciated tools (e.g. Excel, R) takes precedence over redevelopment of features. Times for training and user support can so be minimized.
2.	In the past, highest deficiencies of many tools were observed in the domains of data structure modelling and data collection (agreement of structures, entering/exchange of data). These should be the main areas to focus on.
3.	Timeliness refers to how quickly the data are available after the event or phenomenon they describe within the time period that permits the data to be of value and still acted upon. Currently, and with many private data providers emerging in this new digitalised economy, the speed with which statistical organisations deliver their data becomes mission critical. 
4.	Both efficiency and timeliness can be optimised by implementing a maximum degree of **automation** especially of lower-level tasks performed by users, as well as **high computing and algorithmic performance**.

#### Produce and (re)use
1.	The business process steps for producing official statistical data have been standardised in the Generic Statistical Business Process Model (GSBPM): **specify needs, design, build, collect, process, analyse, disseminate, evaluate**.
2.	These steps are not necessarily linear. Users also often have different roles and intervene at different steps of the process. The current **process status** and **needs for actions** must therefore always be clear to all users, even if they are only involved partially.
3.	The DLM aims at progressively covering all of the GSBPM processes and sub-processes, so that users do not have to constantly switch between different tools. However, this will surely take some time. Meanwhile, **overall usability** and **coherence** must be assured, and it should be clear which **process steps** are **currently supported**.
4.	General increased integration within organisations between different specific statistical process flow instances and even with processes outside the scope of official statistical data production adds the need for an open approach with the DLM. It should facilitate the (re)use of the data by **combining and linking of data from different domains** and improve **data accessibility** both technically and humanly.

#### High quality
1.	**Quality Assurance by design**, an ultimate objective of the .Stat Suite, will be to enable organisations to bring further value as ‘Trusted quality data’ producers.
2.	It includes:
  * Fully functional data design encouraging the application of **high-quality modelling standards** (SDMX Content-Oriented Guidelines) and therefore a high degree of **data structure harmonisation** at all levels;
  * Fully functional process design to execute the data cycle;
  * Reduced manual interventions through **automation** of data maintenance and lower-level tasks performed by users;
  * Assisting users in QA activities (such as VTL coded validations);
  * **Robust** data operations, including for large volumes, and fully assured **data integrity**;
  * UX Analytics to drive product design and quality task management.
3.	**Quality management** is an overarching process in GSBPM.

#### Statistical data
1.	**SDMX** was chosen as standard to model statistical data. It includes the following main structures:  
  * Multi-dimensional **cube** (DSD);
  * Dimension names (Concepts) and elements (Codelists);
  * **Views** on sub-cubes (Dataflows + Allowed Content Constraints);
  * Ownership (Agencies): only owners (users/user groups) can modify or delete a structure object;
  * Topics/themes (Categories);
  * **Data mapping rules** (Structure Sets);
  * Referential metadata (MSD).

To foster harmonisation, all users within the organisation should have a general structure read access.  

2.	In the future, **SDMX 3.0** should allow to fully model also **disaggregated data** (microdata) and its **geospatial location**, which will allow for extending the coverage of the data lifecycle towards original data collection. The appropriate management of confidentiality to protect privacy and personally identifiable information will then be very important.
3.	Users need to be able to easily **import, create, edit, transfer** and **export** these data structures.  
The underlying statistical business process in GSBPM is **design**.

#### The underlying data processes
1.	Data processes are a subset of the statistical business processes defined in GSBPM: **collect, process, analyse, disseminate**. These are those that deal with the **actual statistical data** and **referential metadata**.
2.	The currently prioritised main data processes are:
  * Collect: Data **import** from various sources, **transfer**, **export** – with and w/o structure mappings;
  * Collect: Data **capture** (survey/collection/scraping; online/offline);
  * Collect: Data **editing** (grid);
  * Process: Data **validations** with VTL and reports;
  * Process: Data **calculations** (conversions, aggregations, estimations, indicator calculations) with VTL;
  * Analyse: Data **access** for internal data analysis and reuse;
  * Disseminate: Data **dissemination** and embargo management;
3.	Most often, these processes are executed in a very **repetitive** manner because data are being produced at specific rhythms, the most frequent ones being multi-annual, annual, quarterly, monthly and daily.

#### Defining
1.	It is the definition of the **data processes** (besides the definition of data structures) that will need the highest degree of **user guidance**. This corresponds to the statistical business process **build** in GSBPM.
2.	Data processes need always to be defined, independently from whether they are executed manually or automatically, and only once or in a repetitive manner. 
3.	The definition contains information about **what** needs to be done with **which data**, in other words:
  * What and where are the input data? How are they structured? What are the pre-requisites?
  * What actions should be performed on the input data, what parameters should be taken into account when executing these actions? Should actions be performed by **other users** (or user group)?
  * What should happen with the output data? In which way and where should they be stored? Who can **access** the output data and when?
  * What are the success/failure criteria for the data process?
4.	Special users should have the possibility to **limit certain actions** to certain (types/groups of) **users**.
5.	The user should be able to **store** the definition, so that it can be used at later or be reused by others. 
Due to the increasing amount of those definitions, they should be easily **manageable**.

#### Running
1.	Once a **data process** is defined, the user can run it **manually**. 
2.	During the execution (especially for more time-intensive data processes) the user needs to be kept aware about the **progress status**. But most importantly, at the end of the data processing, the user needs to be fully informed in a convenient way about its **outcome** (full success, success with warnings, partial failures - this should be rare as transactional execution is preferable -, complete failure). 
3.	If an error occurred, after correcting the underlying reason, it should be straightforward for the user to **rerun** the data process.
4.	Manual execution is mainly used in non-automatable situations, e.g. when the data source of the process is volatile, in one-off scenarios, or to test the correctness of the definition or the source data. 

#### Automating
1.	Today’s statistical data production is globally still very much manual. Statisticians and other users execute most of the tasks themselves, including editing and moving of files, sending/receiving data per email, entering or uploading data into the system, etc. This can, and needs to be addressed and progressively replaced by automated executions. It is pre-conditioned by the availability and large widespread of tools like the DLM and so through a ground-breaking technology upgrade, but also by a change of standards and habits from organisational to the personal level. With automation, the role of the user changes from an executor to a definer and controller: defining and controlling the execution of processes are indeed more added-value tasks than executing them manually. Therefore more time can be spent on quality aspects of the data production.
2.	Automation requires the **definition of a trigger** for the automated execution of an already defined **data process**. It could be a specific **time schedule** or the **successful achievement of another** (preceding) **data process**, maybe combined with **a specific state of its output data** (so-called “metadata-driven” workflow). Indeed, this strong need contributed to empowering the ‘Metadata Management’ to an overarching GSBPM process.
3.	In automated scenarios, it is not appropriate that the user gets systematically informed about a full success. Here the **“management by exception”** principle applies allowing the user to get disturbed and be invited to intervene only when things go wrong.

#### Controlling
1.	The user needs **dashboard**-like features to allow him to fully understand at any point in time the current **progress and quality status** of the statistical data production **across all involved data processes**. 
2.	Some examples are: 
  * What were the **outcomes** (full success, success with warnings, partial failures - this should be rare as transactional execution is preferable -, complete failure) of already executed data processes?
  * What is the current data process being executed or waiting for execution?
  * Which data reporters have already successfully submitted their data and when?
  * Are there currently any **data quality issues** in any step that need intervention?
  * What’s the current dissemination **status**?
  * **Who** has done **what** and **when**? (low-level activity report)
3.	Some situations require the generation of specific **data reports**, often building on **visual representations** (e.g. trend charts for plausibility analysis), e.g. in cases where validations are not currently automatable.

#### Evaluating
1.	This means the evaluation of a **specific instance of a statistical business process** in terms of **success compared to initial production goals**, and contributes **to identifying and prioritising potential improvements**.
2.	In the past, evaluation has often been seen as an optional extra. But it actually became one of the major **statistical business process** phases in GSBPM. The DLM should give this step the prominence it deserves. This is also part of the ‘Quality Assurance by design’. 
3.	Evaluation material can be produced in any other phase of the statistical business process instance or sub-process. It may take many forms, including feedback from users (surveys and UX analytics), process metadata (paradata), and system metrics (process performance, overall timeliness). Indeed, since timeliness is measurable, the DLM should provide prominent features to **track time-related bottle-necks** in the statistical business process instance and its data processes.
4.	**Dashboard**-like features include **high-level quality reports**, **high-level activity reports**, and **usage & usability statistics**. It must be possible to see the **progress** of the current statistical business process success **over time**.

#### Powered by the .Stat Suite
1.	The DLM is one of the major components of the .Stat Suite, an open-source, **SDMX-based**, **web-based** modular platform covering the complete end-to-end data lifecycle.
2.	The DLM is composed of a set of back office modules and combines all data lifecycle management activities into **one user interface**. It is relying on a strong, robust and efficient SDMX backbone (.Stat CORE) through **standard protocols**. Due to the nature of the application, web accessibility and responsiveness are not prioritised, but some future modules, e.g. for data collection, might have stronger accessibility requirements. **Cloud-readiness** is mandatory.
3.	Different data versions throughout the statistical production process (e.g. test data, collected non-validated data, validated data not ready for dissemination, staging data, disseminated data, etc.) are managed through **data spaces**, which are logically fully separated SDMX endpoints/databases. These data spaces need to be defined to a high-level of flexibly depending on the specific needs of the instance of a statistical business process or organisational needs. It is very important that the user is always very clear about the data space (s)he is currently dealing with.
4.	The .Stat Suite is modular and open (architecture) by design. **Reusability** is also a key architectural principle. Thus, components such as **.Stat Data Explorer** should be reused also in the DLM to cover user needs when they are similar. Some adaption/configuration might be necessary to clarify the context.

---

### User personas

![DLM personas](/dotstatsuite-documentation/images/dlm-personas.png)

#### Methodology adviser

![DLM persona](/dotstatsuite-documentation/images/dlm-persona-01.png)

#### Statistical assistant

![DLM persona](/dotstatsuite-documentation/images/dlm-persona-02.png)

#### Statistician (manager of regular data cycle)

![DLM persona](/dotstatsuite-documentation/images/dlm-persona-03.png)

#### Reporter

![DLM persona](/dotstatsuite-documentation/images/dlm-persona-04.png)

#### Statistician (manager of high-frequency data cycle)

![DLM persona](/dotstatsuite-documentation/images/dlm-persona-05.png)

#### Database manager

![DLM persona](/dotstatsuite-documentation/images/dlm-persona-06.png)

#### Data scientist

![DLM persona](/dotstatsuite-documentation/images/dlm-persona-07.png)

#### Economist / Policy analyst (through GUI)

![DLM persona](/dotstatsuite-documentation/images/dlm-persona-08.png)

#### Economist / Policy analyst (through programming)

![DLM persona](/dotstatsuite-documentation/images/dlm-persona-09.png)

#### Release officer

![DLM persona](/dotstatsuite-documentation/images/dlm-persona-10.png)

---

### Past pain points

* Never heard about standards like SDMX, GSBPM and GSIM

* Do not master the common statistical tools such as Stata, R, SAS, SPSS neither other tools or languages SQL, Prognoz, SAS, SQL

* Repetitive tasks, such as quantitative or qualitative questionnaires prefilling

* Performance problems with SQL to carry out heavy calculations

* Too much interactions with the IT department to be able to manage the volume of data

* Limited in the size of the datasets due to issue on loading high volume of data

* Being able to manage\store microdata, having easily access to a large storage space and being able to run heavy calculations without running out of memory

* Web scraping done outside of the OECD environment with the risk of IP address blocked by the web site that is scraped

* Find a simple way to deal with data (their values, trends, relationships, their impact due to the changes\updates\calculations)

* Make the data\information easily accessible and less disperse

* Being able to produce charts directly with the statistical analytic tools

* Diversity of the tools (wish on track to unify them under the same user interface)

* Missing workflow system to manage the status of any datasets

---

### User journeys
#### User Journey #0: A content manager (methodological adviser) maintains common artefacts, monitors content and reviews all structures
1. Browse through all artefacts in all statistical domains/categories/categoryschemes in all data spaces, by maintenance agency, by version (final, latest, all).
2. Easily design new, view, edit and delete (unused) common, recommended and mandatory artefacts (with maintenance agencies “SDMX”, “MYORG”):  
  2.1. CategorySchemes* (for topics and statistical domains) -> See user journey [#1A](#user-journey-1a-a-content-manager-helps-the-statisticians-in-the-creation-of-the-new-project-specific-statistical-business-process-instance)  
  2.2. ConceptSchemes* (incl. for roles, referential metadata, …)  
  2.3. Codelists* (incl. for dimensions, for attributes, for referential metadata, annotations for Alternative Labels)  
3. Design new, view, edit and delete (unused) domain-specific artefacts (with maintenance agency “DomainX”):  
  3.1. Domain’s ConceptScheme*, Domain’s Codelists, Categorisations* -> see journeys [#1A](#user-journey-1a-a-content-manager-helps-the-statisticians-in-the-creation-of-the-new-project-specific-statistical-business-process-instance) and [#1B](#user-journey-1b-a-statistician-designs-new-data-structures)  
  3.2. DSDs*, Dataflows*, Allowed content constraints (restrictions on lists of codes)* -> see journeys [#1B](#user-journey-1b-a-statistician-designs-new-data-structures) & [#1C](#user-journey-1c-a-statistician-designs-new-data-viewss)  
  3.3. Structure Set* (for mapping) -> see journey [#4A](#user-journey-4a-a-statistician-collects-data-and-metadata-manually-data-import)  
4. AgencySchemes cannot be edited because they are inherited from user groups (“SDMX” parent agency is hardcoded because obligatory).
5. Can define the languages to be supported at the .Stat Suite instance.
6. Save the (partially ready) artefacts, return to its editing at any time, and submit to the DB in one or several spaces.

(*) All artefacts need ID, Agency (selected from his agency list), version (1.0 by default), name(s), description(s), annotation(s), isfinal. Names, descriptions, annotations can be entered in several languages. User should get a warning when required translations of some data structure elements are missing.

#### User Journey #1A: A content manager helps the statisticians in the creation of the new project (specific statistical business process instance)
1. For the first data space, define if the project fits under an existing statistical domain or if a new statistical domain is needed.
2. In the case of a new statistical domain is needed, for all data spaces:  
  2.1. Define the statistical domain as a category* and its position in the category scheme of statistical domains  
  2.2. Define the statistical domain owner (Maintenance Agency and representing users/user group)  
  2.3. Browse and see the concepts from cross-domain concept scheme  
  2.4. Browse and see the default values (codes) of each concept and the other available lists of codes  
  2.5. Identify new yet missing concepts and lists of codes  
  2.6. Define the domain-specific concept scheme containing all concepts* of the domain, including those concepts that are in parallel maintained or defined as cross-domain concepts, based on a template including pre-selected commonly used concepts (domain-specific concept scheme is managed centrally by CM)  
  2.7. Define new cross-domain and domain-specific lists of codes* (cross-domain lists of codes are managed by CM) (domain-specific lists of codes, e.g. by deriving from an existing cross-domain list, and restricting the list of codes to a subset of codes (whitelist / blacklist). They are managed by CM or domain manager?)  
3. For an existing statistical domain:  
  3.1. Browse and see the concepts from the domain-specific concept scheme  
  3.2. Browse and see the default values (codes) of each concept and the other available lists of codes  
  3.3. Do a gap analysis between the need and the existing domain-specific concepts to identify new yet missing concepts and lists of codes  
  3.4. If necessary, update the domain-specific concept scheme with new concepts*, including those concepts that are in parallel defined as cross-domain concepts  
  3.5. If necessary, define new cross-domain and domain-specific lists of codes*  
4. Save the (partially ready) artefacts, return to its editing at any time, and submit to the DB in one or several spaces.

(*) All artefacts need ID, Agency (selected from his agency list), version (1.0 by default), name(s), description(s), annotation(s), isfinal. Names, descriptions, annotations can be entered in several languages. User should get a warning when required translations of some data structure elements are missing.

#### User Journey #1B: A statistician designs new data structure(s)
1. If not already done, select and enter a data space and a statistical domain, browse and see:  
  2.1. the concept scheme already defined within the statistical domain, the concepts and their roles (REF_AREA, FREQ, TIME_PERIOD, UNIT_MEASURE, UNIT_MULT, REF_PERIOD, OBS_STATUS, CONF_STATUS, OBS_VALUE, etc.).  
  2.2. the default list of values (codes) of each concept, and the other lists of codes already defined within the domain.  
  2.3. the data structures already defined within the domain.  
2. Define the concepts to be used for the new data structure:  
  2.1. see mandatory (FREQ) and recommended concepts which are automatically pre-selected, unselect recommended concepts if necessary.  
  2.2. select additional concepts from the list.  
  2.3. remove default or attach new roles for each concept from a list of pre-defined roles (specific common concept scheme for roles).  
  2.4. if necessary, define a representation for a concept (e.g. cross-domain or domain-specific list of codes, text, integer, …) when the default representation is not appropriate, except for the TIME_PERIOD concept. Restrict the representation (whitelist / blacklist) as required, e.g. subset of codes for list of codes.  
  2.5. change the order of selected concepts (not allowed?) FREQ is always the first concept.  
  2.6. define the function of each concept (Dimension, Attribute or referential metadata). The interface informs about the purpose of these concept usages. TIME_PERIOD is always a TimeDimension and is selected by default. FREQ is always a FrequencyDimension. Except one microdata ID dimension, only coded concepts (with a list of codes as representation) can be defined as dimension.  
3. For each attribute:  
  3.1. define if it is optional or mandatory  
  3.2. define the attachment level: Dataset, Observation, Dimension(s) (-> need to select the corresponding dimensions, with TimeSeries attachment being a special case where all dimensions except Time_Period are selected)  
4. Select the data format (e.g. integer, decimal, float, double (default), text,…) from a list.
5. Fill the data structure* details. 
6. Save the (partially ready) data structure, return to its editing at any time, and submit to the DB.

(*) All artefacts need ID, Agency (selected from his agency list), version (1.0 by default), name(s), description(s), annotation(s), isfinal. Names, descriptions, annotations can be entered in several languages. User should get a warning when required translations of some data structure elements are missing.

#### User Journey #1B-Bis: A statistician derives new data (sub) structure(s)
1. If not already done, select and enter a data space and a statistical domain, browse and see the data structures already defined within the domain.
2. Select an existing data structure.
3. See the concepts defined for that data structure, browse their representations (e.g. text, integer, list of codes), roles, function (dimension, attribute, referential metadata), attachment level and mandatory status for attributes, and data format (e.g integer, decimal, float, double (default), text,…).
4. Unselect at least one concept for dimensions (except TIME_PERIOD and FREQ) and/or attributes. For those (dimensions and mandatory attributes), define a default element/value to be used for all data.
5. For all other concepts, if required, further restrict the representation (whitelist / blacklist), e.g. subset of codes for list of codes.
6. Fill the data (sub) structure* details. 
7. Save the (partially ready) data (sub) structure, return to its editing at any time, and submit to the DB.

(*) A data structure and all its data (sub) structures share their data.

#### User Journey #1C: A statistician designs new data views(s)
1. If not already done, select and enter a data space and a statistical domain.
2. Browse and see the data structures already defined within the domain.
3. Select an existing data structure (or data (sub) structure).
4. Browse and see the data views already defined for the selected data structure (e.g. in a matrix -> see image below).
5. Derive one or several new data views as follow:  
  5.1. For each coded dimension (except TIME_PERIOD) and coded attribute, ST can restrict the list of codes to a subset of codes (whitelist / blacklist).  
  5.2. ST fills the data view details: ID, Agency (selected from his agency list), version (1.0 by default), name(s), description(s), annotation(s), is final.  
6. Save the (partially ready) data view(s) and return to their editing at any time.
7. Once the data structure is ready (-> see journey [#1B](#user-journey-1b-a-statistician-designs-new-data-structures)) and the data view matrix is ok, initiate the creation of the above structures in the DB in one or several spaces. The following structures will be created/updated:  
  7.1. ConceptScheme (of domain),  
  7.2. Code lists,  
  7.3. Data Structure Definition,  
  7.4. Dataflows,  
  7.5. Content constraints.  
8. Access right management *to be clarified*

*Note: Release calendar in the Dataflow constraint will be added in another user journey.*

![data structure matrix](/dotstatsuite-documentation/images/dlm-data-structure-matrix.png)

#### User Journey #1D: A statistician edits data structure(s)
1. If not already done, select and enter a data space and a statistical domain, browse and see:  
  1.1. the concept scheme already defined within the statistical domain, the concepts and their roles (REF_AREA, FREQ, TIME_PERIOD, …).  
  1.2. the default list of values (codes) of each concept, and the other lists of codes already defined within the domain.  
  1.3. the data structures already defined within the domain.  
2. Choose and see the definition of an existing data structure or data (sub) structure, and change the concepts to be used:  
  2.1. see mandatory (FREQ) and recommended concepts which are automatically pre-selected, unselect recommended concepts if necessary.  
  2.2. unselect or select additional concepts from the list.  
  2.3. change or define roles for each concept from a list of pre-defined roles (specific common concept scheme for roles).  
  2.4. if necessary, change a representation for a concept (e.g. cross-domain or domain-specific list of codes, text, integer, …) when the current or default representation is not appropriate, except for the TIME_PERIOD concept. Restrict the representation (whitelist / blacklist) as required, e.g. subset of codes for list of codes.  
  2.5. change the order of selected concepts (not allowed?) FREQ is always the first concept.  
  2.6. Change or define the function of each concept (Dimension, Attribute or *referential metadata*). The interface informs about the purpose of these concept usages. TIME_PERIOD is always a TimeDimension and is selected by default. FREQ is always a FrequencyDimension. Except one microdata ID dimension, only coded concepts (with a list of codes as representation) can be defined as dimension.  
3. For each attribute:  
  3.1. change the definition if it is optional or mandatory.  
  3.2. change or define the attachment level: Dataset, Observation, Dimension(s) (-> need to select the corresponding dimensions, with TimeSeries attachment being a special case where all dimensions except Time_Period are selected).  
4. Change the data format (e.g integer, decimal, float, double (default), text,…) from a list.
5. Change the data structure* details. 
6. Save the (partially ready) data structure, return to its editing at any time, and submit to the DB. Any backward-compatibility-braking changes will result in the creation of a new artefact or new version.

(*) All artefacts need ID, Agency (selected from his agency list), version (1.0 by default), name(s), description(s), annotation(s), isfinal. Names, descriptions, annotations can be entered in several languages. User should get a warning when required translations of some data structure elements are missing.

#### User Journey #1E: A statistician edits data view(s)
1. If not already done, select and enter a data space and a statistical domain.
2. Browse and see the data structures already defined within the domain.
3. Select an existing data structure (or data (sub) structure).
4. Browse and see the data views already defined for the selected data structure (e.g. in a matrix).
5. Change a data views as follow:  
  5.1. For each coded dimension (except TIME_PERIOD) and coded attribute, if required, restrict the list of codes to a subset of codes (whitelist/blacklist).  
  5.2. Change the data view details: ID, Agency (selected from his agency list), version (1.0 by default), name(s), description(s), annotation(s), is final.  
6. Save the (partially ready) data view(s), and return to their editing at any time. Any backward-compatibility-braking changes will result in the creation of a new artefact or new version.
7. Once the data structure is ready (-> see journey [#1D](#user-journey-1d-a-statistician-edits-data-structures)) and the data view matrix is ok, initiate the change or creation of the changed structures in the DB in one or several spaces. The following structures will be created/updated:  
  7.1. ConceptScheme (of domain),  
  7.2. Code lists,  
  7.3. Data Structure Definition,  
  7.4. Dataflows,  
  7.5. Content constraints.

*Note: Release calendar in the Dataflow constraint will be added in another user journey.*

#### User Journey #2: A statistician runs a data and metadata collection
Journey [#1B](#user-journey-1b-a-statistician-designs-new-data-structures) (Data Structure Design) is a pre-requisite for the following journey.

1. If not already done, select and enter the appropriate data space (e.g. “Collect”) and the statistical domain.
2. Browse and select the data structure to be used.
3. Browse and select the data views (e.g. one per reporting country -> provision agreement structures).
4. Define the data model/storage and related validation rules.
5. Decide on collection method per reporter.
6. Choose the collection method(s) and define the necessary information in the system:  
  6.1. SDMX web service : define the web service end-point and parameters, preview  
  6.2. Questionnaires : list the reporters, define the questions & structures and validation rules, pre-fill the questionnaire  
  6.3. Web queries : define the source url and the content, do the mapping  
  6.4. Manual import/edit (the collector in this case acts like a reporter) –> see user journey [#3](#user-journey-3-a-reporter-submits-data-and-metadata)  
7. Schedule the collection for all methods (depending on either their own agenda or reporters’ agenda) and choose options of re-trials
8. Get notified when collection is successfully done, not completed or failed according to schedule  
  8.1. Give more information in case of failure and provide options for solutions  
9. Validate the data  
  9.1. Checking the automatically-generated reports if validation errors  
  9.2. Visual validations, if appropriate  
10. Engage in a feedback and re-submission loop with the reporters including notifications
11. Can come back at any time to easily see (through filters) what has been done when by who (according to access rights)

#### User Journey #3: A reporter submits data and metadata
*Note:* A reporter can be a country, an internal or external statistical organization

1. Submit source data release dates per project, if appropriate.

Only for questionnaire collection (Note that SDMX collection is considered fully automated):  

2. Get notified about the need to fill a questionnaire (related to data and metadata) according to the timing and frequency of notifications and reminders set by the collector. 
3. Connect to the system and choose one of the 2 following methods:  
  3.1. Online form (connected editing) : the reporter can come back anytime to continue editing  
  3.2. Downloadable Excel file (disconnected editing)  
4. Fill in the form and see completion rate and review completed answers at any time.
5. Can share the questionnaire with other reporters (that could read, edit but not submit).
6. The system automatically validates the entered data according to the rules defined by the collector at the appropriate time (while editing of before submission) and indicates errors visually, pointing the possible solutions. Validations are also done in Excel.
7. Has a question for a specific item in the form or for the whole form, he can submit it to the collector. He will be notified upon response which will be provided within the system. For follow-up questions, he can continue to use this mechanism. 
8. When the reporter has completely filled the form, he can check the overall validity of his questionnaire then finally submit it. If Excel file has been chosen, the Excel file will be uploaded by the reporter and automatically validated by the system; only then, the reporter can submit it. 
9. Get notified about the successful submission and the notification of the collector.
10. Engage in re-submission loop with the collector.
11. Can come back at any time to easily see (through filters) what has been done when by who (according to access rights).

#### User Journey #4A: A statistician collects data and metadata manually (data import)
*Prerequisites:* have the data file ready, have the dataset structure created in the system

1. If not already done, select and enter the appropriate data space (e.g. “Collect”), the statistical domain and the data structure/dataflow to be used.
2. Select source file (SDMX file, Excel or Csv) and the system shows a preview.
3. Might need mapping between the file content and the destination dimensions & attributes (see user journey [#4B](#user-journey-4b-a-statistician-creates-a-mapping)): SDMX (features such as in SDMX  Structure map), Excel (features such as in EDD), CSV (features such as in StatWorks).

Mapping options:  
a. New mapping through Wizard which is then saved for later possible re-use  
  a.1. The system proposes an automatic mapping of the dimensions and the statistician can change and validate  
  a.2. The system proposes an automatic mapping of dimension codes and the statistician can change and validate  
b. Re-use existing mapping (recommended for common codes like ISO codes)  
c. Missing or un-matched codes in the destination are displayed and the statistician can choose between the following options: ignore, add codes, manually map  
d. Missing or un-matched codes in the source can be listed on demand

3. Choose option to continue or not uploading correct data even if errors occur on other data points.
4. Launch import. The system automatically validates the data. If error occur, the system cancels the import unless previous option was set. The system generates a report with number of valid observations loaded and/or report of first 100 errors found. The system logs the action (actor, date, file name and path, destination).
5. Nice to have: Should be able to input ad hoc logging information (last update date from the source, source name...). Log change (when and by who) on each data point, and being able to see previous data versions (not in this user journey).
6. Validates the data:  
  6.1. Checking the automatically-generated reports if validation errors and rejected data  
  6.2. Visual validations, if appropriate: see data grid  
7. Can come back at any time to easily see (through filters) what action has been done when by who (according to access rights).
8. Can save this import definition as a schedulable or repeatable task.

#### User Journey #4B: A statistician creates a mapping
*Notes:*
* Mapping between different SDMX structures and for imports from or exports to SDMX files or arbitrary CSV files.
* The journey for arbitrary Excel tables is more complex.

1. Sees lists of all dimensions, attributes and measures and/or columns of the source and the target facing each other, as a result of a first automatic mapping done by the system.  
  1.1. For CSV files: The list of all columns in the file using header titles, if available, or simply column numbers.  
  1.2. *Note:* The system might not be able to detect mappings if no values match, and the total number of dimensions, attributes and measures is not necessarily equal to the number of columns in the file (which results in empty cases).  

![dlm userjourney-4b](/dotstatsuite-documentation/images/dlm-userjourney-4b-01.png)

2. Change mapping as appropriate  
  2.1. Including many to one or one to many (e.g. Column 3 and Column 4 to Indicator)

![dlm userjourney-4b](/dotstatsuite-documentation/images/dlm-userjourney-4b-02.png)

3. Then map dimension, attribute and measure values, if necessary  
  3.1. Map available values (also retrieved from CSV files)  
4. The user can save his mapping in order to re-use it later on.

#### User Journey #5: A statistician enters data and metadata manually (data grid editing)
*Prerequisites:* have the data file ready, have the dataset structure created in the system.

1. If not already done, select and enter the appropriate data space (e.g. “Collect”), the statistical domain and the data structure/dataflow to be used.
2. Filter members on one or several dimensions.
3. Place dimensions on horizontal/vertical axis as desired* (in a way it will be easier to copy/paste from an existing source for instance).
4. Modify data:
  4.1. Edit observation and/or attribute values one by one (quantitative, qualitative, attributes), or  
  4.2. Copy/paste a range of observation and/or attribute values from an external source (e.g. Excel table), or  
  4.3. Assigning the same observation and/or attribute value to a whole range.  
5. When the statisticians extends the grid range with new values the system should be able to recognise the new values.
6. Add new or see referential metadata related to the data in the table.
7. Create simple calculations, combining one or several rows/columns from a table (e.g. sum of several columns, divide one row by another one, multiply a column by a factor).
8. While editing, the system automatically validates the entered data according to the rules (e.g. correct data types) defined for the data and indicates errors visually, pointing the possible solutions. 
9. Save all modified data back in the system, as well as calculation results created on the fly (calculation is not saved, data are saved as fixed values). Optionally, the system imports at least all correct data or rejects the complete data submission. The system automatically checks more advanced validation rules (e.g. coherence with other data already in the system) and indicates errors pointing the possible solutions.
10. Come back at any time to easily see (through filters) what action has been done when by who (according to access rights).

(*) See if only time series across/down or more flexible pivoting (check complexity).

#### User Journey #6: A statistician validates data
1. Define validation rules using VTL:  
  1.1. define input data (data space, data structure/dataflow, dimension value selection)  
  1.2. define calculation  
  1.3. define valid limits for output for success  
2. Run validation rule.
3. View validation failures, if any.

Or

1. Define validation report using a report designer
  1.1. define input data  (data space, data structure/dataflow, dimension value selection incl. dynamic range for time periods)  
  1.2. define calculation  
  1.3. define valid limits for output  
  1.4. define output data display (data grids, charts, inclusion of validation limits, highlight of validation errors or exclusion of valid data)  
  1.5. arrange display in dashboard  
  1.6. add additional text anywhere, incl. dynamic text such as report title, generation date, page number, user name  
2. Run/refresh report (at any time).
3. Print report

#### User Journey #7: A statistician calculates data (conversions, aggregations, estimations, indicator calculations) with VTL
1. Define calculation rules using VTL:  
  1.1. define input data (data space, data structure/dataflow, dimension value selection).  
  1.2. define calculation (conversions, aggregations, estimations, indicator calculations).  
  1.3. define target structure for output (data space, data structure/dataflow, incl. mappings if necessary).  
2. Save calculation rule.

Or

1. Select calculation rule.
2. Open calculation rule.  
Then  
3. Run calculation rule.
4. View calculation failures, if any.
5. Rerun calculation rule, if required.

#### User Journey #8: A policy analyst accesses data (for internal data analysis and reuse)
1. Use DE-like search and visualisation to fully select data (data space is one of the home page filters).
2. Copy appropriate API query from interface (additional queries for R and Python are generated (if needed).
3. Use API query for R or Python in own program.
4. Use calculation algorithms stored in Algorithm Bank, if required, in own R or Python program.
5. Run R or Python on own machine or remotely.
6. To save calculated data back into the System, use specific API call (web or SQL) from own R or Python program.

Or  

3. Use API query for use by high-performance calculation engine.
4. Use calculation algorithms stored in Algorithm Bank, if required, for use by high-performance calculation engine.
5. Run calculation algorithms with high-performance calculation engine.

Or

1. Use DE-like search and visualisation to fully select data (data space is one of the home page filters) from within Excel (plugin).
2. Work with data provided into the Excel grid.
3. Define output data grid range for saving back into the System.
4. Save output data from specific grid into System by using special Excel plugin button.
5. Save Excel sheet for later re-opening.

#### User Journey #9: A statistician launches the data dissemination and manages embargo
1. If not already created, in the appropriate data space (e.g. “Disseminate”) create the statistical domain and the data structure/dataflow to be used (see user journey [#1B](#user-journey-1b-a-statistician-designs-new-data-structures)) by keeping the data private.
2. Load the data into the appropriate data structure/dataflow in the data space (e.g. “Disseminate”, see user journey [#4A](#user-journey-4a-a-statistician-collects-data-and-metadata-manually-data-import)).
3. Categorize dataflow under appropriate Sub-topic in appropriate Topic CategoryScheme.
4. Check data in internal DE instance (within DLM).
5. Change data access to pubic -> *Note:* Before being executed by the System, might need approval by Release Manager; Statistician is notified when actions are done.  

If data was already loaded and made public before:  
1.Load more/new data into the appropriate data structure/dataflow in the data space (e.g. “Disseminate", see user journey [#4A](#user-journey-4a-a-statistician-collects-data-and-metadata-manually-data-import)).  
Or  
1.Load more/new data into the appropriate data structure/dataflow in the data space (e.g. “Disseminate”, see user journey [#4A](#user-journey-4a-a-statistician-collects-data-and-metadata-manually-data-import)) using Point-in-Time release (PIT: includes also release date if known already, and back-up tick if back-up is required).

#### User Journey #10: A release officer controls public dissemination
1. Is notified when a dissemination request representing a major change is submitted (delete of public data or of public access rights, add new public data, restructuring data incl. replacing codes).
2. Checks the dissemination request form and assesses it:  
  2.1. Accept the dissemination request and notifies the requestor.  
  2.2. Refuses the dissemination request, notifies the requestor and explains the reason of rejection.  
3. When the dissemination request is accepted, the system executes it.
4. Checks that the dissemination request has been properly executed.
5. Is notified about dissemination actions representing medium changes (create a new dataset not publically accessible yet, add some dimension values like adding time periods or countries, change a large percentage of data volume or size, replace many existing observations).
6. Checks the dashboards/report linked from the notification.
7. Gets back to the data provider for some comments, recommendations for future dissemination actions if needed.
8. Notifies external users about important changes.
9. Consults the status of a dissemination action at any time.

#### User Journey #11: A statistician automates and controls data processes
Automate:  
*Prerequisites:* the user has already defined a data process, and has it currently selected/opened:
* Data import from various sources, transfer, export – all with and w/o structure mappings
* Data capture (survey/collection/scraping; online/offline)
* Data validations with VTL and generation/printing of reports
* Data calculations (conversions, aggregations, estimations, indicator calculations) with VTL
* Data dissemination and embargo management

1. If not already done, define a statistical business process instance (ID, title, version) to which this automation should be attached; Note that a statistical business process instance is independent from the data space.
2. Select the statistical business process instance (ID, title, version) to which this automation should be attached.
3. Define of a trigger for the automated execution:  
  3.1. specific time schedule  
  3.2. another (and thus preceding) data process (that must have been successful achieved), maybe combined with  
  3.3. a specific state of its output data (for so-called “metadata-driven” workflow)  
4. Define who should be notified if the process fails.

Control:  
1. Select the statistical business process instance (ID, title, version).
2. View control dashboard related to the statistical business process instance to see the progress of the current statistical production cycle and the quality status.
3. Define specific quality reports as necessary.

#### User Journey #12: A statistician evaluates the project outcome at the end of the production cycle
1. Select the statistical business process instance (ID, title, version).
2. View control dashboard related to the statistical business process instance that includes high-level quality reports, high-level activity reports, and usage & usability statistics.
3. View progress of the current statistical business process success over time.

---

### DLM navigation tree

![DLM navigation tree](/dotstatsuite-documentation/images/dlm-navigation-tree.png)
