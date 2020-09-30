---
title: "Copy data structures"
subtitle: 
comments: false
weight: 260

---

#### Table of Content
- [Transfer artefact menu](#transfer-artefact-menu)
- [Transfer process and notifications](#transfer-process-and-notifications)

The user can transfer (make a copy of) a given data structure artefact from one source (dataspace or external source) to another (except external source), by using the 'Transfer' icon *(double arrows)*  
![transfer artefact icon](/dotstatsuite-documentation/images/dlm-copy-data-structures-icon.png).  

The combination of the data structure artefact type and its triple identifier (ID, Agency ID and Version) must be unique within a dataspace. If there already exists a data structure artefact with the same combination, then the transfer (copy) will fail.

---

### Transfer artefact menu

1. When the user selects **Transfer artefact** in the hambuger menu associated to a specific data structure artefact, he is given the choice between two options:
* Make a copy of only the selected artefact **(without referenced structures)**
* Make a copy of the selected data structure artefact AND all its associated referenced data structures **(with referenced structures)**

![dlm copy data structures 2](/dotstatsuite-documentation/iamges/dlm-copy-data-structures-2.png)  

2. Once the option *with or without referenced structures* is selected, a second sub-menu (as shown above) will request the user to choose for a destination space to copy the data structure artefact.  
**Note** that the copy can **only** be performed in a different dataspace (the source space is only displayed in this feature as a reminder of the source).
 
3. After having selected the *destination space*, the copy is launched.  

### Transfer process and notifications
 
1. When the copy of the data structure artefact is performing, a spinner with a copied artefact icon ![copied artefact icon](/dotstatsuite-documentation/images/dlm-copy-data-structures-copiedartefact-icon.png) followed by the `Updating` message will appear on the screen.

![dlm copy data structures 3b](/dotstatsuite-documentation/images/dlm-copy-data-structures-3b.png)   

2. Once the transfer process is complete,**for successful transfer**, two visual notifications are displayed:
* The 'Transfer' icon in green color is displayed next to the hambuger menu related to the source data structure artefact; 
* The new copy of the data structure artefact is also displayed below the source data structure artefact in the list; the 'copied artefact' icon is displayed next to the hamburger menu.

![dlm copy data structures 4](/dotstatsuite-documentation/images/dlm-copy-data-structures-4.png)  

If the transfer process ends with warning or unsuccessful, then the 'Transfer' icon is displayed:
* Orange for warnings,
* Red for unsuccessful transfer.

3. A mouse over on the colored 'Transfer' icon will provide details over the outcome of the transfer action(s):
* **with referenced structures** and a successful copy

![dlm copy data structures 3](/dotstatsuite-documentation/images/dlm-copy-data-structures-3.png)  

* **without referenced structures** and a successful copy

![dlm copy data structures 5](/dotstatsuite-documentation/images/dlm-copy-data-structures-5.png)  

* transfer with already existing destination artefact, thus unsuccessful copy

![dlm copy data structures 6](/dotstatsuite-documentation/images/dlm-copy-data-structures-6.png)  

* transfer with some already existing destination artefacts, thus warning notification mentioningthat some artefacts were created while some were already available.

![dlm copy data structures 7](/dotstatsuite-documentation/images/dlm-copy-data-structures-7.png)    
