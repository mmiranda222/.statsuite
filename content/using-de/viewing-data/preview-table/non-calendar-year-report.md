---
title: "Non-calendar reporting periods display"
subtitle: 
comments: false
weight: 2960
---

> *Version history:*  
> Taking the "REPYEARSTART" attribute into account since [April 11, 2022 Release .Stat Suite JS 14.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-11-2022)  
> Introduced with [December 14, 2021 Release .Stat Suite JS 11.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#december-14-2021)

When the Data Structure Definition related to a data view uses either the `REPORTING_YEAR_START_DAY` or the `REPYEARSTART` attribute (with a fixed representation (xs:gMonthDay), e.g. having as value "--07-01" for specifying the 1st of July as the start day of every reporting year) at dataset (dataflow), group (e.g. time series) or observation level, then the value of this attribute is taken into account when interpreting and displaying time periods. This is done as follows:

| Frequency or time period format | Reporting year start day example | SDMX time period ID example | Label display | Auto-note |
| - | - | - | - | - |
| Annual | "--07-01" | "2001-A1" or "2001" | "2001/2002" | "2001-07-01 – 2002-06-30" |
| Half-yearly | "--07-01" | "2001-S1" | "2001/2002-S1" | "2001-07-01 – 2001-12-31" |
| Quarterly | "--07-01" | "2001-Q1" | "2001/2002-Q1" | "2001-07-01 – 2001-09-30" |
| Monthly | "--07-**01**" | "2001-M01" or "2001-01" | "2001-Jul" (current monthly formatting) | - |
| Monthly | "--07-15" | "2001-M01" or "2001-01" | "2001/2002-M01" | "2001-07-15 – 2001-10-14" |
| Weekly | "--07-01" | "2001-W01" | "2001/2002-W01" | "2001-07-01 – 2001-07-07" |
| Daily | "--07-01" | "2001-D001" or "2001-01-01" | "2001-07-01" | - |

The Data Explorer also auto-generates notes (*) with a specific text for each time period showing the exact time range covered by the time period (see Auto-note in the table above).

![Data model example](/dotstatsuite-documentation/images/de-REPYEARSTART-attr.png)

Also see the **API specifications**: https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/typical-use-cases/#non-calendar-reporting-periods
