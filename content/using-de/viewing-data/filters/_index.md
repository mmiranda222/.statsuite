---
title: "Filters"
subtitle: 
comments: false
weight: 2100

---

#### Table of Content
- [Multi selection and Scopelist](#multi-selection-and-scopelist)
- [Frequency and Time Period](#frequency-and-time-period)
- [Last N Periods](#last-n-periods)
- [Spotlight](#spotlight)
- [Data availability](#data-availability)
- [Used filters](#used-filters)

*under construction...*

### Last N Periods
>Pre-requisite: This feature is defined by the configuration and must supported by the web service. See [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#lastnobservations-support).

An edit box for "Last [xxx] periods" is visible under the "Frequency & Time period" filter in the DE visualisation page.  
It implies that the equivalent number of latest time series observations per time series will be returned for table and chart views of a given data view.  
Unless the LastNObservations value is defined by an `SDMX`-sourced default setting (see the example below) or by a URL parameter, at first display the edit box will show an empty value "--". Otherwise it shows the number retrieved from the default setting or the URL.

![Last N Periods](/images/last-n-periods.png)

**Example**:  
If a dataflow has yearly data and sparse observations within the default time period range from 2014 to 2018.  
This dataflow has also an `SDMX` annotation of type "DEFAULT" that is defined at the dataflow level for `LASTNOBSERVATIONS=1` (see [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/custom-data-view/default-layout/) how to define this `SDMX` annotation of type `DEFAULT`):  
```
        "annotations":[{
                 "type": "DEFAULT"
                 "title": "TIME_PERIOD_START=2013,TIME_PERIOD_END=2015,LASTNOBSERVATIONS"
         }]

```
Then the default displayed table and chart view can contain data for:  
* time period 2015 for time series 1 (--> if 2015 is the latest time period for this time series within the given new range 2013 to 2015)
* time period 2015 for time series 2 (--> if 2015 is the latest time period for this time series within the given new range 2013 to 2015) and
* time period 2014 for time series 3 (--> if 2014 is the latest time period for this time series within the given new range 2013 to 2015).

