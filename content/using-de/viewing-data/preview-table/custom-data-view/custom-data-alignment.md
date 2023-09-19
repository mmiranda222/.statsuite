---
title: "Custom data alignment"
subtitle: 
comments: false
weight: 480

---

>*Version history:*  
> Implemented in [August 03, 2023 Release .Stat Suite JS 'Wave'](/dotstatsuite-documentation/changelog/#august-03-2023) 

By default, string-typed values are left (rtl: right) aligned in table cells while the values of numerical types are right aligned (incl. in rtl version). The data owner can change this behaviour by using a dataflow or DSD annotation of type `LAYOUT_CELL_ALIGN` with `LEFT` or `RIGHT` in its title or localised text properties.

To force the alignment of data to a specific side, use the following syntax:

#### Syntax

You can use the following syntaxes either in the DSD definition or the dataflow: 

- defining the alignment per locale
```xml
<common:Annotation>
    <common:AnnotationType>LAYOUT_CELL_ALIGN</common:AnnotationType>
    <common:AnnotationText xml:lang="en">RIGHT</common:AnnotationText>
    <common:AnnotationText xml:lang="ar">LEFT</common:AnnotationText>
</common:Annotation>
```

- defining the alignment generically for all locales
 ```xml
<common:Annotation>
    <common:AnnotationTitle>RIGHT</common:AnnotationTitle>             
    <common:AnnotationType>LAYOUT_CELL_ALIGN</common:AnnotationType>
</common:Annotation>
```

#### Example

```xml
<common:Annotation>
    <common:AnnotationTitle>RIGHT</common:AnnotationTitle>   
    <common:AnnotationType>LAYOUT_CELL_ALIGN</common:AnnotationType>
    <common:AnnotationText xml:lang="ar">LEFT</common:AnnotationText>
</common:Annotation>
```

- English locale:  
  ![Custom data alignment](/dotstatsuite-documentation/images/DE-viewing-data-preview-table-custom-data-alignment.png)

- Arab locale:  
  ![Custom data alignment](/dotstatsuite-documentation/images/DE-viewing-data-preview-table-custom-data-alignment-ar.png)
