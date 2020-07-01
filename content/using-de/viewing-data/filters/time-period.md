---
title: "Frequency & Time-Period"
subtitle: 
comments: false
weight: 2130

---

#### Table of Content
- [Frequency & Time Period](#frequency-and-time-period-selectors)
- [Last N Periods](#last-n-periods)

---

### Frequency and Time-Period selectors
**Frequency & Time Period** is a combined set of selectors in the visualisation page, enabling to filter a data view for time-period range in the context of a pre-selected frequency. **Frequency** is a single-selection filter, and **Time Period** is a range selector.  
Most of the (*standard SDMX*) used frequencies are supported: Annual, biannual, quarterly, monthly, weekly, daily, daily (business week), hourly. Minutely and secondly are nice to have options.  

**Frequencies**  
The frequencies returned in the **Frequency** dimension of a data view are displayed in the filter, and only the frequencies returned for the given data view are displayed in it. If there is only one frequency, then the filter isn't displayed, and **Frequency** is shown only in the data view table/chart header.  
In any case, the **Time Period** range selector will dynamically update according to the **Frequency** selection.

![frequency](/dotstatsuite-documentation/images/time-period-1.png)

**Time Periods**  
As a general behavior, the **Time Period** selector layout is dynamic and updates according to the Frequency selection, e.g. *"I select Daily frequency, and the Time Period range selector displays the boxes for Year, Month and Day"*.  
At this stage, if only Year is filled, or Year and Month, then it means that all available values in this range are returned. The selection field dropdown content automatically adapts to the corresponding date/time part displayed, e.g. "1" and "2" for semesters, and it should also take the actual data availability into account (see [this documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/data-availability/)).  
In the **Time Period** selector, each box is a drop-down list of items corresponding to the selected **Frequency**.

![time period](/dotstatsuite-documentation/images/time-period-2.png)

**Configurations**  
If there is no Frequency dimension returned for a data view, then the **Frequency** Annual is selected by default.  
The configuration "vis.period.boundaries": [1970, 2020] is used to return the list of available years in the **Time Period** selector. [Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#time-period-boundaries)  
The configuration "vis.period.default": [2008, 2018] is used to display the default range selected for a given data view. [Documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#default-time-period)

**Specificities**  
In the "Used filters" area, **Frequency** cannot be removed, but only replaced. Thus there is no cross in front of the selected **Frequency**.  
For **Time Period** ranges, each start / end can be removed, and thus no filter will be applied for each.  
The *green* number of **selected values/total of values** is counting values for a given frequency. So for example, it will count the number of selected/total years when Yearly is selected, the number of selected/total months when Monthly is selcted, etc...

![number of values](/dotstatsuite-documentation/images/time-period-3.png)

---

### Last N Periods
>Pre-requisite: This feature is defined by the configuration and must supported by the web service. See [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#lastnobservations-support).

An edit box for "Last [xxx] periods" is visible under the "Frequency & Time period" filter in the DE visualisation page.  
It implies that the equivalent number of latest time series observations per time series will be returned for table and chart views of a given data view.  
Unless the LastNObservations value is defined by an `SDMX`-sourced default setting (see the example below) or by a URL parameter, at first display the edit box will show an empty value "--". Otherwise it shows the number retrieved from the default setting or the URL.

![Last N Periods](/dotstatsuite-documentation/images/last-n-periods.png)

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

