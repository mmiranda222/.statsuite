---
title: "Typical use cases"
subtitle: Generating the SDMX structure and data queries and exploring their responses to retrieve the required content from the SDMX API response for typical use cases
comments: false
weight: 5000
keywords: [
  'Retrieve the content of the DE filters from the SDMX API', '#retrieve-the-content-of-the-de-filters-from-the-sdmx-api',
  'Retrieve the data corresponding to the current DE filters from the SDMX API', '#retrieve-the-data-corresponding-to-the-current-de-filters-from-the-sdmx-api',
  'Dynamic data availability for a specific data selection', '#dynamic-data-availability-for-a-specific-data-selection',
  'How to identify dimensions with specific roles for both xml and json', '#how-to-identify-dimensions-with-specific-roles-for-both-xml-and-json',
  'Frequency dimension', '#frequency-dimension',
  'Frequency value (time period length)', '#frequency-value-time-period-length',
  'Reference area dimension', '#reference-area-dimension',
  'Time dimension', '#time-dimension',
  'Non-calendar reporting periods', '#non-calendar-reporting-periods',
]

---

#### Table of Content

- [Retrieve the content of the DE filters from the SDMX API](#retrieve-the-content-of-the-de-filters-from-the-sdmx-api)
- [Retrieve the data corresponding to the current DE filters from the SDMX API](#retrieve-the-data-corresponding-to-the-current-de-filters-from-the-sdmx-api)
- [Dynamic data availability for a specific data selection](#dynamic-data-availability-for-a-specific-data-selection)
- [How to identify dimensions with specific roles for both xml and json](#how-to-identify-dimensions-with-specific-roles-for-both-xml-and-json)
  - [Frequency dimension](#frequency-dimension)
  - [Frequency value (time period length)](#frequency-value-time-period-length)
  - [Reference area dimension](#reference-area-dimension)
  - [Time dimension](#time-dimension)
- [Non-calendar reporting periods](#non-calendar-reporting-periods)

This section describes how to generate the SDMX structure and data queries and explore their responses for typical use cases.  

---

### Retrieve the content of the DE filters from the SDMX API
The generic SDMX structure query has the following syntax:  

protocol://ws-entry-point/resource/agencyID/resourceID/version?detail=value&references=value

Parameters of the SDMX query:
- resource: datastructure (to retrieve the DSD), dataflow, conceptscheme, codelist, hierarchicalcodelist, agencyscheme, contentconstraint or (the generic resource keyword) structure
- agencyID: the agency known to be the maintaining agency of the artefact, otherwise ‘all’
resourceID: the ID of the resource, eg. The ID of the dataflow
- version: the version known of the artefact, otherwise omitted
- detail:
  * full: All available information for all artefacts will be returned. This is the default.
  * allstubs: All artefacts will be returned as stubs.
  * referencestubs: The referenced artefacts will be returned as stubs.
- references: none: No references will be returned. This is the default.
  * parents: The artefacts that use the artefact matching the query (for example, the dataflows that use the data structure definition matching the query) will be returned.
  * parentsandsiblings: The artefacts that use the artefact matching the query, as well as the artefacts referenced by these artefacts will be returned.
  * children: The artefacts referenced by the matching artefact will be returned (for example, the concept schemes and code lists used in a DSD).
  * descendants: References of references, up to any level, will also be returned.
  * all: The combination of parentsandsiblings and descendants.
  * In addition, a concrete type of resource, may also be used (for example, references=codelist).
 
The following query needs to be made in order to retrieve all relevant information (except TIME range):

**protocol://ws-entry-point/dataflow/agencyID/resourceID/version?references=all**

Parameters of the SDMX query:

- agencyID: the agency known to be the maintaining agency of the dataflow otherwise ‘all’
- resourceID: the ID of the resource, eg. The ID of the dataflow
- version: the version known of the artefact otherwise omitted
 
Compression should be enabled using the appropriate HTTP Header field (Accept-Encoding). Error handling is done by API as specified in the standard. If the web service has not yet implemented one of the methods defined in the API, then the web service will return the ‘Not implemented’ – 501 error.

Selection of the appropriate representation (SDMX-ML, SDMX-JSON and SDMX-CSV) is done using HTTP Content Negotiation and the HTTP Accept request header:

 `application/vnd.sdmx.[content-type]+[format];version=[version]`

where [content-type] should be replaced with the desired content-type (i.e.: genericdata, structurespecificdata, data, structure, etc), [format] should be replaced with xml, json or csv, and [version] should be replaced with one of the versions of the SDMX standard, starting with SDMX 2.1 (e.g.: 2.1). In case the client does not specify the desired format and version of the response message, or only specifies the generic application/xml format, then the SDMX RESTful web service should return:

- The most recent version (that the service supports) of the SDMX-ML Structure format for structural metadata queries;
- The most recent version (that the service supports) of the SDMX-ML Generic Data format for data queries;
- The most recent version (that the service supports) of the SDMX-ML Generic Metadata format for metadata queries.
 
#### Example
https://nsi-demo-stable.siscc.org/rest/dataflow/OECD/DF_KEI/1.0?references=all&detail=referencepartial

Note that the option **references=all** assures that all required information is returned (this simplified API calls):

- **dataflow**:  
  * (Localised) name used for title of Pivot Table/Chart
  * Agency+ID+Version of datastructure (DSD)  

- **datastructure** (DSD) for above Agency+ID+Version:
  * dimension(s):
    - Position of dimension: used for filters order
    - ID of the dimension: used to match additional constraints (see below)
    - ConceptScheme + Agency+ID+Version of concept
    - Agency+ID+Version of codelist  
 
- **concept(s)** for above ConceptScheme + Agency+ID+Version:
  * (Localised) name_ used for filter title “Filter by XXX”  

- **codelist(s)** for above Agency+ID+Version:
  * Code(s):
    - (Localised) name: used as filter item (only if not constrained by below Constraint! )
    - Parent (ID): used to create a basic item hierarchy in the filter (keep order as ordered in xml; codes without parent codes are at root level)  

- **contentconstraint** (if any for this dataflow):
  * The option **detail=referencepartial** automatically applies **allowed** content constraints to the returned codelists, those can thus be ignored
  * Type: Only use if "Actual". This type of content constraint contains the dimension values for which observation values exist.
  * ConstraintAttachment: Check that Dataflow Agency+ID_Version match!
  * CubeRegion: Check parameter “include=”true“” because if “false” those codes need to be excluded from the filter
    - KeyValue: ID must match a dimension ID
      * Value list: use to constrain (filter) the items included in/excluded from the filter box, when data availability is applied
    - TimeRange: use StartPeriod and EndPeriod to define the content of the Time Period filter (SDMX doesn’t foresee returning a codelist for the TIME(_PERIOD) dimension)
 
Notes:  
- In the filter of the FREQUENCY dimension, the user should select only one frequency at any time. Note that dataflows with data for only one frequency might not have defined a specific frequency dimension.
- An older SDMX web service might not support the option “references=all”. In this case, separate calls would need to be made for artefacts.
- An older SDMX web service might not support the option “detail=referencepartial”. In this case, the filter items need to be constrained according to the Allowed ContentConstraint if no Actual ContentConstraints were returned.

---

### Retrieve the data corresponding to the current DE filters from the SDMX API
The SDMX data query has the following syntax:  
**protocol://ws-entry-point**/data/**dataflowRef**/**key**/**providerRef**&startPeriod=xxxx&endPeriod=yyyy&updatedAfter=zzzz&firstNObservations=aa&lastNObservations=bb&dimensionAtObservation=AllDimensions&detail=full

**Parameters of the SDMX query:**
- **dataflowRef**: agency, id and version of dataflow. This information comes from the URL of the visualisation page or from the previous search page. See guidelines below on what to do if agency or version are not provided as input to the visualisation page.
- **key**: dimension member selection using the '+' symbol as separator between Code IDs and the '.' symbol for separation between dimensions (dimensions in the order as defined in the DSD except TIME dimension). If there is no selection in a dimension, then it is left empty (it means that this dimension is not filtered). If there are no selections in any dimension, then the single keyword 'all' is to be used as key (it means that there is no data filter applied).

**!!!** The number of dimensions in ‘key’ must be the same than the number of dimensions in the DSD. This means that the dimensions that are not used for the filters (dimensions with one value) should have their value present in the SDMX request in order to fetch the data. To make sure that the number of dimensions is correct, the number of spots in the ‘key’ parameter must be size(dimensions) – 1. The dimensions of the query must come in the same order than in the DSD. **!!!**

- **providerRef**: use keyword 'all' or ‘OECD' (***configurable!***) for the moment
- **startPeriod**: if user selected a starting time period in the TIME dimension
- endPeriod: if user selected an ending time period in the TIME dimension
- **updatedAfter**: Not implemented yet in .Stat Suite.
- *(Released in [January 25, 2021 Release .Stat Suite .NET 5.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#january-25-2021))* **firstNObservations**: Return the first N observations per series as defined by the dimensionAtObservation parameter. If dimensionAtObservation=AllDimensions then the API returns the first N observations of the query. This parameter is not needed for preview table.
- *(Released in [January 25, 2021 Release .Stat Suite .NET 5.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#january-25-2021))* **lastNObservations**: Return the last N observations per series as defined by the dimensionAtObservation parameter. If dimensionAtObservation=AllDimensions then the API returns the last N observations of the query. This parameter is not needed for pivot table.
- **dimensionAtObservation**: Use as appropriate for best display of results in pivot table (which dimension is to be attached at the observation level to create series). 'AllDimensions' is used for data visualisation page (in this case the API returns a flat list of observations). 
- **detail**: Not used in .Stat Suite

The web service will return all relevant observations together with all relevant attributes at 2 (or 3) levels: dataset, (series) and observation, as well as all related structural information including definition of dimensions and attributes.

Compression should be enabled using the appropriate HTTP Header field (Accept-Encoding). Error handling is done by API as specified in the standard. If the web service has not yet implemented one of the methods defined in the API, then the web service will return the ‘Not implemented’ – 501 error.

Selection of the appropriate representation (SDMX-ML, SDMX-JSON and SDMX-CSV) is done using HTTP Content Negotiation and the HTTP Accept request header:

 `application/vnd.sdmx.[content-type]+[format];version=[version]`

where [content-type] should be replaced with the desired content-type (i.e.: genericdata, structurespecificdata, data, structure, etc), [format] should be replaced with xml, json or csv, and [version] should be replaced with one of the versions of the SDMX standard, starting with SDMX 2.1 (e.g.: 2.1). In case the client does not specify the desired format and version of the response message, or only specifies the generic application/xml format, then the SDMX RESTful web service should return:

- The most recent version, that the service supports, of the SDMX-ML Structure format for structural metadata queries;
- The most recent version, that the service supports, of the SDMX-ML Generic Data format for data queries;
- The most recent version, that the service supports, of the SDMX-ML Generic Metadata format for metadata queries.

The DE requests the SDMX-JSON data format for all data requests (with latest version) for the online display using the following HTTP Accept header:

**application/vnd.sdmx.data+json**

#### Examples
https://sdw-wsrest.ecb.europa.eu/service/data/ECB,EXR,1.0/M.USD.EUR.SP00.A?dimensionAtObservation=AllDimensions&startPeriod=2016-12  
In this example, the user would have made the following selection:  
FREQ=M, CURRENCY=USD, CURRENCY_DENOM=EUR, EXR_TYPE=SP00, EXR_SUFFIX=A, TIME selection starting Dec 2016

https://sdw-wsrest.ecb.europa.eu/service/data/ECB,EXR,1.0/M.USD.EUR.SP00.A+E?dimensionAtObservation=AllDimensions&startPeriod=2016-12  
In this example, the user would have made the following selection:  
FREQ=M, CURRENCY=USD, CURRENCY_DENOM=EUR, EXR_TYPE=SP00, EXR_SUFFIX=A and E, TIME selection starting Dec 2016  

https://sdw-wsrest.ecb.europa.eu/service/data/ECB,EXR,1.0/M.USD.EUR.SP00.?dimensionAtObservation=AllDimensions&startPeriod=2016-12   
In this example, the user would have made the following selection:  
FREQ=M, CURRENCY=USD, CURRENCY_DENOM=EUR, EXR_TYPE=SP00, EXR_SUFFIX=no selection, TIME selection starting Dec 2016

For additional information, see SDMX web service guidelines:  
- Generic http://sdmx.org/wp-content/uploads/SDMX_2-1-1-SECTION_07_WebServicesGuidelines_2013-04.pdf
- SOAP https://github.com/sdmx-twg/sdmx-soap
- REST https://github.com/sdmx-twg/sdmx-rest
- JSON message syntax https://github.com/sdmx-twg/sdmx-json

---

### Dynamic data availability for a specific data selection
> *Available in .Stat Suite since [September 03, 2021 Release .Stat Suite .NET 7.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#september-03-2021)* 
The dynamic data availability for a specific data selection is obtained from the NSI web service through the **available content constraint**.  

The Available Content Constraint (also called 'Dynamic Content Constraint' or 'Dynamic Data Availability') indicates the values of dimensions (or attributes) for which any data exists on the server for a dataflow and for a given partial data selection. The constraint can be queried through the following SDMX ws request, which includes the current data selection:  
`protocol://ws-entry-point/availableconstraint/AGENCYID,DATAFLOWID,VERSION/key/PROVIDERID/COMPONENTID?startPeriod=XXXX&endPeriod=XXXX&references=codelist&mode=exact`

Acceptable parameters:
- `componentId` used to retrieve the values for one specific dimension only
- `startPeriod`, `endPeriod`, and `updatedAfter` for Time Period information
- `references=codelist` used to also retrieve the codelist(s) as references

The `mode=available` parameter instructs the web service to return a ContentConstraint containing values for which data exists for those dimension not part of the submitted data selection. With `mode=exact` (default), the web service includes also values for the dimensions that were part of the submitted data selection.  
*Note* that the returned values can exceed the submitted values. For instance, a request to retrieve exactly all dimension values for which data exists when 'FRANCE' is selected, includes also 'AUSTRIA' as dimension value if the same data also existed for 'AUSTRIA'.

**Examples:**
- https://nsi-qa-stable.siscc.org/rest/availableconstraint/LU1,DF_A3205,1.0/
- https://nsi-qa-stable.siscc.org/rest/availableconstraint/OECD,DF_UOM,3.0/.A.GDP..V+Q.SA+NSA.NT
- [https://nsi-qa-stable.siscc.org/rest/availableconstraint/UNICEF,MG,1.0/AFG+ALB+DZA+AND.MG_ASYLM_CNTRY_ASYLM+MG_ASYLM_CNTRY_DEST.](https://nsi-qa-stable.siscc.org/rest/availableconstraint/UNICEF,MG,1.0/AFG+ALB+DZA+AND.MG_ASYLM_CNTRY_ASYLM+MG_ASYLM_CNTRY_DEST.) same result than https://nsi-qa-stable.siscc.org/rest/availableconstraint/UNICEF,MG,1.0/AFG+ALB+DZA+AND.MG_ASYLM_CNTRY_ASYLM+MG_ASYLM_CNTRY_DEST.?mode=exact
- https://nsi-qa-stable.siscc.org/rest/availableconstraint/UNICEF,MG,1.0/AFG+ALB+DZA+AND.MG_ASYLM_CNTRY_ASYLM+MG_ASYLM_CNTRY_DEST.?mode=available

A dedicated Annotation is returned to express metrics (like the number of matching series or observations). Its type is `sdmx_metrics`, its ID one of `series_count` or `obs_count`, and the title contains the measure.

For more information, see https://github.com/sdmx-twg/sdmx-rest/blob/master/v2_1/ws/rest/docs/4_6_1_other_queries.md

---

### How to identify dimensions with specific roles for both xml and json
To identify a dimension, we should search within the following items chronologically:  
In xml Structure file:
1. ConceptRole
2. ConceptIdentity (if no ConceptRole found)
3. DimensionID (if neither ConceptRole nor ConceptIdentity is found)

In json data file:  
1. ConceptRole
2. DimensionID (if no ConceptRole found)
 
#### Frequency dimension
For frequency, we should search for one of the following IDs: **FREQ**, **FREQUENCY**

##### Structure message
**“if there is a FREQUENCY dimension” means:**  
1. Check if there is a dimension that can be recognized by its role "FREQ":  
  ```json
  {
    "id": "FREQ",
    "position": 1,
    "type": "Dimension",
    "conceptIdentity": "urn:sdmx:org.sdmx.infomodel.conceptscheme.Concept=OECD:CS_KEI(1.0).FREQ",
    "conceptRoles": ["urn:sdmx:org.sdmx.infomodel.conceptscheme.Concept=OECD:OECD_CONCEPTS(1.0).FREQ"],
    "localRepresentation": {"enumeration": "urn:sdmx:org.sdmx.infomodel.codelist.Codelist=OECD:CL_FREQ(1.0)"}
  }
  ```
   Note that a dimension can have none or multiple ConceptRoles defined.  
   For more info, see: https://sdmx.org/wp-content/uploads/SDMX_2-1-1-SECTION_6_TechnicalNotes-march-2013.pdf (Chapter 7 Concept Roles)   
   For cross-domain Concepts (and their Roles) defined at SDMX level, see: https://sdmx.org/wp-content/uploads/01_sdmx_cog_annex_1_cdc_2009.pdf  
   The id of the cross-domain Frequency concept is “**FREQ**”.
 
2. If no such dimension exists, check if there is a dimension that can be recognized by its underlying concept "FREQ" or “FREQUENCY”:  
  ```json
  {
    "id": "FREQ",
    "position": 1,
    "type": "Dimension",
    "conceptIdentity": "urn:sdmx:org.sdmx.infomodel.conceptscheme.Concept=OECD:CS_KEI(1.0).FREQ",
    "localRepresentation": {"enumeration": "urn:sdmx:org.sdmx.infomodel.codelist.Codelist=OECD:CL_FREQ(1.0)"}
  }
  ```

3. If no such dimension exists, check if there is a dimension that can be recognized by its id "FREQ" or “FREQUENCY”:  
  ```json
  {
    "id": "FREQ",
    "position": 1,
    "type": "Dimension",
    "conceptIdentity": "urn:sdmx:org.sdmx.infomodel.conceptscheme.Concept=OECD:CS_KEI(1.0).FREQS",
    "localRepresentation": {"enumeration": "urn:sdmx:org.sdmx.infomodel.codelist.Codelist=OECD:CL_FREQ(1.0)"}
  }
  ```

Notes:  
2) and 3) are added only to conveniently and flexibly accommodate to SDMX API implementations with varying functional coverage.
Usually the underlying codelist would be “CL_FREQ” but there might be a different one.
 
##### Data message
1. Check the SDMX-JSON data message if there is a FREQUENCY dimension (see structure-dimensions-[dataset/series/observation]). It can be recognized by its role "FREQ":  
```json
{ "keyPosition": 3, 
  "id": "FREQUENCY", 
  "name": "Frequency", 
  "values": [ 
    { 
      "id": "A", 
      "name": "Annual" 
    } 
  ], 
  "role": "FREQ"  
},
```

2. If no such dimension exists, check if there is a dimension that can be recognized by its id "FREQ" or “FREQUENCY”
```json
{ "keyPosition": 3, 
  "id": "FREQUENCY", 
  "name": "Frequency", 
  "values": [ 
    { 
      "id": "A", 
      "name": "Annual" 
    } 
  ]  
},
```

The DE chart/table engine only supports one single frequency, thus the above "values" array must have exactly one item, otherwise the data selection is considered as invalid (and appropriate error message is returned to the user specifying that only one single frequency is allowed). The item will tell you which frequency is being used.

.Stat Suite currently supports the following values:  
- A: Annual
- S: Half-yearly, semester
- Q: Quarterly
- M: Monthly

If interested, the full SDMX list of admissible values is available here: https://sdmx.org/wp-content/uploads/CL_FREQ_v2.0_update_April_2015.doc
 
#### Frequency value (time period length)
If no Frequency dimension is found, then search for 'Time Format' attribute. This attribute will implicitly indicate the frequency assigned for the data of the dataset.  
For frequency value, we should search for the following ID: **TIME_FORMAT**
 
*Following are codes examples for TIME_FORMAT:*

| Recommended code value | Recommended code description |
|------------------------|------------------------------|
| P1D                    | Daily (or Business)          |
| P1M                    | Monthly                      |
| P1Y                    | Annual                       |
| P3M                    | Quarterly                    |
| P6M                    | Half-yearly, semester        |
| P7D                    | Weekly                       |
| PT1M                   | Minutely                     |
 
##### Structure message
https://nsi-demo-stable.siscc.org/rest/datastructure/OECD/DSD_KEI/1.0

Attribute definition:

```json
  {
      "id": "TIME_FORMAT",
      "urn": "urn:sdmx:org.sdmx.infomodel.datastructure.DataAttribute=OECD:DSD_KEI(1.0).TIME_FORMAT",
      "links": [{
          "rel": "self",
          "urn": "urn:sdmx:org.sdmx.infomodel.datastructure.DataAttribute=OECD:DSD_KEI(1.0).TIME_FORMAT",
          "type": "dataattribute"
      }],
      "conceptIdentity": "urn:sdmx:org.sdmx.infomodel.conceptscheme.Concept=OECD:CS_KEI(1.0).TIME_FORMAT",
      "localRepresentation": {"enumeration": "urn:sdmx:org.sdmx.infomodel.codelist.Codelist=OECD:CL_TIME_FORMAT(1.0)"},
      "assignmentStatus": "Mandatory",
      "attributeRelationship": {}
  },
```

Attribute values defined by corresponding codelist:

```json
  {
        "id": "CL_TIME_FORMAT",
        "version": "1.0",
        "agencyID": "OECD",
        "isFinal": true,
        "name": "Time format",
        "names": {"en": "Time format"},
        "isPartial": false,
        "codes": [
            {
                "id": "P1Y",
                "name": "Annual",
                "names": {"en": "Annual"}
            }
        ]
    },
```

##### Data message
```json
  "attributes": { 
    "dataSet": [], 
    "series": [], 
    "observation": [ 
      { 
        "id": "TIME_FORMAT", 
        "name": "Time format",
        "names": {"en": "Time format"}, 
        "values": [ 
          { 
          "id": "P1Y", 
          "name": "Annual",
          "names": {"en": "Annual"} 
          } 
        ] 
      }
    ]
  },
```

In the context of the DE table and chart generation, the above "values" array must have exactly one item, otherwise data selection is considered as invalid (and an appropriate error message is returned to the user specifying that only one single frequency is allowed).  
The item id will tell you which frequency is being used. .Stat Suite currently supports the following values (ids):  
- P1M: Monthly
- P1Y: Annual
- P3M: Quarterly
- P6M: Half-yearly, semester

If you are interested, the full SDMX list of admissible values is available here: https://sdmx.org/wp-content/uploads/CL_TIME_FORMAT_1.0_2009.doc  
If the SDMX-JSON data message contains neither FREQUENCY dimension nor TIME_FORMAT attribute, then the data selection is considered as invalid (and appropriate error message is returned to the user specifying that the frequency could not be recognized).
 
#### Reference area dimension
For the reference area dimension, we should search for one of the following IDs: **REF_AREA**, **LOCATION**, **COUNTRY**

##### Structure xml
**“if there is a LOCATION dimension” means:**
 
1. Check if there is a dimension that can be recognized by its role "REF_AREA":  
```xml
<str:Dimension urn="urn:sdmx:org.sdmx.infomodel.datastructure.Dimension=ECB:ECB_FMD2(1.0).REF_AREA" id="REF_AREA" position="2">
  <str:ConceptIdentity>
    <Ref maintainableParentID="ECB_CONCEPTS" package="conceptscheme" maintainableParentVersion="1.0" agencyID="ECB" id="REF_AREA" class="Concept" />
  </str:ConceptIdentity>
  <str:LocalRepresentation>
    <str:Enumeration>
      <Ref package="codelist" agencyID="ECB" id="CL_AREA_EE" version="1.0" class="Codelist" />
    </str:Enumeration>
  </str:LocalRepresentation>
  <str:ConceptRole>
    <Ref maintainableParentID="ECB_CONCEPTS" package="conceptscheme" maintainableParentVersion="1.0" agencyID="ECB" id="REF_AREA" class="Concept" />
  </str:ConceptRole>
</str:Dimension> 
```

Note, that a dimension can have none or multiple ConceptRoles defined.  
For more info, see: https://sdmx.org/wp-content/uploads/SDMX_2-1-1-SECTION_6_TechnicalNotes-march-2013.pdf (Chapter 7 Concept Roles)  
For cross-domain Concepts (and their Roles) defined at SDMX level, see: https://sdmx.org/wp-content/uploads/01_sdmx_cog_annex_1_cdc_2009.pdf  
The id of the cross-domain Frequency concept is “**REF_AREA**”.
 
2. If no such dimension exists, check if there is a dimension that can be recognized by its underlying concept "REF_AREA" or “LOCATION”:  
```xml
<str:Dimension urn="urn:sdmx:org.sdmx.infomodel.datastructure.Dimension=ECB:ECB_FMD2(1.0).REF_AREA" id="REF_AREA" position="2">
  <str:ConceptIdentity>
    <Ref maintainableParentID="ECB_CONCEPTS" package="conceptscheme" maintainableParentVersion="1.0" agencyID="ECB" id="REF_AREA" class="Concept" />
  </str:ConceptIdentity>
  <str:LocalRepresentation>
    <str:Enumeration>
      <Ref package="codelist" agencyID="ECB" id="CL_AREA_EE" version="1.0" class="Codelist" />
    </str:Enumeration>
  </str:LocalRepresentation>
</str:Dimension> 
```

3. If no such dimension exists, check if there is a dimension that can be recognized by its id "REF_AREA" or “LOCATION”:  
```xml
<str:Dimension urn="urn:sdmx:org.sdmx.infomodel.datastructure.Dimension=ECB:ECB_FMD2(1.0).REF_AREA" id="REF_AREA" position="2">
  <str:ConceptIdentity>
    <Ref maintainableParentID="ECB_CONCEPTS" package="conceptscheme" maintainableParentVersion="1.0" agencyID="ECB" id="REFERENCE_AREA" class="Concept" />
  </str:ConceptIdentity>
  <str:LocalRepresentation>
    <str:Enumeration>
      <Ref package="codelist" agencyID="ECB" id="CL_AREA_EE" version="1.0" class="Codelist" />
    </str:Enumeration>
  </str:LocalRepresentation>
</str:Dimension> 
```

Notes:  
2) and 3) are added only to conveniently and flexibly accommodate to SDMX API implementations with varying functional coverage. 
In the OECD context, the underlying codelist would be “CL_AREA” but there might be a different one.
 
**Json data**  
*to be completed*

#### Time dimension
For the time dimension, we should search for the ID **TIME_PERIOD**.

Note:  
Other IDs, such as **TIME** and **YEAR**, are not supported as TimeDimension for now.  
However, those IDs can be used as non-TimeDimension dimensions with the associated Codelist to be created.

##### Structure xml
**“if there is a TIME dimension” for selecting “last five years” means:**  
 
1. Check if there is a TimeDimension:
```xml
<str:TimeDimension urn="urn:sdmx:org.sdmx.infomodel.datastructure.TimeDimension=ECB:ECB_EXR1(1.0).TIME_PERIOD" id="TIME_PERIOD" position="6">
  <str:ConceptIdentity>
    <Ref maintainableParentID="ECB_CONCEPTS" package="conceptscheme" maintainableParentVersion="1.0" agencyID="ECB" id="TIME_PERIOD" class="Concept" />
  </str:ConceptIdentity>
  <str:LocalRepresentation>
    <str:TextFormat textType="ObservationalTimePeriod" />
  </str:LocalRepresentation>
</str:TimeDimension>
```

**Json data**  
*to be completed*

---

### Non-calendar reporting periods
> *Available in .Stat Suite since [September 03, 2021 Release .Stat Suite .NET 7.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#september-03-2021)*

*SDMX* specifications references:
- [Section 6 – Technical Notes](http://sdmx.org/wp-content/uploads/SDMX_2-1-1-SECTION_6_TechnicalNotes-march-2013.pdf)
- [Guidelines on Non-Calendar Year Reporting of Data](https://sdmx.org/?page_id=4345#NonCalendar)
- [Generic rules for querying time](https://sdmx.org/wp-content/uploads/SDMX_2-1_SECTION_6_TechnicalNotes_2020-07.pdf) See page 21. (Valid for SOAP and REST, some features only exist in SOAP)

In order to allow managing time periods for non-calendar year reporting, .Stat Suite can take the **`REPORTING_YEAR_START_DAY`** and **`REPYEARSTART`** attributes into account when interpreting time periods and time period ranges in data import and data extraction.

**Note** that The *SDMX* standard says the 2 followings:
- "*A specialized attribute (reporting year start day) exists for the purpose of communicating the reporting year start day. This attribute has a **fixed identifier (`REPORTING_YEAR_START_DAY`)** and a fixed representation (xs:gMonthDay) so that it can always be easily identified and processed in a data message.*"
- "*The technical note (revision 1.0) suggests that the attribute ID for reporting year start day to be `REPORTING_YEAR_START_DAY`. However, **to maintain EDI compliance, it is suggested to use the IDs `REPYEARSTART`** and `REPYEAREND` when defining DSDs.*"  
Therefore, the official SDMX standard is `REPORTING_YEAR_START_DAY`, but business-driven recommendations (and some implementations like National Account) use `REPYEARSTART`.

**Data import**  
When the **`REPORTING_YEAR_START_DAY`** or **`REPYEARSTART`** attribute at dataset(/dataflow), time series or observation level is being used in the DSD (e.g. with a fixed representation (xs:gMonthDay) and with value "--07-01" for specifying 1st of July), then the data are loaded appropriately...

**Data extraction**  
When the **`REPORTING_YEAR_START_DAY`** or **`REPYEARSTART`** attribute at dataset(/dataflow), time series or observation level is being used in the DSD (e.g. with a fixed representation (xs:gMonthDay) and with value "--07-01" for specifying 1st of July), then the value of this attribute is taken into account when resolving a specific time range request in the SDMX APIs (e.g. startPeriod/endPeriod Rest parameters).

**Period start and period end calculations**  
When uploading data with a `REPORTING_YEAR_START_DAY` attribute value, then it derives the **`PERIOD_START`** and **`PERIOD_END`** values from the `TIME_PERIOD` value by taking the `REPORTING_YEAR_START_DAY` attribute value into account.

**Example:**  

| TIME_PERIOD | REPORTING_YEAR_START_DAY | calculated PERIOD_START | calculated PERIOD_END |
|---------------|------------------------|----------------------------|--------------------------|
| 1997-Q1 | "--07-01" | "1997-07-01" | "1997-09-30" |
| 1997-Q2 | "--07-01" | "1997-10-01" | "1997-12-31" |
| 1997-Q3 | "--07-01" | "1998-01-01" | "1998-03-31" |
| 1997-Q4 | "--07-01" | "1998-04-01" | "1998-06-30" |
| 1998-Q1 | "--07-01" | "1998-07-01" | "1998-09-30" |
| 1998-Q2 | "--07-01" | "1998-10-01" | "1998-12-31" |

