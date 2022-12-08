---
title: ".Stat Suite Core data model"
subtitle: 
comments: false
weight: 4700
keywords: [
  'Data structure components', '#data-structure-components',
  'Dimensions', '#data-structure-components',
  'Time dimension', '#data-structure-components',
  'Measures', '#data-structure-components',
  'Attributes', '#data-structure-components',
  'Data type definitions', '#data-type-definitions',
  'Data querying', '#data-querying',
  'Referential metadata types', '#referential-metadata-types',
  'Allowed Content Constraints', '#allowed-content-constraints',
  'Uniqueness of Observations', '#uniqueness-of-observations',
]

---

#### Table of Content
- [Data structure components](#data-structure-components)
- [Data type definitions](#data-type-definitions)
- [Data querying](#data-querying)
- [Referential metadata types](#referential-metadata-types)
- [Allowed Content Constraints](#allowed-content-constraints)
- [Uniqueness of Observations](#uniqueness-of-observations)

This section details the characteristics of the statistical data model described by SDMX and implemented to large parts in the .Stat Suite Core database storage. This storage is composed of 4 parts:
- (data) structure database - based on MappingStore (component of Eurostat's SDMX-RI solution)
- data (values) database
- management database (link between structure and data storage)
- authorisation management database

This page concentrates on the data model features supported by the data database for the storage of observation values, attribute values and (later also) referential metadata values conforming to the SDMX information model.

---

### Data structure components

The SDMX information model defines **5 main types of components** for data structures:

1. **Dimensions**: Defined by Concepts. There must be at least one Dimension (incl. Time Dimension). Their allowed values (local Representation) can be coded (from a Codelist) or non-coded (see below). For the moment only coded dimensions are supported, but support for non-coded dimensions is already being worked on.  
In opposite to Measures and Attributes, _Dimensions (incl. Time Dimension) are used to uniquely identify Observations_.
2. **Time dimension**: Defined by Concept. Its allowed values (local Representation) are always non-coded but restricted to specific time period representations (ObservationalTimePeriod), which include also information about start and end time (or start and duration) for each time period.  
   **Note:** In order to optimise the database storage space and performance in .Stat Core, by default only time periods *without a time component* (hours, minutes, seconds, milli-seconds), e.g. day, week, month, quarter, year, etc., are supported. In case a DSD requires the usage of time periods including information about hours, minutes, seconds or milli-seconds, this needs to be communicated through the annotation of type `SUPPORT_DATETIME` in the DSD before any data are uploaded.
   
   ```xml
   <common:Annotation>
     <common:AnnotationType>SUPPORT_DATETIME</common:AnnotationType>
   </common:Annotation>
   ```

3. **Measures**: Defined by Concepts. There must be at least one Measure, the default is called the PrimaryMeasure. The allowed values (local Representation) of a Measure can be coded (from a Codelist) - this is not yet implemented - or uncoded (see below) - only the double number type is currently imlemented. In SDMX 2.1, Measures, when there are multiple, are grouped (and transposed) into a special "MeasureDimension" and their Concepts are taken from a special ConceptScheme. This special SDMX 2.1 "MeasureDimension" construct is not implemented in the .Stat Suite Core because in SDMX 3.0 it will be transformed into a normal Dimension with a role 'Measure'.  
In distinction to Attributes, _Measures contain the main target pieces of information_. E.g. for a survey for household earning, the main information is the amount of earning and this would be stored in a Measure. Other related information, e.g. about the family composition of the household, would be stored in attributes.
4. **Attributes**: Defined by Concepts. Their allowed values (local Representation) can be coded (from a Codelist) or uncoded (see below). All these options are supported.
Observations can share the same Attribute values. This is the case when the Attributes attachment level is higher than Observation-level. Such higher levels are groups of dimensions or dataset level. In SDMX 2.1, Attributes cannot be attached to specific Measures within one Observation, which means Attributes values cannot provide additional information for specific Measure values. However, in SDMX 3.0 this will become possible and allow to generically host micro data.  
If Attributes are marked as mandatory, then a value must be provided for the attribute when sending the data, otherwise the corresponding observation(s), which it refers to, is (are) not considered meaningful enough.  
_Attributes provide additional information about Observations_.
5. **Referential metadata attributes**: Defined in separate Metadata Structure Definition and by Concepts. Their allowed values (Representation) can be coded (from a Codelist) or uncoded (see [Referential metadata types](#referential-metadata-types)).  
   Do not (yet) have a pre-defined attachment level. During imports of their values their can be attached to any level from observation (full key) through any combination of dimension values (partial key) up to dataflow level (empty key).  
   Cannot (yet) be made mandatory.  
   Can be considered a specific type of attributes, and as such also _provide additional information about the data_.  
   Their values are not exchanged together with the observation and attribute values but in separate messages and through separate web service calls.

In SDMX 2.1, examples of single- and multi-measure Observations would be:
- Dimensions: FREQ=A; REF_AREA=US; INDICATOR=GDP_PER_CAPITA_PPP
- Time Dimension: TIME_PERIOD=2017
- Measures: PRIMARY_MEASURE=59.495
- Attributes: OBS_STATUS=A; UNIT_OF_MEASURE=USD; POWERCODE=0; TIME_FORMAT=P1Y
- Dimensions: FREQ=A; REF_AREA=US; INDICATOR=GDP_PER_CAPITA
- Time Dimension: TIME_PERIOD=2017
- Measures: PRIMARY_MEASURE(PPP)=59.495; PRIMARY_MEASURE(NOMINAL)=59.501
- Attributes: OBS_STATUS=A; UNIT_OF_MEASURE=USD; POWERCODE=0; TIME_FORMAT=P1Y

In SDMX 3.0, an example of a multi-measure Observation would be:
- Dimensions: FREQ=A; REF_AREA=US; INDICATOR=GDP_PER_CAPITA
- Time Dimension: TIME_PERIOD=2017
- Measures: PPP=59.495; NOMINAL=59.501
- Attributes: OBS_STATUS.PPP=A; OBS_STATUS.NOMINAL=E; UNIT_OF_MEASURE=USD; POWERCODE=0; TIME_FORMAT=P1Y

When allowed values (Representations) of Dimensions, Attributes or Measures are uncoded, then they can be of the following simple data types: String, Alpha, AlphaNumeric, Numeric, BigInteger, Integer, Long, Short, Decimal, Float, Double, Boolean, URI, Count, InclusiveValueRange, ExclusiveValueRange, Incremental, ObservationalTimePeriod, StandardTimePeriod, BasicTimePeriod, GregorianTimePeriod, GregorianYear, GregorianYearMonth, GregorianDay, ReportingTimePeriod, ReportingYear, ReportingSemester, ReportingTrimester, ReportingQuarter, ReportingMonth, ReportingWeek, ReportingDay, DateTime, TimeRange, Month, MonthDay, Day, Time, Duration.  
Codes in a Codelist, even if enumerated, can be defined by the following allowed values (Representations): String, Alpha, AlphaNumeric, Numeric, BigInteger, Integer, Long, Short, Boolean, URI, Count, InclusiveValueRange, ExclusiveValueRange, Incremental, ObservationalTimePeriod, StandardTimePeriod, BasicTimePeriod, GregorianTimePeriod, GregorianYear, GregorianYearMonth, GregorianDay, ReportingTimePeriod, ReportingYear, ReportingSemester, ReportingTrimester, ReportingQuarter, ReportingMonth, ReportingWeek, ReportingDay, Month, MonthDay, Day, Duration. 

Codes in a Codelist can additionally be restrained through the following parameters: isSequence (xs:boolean), interval (xs:integer), startValue (xs:integer), endValue (xs:integer), timeInterval (xs:duration), startTime (StandardTimePeriod), endTime (StandardTimePeriod), minLength (xs:positiveInteger), maxLength (xs:positiveInteger), minValue (xs:integer), maxValue (xs:integer), pattern (xs:string)

---

### Data type definitions
> Since [March 5, 2021 Release .Stat Suite .NET 6.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#march-5-2021), .Stat Suite supports the use of **non-numeric and coded measure values**. Following are the lists of the SDMX standard for possible data types (representations) for observation values.

The possible values for the optional TextFormat attribute **"textType"** are:
- String: A string datatype corresponding to W3C XML Schema's xs:string datatype. **Note that `String` is the default data type** when it is not specified in the structure definition. [Example](https://de-qa.siscc.org/vis?lc=en&df%5Bds%5D=qa%3Astable&df%5Bid%5D=DF_TEST_STRING&df%5Bag%5D=OECD.CFE&df%5Bvs%5D=5.0&av=true&pd=2015%2C2018&dq=AU....A&lt%5Brw%5D=ACTIVITY&lt%5Bcl%5D=TIME_PERIOD)
- Alpha: A string datatype which only allows for the simple aplhabetic charcter set of A-Z, a-z. [Example](https://de-qa.siscc.org/vis?lc=en&df%5Bds%5D=qa%3Astable&df%5Bid%5D=DF_TEST_ALPHA&df%5Bag%5D=OECD&df%5Bvs%5D=1.0&av=true&pd=2015%2C2018&dq=AU....A&lt%5Brw%5D=ACTIVITY&lt%5Bcl%5D=TIME_PERIOD)
- AlphaNumeric: A string datatype which only allows for the simple alphabetic character set of A-Z, a-z plus the simple numeric character set of 0-9. [Example](https://de-qa.siscc.org/vis?lc=en&df%5Bds%5D=qa%3Astable&df%5Bid%5D=DF_TEST_ALPHANUMERIC&df%5Bag%5D=OECD&df%5Bvs%5D=1.0&av=true&pd=%2C&dq=AT....A&lt%5Brw%5D=ACTIVITY&lt%5Bcl%5D=TIME_PERIOD)
- Numeric: A string datatype which only allows for the simple numeric character set of 0-9. This format is not treated as an integer, and therefore can having leading zeros. [Example](https://de-qa.siscc.org/vis?lc=en&df%5Bds%5D=qa%3Astable&df%5Bid%5D=DF_TEST_NUMERIC&df%5Bag%5D=OECD&df%5Bvs%5D=1.0&av=true&pd=2015%2C2017&dq=....A&lt%5Brw%5D=ACTIVITY&lt%5Bcl%5D=TIME_PERIOD)
- BigInteger: An integer datatype corresponding to W3C XML Schema's xs:integer datatype.
- Integer: An integer datatype corresponding to W3C XML Schema's xs:int datatype. [Example](https://de-qa.siscc.org/vis?lc=en&df%5Bds%5D=qa%3Astable&df%5Bid%5D=DF_TEST_INTEGER&df%5Bag%5D=OECD&df%5Bvs%5D=1.0&av=true&pd=%2C&dq=....A&lt%5Brw%5D=ACTIVITY&lt%5Bcl%5D=TIME_PERIOD&lt%5Brs%5D=REF_AREA)
- Long: A numeric datatype corresponding to W3C XML Schema's xs:long datatype. [Example](https://de-qa.siscc.org/vis?lc=en&df%5Bds%5D=qa%3Astable&df%5Bid%5D=DF_TEST_LONG&df%5Bag%5D=OECD&df%5Bvs%5D=1.0&av=true&pd=%2C&dq=....A&lt%5Brw%5D=ACTIVITY&lt%5Bcl%5D=TIME_PERIOD&lt%5Brs%5D=REF_AREA)
- Short: A numeric datatype corresponding to W3C XML Schema's xs:short datatype. [Example](https://de-qa.siscc.org/vis?lc=en&df%5Bds%5D=qa%3Astable&df%5Bid%5D=DF_TEST_SHORT&df%5Bag%5D=OECD&df%5Bvs%5D=1.0&av=true&pd=%2C&dq=....A&lt%5Brw%5D=ACTIVITY&lt%5Bcl%5D=TIME_PERIOD&lt%5Brs%5D=REF_AREA)
- Decimal: A numeric datatype corresponding to W3C XML Schema's xs:decimal datatype.
- Float: A numeric datatype corresponding to W3C XML Schema's xs:float datatype. [Example](https://de-qa.siscc.org/vis?lc=en&df%5Bds%5D=qa%3Astable&df%5Bid%5D=DF_TEST_FLOAT&df%5Bag%5D=OECD&df%5Bvs%5D=1.0&av=true&pd=%2C&dq=....A&lt%5Brw%5D=ACTIVITY&lt%5Bcl%5D=TIME_PERIOD&lt%5Brs%5D=REF_AREA)
- Double: A numeric datatype corresponding to W3C XML Schema's xs:double datatype.
- Boolean: A datatype corresponding to W3C XML Schema's xs:boolean datatype. [Example](https://de-qa.siscc.org/vis?lc=en&df%5Bds%5D=qa%3Astable&df%5Bid%5D=DF_TEST_BOOLEAN&df%5Bag%5D=OECD&df%5Bvs%5D=1.0&av=true&pd=%2C&dq=....A&lt%5Brw%5D=ACTIVITY&lt%5Bcl%5D=TIME_PERIOD&lt%5Brs%5D=REF_AREA)
- URI: A datatype corresponding to W3C XML Schema's xs:anyURI datatype.
- Count: A simple incrementing Integer type. The isSequence facet must be set to true, and the interval facet must be set to "1".
- InclusiveValueRange: This value indicates that the startValue and endValue attributes provide the inclusive boundaries of a numeric range of type xs:decimal.
- ExclusiveValueRange: This value indicates that the startValue and endValue attributes provide the exclusive boundaries of a numeric range, of type xs:decimal.
- Incremental: This value indicates that the value increments according to the value provided in the interval facet, and has a true value for the isSequence facet.
- ObservationalTimePeriod: Observational time periods are the superset of all time periods in SDMX. It is the union of the standard time periods (i.e. Gregorian time periods, the reporting time periods, and date time) and a time range. [Example](https://de-qa.siscc.org/vis?lc=en&df%5Bds%5D=qa%3Astable&df%5Bid%5D=DRAFT_POV&df%5Bag%5D=UNICEF_DRAFT&df%5Bvs%5D=1.0&av=true&pd=2005%2C2017&dq=...)
- StandardTimePeriod: Standard time periods is a superset of distinct time period in SDMX. It is the union of the basic time periods (i.e. the Gregorian time periods and date time) and the reporting time periods.
- BasicTimePeriod: BasicTimePeriod time periods is a superset of the Gregorian time periods and a date time.
- GregorianTimePeriod: Gregorian time periods correspond to calendar periods and are represented in ISO-8601 formats. This is the union of the year, year month, and date formats.
- GregorianYear: A Gregorian time period corresponding to W3C XML Schema's xs:gYear datatype, which is based on ISO-8601.
- GregorianYearMonth: A time datatype corresponding to W3C XML Schema's xs:gYearMonth datatype, which is based on ISO-8601.
- GregorianDay: A time datatype corresponding to W3C XML Schema's xs:date datatype, which is based on ISO-8601. [Example](https://de-qa.siscc.org/vis?lc=en&df%5Bds%5D=qa%3Astable&df%5Bid%5D=DF_TEST_GREGORIANDAY&df%5Bag%5D=OECD&df%5Bvs%5D=1.0&av=true&pd=2015%2C2017&dq=....A&lt%5Brw%5D=ACTIVITY&lt%5Bcl%5D=TIME_PERIOD)
- ReportingTimePeriod: Reporting time periods represent periods of a standard length within a reporting year, where to start of the year (defined as a month and day) must be defined elsewhere or it is assumed to be January 1. This is the union of the reporting year, semester, trimester, quarter, month, week, and day.
- ReportingYear: A reporting year represents a period of 1 year (P1Y) from the start day of the reporting year (day-month) specified in the specialized reporting year start day attribute. In the absence of a start day for the reporting year, a day of January 1 is assumed. In this case a reporting year will coincide with a calendar year. The format of a reporting year is YYYY-A1 (e.g. 2000-A1). Note that the period value of 1 is fixed. Pattern: ".{5}A1.*"
- ReportingSemester: A reporting semester represents a period of 6 months (P6M) from the start day of the reporting year (day-month) specified in the specialized reporting year start day attribute. In the absence of a start day for the reporting year, a day of January 1 is assumed. The format of a reporting semester is YYYY-Ss (e.g. 2000-S1), where s is either 1 or 2. Pattern: ".{5}S[1-2].*" [Example](https://de-qa.siscc.org/vis?lc=en&df%5Bds%5D=qa%3Astable&df%5Bid%5D=DF_TEST_REPORTINGSEMESTER&df%5Bag%5D=OECD&df%5Bvs%5D=1.0&av=true&pd=2015%2C2017&dq=....A&lt%5Brw%5D=ACTIVITY&lt%5Bcl%5D=TIME_PERIOD)
- ReportingTrimester: A reporting trimester represents a period of 4 months (P4M) from the start day of the reporting year (day-month) specified in the specialized reporting year start day attribute. In the absence of a start day for the reporting year, a day of January 1 is assumed. The format of a reporting trimester is YYYY-Tt (e.g. 2000-T1), where s is either 1, 2, or 3. Pattern: ".{5}T[1-3].*"
- ReportingQuarter: A reporting quarter represents a period of 3 months (P3M) from the start day of the reporting year (day-month) specified in the specialized reporting year start day attribute. In the absence of a start day for the reporting year, a day of January 1 is assumed. The format of a reporting quarter is YYYY-Qq (e.g. 2000-Q1), where q is a value between 1 and 4. Pattern: ".{5}Q[1-4].*"
- ReportingMonth: A reporting month represents a period of 1 month (P1M) from the start day of the reporting year (day-month) specified in the specialized reporting year start day attribute. In the absence of a start day for the reporting year, a day of January 1 is assumed. In this case a reporting month will coincide with a calendar month. The format of a reporting month is YYYY-Mmm (e.g. 2000-M01), where mm is a two digit month (i.e. 01-12). Pattern: ".{5}M(0[1-9]|1[0-2]).*"
- ReportingWeek: A reporting week represents a period of 7 days (P7D) from the start day of the reporting year (day-month) specified in the specialized reporting year start day attribute. A standard reporting week is based on the ISO 8601 defintion of a week date, in relation to the reporting period start day. The first week is defined as the week with the first Thursday on or after the reporting year start day. An equivalent definition is the week starting with the Monday nearest in time to the reporting year start day. There are other equivalent defintions, all of which should be adjusted based on the reporting year start day. In the absence of a start day for the reporting year, a day of January 1 is assumed. The format of a reporting week is YYYY-Www (e.g. 2000-W01), where mm is a two digit week (i.e. 01-53). Pattern: ".{5}W(0[1-9]|[1-4][0-9]|5[0-3]).*"
- ReportingDay: A reporting day represents a period of 1 day (P1D) from the start day of the reporting year (day-month) specified in the specialized reporting year start day attribute. In the absence of a start day for the reporting year, a day of January 1 is assumed. The format of a reporting day is YYYY-Dddd (e.g. 2000-D001), where ddd is a three digit day (i.e. 001-366). Pattern: ".{5}D(0[0-9][1-9]|[1-2][0-9][0-9]|3[0-5][0-9]|36[0-6]).*"
- DateTime: A time datatype corresponding to W3C XML Schema's xs:dateTime datatype.
- TimeRange: TimeRange defines a time period by providing a distinct start (date or date time) and a duration. It is generally described as [xs:date or xs:dateTime]\[xs:duration], where the referenced types are defined by XML Schema. Patterns: ".+/P.*T(\d+H)?(\d+M)?(\d+(.\d+)?S)?", ".+/P[^T]+"
- Month: A time datatype corresponding to W3C XML Schema's xs:gMonth datatype. [Example](https://de-qa.siscc.org/vis?lc=en&df%5Bds%5D=qa%3Astable&df%5Bid%5D=DF_TEST_MONTH&df%5Bag%5D=OECD&df%5Bvs%5D=1.0&av=true&pd=2015%2C2017&dq=....A&lt%5Brw%5D=ACTIVITY&lt%5Bcl%5D=TIME_PERIOD)
- MonthDay: A time datatype corresponding to W3C XML Schema's xs:gMonthDay datatype.
- Day: A time datatype corresponding to W3C XML Schema's xs:gDay datatype.
- Time: A time datatype corresponding to W3C XML Schema's xs:time datatype.
- Duration: A time datatype corresponding to W3C XML Schema's xs:duration datatype.
- XHTML: This value indicates that the content of the component can contain XHTML markup.

**Example:**
```xml
<structure:PrimaryMeasure id="OBS_VALUE">
    <structure:ConceptIdentity>
        <Ref id="OBS_VALUE" maintainableParentID="CS_TOURISM" maintainableParentVersion="1.0" agencyID="OECD" package="conceptscheme" class="Concept" />
    </structure:ConceptIdentity>
        <structure:LocalRepresentation>
            <structure:TextFormat textType="Float"/>
        </structure:LocalRepresentation>
</structure:PrimaryMeasure>
```

The other optional TextFormat attributes and properties that .Stat Suite supports are:
- "minLength" type="xs:positiveInteger": The minLength attribute specifies the minimum and length of the value in characters.
- "maxLength" type="xs:positiveInteger": The maxLength attribute specifies the maximum length of the value in characters.
- "minValue" type="xs:integer": The minValue attribute is used for inclusive and exclusive ranges, indicating what the lower bound of the range is. If this is used with an inclusive range, a valid value will be greater than or equal to the value specified here. If the inclusive and exclusive data type is not specified (e.g. this facet is used with an integer data type), the value is assumed to be inclusive. [Example](https://de-qa.siscc.org/vis?lc=en&df%5Bds%5D=qa%3Astable&df%5Bid%5D=DF_TEST_SHORT&df%5Bag%5D=OECD&df%5Bvs%5D=1.0&av=true&pd=%2C&dq=....A&lt%5Brw%5D=ACTIVITY&lt%5Bcl%5D=TIME_PERIOD&lt%5Brs%5D=REF_AREA)
- "maxValue" type="xs:integer": The maxValue attribute is used for inclusive and exclusive ranges, indicating what the upper bound of the range is. If this is used with an inclusive range, a valid value will be less than or equal to the value specified here. If the inclusive and exclusive data type is not specified (e.g. this facet is used with an integer data type), the value is assumed to be inclusive. [Example](https://de-qa.siscc.org/vis?lc=en&df%5Bds%5D=qa%3Astable&df%5Bid%5D=DF_TEST_SHORT&df%5Bag%5D=OECD&df%5Bvs%5D=1.0&av=true&pd=%2C&dq=....A&lt%5Brw%5D=ACTIVITY&lt%5Bcl%5D=TIME_PERIOD&lt%5Brs%5D=REF_AREA)
- "pattern" type="xs:string": The pattern attribute holds any regular expression permitted in the similar facet in W3C XML Schema. [Example](https://de-qa.siscc.org/vis?lc=en&df%5Bds%5D=qa%3Astable&df%5Bid%5D=MG&df%5Bag%5D=UNICEF&df%5Bvs%5D=1.0&av=true&pd=2017%2C2017&dq=AFG%2BALB%2BDZA%2BAND%2BAGO%2BAIA%2BATG%2BARG..)

**Example:**
```xml
<structure:PrimaryMeasure id="OBS_VALUE">
    <structure:ConceptIdentity>
        <Ref id="OBS_VALUE" maintainableParentID="CS_TOURISM" maintainableParentVersion="1.0" agencyID="OECD" package="conceptscheme" class="Concept"/>
    </structure:ConceptIdentity>
        <structure:LocalRepresentation>
            <structure:TextFormat textType="Short" minValue="-10" maxValue="10"/>
        </structure:LocalRepresentation>
</structure:PrimaryMeasure>
```

---

### Data querying
In SDMX 2.1, users can query for data by distinct values for the Dimensions, incl. MeasureDimension. However, the TimeDimension can only be queried through a time period range.

In SDMX 3.0, it is expected to be able to query for data by distinct values for the Dimensions, Measures and Attributes. Likely, the TimeDimension can still only be queried through a time period range.

---

### Referential metadata types
> Released in [March 4, 2022 Release .Stat Suite JS 13.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#march-4-2022)

.Stat Core supports the use and the interpretation of all types (representations) of referential metadata attributes, including coded, non-coded non-localised or non-coded multi-lingual values, except multi-valued values, but their values are not yet validated against the types during imports, and all values are stored in .Stat Core as simple strings. Currently, only the following types are specifically formatted by the Data Explorer for the online display:

- `XHTML`: the value is interpreted as HTML and escaped as is;
- `Numeric`, `Integer` and `Decimals` formats: the value is a Number formatted with the configured localized thousands and decimals separators;
- `Boolean`: 'true' and 'false' values are replaced by the corresponding `i18n` localised messages ('Yes' and 'No' in English, 'Oui' and 'Non' in French, etc.);
- `GregorianYearMonth`: the same localized monthly format used for the monthly time period in the DE filters and table views of the visualisation page.

**Example:**  
```xml
<structure:MetadataAttribute id="CALL_FOR_DATA" minOccurs="1" maxOccurs="1">
    <structure:ConceptIdentity>
        <Ref id="CALL_FOR_DATA" maintainableParentID="CS_MSD_UNICEF_MG" maintainableParentVersion="5.0" agencyID="UNICEF" package="conceptscheme" class="Concept" />
    </structure:ConceptIdentity>
    <structure:LocalRepresentation>
        <structure:TextFormat textType="XHTML" isMultiLingual="true" />
    </structure:LocalRepresentation>
</structure:MetadataAttribute>
```

---

### Allowed Content Constraints

**Allowed Content Constraints** can be used to constrain the data admissible per *Data Structure Definition*, *Dataflow* or *Provision Agreement* (\*) with help of a list of allowed or forbidden (\*) values for *Dimensions* and/or for *Attributes*. In SDMX 3.0, also values of *Measures* can be constrained (\*).

Constraints can be defined through 2 means: 

1. Up to one included and one excluded (\*) **CubeRegion**: For each constrained *Dimension* or *Attribute*, a set of allowed or forbidden (\*) values is listed separately through the **KeyValue** and **Attribute** elements. For a constrained *Time Dimension*, the allowed or forbidden (\*) time range is specified.
2. Any number of **DataKeySets** (\*) whether included or excluded: Constraints are defined through distinct full or partial data keys, e.g. specific *Observations*, specific *Time Series*, or specific *Dimension* value combinations are allowed or forbidden.

The *Allowed Content Constraints* are being applied to control which values can be imported and exported depending on to which level they relate (Data Structure Definition, Dataflow or Provision Agreement (\*)).

(\*) the latter not being implemented

This is done practically in the following source code:  
- Transfer service (DataAccess): https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access/-/blob/develop/DotStat.MappingStore/SdmxParser.cs#L181
- NSI service (SdmxSource): https://citnet.tech.ec.europa.eu/CITnet/stash/projects/SDMXRI/repos/sdmxsource.net/browse/SdmxObjects/Model/Data/Query/DataQueryImpl.cs#745

---

### Uniqueness of Observations

Observations are uniquely identified by a Data Structure Definition (defined with a Maintenance Agency ID, ID and Version) and by the underlying Dimensions and their values. Dataflows, Measures or Attributes do not uniquely identify Observations, and vice-versa. The same Observation can be included in two different Dataflows defined on the same Data Structure Defintion. This happens when the content constraints of those Dataflows overlap or when no Content Constraints are defined.

The ensemble of Observations (with their values for Dimensions, Measures and Attributes) defined by a specific Data Structure Definition (version) is thus independent from ensembles of Observations defined by any other Data Structure Definition (version), unless one is backward-compatible with the other. This means that ensembles of Observations for different Data Structure Definitions (versions, if one is not backward-compatible with the other) require separate storage entities. However, for the moment, in .Stat Suite CORE there is a separate storage for any Data Structure Definition version, and thus related observation values need to be re-uploaded.
