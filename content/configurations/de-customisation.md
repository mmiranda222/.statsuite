---
title: ".Stat DE customisation"
subtitle: 
comments: false
weight: 72
---

# Table of Content
- [intro](#intro)
- [main theme](#main-theme)
- [site title and logo](#site-title-and-logo)
- [homepage background image](#homepage-background-image)
- [common site logos](#common-site-logos)
- [table and chart footer logo](#table-and-chart-footer-logo)
- [table and chart footer terms and conditions](#table-and-chart-footer-terms-and-conditions)
- [api documentation hyperlink](#api-documentation-hyperlink)
- [contact us hyperlink](#contact-us-hyperlink)
- [map chart configuration](#map-chart-configuration)


### intro
This page is a guide on how to customise and interact with some of the .Stat Data Explorer look and feel and layout features.<br>

These customisations can be performed by Administrators with access to the .Stat DE installation files, but they should all be driven by business decisions.<br>

---

### Main Theme
It is possible to change the default layout theme of the application, including four properties.<br>
You can add new entries in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json` and it will replace the default customisation. <br>
The default theme is applied if there is no theme added to the settings.json file.<br>

* "theme":"layout" corresponds to the homepage background color and default font
* "theme":"searchHeader" corresponds to colored header banner of the search and visualisation pages
* "theme":"splash" corresponds to the text color under the homepage splash logo
* "theme":"searchDataflow" corresponds to the text color of Dataflow titles in the list of the search result page

```
    "theme":  {
        "layout": {
            "fontFamily": "Arial, 'sans-serif'",
            "background": "#c5e0dc"
        },
        "searchHeader": {
            "background": "#c5e0dc"
        },
        "splash": {
            "color": "black"
        },
        "searchDataflow": {
            "colorTitle": "#0088cc !important"
        }
      }
```

---

### Site title and logo
Define your website name and logo.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```
    "app": {
          "title": "OECD Data Explorer",
          "favicon": "/assets/siscc/data-explorer/images/favicon.ico"
    }
```

![Site title and logo](/images/faq-site-title-logo.png)

---

### Homepage background image

> **Prerequisite**: you need basic `HTML` and `CSS` knowledge before going further.

**Go to** your Data Explorer homepage > right-click and select Inspect (Ctrl+Shift+I).<br>

**Find and copy** from the Elements the name of the class corresponding to the background body.<br>

![DE Inspect](/images/de-background01.png)

**Go to** `dotstatsuite/data/<env>/configs/assets/<tenant>/data-explorer/styles/styles.css`.<br>

**Add** a new entry in the file in order to overide the default background. Paste the copied class and add the url of a publicly available image, or the path of an image stored in `/assets/<tenant>/data-explorer/images`:<br>

```CSS
.css-xn1wur {
 background-image: url('https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832_3082832_1280.jpg');
 }
```

![DE new background](/images/de-background02.png)

<br>

**Note** that some additional CSS properties can be required in order to correctly display the background in a responsive and adaptive mode depending on the original size of your image. 

---

### Common site logos
Define the common logos in the header, subheader, footer and homepage of the website.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```
    "assets": {
        "header": "/assets/siscc/data-explorer/images/sis-cc-logo.png",
        "subheader": "/assets/siscc/data-explorer/images/dotstat-data-explorer-logo.png",
        "footer": "/assets/siscc/data-explorer/images/sis-cc-icon.png",
        "splash": "/assets/siscc/data-explorer/images/dotstat-data-explorer-logo.png"
    }
```

* header:<br>
![Site logo header](/images/faq-site-logo-header.png)

* subheader:<br>
![Site logo subheader](/images/faq-site-logo-subheader.png)

* footer:<br>
![Site logo footer](/images/faq-site-logo-footer.png)

* splash:<br>
![Site logo splash](/images/faq-site-logo-splash.png)

---

### Table and chart footer logo
Define the logo of the organisation in the footer of the table and chart views.<br>
The source can be a binary image or a link.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```
    "viewer": {
        "logo": "dotstat-suite-config/data/prod/assets/oecd-logo.png",
    }
```

![viewer footer logo](/images/faq-viewer-logo.png)

---

### Table and chart footer terms and conditions
Define the name and hyperlink in the footer of the table and chart views behind the "c" copyright icon.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```
    "viewer": {
        "terms": {
            "label": "Terms & Conditions",
            "link": "http://www.oecd.org/termsandconditions/",
    }
    }
```

![Terms and Conditions](/images/faq-terms-conditions.png)

---

### API documentation hyperlink
Define the hyperlink for the API documentation.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```
    "viewer": {
        "api": {
            "doc": "https://data.oecd.org/api/sdmx-json-documentation/",
    }
    }
```

![API documentation](/images/faq-api-documentation.png)

---

### Contact us hyperlink
Define the hyperlink for the "Contact us" feature.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```
    "viewer": {
        "api": {
            "contact": "https://stats.oecd.org/FAQAndContact.aspx",
    }
    }
```

![Contact us](/images/faq-contact-us.png)

---

### Map Chart Configuration

Displaying data in a geographical map representation in the Data Explorer visualisation pages, will rely on the providing of one or several maps (regarding the needs) to the application.<br>

**Prerequisites**<br>
It is first required to produce these maps as `topojson` files. To learn more about `topojson` format, you can read: https://github.com/topojson/topojson-specification/blob/master/README.md <br>
You can also learn more about `topojson` files generation from [here](https://github.com/topojson/topojson). <br>
<br>
From here and further in the configuration, it is assumed that one can produce `topojson` files for his needs.<br>
<br>

**First steps**
Starting with the specifications of the `topojson` file format. Following is provided a '**world_map.json**' file as example.<br>
As `topojson` standard specifes, areas are defined in `objects` entry. Since the SDMX dimension representing the Reference Areas may be a hierarchical one, it is possible for the Data Explorer to have several maps choice corresponding to the different hierarchy levels, for only one `topojson` file. All you need is regrouping your areas definition into several entries inside your `objects` entry.<br>
So for instance, for 2 levels of a hierarchy, e.g. `continents` and `countries`, the following 2 entries are defined in the **world_map.json** file as `objects`:
```
{
    "objects": {
        "continents": {
            "type": 'GeometryCollection',
            "geometries": [(...)]
        },
        "countries": {
            "type": 'GeometryCollection',
            "geometries": [(...)]
        }
    }
}
```
**Note**: in case of a flat area dimension, there is still a need for areas to be put under a level in the file.<br>
<br>
Then each of the areas will be collected in one of the `geometries` arrays, as follows:
```
area = {
    "type": "",
    "arcs": [],
    "properties": { "id": SDMX_AREA_ID }
}
```
In the above example, `type` and `arcs` are pure topojson generated entries and serving the computing of the draw. <br>
The `properties` entry serves as the metadata entry of the area. <br>
The engine only requires an `id` entry (**Note** that any other entry will be ignored, and it is strongly suggested to not overload the file -in case of a large number of areas- for performance purpose). <br>
It is highly important that `id` perfectly matches the corresponding SDMX id defined in the areas codelist, for the mapping between SDMX datas and geographical data to work.
<br>
<br>
**Second step** The `topojson` file needs to be added in the following path `dotstatsuite/data/<env>/assets/<tenant>/data-explorer/maps/world_map.json`<br>

**Third step** Then it needs to be referenced in Data Explorer settings in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`:
```
{
    "chart": {
        "maps": {
            "world_map": {
                "id": "world_map",
                "projection": ,
                "path": "/assets/<tenant>/data-explorer/maps/world_map.json",
                "levels": ["continents", "countries"],
                "scale": ,
            }
        }
    }
}
```
A very important aspect here above is about `projection` and `scale` entries. Both are linked to the api specification of the D3 library for map rendering. Detailed specifications of D3 projection mechanism are to be found [here](https://github.com/d3/d3-3.x-api-reference/blob/master/Geo-Projections.md). 
Keep in mind that `projection` stands for the specific D3 projection you want to use (e.g. `mercator` for `d3.geo.mercator`).<br>
<br>

**Last step** is to make sure that each area level of the map has its label properly put in the translation files.<br>
For the English example of the world map, it should look like:
`dotstatsuite/data/<env>/configs/<tenant>/data-explorer/i18n/en.json`
```
{
    "chart.choropleth": "Map of {map}",
    "map.world_map.continents": "Continents",
    "map.world_map.countries": "Countries"
}
```

This example above will result with 2 options (in the menu of the Data Explorer chart drop-down feature) labelled in English: "Map of Continents" and "Map of Countries".

