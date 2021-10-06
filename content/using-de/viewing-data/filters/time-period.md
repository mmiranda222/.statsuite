---
title: "Frequency & Time-Period"
subtitle: 
comments: false
weight: 2130
keywords: [
  'Frequency & Time Period', '#frequency-and-time-period-selectors',
  'Last N Periods', '#last-n-periods',
  'Hiding Frequeny & Time Period filters','#hiding-frequency-and-time-period-filters'
]
---

#### Table of Content
- [Frequency & Time Period](#frequency-and-time-period-selectors)
- [Last N Periods](#last-n-periods)
- [Hiding Frequency & Time Period filters](#hiding-frequency-and-time-period-filters)

---

### Frequency and Time-Period selectors
**Frequency & Time Period** is a combined set of selectors in the visualisation page, enabling to filter a data view for time-period range in the context of a pre-selected frequency. **Frequency** is a single-selection filter, and **Time Period** is a range selector.  
Most of the (*standard SDMX*) used frequencies are supported: Annual, biannual, quarterly, monthly, weekly, daily, daily (business week), hourly. Minutely and secondly are *nice to have* options.  

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

**Exceptions**  
If the content constraints are not defined (see [data availability](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/filters/data-availability/)), then the DE relies on default boundaries and default period (defined in the settings of the instance).  
If the content constraints are defined but do not have boundaries period, then the DE relies on the default boundaries and default period.  
If the content constraints are defined and have boundaries, then the DE uses the default periods in order to fit to the boundaries of the content constraints.  
*(since [July 8, 2021 Release .Stat Suite JS 9.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#july-8-2021))* It is **never possible** to select an end period that is before the start period, and vice-versa, a start period that is after the end period. This means that each dropdown box content takes into account the selection in the other dropdown.  
Example: assuming that the start and end periods are open. When the user selects a start period then the dropdown content of the end period is automatically restricted to start only from the selected start period. Vice-versa, under the same assumption, when the user selects an end period, then the dropdown content of the start period is automatically restricted to end latest on the selected end period.  
Last, when a date selector is **empty**, then selecting a start date will select the first available date, and selecting an end date will select the latest date available.

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


---

### Hiding Frequency and Time Period filters
> The feature was enhanced with [October 5, 2021 Release .Stat Suite JS 10.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#october-5-2021)

The Frequency and Time-Period filters can be hidden in two cases: if the dataflow doesn't have a `TIME_PERIOD` time dimension, or if the dataflow has a `NOT_DISPLAYED` annotation containing the TIME_PERIOD time dimension.

**Case 1: dataflow without `TIME_PERIOD` time dimension**

If your dataflow doesn't contain a TIME_PERIOD, then you won't see the Frequency and Time-Period filter diplayed in the DE. This includes the frequency filter, the start/end date filter and the last N periods filter.

![Dataflow without TIME_PERIOD](/dotstatsuite-documentation/images/dataflow-without-TIME_PERIOD-time-dimension.PNG)

**Case 2: dataflow with "NOT_DISPLAYED" annotation containing the `TIME_PERIOD` time dimension**

You can decide to hide the Frequency and Time-Period filter even if your dataflow contains a TIME_PERIOD dimension.  
To do so, you can define the SDMX annotation of type `NOT_DISPLAYED` (see [specifications](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/custom-data-view/not-displayed/)) to be used for hiding the filter. 

![NOT_DISPLAYED annotation](/dotstatsuite-documentation/images/NOT_DISPLAYED-annotation-containing-TIME_PERIOD.png) 

![Hidden filters](/dotstatsuite-documentation/images/Frequency-Time-Period-filters-hidden-using-NOT_DISPLAYED-annotation.png)

![Filters not hidden](/dotstatsuite-documentation/images/Frequency-Time-Period-filters-not-hidden.png)

**Note:**

If the `NOT_DISPLAYED` annotation contains the frequency dimension (FREQ or FREQUENCY) but does not contain the TIME_PERIOD time dimension:
Only the frequency filter should be hidden. The start/end date filter and the last N periods filter should remain.


