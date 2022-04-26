---
title: "SDMX artefact annotations supported by the .Stat Suite"
subtitle: 
comments: false
weight: 3800
---

This page lists all the types of **SDMX artefact annotations** supported by the .Stat Suite.

### Definition and purpose
"_The Annotation is a construct that contains user or organisation-specific metadata. The Annotation construct in SDMX is available to most of the SDMX structural metadata artefacts.  
The main advantage of the Annotation is its flexibility as all properties can be tailor-made and there is no limit to their number. This can prove very useful for specific applications, such as dissemination tools._" _[sdmx.org/new-guideline-on-using-sdmx-annotations](https://sdmx.org/?sdmx_news=new-guideline-on-using-sdmx-annotations)_

### User-managed annotations

<table style="margin-left: auto; margin-right: auto; width: 1236px;">
<tbody>
<tr style="height: 23px;">
<th style="text-align: center; vertical-align: middle; height: 23px; width: 209px;">Annotation type</th>
<th style="text-align: center; vertical-align: middle; height: 23px; width: 361px;">Use case(s)</th>
<th style="text-align: center; vertical-align: middle; height: 23px; width: 185.891px;">Where to attach</th>
<th style="text-align: center; vertical-align: middle; height: 23px; width: 44.1094px;">Annotation text?</th>
<th style="text-align: center; vertical-align: middle; height: 23px; width: 106px;">Annotation title?</th>
</tr>
<tr style="height: 23px;">
<td style="height: 23px; width: 209px;">LAYOUT_ROW</td>
<td style="height: 23px; width: 361px;">Dimensions to be presented in rows of a DE table (concepts on y-axis)<br/>-&nbsp;<a href="https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/custom-data-view/default-layout/">full specs</a></td>
<td style="height: 23px; width: 185.891px;">-&nbsp;Dataflow, DSD<br/>-&nbsp;Dimension</td>
<td style="height: 23px; width: 44.1094px;"></td>
<td style="height: 23px; width: 106px;">- Attached to Dataflow or DSD: &lt;dimension Id&gt;,&lt;dimension Id &gt;,&hellip;<br/>- Attached to Dimension: &lt;blank&gt;</td>
</tr>
<tr style="height: 23px;">
<td style="height: 23px; width: 209px;">LAYOUT_COLUMN</td>
<td style="height: 23px; width: 361px;">Dimensions to be presented in columns of a DE table (concepts on x-axis)<br/>-&nbsp;<a href="https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/custom-data-view/default-layout/">full specs</a></td>
<td style="height: 23px; width: 185.891px;">-&nbsp;Dataflow, DSD<br/>-&nbsp;Dimension</td>
<td style="height: 23px; width: 44.1094px;"></td>
<td style="height: 23px; width: 106px;">-&nbsp;Attached to Dataflow or DSD: &lt;dimension Id&gt;,&lt;dimension Id &gt;,&hellip;<br/>-&nbsp;Attached to Dimension: &lt;blank&gt;</p>
</td>
</tr>
<tr style="height: 23px;">
<td style="height: 23px; width: 209px;">LAYOUT_ROW_SECTION</td>
<td style="height: 23px; width: 361px;">Dimensions to be presented at the row section level of a DE table<br/>-&nbsp;<a href="https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/custom-data-view/default-layout/">full specs</a></td>
<td style="height: 23px; width: 185.891px;">-&nbsp;Dataflow, DSD<br/>-&nbsp;Dimension</td>
<td style="height: 23px; width: 44.1094px;"></td>
<td style="height: 23px; width: 106px;">-&nbsp;Attached to Dataflow or DSD: &lt;dimension Id&gt;,&lt;dimension Id &gt;,&hellip;<br/>-&nbsp;Attached to Dimension: &lt;blank&gt;</p>
</td>
</tr>
<tr style="height: 23px;">
<td style="height: 23px; width: 209px;">MAX_TABLE_DATA</td>
<td style="height: 23px; width: 361px;">Increase the maximum preview table size above the DE default maximum limits for the number of observations retrieved from the SDMX web service and for the number of table cells<br/>-&nbsp;<a href="https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/custom-data-view/increased-table-size/">full specs</a></td>
<td style="height: 23px; width: 185.891px;">Dataflow</td>
<td style="height: 23px; width: 44.1094px;"></td>
<td style="height: 23px; width: 106px;">&lt;integer&gt;<br/><br/><em>example:</em><br/>15000</td>
</tr>
<tr style="height: 23px;">
<td style="height: 23px; width: 209px;">DEFAULT</td>
<td style="height: 23px; width: 361px;">Indication that an Item in an Item Scheme is to be selected by default in the DE visualisation filter, or is pre-selected when queried<br/>-&nbsp;<a href="https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/custom-data-view/default-selection/">full specs</a></td>
<td style="height: 23px; width: 185.891px;">-&nbsp;Item in an Item Scheme (e.g. code in a codelist)<br/>-&nbsp;Dataflow, DSD</td>
<td style="height: 23px; width: 44.1094px;"></td>
<td style="height: 23px; width: 106px;">-&nbsp;Attached to Item in Item scheme: &lt;blank&gt;<br/>-&nbsp;Attached to Dataflow or DSD: &lt;concept&gt;=&lt;code&gt;+&lt;code&gt;+&hellip;,&lt;concept&gt;=&lt;code&gt;+&lt;code&gt;+&hellip;<br/><br/><em>example:</em><br/>FREQ=A+Q,TIME_PERIOD_START=20-13-01,TIME_PERIOD_END=2018-12</p>
</td>
</tr>
<tr style="height: 23px;">
<td style="height: 23px; width: 209px;">NOT_DISPLAYED</td>
<td style="height: 23px; width: 361px;">Indication that a component and/or its value (dimension, dimension value, attribute, attribute value) is hidden in a presentation<br/>-&nbsp;<a href="https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/custom-data-view/not-displayed/">full specs</a></td>
<td style="height: 23px; width: 185.891px;">-&nbsp;Item in an Item Scheme (e.g. code in a codelist)<br/>-&nbsp;Dataflow, DSD</td>
<td style="height: 23px; width: 44.1094px;"></td>
<td style="height: 23px; width: 106px;">-&nbsp;Attached to Item in Item scheme: &lt;blank&gt;<br/>-&nbsp;Attached to Dataflow or DSD: &lt;concept Id&gt;,&lt;concept Id&gt;... <em>or</em> &lt;concept&gt;=&lt;code&gt;+&lt;code&gt;+&hellip;</td>
</tr>
<tr style="height: 23px;">
<td style="height: 23px; width: 209px;">ORDER</td>
<td style="height: 23px; width: 361px;">Explicit indication of localised order of items in items schemes<br/>-&nbsp;<a href="https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/custom-data-view/implicit-explicit-order">generic full specs</a><br/>-&nbsp;<a href="https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/facets/#facet-items-ordered-by-explicit-order-annotation">DE search facets specs</a></td>
<td style="height: 23px; width: 185.891px;">Item in an Item Scheme (e.g. code in a codelist)</td>
<td style="height: 23px; width: 44.1094px;">&lt;language&gt;:&lt;integer&gt;,&lt;language&gt;:&lt;integer&gt;,...<br/><br/><em>example:</em><br/>"en": "5","fr": "7"</td>
<td style="height: 23px; width: 106px;"></td>
</tr>
<tr style="height: 23px;">
<td style="height: 23px; width: 209px;">EXT_RESOURCE</td>
<td style="height: 23px; width: 361px;">Indication of a localised link to an external resource associated to the annotated Dataflow<br/>-&nbsp;<a href="https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/custom-data-view/external-resources/">full specs</a></td>
<td style="height: 23px; width: 185.891px;">Dataflow</td>
<td style="height: 23px; width: 44.1094px;">&lt;language&gt;:&lt;HTML containing URL to the resource&gt;,&lt;language&gt;:&lt;HTML containing URL to the resource&gt;,&hellip;<br/><br/><em>example:</em><br/>"en":"&lt;a href='http://www.ilo.org/ilostat-files/Documents/Metadata/Ref_MD_EN.xlsx'&gt;Explanatory information in pdf&lt;/a&gt;","fr":"&lt;a href='http://www.ilo.org/ilostat-files/Documents/Metadata/Ref_MD_FR.xlsx'&gt;Informations explicatives en pdf&lt;/a&gt;"</td>
<td style="height: 23px; width: 106px;"></td>
</tr>
<tr style="height: 23px;">
<td style="height: 23px; width: 209px;">MAXTEXTATTRIBUTELENGTH</td>
<td style="height: 23px; width: 361px;">Increase the maximum length for textual attribute values<br/>-&nbsp;<a href="https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/upload-structure/text-attribute-length/">full specs</a></td>
<td style="height: 23px; width: 185.891px;">DSD</td>
<td style="height: 23px; width: 44.1094px;"></td>
<td style="height: 23px; width: 106px;">&lt;integer&gt;<br/><br/><em>example:</em><br/>500</td>
</tr>
<tr style="height: 23px;">
<td style="height: 23px; width: 209px;">METADATA</td>
<td style="height: 23px; width: 361px;">Indication that referential metadata can be uploaded to a related DSD where the METADATA annotation is defined<br/>-&nbsp;<a href="https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/upload-data/upload-referential-metadata/">full specs</a></td>
<td style="height: 23px; width: 185.891px;">DSD</td>
<td style="height: 23px; width: 44.1094px;"></td>
<td style="height: 23px; width: 106px;">&lt;URN of the related Metadata Structure Definition (MSD)&gt;<br/><br/><em>example:</em><br/>urn:sdmx:org.sdmx.infomodel.<br/>metadatastructure.MetadataStructure=<br/>AGENCY:MSD_ID(1.0)</td>
</tr>
<tr style="height: 23px;">
<td style="height: 23px; width: 209px;">SEARCH_WEIGHT</td>
<td style="height: 23px; width: 361px;">Indication of localised boosted dataflows in the DE search results when ordered by relevance<br/>-&nbsp;<a href="https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/search-results/#result-boosting">full specs</a></td>
<td style="height: 23px; width: 185.891px;">Dataflow</td>
<td style="height: 23px; width: 44.1094px;"><em>optional</em><br/>&lt;language&gt;:&lt;integer&gt;,&lt;language&gt;:&lt;integer&gt;,...<br/><em>example:</em><br/>"en":"3","es":"4","fr":"5"</td>
<td style="height: 23px; width: 106px;">&lt;integer&gt;<br/><br/><em>example:</em><br/>10</td>
</tr>
<tr style="height: 23.5px;">
<td style="height: 23.5px; width: 209px;">LAYOUT_FLAG</td>
<td style="height: 23.5px; width: 361px;">Indication that an attribute and its atribute value can be presented as a flag<br/>-&nbsp;<a href="https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/#display-of-additional-information">full specs</a></td>
<td style="height: 23.5px; width: 185.891px;">Dataflow</td>
<td style="height: 23.5px; width: 44.1094px;"></td>
<td style="height: 23.5px; width: 106px;">&lt;concept Id&gt;,&lt;concept Id&gt;,...<br/><br/><em>example:</em><br/>OBS_STATUS,CONF_STATUS</td>
</tr>
<tr style="height: 23px;">
<td style="height: 23px; width: 209px;">LAYOUT_NOTE</td>
<td style="height: 23px; width: 361px;">Indication that an attribute and its attribute value can be presented as a note<br/>-&nbsp;<a href="https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/#display-of-additional-information">full specs</a></td>
<td style="height: 23px; width: 185.891px;">Dataflow</td>
<td style="height: 23px; width: 44.1094px;"></td>
<td style="height: 23px; width: 106px;">&lt;concept Id&gt;,&lt;concept Id&gt;,...<br/><br/><em>example:</em><br/>OBS_STATUS,CONF_STATUS</td>
</tr>
<tr style="height: 23px;">
<td style="height: 23px; width: 209px;">UNIT_MEASURE_CONCEPTS</td>
<td style="height: 23px; width: 361px;">List of dimensions (concept IDs) that are used to define the full unit of measure<br/>-&nbsp;<a href="https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/preview-table/unit-of-measure/#underlying-data-model">full specs</a></td>
<td style="height: 23px; width: 185.891px;">Dataflow, DSD</td>
<td style="height: 23px; width: 44.1094px;"></td>
<td style="height: 23px; width: 106px;">&lt;concept Id&gt;,&lt;concept Id&gt;,...<br/><br/><em>example:</em><br/>UNIT_MEASURE,UNIT_MULT,BASE_PER</td>
</tr>
<tr style="height: 23px;">
<td style="height: 23px; width: 209px;">DRILLDOWN_CONCEPTS</td>
<td style="height: 23px; width: 361px;">List of dimensions (concept IDs) to be displayed in a drilldown presentation<br/>-&nbsp;<a href="https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/microdata-preview-table/#microdata-preview-table">full specs</a></td>
<td style="height: 23px; width: 185.891px;">Dataflow, DSD</td>
<td style="height: 23px; width: 44.1094px;"></td>
<td style="height: 23px; width: 106px;">&lt;concept Id&gt;,&lt;concept Id&gt;,...<br/><br/><em>example:</em><br/>DONOR,RECIPIENT,YEAR,PROJECT_ID,<br/>OBS_VALUE,DESCRIPTION</td>
</tr>
<tr style="height: 23px;">
<td style="height: 23px; width: 209px;">DRILLDOWN</td>
<td style="height: 23px; width: 361px;">Denotes the concept that specifies if observations are at the drilldown level (instead of aggregate level)<br/>-&nbsp;<a href="https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/viewing-data/microdata-preview-table/#microdata-in-the-stat-suite">full specs</a></td>
<td style="height: 23px; width: 185.891px;">Dataflow, DSD</td>
<td style="height: 23px; width: 44.1094px;"></td>
<td style="height: 23px; width: 106px;">&lt;concept Id&gt;<br/><br/><em>example:</em><br/>MD_DIM<br/><em>Note</em> that this "special" drilldown MD_DIM dimension is hidden in the data representation</td>
</tr>
<tr style="height: 23px;">
<td style="height: 23px; width: 209px;">SUPPORT_DATETIME</td>
<td style="height: 23px; width: 361px;">Indication that a DSD can support data with values for a frequency higher than daily (e.g. hours, minutes, seconds)<br/>-&nbsp;<a href="https://sis-cc.gitlab.io/dotstatsuite-documentation/using-api/api-main-features/#support-of-high-frequency-time-periods-using-sdmx-annotation">full specs</a></td>
<td style="height: 23px; width: 185.891px;">DSD</td>
<td style="height: 23px; width: 44.1094px;"></td>
<td style="height: 23px; width: 106px;"></td>
</tr>
</tbody>
</table>

#### Automatically generated annotations

<table style="margin-left: auto; margin-right: auto; width: 1236px;">
<tbody>
<tr style="height: 23px;">
<th style="text-align: center; vertical-align: middle; height: 23px; width: 209px;">Annotation type</th>
<th style="text-align: center; vertical-align: middle; height: 23px; width: 361px;">Use case(s)</th>
<th style="text-align: center; vertical-align: middle; height: 23px; width: 185.891px;">Where to attach</th>
<th style="text-align: center; vertical-align: middle; height: 23px; width: 44.1094px;">Annotation text?</th>
<th style="text-align: center; vertical-align: middle; height: 23px; width: 106px;">Annotation title?</th>
</tr>
<tr style="height: 23px;">
<td style="height: 23px; width: 209px;">sdmx_metrics</td>
<td style="height: 23px; width: 361px;">-&nbsp;if ID="obs_count" then current number of observations per dataflow<br/>-&nbsp;if ID="series_count" then number of time series series per dataflow<br/>-&nbsp;<a href="https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/dlm_overview/#content-of-the-list">full specs</a></td>
<td style="height: 23px; width: 185.891px;">Actual Content Constraint for Dataflow</td>
<td style="height: 23px; width: 44.1094px;"></td>
<td style="height: 23px; width: 106px;">&lt;integer&gt;<br/><br/><em>example:</em><br/>123456</td>
</tr>
</tbody>
</table>
