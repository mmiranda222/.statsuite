---
title: "Textual attribute values length"
subtitle: 
comments: false
weight: 245

---

>Released in [January 28, 2020 Release .Stat Suite .NET v2.3.0](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones/9)

You can specify, at the Data Structure Definition (DSD) level, to allow uploading data with **long textual attribute values** for dataflows.  
By default, the maximum length for textual attribute values is set to **150**. In order to extend this limit, you need to define a SDMX annotation of type **`MAXTEXTATTRIBUTELENGTH`** with a value superior to 150 in the DSD definition.  

### Syntax
Use the following syntax when defining the annotation in the DSD definition:

```
  <structure:DataStructure id="SPS_ATT_TEST_TFWithNoRelationship_DSD" agencyID="OECD" version="11.1" isFinal="false">  
                 <common:Annotations>  
                     <common:Annotation>  
                         <common:AnnotationType>MAXTEXTATTRIBUTELENGTH</common:AnnotationType>  
                         <common:AnnotationText xml:lang="en">500</common:AnnotationText>  
                     </common:Annotation>  
                 </common:Annotations>  
                 <common:Name xml:lang="en">Attribute test dsd scenario with TIME_FORMAT attribute relationship on dimensions ETA and SESSO</common:Name>  
                 <structure:DataStructureComponents>
```

### Rules

At first data upload, the default MaxTextAttributeLength parameter is used if the annotation `MAXTEXTATTRIBUTELENGTH` is not provided.  
Whenever a *DSD-specific* MaxTextAttributeLength parameter is increased after a first data upload, then the new length is applied.  
When uploading the DSD with the annotation `MAXTEXTATTRIBUTELENGTH` in its definition, the end-user is also notified through the usual email report that the parameter has been taken into consideration:

![Example of mail with annotation MAXTEXTATTRIBUTELENGTH](/using-dlm/files/MAXTEXTATTRIBUTELENGTH.png)
