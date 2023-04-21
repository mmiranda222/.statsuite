---
title: "Reversed time period sort order"
subtitle:
comments: false
weight: 505
keywords: [

]

---

>Introduced in [April 20, 2023 Release .Stat Suite JS unicorn](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-20-2023)

The default behavior to display the Time Period dimension in all data table and chart views is the ascending sort order. Alternatively, this default sorting order can be overriden for the whole Data Explorer instance (see [configuration specs](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#time-period-sort-order-override)), but it can also be **overriden at the dataflow or DSD level by using the *SDMX* annotation of type `LAYOUT_TIME_PERIOD_DESC`**.

Example at dataflow level:

```xml
    <structure:Dataflow id="DATAFLOW_TEST" agencyID="OECD" version="1.0" isFinal="false">
      <common:Annotations>
        <common:Annotation>
          <common:AnnotationType>LAYOUT_TIME_PERIOD_DESC</common:AnnotationType>
        </common:Annotation>
      </common:Annotations>
      <common:Name xml:lang="en">Table 01 - Gross domestic product at market prices</common:Name>
      <structure:Structure>
        <Ref id="DSD_TEST" version="1.0" agencyID="OECD" package="datastructure" class="DataStructure"/>
      </structure:Structure>
    </structure:Dataflow>
```

If the **`LAYOUT_TIME_PERIOD_DESC`** type is defined at the dataflow level, then its Time Period dimension values are displayed in the descending sort order (from newest to oldest) by default.

Example at DSD level:

```xml
    <structure:DataStructures>
      <structure:DataStructure id="DSD_TEST" agencyID="OECD" version="1.0" isFinal="false">
        <common:Annotations>
          <common:Annotation>
            <common:AnnotationType>LAYOUT_TIME_PERIOD_DESC</common:AnnotationType>
          </common:Annotation>
        </common:Annotations>
        <common:Name xml:lang="en">Main Aggregates</common:Name>
        <structure:DataStructureComponents>
        ...
```

If the **`LAYOUT_TIME_PERIOD_DESC`** type is defined at the DSD level, then all dataflows related to that same DSD will display its Time Period dimension values in the descending sort order (from newest to oldest) by default.

![Time period reverse](/dotstatsuite-documentation/images/de-time-period-reverse-order.png)
