---
title: Irregular time periods
subtitle: 
comments: false
weihgt: 2955

---

> *Version history:*  
> Introduced with [September 20, 2023 Release .Stat Suite JS "xray"](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#september-20-2023)

**Irregular "time range" time periods** are ranges/periods that do not follow the standard reporting periods.  
See "Standard Reporting Period" and "Distinct Range" as defined in the [SDMX standard Informaiton Model](https://sdmx.org/wp-content/uploads/SDMX_2-1_SECTION_6_TechnicalNotes.pdf).

As per the standard definition, "the value of these ranges is based on the ISO 8601 time interval format of start/duration. "Start" can be expressed as either an ISO 8601 date or a date-time, and "duration" is expressed as an ISO 8601 duration. However, the duration can only be positive.  

The time Range is expressed with Start time and duration as **YYYY-MM-DD(Thh:mm:ss)?/<duration>** where <duration> is based on https://www.w3.org/TR/xmlschema-2/#duration, and is of format P[nY][nM][nD][T[nH][nM][nS]], but most often it is PnY, PnM, PnD, PTnH, PTnM, or PTnS (n being a positive number).

**Note** that mixed durations is not supported, e.g. P1Y2M (since P14M can be used instead).  

**List of irregular time periods formats** and their corresponding display: see [annex](#annex). Note also that the applied display of years and months will be dependent on the [DE configuration for the localised itme period values](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#localised-time-period-values-for-monthly-frequency).

**Table display example** with a time period format **`"YYYY-MM-DD/P3M"`**

![irregular time periods](/dotstatsuite-documentation/images/de-irregular-time-periods1.png)



### Annex

| Irregular time period       | corresponds to                                                | monthly timeFormat: default ("YYYY-MM")                | locale: EN; monthly timeFormat: "YYYY-MMM"  | locale: FR; monthly timeFormat: "MMM YYYY"  |
|-----------------------------|---------------------------------------------------------------|-------------------------------------|-------------------------------------|-------------------------------------|
| "2000-01-01/P5Y"            | 5-year range 2000 to 2004                                     | 2000 – 2004                         | 2000 – 2004                         | 2000 – 2004                         |
| "2000-07-01/P1Y"            | 1-year range Jul 2000 to Jun 2001                             | 2000-07 – 2001-06                   | 2000-Jul – 2001-Jun                 | Juil 2000 – Juin 2001              |
| "2000-07-10/P1Y"            | 1-year range 10 Jul 2000 to 09 Jun 2001                       | 2000-07-10 – 2001-06-09             | 2000-07-10 – 2001-06-09             | 2000-07-10 – 2001-06-09             |
| "2015-01-01/P3M"            | 3-month range Jan 2015 to Mar 2015                            | 2015-01 – 2015-03                   | 2015-Jan – 2015-Mar                 | Jan – Mar 2015                          |
| "2015-02-01/P3M"            | 3-month range Feb 2015 to Apr 2015                            | 2015-02 – 2015-03                   | 2015-Feb – 2015-Apr                 | Fév – Avr 2015                          |
| "2015-11-01/P3M"            | 3-month range Nov 2015 to Jan 2016                            | 2015-11 – 2016-01                   | 2015-Nov – 2016-Jan                 | Nov 2015 – Jan 2016                 |
| "2015-11-10/P3M"            | 3-month range 10 Nov 2015 to 09 Jan 2016                      | 2015-11-10 – 2016-01-09             | 2015-11-10 – 2016-01-09             | 2015-11-10 – 2016-01-09             |
| "2015-01-01/P7D"            | 7-day range 01 Jan 2015 to 07 Jan 2015                        | 2015-01-01 – 2015-01-07             | 2015-01-01 – 2015-01-07             | 2015-01-01 – 2015-01-07             |
| "2015-01-30/P7D"            | 7-day range 30 Jan 2015 to 05 Feb 2015                        | 2015-01-30 – 2016-02-05             | 2015-01-30 – 2016-02-05             | 2015-01-30 – 2016-02-05             |
| "2015-12-30/P7D"            | 7-day range 30 Dec 2015 to 05 Jan 2016                        | 2015-12-30 – 2016-01-05             | 2015-12-30 – 2016-01-05             | 2015-12-30 – 2016-01-05             |
| "2000-03-01T12:30:00/P1D"   | 1-year range 01 Mar 2000 12:30 to 02 March 2000 12:29         | 2000-03-01 12:30 – 2000-03-02 12:29 | 2000-03-01 12:30 – 2000-03-02 12:29 | 2000-03-01 12:30 – 2000-03-02 12:29 |
| "2000-03-01T23:30:00/PT1H"  | 1-hour range 01 Mar 2000 23:30 to 02 March 2000 00:29         | 2000-03-01 23:30 – 2000-03-02 00:29 | 2000-03-01 23:30 – 2000-03-02 00:29 | 2000-03-01 23:30 – 2000-03-02 00:29 |
| "2000-03-01T12:30:00/PT30M" | 30-minute range 01 Mar 2000 12:30 to 01 March 2000 12:59      | 2000-03-01 12:30 – 12:59            | 2000-03-01 12:30 – 12:59            | 2000-03-01 12:30 – 12:59            |
| "2000-03-01T12:30:00/PT5S"  | 5-second range 01 Mar 2000 12:30:00 to 01 March 2000 12:30:04 | 2000-03-01 12:30:00 – 12:30:04      | 2000-03-01 12:30:00 – 12:30:04      | 2000-03-01 12:30:00 – 12:30:04      |
