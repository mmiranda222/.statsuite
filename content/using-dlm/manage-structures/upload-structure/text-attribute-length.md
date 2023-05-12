---
title: "Textual attribute values length"
subtitle: 
comments: false
weight: 245

---

>Released in [January 28, 2020 Release .Stat Suite .NET v2.3.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#january-28-2020)

To allow uploading attribute values with **longer textual attribute values** specify the required maximum length in the SDMX annotation of type **`MAXTEXTATTRIBUTELENGTH`** in the Dataflow Structure Definition (DSD). By default, the maximum length (in characters) for textual attribute values is set to the number defined in the **MaxTextAttributeLength** configuration parameter of the Transfer service, which is **150** in the out-of-the-box installation. The generic MaxTextAttributeLength configuration parameter and the DSD-specific **`MAXTEXTATTRIBUTELENGTH`** annotation accept values up to **4000**.  

NOTE: Once a limit has been extended, it cannot be decreased again.

Use the following syntax when defining the annotation in the DSD:

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

After uploading a DSD structure with the annotation `MAXTEXTATTRIBUTELENGTH`, the user is notified about the application of this new value through the usual email report that is generated at the next data upload action:

![Example of mail with annotation MAXTEXTATTRIBUTELENGTH](/dotstatsuite-documentation/images/MAXTEXTATTRIBUTELENGTH.png)
