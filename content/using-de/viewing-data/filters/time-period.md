---
title: "Frequency & Time-Period" 
subtitle: 
comments: false
weight: 2130
keywords: [
  'Frequency and Time-Period selectors', '#frequency-and-time-period-selectors',
  'Frequency', '#frequency',
  'Time Periods', '#time-periods',
  'Last [..] period(s)', '#last-period-s',
  'Last [..] time series value(s)', '#last-time-series-value-s',
  'Hiding Frequeny & Time Period filters','#hiding-frequency-and-time-period-filters',
  'Data availability', '#data-availability'
]
---

#### Table of Content
- [Frequency and Time-Period selectors](#frequency-and-time-period-selectors)
  - [Frequency](#frequency)
  - [Time Periods](#time-periods)
  - [Last [..] period(s)](#last-period-s)
  - [Last [..] time series value(s)](#last-time-series-value-s)
- [Hiding Frequency & Time Period filters](#hiding-frequency-and-time-period-filters)
- [Data availability](#data-availability)

---

### Frequency and Time-Period selectors
**Frequency & Time Period** is a combined set of selectors in the visualisation page, enabling to filter a data view for time-period range in the context of a pre-selected frequency. **Frequency** is a single-selection dropdown, and **Time Period** is a range selector.  
Most of the (*standard SDMX*) used frequencies are supported: Annual, biannual, quarterly, monthly, weekly, daily, daily (business week), hourly. Minutely and secondly are *nice to have* options.  

Selectors without a selection show 2 or 4 dashes ('--' or '----'), depending on their purpose.

#### Frequency  
The frequencies returned in the **Frequency** dimension of a data view are displayed in the **Frequency** filter, and only the frequencies returned for the given data view are displayed in it. 

If there is no **Frequency** dimension defined for the displayed data, then the **Frequency** filter isn't displayed and the **Time Period** selector uses an annual time format. See [here](/dotstatsuite-documentation/using-api/typical-use-cases#frequency-dimension) for how the Frequency dimension is recognised.

If the data has only one **Frequency** value, then the **Frequency** filter isn't displayed, and the **Frequency** value is shown only in the data view table/chart header.  
In any case, the **Time Period** range selector will dynamically update according to the **Frequency** selection.

![frequency](/dotstatsuite-documentation/images/time-period-1.png)

The user cannot remove the **Frequency** value in the 'Applied filters'. Thus there is no cross in the **Frequency** value.  

#### Time Periods  
The **Time Period** range selector layout is dynamic and updates according to the **Frequency** selection; only the necessary drop-down boxes with items corresponding to the selected **Frequency** are shown, e.g., when selecting a daily frequency, then the **Time Period** range selector displays appropriately filled dropdowns for the year, month and day. 

![time period](/dotstatsuite-documentation/images/time-period-2.png)

The **boundaries** applied in the **Time Period** filter are defined using the following rules in this order of increasing priority:

* The _start boundary_ and _end boundary_ take the current year.
* The _start boundary_ and _end boundary_ take the default boundaries defined in the [DE **config** settings](/dotstatsuite-documentation/configurations/de-configuration/#default-time-period-boundaries-and-default-time-period-selection), if available.
* The _start boundary_ and _end boundary_ take the **[data availability](/dotstatsuite-documentation/using-de/viewing-data/filters/data-availability/)**, if available.
* The _start boundary_ must always be smaller than or equal to the _end boundary_.

The initial **selections** applied in the **Time Period** filter are defined using the following rules in this order of increasing priority:

* The _start period_ and _end period_ selections take the above **boundaries** settings.
* The _start period_ and _end period_ selections take the related default selection defined in the [DE **config** settings](/dotstatsuite-documentation/configurations/de-configuration/#default-time-period-boundaries-and-default-time-period-selection), if available and if within the final boundaries settings.
* The _last [..] period(s)_ selection take the related default selection defined in the [DE **config** settings](/dotstatsuite-documentation/configurations/de-configuration/#default-time-period-boundaries-and-default-time-period-selection), if available, and the _start period_ is auto-calculated accordingly (see [here]()) and the _end period_ is non-selected.
* The _start period_ and _end period_ selections take the related [`DEFAULT` **annotation** settings](/dotstatsuite-documentation/using-de/viewing-data/preview-table/custom-data-view/default-selection/), if available and if within the boundaries settings.
* The _last [..] period(s)_ selection takes the related [`DEFAULT` **annotation** settings](/dotstatsuite-documentation/using-de/viewing-data/preview-table/custom-data-view/default-selection/), the _start period_ is then auto-calculated accordingly (see [Last [..] period(s)](#last-period-s)) and the _end period_ is non-selected.
* The _start period_ and _end period_ selections take the related current [DE **URL**settings](/dotstatsuite-documentation/using-de/general-layout/#url-parameters), if available and if within the boundaries settings.
* The _last [..] period(s)_ selection takes the related current [DE **URL** settings](/dotstatsuite-documentation/using-de/general-layout/#url-parameters), the _start period_ is then auto-calculated accordingly (see [Last [..] period(s)](#last-period-s)) and the _end period_ is non-selected.
* If set, then the _start period_ must always be smaller than or equal to the the _end boundary_ and smaller than or equal to the _end period_, if that is also set.

If there is no **Time** dimension defined for the displayed data, then the **Frequency and Time-Period** filter is hidden. See [here](/dotstatsuite-documentation/using-api/typical-use-cases#time-dimension) for how the **Time** dimension is recognised.

> Introduced in [July 8, 2021 Release .Stat Suite JS 9.0.0](/dotstatsuite-documentation/changelog/#july-8-2021)

The user can **never** select an _end period_ that is before the _start period_, and vice-versa, a _start period_ that is after the _end period_. This means that each dropdown box content takes into account the selection in the other dropdown.  
Example: assuming that the _start and end periods_ are open. When the user selects a _start period_ then the dropdown content of the _end period_ is automatically restricted to start only from the selected _start period_. Vice-versa, under the same assumption, when the user selects an _end period_, then the dropdown content of the _start period_ is automatically restricted to end latest on the selected end period.  
When a _start or end period_ has no selection, then selecting the year will automatically select the most appropriate values for the other time period date parts like quarter, month or day. E.g., selecting a start year will automatically set the corresponding first available quarter, month or day (as appropriate), selecting a end year will automatically set the corresponding last available quarter, month or day (as appropriate).  
The _start and end periods_ can be deselected, in which case they will not be applied in the data request.  

The *green* number of **selected values/total of values** is counting values for a given frequency. So for example, it will count the number of selected/total years when Yearly is selected, the number of selected/total months when Monthly is selcted, etc...

![number of values](/dotstatsuite-documentation/images/time-period-3.png)

> Introduced in [March 4, 2022 Release .Stat Suite JS 13.0.0](/dotstatsuite-documentation/changelog/#march-4-2022)

The **Frequency & Time Period** filter takes as title the concatenated, localised *SDMX* concept names of the **Frequency** and **Time** dimensions (glued with the ' & ' term), depending on the presence of those dimensions. Also see the paragraph about [Hiding Frequency and Time Period filters](#hiding-frequency-and-time-period-filters).

![overriden time period & frenquency names](/dotstatsuite-documentation/images/time-period-4.png)

See the [documentation](/dotstatsuite-documentation/using-de/viewing-data/common-features/#how-special-dimensions-are-identified) on how time and frequency dimensions are identified.

> Introduced in [July 20, 2023 Release .Stat Suite JS Virtual](/dotstatsuite-documentation/changelog/#july-20-2023)

The Data Explorer proposes two alternative (mutually exclusive) options for retrieving the latest available data within other filter criteria, either with a generic time span of a fixed number of latest available time periods ([Last [..] period(s)](#last-period-s)) or with a time-series-specific time span of a fixed number of latest available time periods ([Last [..] time series value(s)](#last-time-series-value-s)). Both options share the same number edit box.

#### Last [..] period(s)

The shared edit box for **Last [..] period(s)** is displayed in the lower part of the **Frequency & Time period** filter. A mouse-over popup contains the localised text 'Latest available [e.g., 5] time periods within the other filter criteria'.  

![Last [..] period(s)](/dotstatsuite-documentation/images/de-filter-last-periods.png)

If set, the time range returned by the SDMX web service with a [dynamic data availability query](/dotstatsuite-documentation/using-api/typical-use-cases/#dynamic-data-availability-for-a-specific-data-selection) is used to calculate the appropriate _start period_ for the data request according to the selected number of time periods. The calculation respects the current frequency selection and is executed as follow: 

* X = selected last [X] periods
* A = dynamic data availability _end period_ obtained without time period selection (or if that is not available then the actual data availability _end period_)
* B = dynamic data availability _start period_ obtained without time period selection (or if that is not available then the actual data availability _start period_)
* If A-X+1 > B then _start period_ submitted to SDMX_WS := A-X+1  
  Else _start period_ submitted to SDMX-WS := B
* The SDMX-WS data request will not use an _end period_ parameter

A generic default for this option for a given DE instance can be defined in the [DE **config** settings](/dotstatsuite-documentation/configurations/de-configuration/#default-time-period-boundaries-and-default-time-period-selection).

A data-specific default for this option can be defined in the [`DEFAULT` **annotation** settings](/dotstatsuite-documentation/using-de/viewing-data/preview-table/custom-data-view/default-selection/).

The order of priority of these settings is explained in the paragrpah about [Time Periods](#time-periods).

When entering a new value in the related edit box, then the **Last [..] period(s)** option is auto-selected. Vice-versa, when the user selects a new _start or end period_, then the value for the **Last [..] period(s)** is removed. 

#### Last [..] time series value(s)

>Pre-requisite: This feature is to be enabled per data space in the [DE **config** settings](/dotstatsuite-documentation/configurations/de-configuration/#support-of-last-n-observations-feature), and must be supported by the related SDMX web service.

The shared edit box for **Last [..] time series value(s)** is displayed in the lower part of the **Frequency & Time period** filter. A mouse-over popup contains the localised text 'Latest available [e.g., 5] values per time series within the other filter criteria'.   

If set, the selected number of latest time series observations per time series will be returned for table and chart views of a given data view.  

![Last [..] time series value(s)](/dotstatsuite-documentation/images/de-filter-last-time-series-values.png)

A data-specific default for this option can be defined in the [`DEFAULT` **annotation** settings](/dotstatsuite-documentation/using-de/viewing-data/preview-table/custom-data-view/default-selection/).

---

### Hiding Frequency and Time Period filters
> The feature was enhanced with [October 5, 2021 Release .Stat Suite JS 10.0.0](/dotstatsuite-documentation/changelog/#october-5-2021)

The Frequency and Time-Period filters are hidden in two cases: if the dataflow doesn't have a `TIME_PERIOD` time dimension, or if the dataflow has a `NOT_DISPLAYED` annotation containing the TIME_PERIOD time dimension.

**Case 1: dataflow without `TIME_PERIOD` time dimension**

If your dataflow doesn't contain a TIME_PERIOD, then you won't see the Frequency and Time-Period filter diplayed in the DE. This includes the frequency filter, the start/end date filter and the last N periods filter.

![Dataflow without TIME_PERIOD](/dotstatsuite-documentation/images/dataflow-without-TIME_PERIOD-time-dimension.PNG)

**Case 2: dataflow with "NOT_DISPLAYED" annotation containing the `TIME_PERIOD` time dimension**

You can decide to hide the Frequency and Time-Period filter even if your dataflow contains a TIME_PERIOD dimension.  
To do so, you can define the SDMX annotation of type `NOT_DISPLAYED` (see [specifications](/dotstatsuite-documentation/using-dlm/custom-data-view/not-displayed/)) to be used for hiding the filter. 

![NOT_DISPLAYED annotation](/dotstatsuite-documentation/images/NOT_DISPLAYED-annotation-containing-TIME_PERIOD.png) 

![Hidden filters](/dotstatsuite-documentation/images/Frequency-Time-Period-filters-hidden-using-NOT_DISPLAYED-annotation.png)

![Filters not hidden](/dotstatsuite-documentation/images/Frequency-Time-Period-filters-not-hidden.png)

**Note:**

If the `NOT_DISPLAYED` annotation contains the frequency dimension (FREQ or FREQUENCY) but does not contain the TIME_PERIOD time dimension:
Only the frequency filter should be hidden. The start/end date filter and the last N periods filter should remain.

---

### Data availability
See [this page](/dotstatsuite-documentation/using-de/viewing-data/filters/data-availability/)
