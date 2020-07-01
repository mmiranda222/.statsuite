---
title: "Textual attribute values length"
subtitle: 
comments: false
weight: 245

---

>Released in [January 28, 2020 Release .Stat Suite .NET v2.3.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#january-28-2020)

You can specify an annotation at the Dataflow Structure Definition (DSD) level, to allow uploading data with **long textual attribute values**.  
By default, the maximum length for textual attribute values is set to **150**. In order to extend this limit, you need to define a SDMX annotation of type **`MAXTEXTATTRIBUTELENGTH`** with a value greater to 150 in the DSD.  

NOTE: Once the limit has been extended, it cannot be decreased.

### Syntax
Use the following syntax when defining the annotation in the DSD definition:

```xml
  <structure:DataStructure id="SPS_ATT_TEST_TFWithNoRelationship_DSD" agencyID="OECD" version="11.1" isFinal="false">  
                 <common:Annotations>  
                     <common:Annotation>  
                         <common:AnnotationTitle>500</common:AnnotationTitle>  
                         <common:AnnotationType>MAXTEXTATTRIBUTELENGTH</common:AnnotationType>  
                     </common:Annotation>  
                 </common:Annotations>  
                 <common:Name xml:lang="en">Attribute test dsd scenario with TIME_FORMAT attribute relationship on dimensions ETA and SESSO</common:Name>  
  <structure:DataStructureComponents>
  ```

  ### Rules
  At first data upload, the default MaxTextAttributeLength configuration parameter (provided when installing the Transfer service) is used if the annotation `MAXTEXTATTRIBUTELENGTH` is not provided.  
  Whenever a *DSD-specific* MaxTextAttributeLength parameter is increased after a first data upload, then the new length parameter is applied.  
  When uploading the DSD structure with the annotation `MAXTEXTATTRIBUTELENGTH` in its definition, the end-user is also notified, through the usual email report, that the new parameter has been taken into account:

![Example of mail with annotation MAXTEXTATTRIBUTELENGTH](/dotstatsuite-documentation/using-dlm/files/MAXTEXTATTRIBUTELENGTH.png)
