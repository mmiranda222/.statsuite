---
title: "Confidentiality and embargo data"
subtitle: 
comments: false
weight: 7500
keywords: [
 'Definitions', '#definitions',
 'Restricted data access with embargo time', '#restricted-data-access-with-embargo-time',
 'Restricted data access', '#restricted-data-access',
 'Free for publication', '#free-for-publication',
 'Structure and data examples', '#structure-and-data-examples',
]

---

#### Table of Content
- [Definitions](#definitions)
- [Restricted data access with embargo time](#restricted-data-access-with-embargo-time)
- [Restricted data access](#restricted-data-access)
- [Free for publication](#free-for-publication)
- [Structure and data examples](#structure-and-data-examples)

> *Version history:*  
> Introduced with [August 24, 2023 Release .Stat Suite 'elote'](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#august-24-2023)

___

### Definitions
An observation (with all its measure and attribute values) is considered SDMX-confidential or SDMX-embargoed and only accessible by authorised users when the related **`CONF_STATUS`** attribute has one of the allowed values. By default, these values are **`F`**, **`N`**, **`C`** and **`E`**:
- F: Free (free for publication)
- N: Not for publication, restricted for internal use only 
- C: Confidential statistical information
- E: Not for publication, restricted for internal use only (equivalent to the code N) until the embargo time elapses; Free for publication (equivalent to the code F) after the embargo time elapses.

For more information about the available values, consult the related *SDMX* standard guidelines [Guidelines for Confidentiality and Embargo in SDMX](https://sdmx.org/wp-content/uploads/Guidelines_on_Confidentiality_and_Embargo.docx) as well as the full *SDMX* standard codelist [CL_CONF_STATUS](https://sdmx.org/wp-content/uploads/CL_CONF_STATUS_1_2_2018.docx).

The *SDMX* Confidential and Embargoed data can only be accessed by users with permission to read Point-in-Time (PIT) data: `2048`-"CanReadPitData" (see more about [permission business rules](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/permission-management)).

---

### Restricted data access with embargo time
When the **`CONF_STATUS`** attribute has the value **`E`** (SDMX-embargoed observations), then access to the underlying observation(s) is **restricted until the embargo time elapses**. The embargo date-time must be defined with the embargo timestamp specified in the **`EMBARGO_TIME`** attribute.  Before this timestamp, the observation is access-restricted. When embargo time is reached, then the observation and its underlying measure(s) and/or attribute(s) is not especially restricted anymore and thus accessible according to the usual permissions.

Supported format for the `EMBARGO_TIME` attribute values: YYYY-MM-DDThh:mm:ss.sTZD e.g. 2022-06-04T10:16:01, 2022-06-04T08:16:01Z, 2022-06-04T10:16:01+02:00, 2022-06-04T10:16:01.021+02:00

**Note** that, in the Data Explorer visualisation, the display of restricted observations **before and after** the embargo time elapses remains the same, which is, when having sufficient permissions, displaying the `CONF_STATUS` attribute value as a flag (if not configured to be displayed in any other way), and the `EMBARGO_TIME` value as the "Embargo timestamp" value in the "Information side panel":

![Restricted data access with embargo time](/dotstatsuite-documentation/images/restricted-embargo-data.png)

---

### Restricted data access
When the **`CONF_STATUS`** attribute has the value **`N`** or **`C`** (SDMX-confidential observations), then access to the underlying observation(s) is **always restricted**.

---

### Free for publication
When the **`CONF_STATUS`** attribute has **no value** or the value is **`F`** (non-restricted observations), then access to the underlying observation(s) is **always accessible** according to the usual permissions.

---

### Structure and data examples
Here attached are examples of *SDMX* structure files with the `CONF_STATUS` and `EMBARGO_TIME` attributes, as well as a .csv data file containing observations with attributes values for all the above confidentiality examples:
- [structures file](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/blob/e4a6839c98ebd64b59bd96b3a202b627d2cd87f4/static/OECD.SDD.SDPS-DF_TEST_CONFIDENTIAL_EMBARGO-1.0-all.xml)
- [data file](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/blob/e4a6839c98ebd64b59bd96b3a202b627d2cd87f4/static/OECD.SDD.SDPS-DF_TEST_CONFIDENTIAL_EMBARGO-1.0-data.csv)
