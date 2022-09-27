---
title: "Point in Time release options"
subtitle: 
comments: false
weight: 360

---

*"point in time" (PIT) release management with the data API is fully described in [this section](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/embargo-management).*

> Released with [October 5, 2021 .Stat Suite JS 10.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#october-5-2021)

When uploading data using the "Upload data" features in the DLM, advanced upload options allow the user to use the "Embargo (point-in-time) release management" features.  
Using an optional **Point-in-Time (PIT)** date, the uploaded data can be kept under embargo in parallel to the previously available data until the embargo date is reached and the embargo data fully replace the previously available data.

![dlm-upload-data-pit](/dotstatsuite-documentation/images/dlm-upload-data-pit1.png)

By default, the target version "Live" means that the user uploads data that will be automatically available (not embargoed). If the user selects "Embargo", then the "Release date-time" date picker is activated and the user can define a date and time in the future. Note that behind the scene, the users' timezone is automatically taken into account.  
If the user doesn't (yet) define a release date and time, then it is left as *undetermined* and the user can subsequently update/upload the data targetting the Embargo version.

Note also that the release data and the release date-time can be set or changed subsequently.  
Also note that, if there is an existing Embargo of data for a dataflow/DSD, then it is not possible to update the Live version of the data (due to potential conflict when the Embargo version is copied to the Live one).

![dlm-upload-data-pit](/dotstatsuite-documentation/images/dlm-upload-data-pit2.png)

The optional feature "Allow for later emergency restoration of the current live data" allows to keep a restoration copy of the data. Read more about [how to restore Live data](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/embargo-management/#rollback-and-restoration).

Once the user has completed the data upload options and clicked on "Upload", the upload process will follow the regular process as described [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/upload-data/upload-data-sdmx-file/#).

The release of the PIT version of data happens then at the exact date-time as specified in the relase date-time.
