---
title: "Additional downloads of external resources"
subtitle: 
comments: 
weight: 355

---

>Released in [December 02, 2019 Release .Stat Suite JS milestone 7](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#december-02-2019)

Additional downloads of external resources can be added to a dataflow and be made available in the "Download" option of the Data Explorer visualisation page.

To do so, you can use the SDMX `EXT_RESOURCE` annotation to define one or several materials (any type of file format) that are stored externally (outside .Stat Suite storage).

### Advanced options of the features
* Any type of format (stored externally) can be triggered for download.
* The feature is localised, meaning that for one single definition of an `EXT_RESOURCE` annotation, you can define a different download source according to the chosen language. 
* The feature being localised also means that the localised annotation text is applied according to the current locale of the Data Explorer.
* The contents of the annotation text/texts are valid `HTML` href elements with href properties (hyperlinks to the resource). It can also include an icon.

### Syntax
Use the following syntax when defining the annotation in the dataflow or dataset definition for additional download options for external resources:  

```
"annotations": [{
		"type": "EXT_RESOURCE",
		"text": "<a href='http://www.ilo.org/ilostat-files/Documents/Excel/MBI_535_EN.xlsx'><img src='https://www.ilo.org/ilostat/images/downloadexcel-24.png'/> All data in Excel</a>",
		"texts": {
			"en": "<a href='http://www.ilo.org/ilostat-files/Documents/Excel/MBI_535_EN.xlsx'><img src='https://www.ilo.org/ilostat/images/downloadexcel-24.png'/> All data in Excel</a>",
			"fr": "<a href='http://www.ilo.org/ilostat-files/Documents/Excel/MBI_535_FR.xlsx'><img src='https://www.ilo.org/ilostat/images/downloadexcel-24.png'/> Toutes les données en Excel</a>"
		}
	},{
		"type": "EXT_RESOURCE",
		"text": "<a href='http://www.ilo.org/ilostat-files/Documents/Metadata/Ref_MD_EN.xlsx'>Explanatory information in pdf</a>",
		"texts": {
			"en": "<a href='http://www.ilo.org/ilostat-files/Documents/Metadata/Ref_MD_EN.xlsx'>Explanatory information in pdf</a>",
			"fr": "<a href='http://www.ilo.org/ilostat-files/Documents/Metadata/Ref_MD_FR.xlsx'>Informations explicatives en pdf</a>	}
	}]
```

### Example
In the below screenshot, the dataflow structure definition contains 3 annotations of `EXT_RESOURCE` typefor localised (in English and French) externally stored files.

Each hyperlink is enriched with a link to an image for its display as an icon of each link in the Data Explorer final representation.

![Example of EXT_RESOURCE structure annotation](/using-dlm/files/EXTERNAL-RESOURCES-01.png)

Once this structure (and data) is uploaded into .Stat DLM (or any other SDMX 2.1 compliant's backoffice system) for Data Explorer dissemination, the external resources related to the dataflow are available from the visualisation page under the "Download" option, and in addiiton to the default data downloads links:

![Example of EXT_RESOURCE annotation download](/using-dlm/files/EXTERNAL-RESOURCES-02.png)

