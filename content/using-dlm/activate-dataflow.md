---
title: "Activate a dataflow"
subtitle: 
comments: false
weight: 315

---

> Introduced with [September 15, 2022 Release .Stat Suite JS radio](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#september-15-2022)

It is possible to manually initialise or re-initialise ("activate") a dataflow. This is required as long as the automated initialisation is only triggered by data uploads or when, in some exceptional situations, the automatic initialisation has not happened.  
**'Activate dataflow'** refers to a technical plugging of the dataflow to its data (and referential metadata) storage and to the generation of an actual content constraint for the given dataflow. This is handled behind the scene by the transfer service `/init/dataflow` method (see the related [API documentation](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer#post-versioninitdataflow-initializes-database-objects-of-a-dataflow-in-datastore-database)).

The **'Activate dataflow'** feature is available in the contextual menu of a dataflow, as well as in the multi-selection menu above the dataflow list. A tooltip message on mouse-over provides the following information to the end-user *"Allows technically plugging the dataflow to the underlying data and/or ref. metadata, e.g. when already uploaded data or metadata is not accessible."*

![DLM Activate dataflow](/dotstatsuite-documentation/images/dlm-activate-dataflow1.png)

Once the user clicks on 'Activate dataflow', the dataflow row disappears and a loading spinner is displayed:

![DLM Activate dataflow](/dotstatsuite-documentation/images/dlm-activate-dataflow2.png)

Once the `/init/dataflow` method is completed, a successful or failure notification is returned with a green/red icon:

![DLM Activate dataflow](/dotstatsuite-documentation/images/dlm-activate-dataflow3.png)
