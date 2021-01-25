---
title: "Point in Time release"
subtitle: 
comments: false
weight: 300

---

Currently the feature for the management of embargoed data through a "point in time" (PIT) release is managed with the data API, and described in [this section](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/embargo-management).

**Note** that there are currently no timezone conversions for the Point-in-Time (PIT) dates, and that the user's date time might not be the same than the server's date time. **When specifying a Point-in-Time (PIT) date, please use the server's timezone.**
