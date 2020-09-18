---
title: "Default filter selections"
subtitle: 
comments: false
weight: 340

---

You can define a default selection of filter(s) on a dataflow.  

To do so, you can define the SDMX annotation of type `DEFAULT` to be used to automatically pre-select dimension values in the filters of the Data Explorer visualisation page. It also includes time-period values (start and end periods).

### Syntax

Use the following syntax when defining the annotation in the item definition of an ItemScheme (e.g. a codelist):
```
        "annotations": [{
                 "type": "DEFAULT"
         }]
```


Use the following syntax when defining the annotation in the Dataflow or DSD definition:  
```
        "annotations": [{
                 "type": "DEFAULT"
                 "title": "DIM3=CODE1+CODE2,DIM6=CODE,DIM7,TIME_PERIOD_START=2013-01,TIME_PERIOD_END=2018-12"   <-- These are the related dimension IDs and code IDs; if a dimension has no code IDs then it means that default settings done at lower levels (codelist for DSDs or dataflows, DSD for dataflows) are discarded and no selection is made for this dimension
        }]

        "annotations": [{
                 "type": "DEFAULT"
                 "title": "DIM3=CODE1+CODE2,DIM6=CODE,TIME_PERIOD_START=2013-01"  <-- open-ended time period span
        }]
```

### Exceptions
* `DEFAULT` annotation attached to dataflow definition fully supersedes those attached to DSDs, which fully supersedes again those individual codes in codelists. Therefore, `DEFAULT` annotation attached to individual codes in codelists are only to be used when there is no `DEFAULT` annotation attached to the dataflow nor to the DSD, and those of DSD are only to be used when there is no `DEFAULT` annotation attached to the dataflow.
* The `DEFAULT` annotations are superseded by selections on the same datalfow dimension(s) coming from the Data Explorer search result filters, or the homepage free text search hits.

### Example
You can find [here](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/blob/master/content/OECD-AIR_EMISSIONS_DF-2.0.xml) a SDMX structure file of a Dataflow.  

In this attached example, several codes of codelists are defined in the dataflow definition with the DEFAULT annotation.  

Once this structure (and data) is uploaded into .Stat DLM (or any other SDMX 2.1 compliant's backoffice system) for Data Explorer dissemination, it will result in displaying the dataflow with the following default filters' selections:  

![Example of DEFAULT annotations](/dotstatsuite-documentation/images/DEFAULT.png)

Note that, in this given example, the default selection of the time period and the start and end years are due to the configuration of the Data Explorer instance (see [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#default-time-period)).
