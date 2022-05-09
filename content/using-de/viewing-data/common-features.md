---
title: "Common view features"
subtitle: 
comments: false
weight: 2100
keywords: [
  'How special dimensions are identified','#how-special-dimensions-are-identified'
  'Identification of the time dimension','#identification-of-the-time-dimension'
  'Identification of the data's frequency','#identification-of-the-data-s-frequency'
  'Identification of the geo/reference area dimension','#identification-of-the-geo-reference-area-dimension'
]
---

### Table of Content
- [How special dimensions are identified](#how-special-dimensions-are-identified)
  - [Identification of the time dimension](#identification-of-the-time-dimension)
  - [Identification of the data's frequency](#identification-of-the-data-s-frequency)
  - [Identification of the geo/reference area dimension](#identification-of-the-geo-reference-area-dimension)

---

## How special dimensions are identified

Some type of dimensions have an impact on the behavior of the data view, e.g. in:
* time axis in timeline chart
* frequency for filters
* ref area for choropleth map

These dimensions require to be identified properly through their:
* role
* concept id
* dimension id

It is to note that the filter uses structure messages while the tables and charts use data messages for their generation.  

--------------------

### Identification of the time dimension

In SDMX, the time dimension is normally clearly identified through its fixed dimension ID "**TIME_PERIOD**". In structure messages, the time dimension is even represented through a special element.

However, if no dimension ID "**TIME_PERIOD**" exists then for backward-compatiblity with legacy systems (e.g. when underlying shared .Stat Suite libraries are used outside the context of the Data Explorer) the time dimension can also be recognised by its **role**: "**TIME_PERIOD**". If even such role is not available/found then the time dimension is recognised by its **concept ID** or by its **dimension ID** that allows also for "**TIME**" or "**YEAR**".

--------------------

### Identification of the data's frequency

Because data views only allow for the display of data for one frequency at the time, it is important to determine the available frequencies and pick the most appropriate one.

##### **1. Retrieval of the frequency dimension**

The frequency dimension can be recognised by its **role**: "**FREQ**" (see: https://sdmx.org/?sdmx_news=just-published-guidelines-for-sdmx-concept-roles). If such role is not available/found then by its **concept ID** or by its **dimension ID**: "**FREQ**" or "**FREQUENCY**".

Most used frequencies are:  

| frequency code ID | meaning |  
|-------------------|-------------|  
| A2 | Biennial |  
| A | Annual |  
| S | Half-yearly, Semester |  
| Q | Quarterly |  
| M | Monthly |  
| W | Weekly |  
| D | Daily |  
| H | Hourly |  
| B | Daily - business week |  
| N | Minutely |  

If a frequency dimension cannot be found, then: 

##### **2. Retrieval of the frequencies from the time-format attribute**

This attribute will implicitly indicate the frequency assigned for the data of the dataset. The time format attribute can be recognised by its **concept ID** or by its **dimension ID**: "**TIME_FORMAT**".

Most used time formats are:  

| time format code ID | meaning |
|---------|---------|
| P1D | Daily (or Daily - business week) |
| P1M | Monthly |
| P1Y | Annual |
| P3M | Quarterly |
| P6M | Half-yearly, Semester |
| P7D | Weekly |
| PT1M | Minutely |

If no frequency dimension nor time-format attribute are found, then 

##### **3. Retrieval of the frequency from subsequent observation values**

This approach is only possible for data messages that are not the result of a special range request (pagination). It requires the presence of a time dimension and of two subsequent observations of the same time series, in general it can be the first 2 observations retrieved because the observations in the data message are ordered by time series.

The time period values of these 2 observations are used and the duration between their (start) dates is calculated, e.g.  
>  0: {start: "2009-01-01T00:00:00Z", end: "2009-12-31T23:59:59Z", id: "2009"}  
>  1: {start: "2010-01-01T00:00:00Z", end: "2010-12-31T23:59:59Z", id: "2010"}  
  duration = "2010-01-01T00:00:00Z" - "2009-01-01T00:00:00Z" = 356d ==> Annual  or  
  duration = "2010" - "2009" = 356d ==> Annual  

| duration | meaning |
|---------|---------|
| 1d | Daily (or Daily - business week) |
| 28d - 31d | Monthly |
| 356d - 366d | Annual |
| 89d - 92d | Quarterly |
| 178d - 188d | Half-yearly, Semester |
| 7d | Weekly |
| 1mn | Minutely |

If no frequency dimension, time-format attribute and time dimension are found, then the time period/frequency filter and the timeline chart menu option are disabled/hidden.

--------------------

### Identification of the geo/reference area dimension

The geo/reference area dimension is used for the Choropleth map.

The geo/reference area dimension can be recognised by its **role**: "**GEO**" (see: https://sdmx.org/?sdmx_news=just-published-guidelines-for-sdmx-concept-roles) or for backward-compatibility also "**REF_AREA**". Note that several dimensions could have the role "GEO" thus only the **first** of those dimensions is to be used.

If such a role is not available/found then the dimension can be recognised by its **concept ID** or by its **dimension ID**: "**REF_AREA**" or for backward-compatibility also "**COUNTRY**", "**LOCATION**", "**REGION**", "**REFERENCE_AREA**". 

If no geo/reference area dimension is found, then the Choropleth map chart menu option is hidden.
