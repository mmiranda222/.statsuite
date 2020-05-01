---
title: ".Stat DE customisation"
subtitle: 
comments: false
weight: 73
---

#### Table of Content
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
- [add icons to specific facet values](#add-icons-to-specific-facet-values)

---

### intro
This page is a guide on how to customise and interact with some of the .Stat Data Explorer look and feel and layout features.  

These customisations can be performed by Administrators with access to the .Stat DE installation files, but they should all be driven by business decisions.<br>

---

### Main Theme
It is possible to change the default layout theme of the application, including four properties.  
You can add new entries in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json` and it will replace the default customisation.  
The default theme is applied if there is no theme added to the settings.json file.<br>

* "theme":"layout" corresponds to the homepage background color and default font
* "theme":"searchHeader" corresponds to colored header banner of the search and visualisation pages
* "theme":"splash" corresponds to the text color under the homepage splash logo
* "theme":"searchDataflow" corresponds to the text color of Dataflow titles in the list of the search result page

```json
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

```json
    "app": {
          "title": "OECD Data Explorer",
          "favicon": "/assets/siscc/data-explorer/images/favicon.ico"
    }
```

![Site title and logo](/images/faq-site-title-logo.png)

---

### Homepage background image
> **Prerequisite**: you need basic `HTML` and `CSS` knowledge before going further.  

> **Disclaimer**: Since release of [MMMMMMMM DD, 2020 Release .Stat Suite JS X.X.X.](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#mmmmmmmm-dd-2020), the **class** object to overide the default background is replaced by a **unique ID** called **ID_HOME_PAGE**.

**Go to** `dotstatsuite/data/<env>/configs/assets/<tenant>/data-explorer/styles/styles.css`.  

**Add** a new entry called `#id_home_page` in the file in order to overide the default background.  
Add the url of a publicly available image, or the path of an image stored in `/assets/<tenant>/data-explorer/images`:  

```CSS
#id_home_page {
 background-image: url('https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832_960_720.jpg');
 }
```

![DE new background](/images/de-background.png)  


**Notes:**  
* Unique IDs are created for each of the Data Explorer page containers (background layers), but it does not imply all components of a page:
```CSS
// HOME PAGE
ID_HOME_PAGE = 'id_home_page';
// ERROR PAGE
ID_ERROR_PAGE = 'id_error_page';
// SEARCH PAGE
ID_SEARCH_PAGE = 'id_search_page';
// VIS PAGE
ID_VIS_PAGE = 'id_vis_page';
// AUTH PAGE
ID_AUTH_PAGE = 'id_auth_page';
```
* Some additional CSS properties can be required in order to correctly display the background in a responsive and adaptive mode depending on the original size of your image. 

---

### Common site logos
Define the common logos in the header, subheader, footer and homepage of the website.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```json
    "assets": {
        "header": "/assets/siscc/data-explorer/images/sis-cc-logo.png",
        "subheader": "/assets/siscc/data-explorer/images/dotstat-data-explorer-logo.png",
        "footer": "/assets/siscc/data-explorer/images/sis-cc-icon.png",
        "splash": "/assets/siscc/data-explorer/images/dotstat-data-explorer-logo.png"
    }
```

* header:  

![Site logo header](/images/faq-site-logo-header.png)

* subheader:  

![Site logo subheader](/images/faq-site-logo-subheader.png)

* footer:  

![Site logo footer](/images/faq-site-logo-footer.png)

* splash:  

![Site logo splash](/images/faq-site-logo-splash.png)

---

### Table and chart footer logo
Define the logo of the organisation in the footer of the table and chart views.  
The source can be a binary image or a link.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```json
    "viewer": {
        "logo": "dotstat-suite-config/data/prod/assets/oecd-logo.png",
    }
```

![viewer footer logo](/images/faq-viewer-logo.png)

---

### Table and chart footer terms and conditions
Define the name and hyperlink in the footer of the table and chart views behind the "c" copyright icon.<br>

* in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`

```json
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

```json
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

```json
    "viewer": {
        "api": {
            "contact": "https://stats.oecd.org/FAQAndContact.aspx",
    }
    }
```

![Contact us](/images/faq-contact-us.png)

---

### Map Chart Configuration
Displaying data in a geographical map representation in the Data Explorer visualisation pages, will rely on the providing of one or several maps (regarding the needs) to the application.  

**Prerequisites**  
It is first required to produce these maps as `topojson` files. To learn more about `topojson` format, you can read: https://github.com/topojson/topojson-specification/blob/master/README.md.  
You can also learn more about `topojson` files generation from [here](https://github.com/topojson/topojson).  

From here and further in the configuration, it is assumed that one can produce `topojson` files for his needs.  


**First steps**
Starting with the specifications of the `topojson` file format. Following is provided a '**world_map.json**' file as example.  
As `topojson` standard specifes, areas are defined in `objects` entry. Since the SDMX dimension representing the Reference Areas may be a hierarchical one, it is possible for the Data Explorer to have several maps choice corresponding to the different hierarchy levels, for only one `topojson` file. All you need is regrouping your areas definition into several entries inside your `objects` entry.  
So for instance, for 2 levels of a hierarchy, e.g. `continents` and `countries`, the following 2 entries are defined in the **world_map.json** file as `objects`:
```json
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
**Note**: in case of a flat area dimension, there is still a need for areas to be put under a level in the file.  

Then each of the areas will be collected in one of the `geometries` arrays, as follows:  
```json
area = {
    "type": "",
    "arcs": [],
    "properties": { "id": SDMX_AREA_ID }
}
```
In the above example, `type` and `arcs` are pure topojson generated entries and serving the computing of the draw.  
The `properties` entry serves as the metadata entry of the area.  
The engine only requires an `id` entry (**Note** that any other entry will be ignored, and it is strongly suggested to not overload the file -in case of a large number of areas- for performance purpose).  
It is highly important that `id` perfectly matches the corresponding SDMX id defined in the areas codelist, for the mapping between SDMX datas and geographical data to work.  

**Second step** The `topojson` file needs to be added in the following path `dotstatsuite/data/<env>/assets/<tenant>/data-explorer/maps/world_map.json`<br>

**Third step** Then it needs to be referenced in Data Explorer settings in `dotstatsuite/data/<env>/configs/<tenant>/data-explorer/setting.json`:
```json
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
Keep in mind that `projection` stands for the specific D3 projection you want to use (e.g. `mercator` for `d3.geo.mercator`).  


**Last step** is to make sure that each area level of the map has its label properly put in the translation files.  
For the English example of the world map, it should look like:  
`dotstatsuite/data/<env>/configs/<tenant>/data-explorer/i18n/en.json`
```json
{
    "chart.choropleth": "Map of {map}",
    "map.world_map.continents": "Continents",
    "map.world_map.countries": "Countries"
}
```

This example above will result with 2 options (in the menu of the Data Explorer chart drop-down feature) labelled in English: "Map of Continents" and "Map of Countries".

---

### Add icons to specific facet values

You can define individual icons that are to be displayed with specific facets values in the DE home and search result pages.  

This is a new entry of the configuration, and is supporting the **SVG path segment** format ONLY.  
SVG paths are to be considered as a best practice and solution for websites auto-layout and accessibility.  
SVG elements should be scaled for a 24 x 24px viewport.  

* in `dotstatsuite-config/data/\<env>/configs/\<tenant>/data-explorer/setting.json`

```json
"sdmx": {
  ...others keys,
  "valueIcons": {
    "topics": {
      "EDU": "M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z" 
    } 
  }
}
```

**Note**: the key of the facet is always in **lowercase e.g. "topics"**, and the key of the facet value is always in **uppercase e.g. "EDU"**.  

Facets are localised, thus you must add the translated name of facet and duplicate the value for the icon, e.g.:  

```json
"sdmx": {
  ...others keys,
  "valueIcons": {
    "topics": {
      "EDU": "M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z" 
    } 
    "thème": {
      "EDU": "M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z" 
    } 
  }
}
```

The result is as follows:  

![facet icon 1](/images/faq-facet-icon-1.png)

![facet icon 2](/images/faq-facet-icon-2.png)
