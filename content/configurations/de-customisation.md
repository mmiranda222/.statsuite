---
title: ".Stat DE customisation"
subtitle: 
comments: false
weight: 73
---

#### Table of Content
- [intro](#intro)
- [Warning](#warning)
- [general theme settings](#general-theme-settings)
- [theme settings: how to override mixins](#theme-settings-how-to-override-mixins)
- [theme settings: palette](#theme-settings-palette)
- [theme settings: first loader](#theme-settings-first-loader)
- [site title and logo](#site-title-and-logo)
- [homepage background image](#homepage-background-image)
- [common site logos](#common-site-logos)
- [add hyperlink on header logo](#add-hyperlink-on-header-logo)
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

### Warning
When editing the configuration .json file(s) of the .Stat Suite applications, the **default encoding** on your server/system could potentially be **different than UTF-8**, e.g. **UTF-8-BOM**.  
`BOM` being an issue to handle in web client rendering, whenever editing your config. files, make sure that this is always managed in the right **UTF-8 encoding format**, in order to avoid introducing extra invisible BOM characters to your file.

---

### General theme settings
>The format and default theme was changed with the release [May 18, 2020 Release .Stat Suite JS 5.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#may-18-2020)  

It is possible to **override** the default **layout theme** of the application.  
The **default theme** is stored under `dotstatsuite-data-explorer/src/web/theme/theme.js`. You can **override** the default theme by adding new entries in `dotstatsuite-config/data/<env>/configs/<tenant>/data-explorer/settings.json`.  
The default theme is applied if there is no theme added to the settings.json file.<br>

```json
{
    "overrides": {
      "MuiButton": {
        "root": {
          "textTransform": "'none'"
        }
      }
    },
    "palette": {
      "action": {
        "active": "rgba(14, 144, 144, 0.54)",
        "selected": "rgba(14, 144, 224, 0.25)",
        "hover": "rgba(14, 144, 224, 0.13)"
      },
      "primary": {
        "main": "#0965c1",
        "light": "#0e90e0",
        "dark": "#0549ab"
      },
      "secondary": {
        "main": "#e3e9ed",
        "light": "#f5f8fa",
        "dark": "#ebf1f5"
      },
      "tertiary": {
        "light": "#e2f2fb",
        "dark": "#b7def6"
      },
      "button": {
        "mainOpacity": "rgba(0, 0, 0, 0.2)"
      },
      "highlight": {
        "hl1": "#f7a42c",
        "hl2": "#8CC841"
      },
      "grey": {
        "200": "#F3F7FB",
        "300": "#cccccc",
        "700": "#666666",
        "A700": "#182026"
      }
    },
    "mixins": {
      "dataflow": {
        "fontWeight": 400,
        "fontFamily": "'Roboto Slab', serif"
      },
      "scopeList": {
        "fontWeight": 700,
        "fontFamily": "'PT Sans Narrow', 'Helvetica Neue', Helvetica, Arial, sans-serif"
      },
      "excel": {
        "headerFont": "#ffffff",
        "sectionFont": "#000000",
        "rowFont": "#000000"
      },
      "sisccButton": {
        "&:hover": {
          "backgroundColor": "#f7a42c"
        }
      }
    },
    "typography": {
      "fontFamily": "'Helvetica Neue', Helvetica, Arial, sans-serif",
      "h6": {
        "fontSize": " 1.0625rem"
      }
    }
  }
```

---

### Theme settings: how to override mixins
Data Explorer uses a [Material-ui](https://material-ui.com/) theme, and you can entirely customise it by using your [settings.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/blob/master/data/dev/configs/oecd/data-explorer/settings.json) file under the `https://material-ui.com/` key. For your help, all components used in Data Explorer are in the website [**Visions**](http://visions-qa-oecd.redpelicans.com/#o).

We try as much as possible to use the Material-ui theme. But sometimes, it is necessary to define **mixins in order to modify the component** with a specific font, font-size, colors, etc...

**Mixins**  
The default defined **mixins** can be overridden from the `settings.json` file.

In the Material-ui theme, under the `mixins` key, it is described as such:
```json
{
  "theme": {
    "mixins": {
      "nameOfTheComponents": { // use camelCase
        "root": {
          // common styles for the entire component
        },
        "specificName": {
          // specific style for the component 
        }
      }
    }
  }
}
```

All mixins are available using the following link: [**theme used by data-explorer**](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions/-/blob/master/src/theme.js)

**Example**  
Here is an example on **how to change the header of the DE table and charts**.  
you can find this component in visions [(**DataHeader**)](http://visions-qa-oecd.redpelicans.com/#oDataHeader), the name of this component being "DataHeader".

Taking our general use case, you need to replace the "nameOfTheComponents" by "dataHeader".  
/**!**\ **You need to change the first capitalize letter into a lower letter to use camelCase mode ("DataHeader" => "dataHeader")** /**!**\

This example will not erase your other props defined in your theme. Your header will remain the same. 
```json
{
  "theme": {
    "mixins": {
      "dataHeader": {}
    }
  }
}
```

The next objective is then to change the font of "DataHeader".
```json
{
  "theme": {
    "mixins": {
      "dataHeader": {
        "root": {
          "font": "'Comic sans MS'"
        }
      }
    }
  }
}
```

Finally, some components have more props defined in mixins.  
As you can see in the [**theme file**](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions/-/blob/master/src/theme.js) "DataHeader" have "title", "subtitle", "uprs" and "disclaimer". You can override those props by your owns.

Let's see with the previous example how we can manage those other props:
```js
{
  "theme": {
    "mixins": {
      "dataHeader": {
        "root": {
          "font": "'Comic sans MS'"
        },
        "title": {
          "color": "black",
          "fontSize": "60px"
          "backgroundColor": "yellow"
        },
        "subtitle": {
          // e.g. add here your own styles for subtitle
        }
      }
    }
  }
}
```

Some styles are now added to the title. Title color is now black with bigger font size and with a yellow background color.  
You can note that style's props are very close to css, but in javascript we use camelCase (e.g: "background-color" => "backgroundColor").

---

### Theme settings: palette
**outerPalette**  
Some colors are used several times in the DE theme. For this purpose, we use **outerPalette**.  
Each property defined in "innerPalette" ([**theme used by data-explorer**](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-visions/-/blob/master/src/theme.js)) is available in the settings.

example
```js
{
  "theme": {
    "outerPalette": {
      "primaryMain": '#ff00ff', 
    }
  }
}
```

---

### Theme settings: first loader
To override the first loader (spinner) color, when the application is not yet loaded, you need to add a **specific class** to your file `styles.css` in your assets config.

```css
.path {
  stroke: "#ff00ff";
}
```

---

### Site title and logo
Define your website name and logo.<br>

* in `dotstatsuite-config/data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
    "app": {
          "title": "OECD Data Explorer",
          "favicon": "/assets/siscc/data-explorer/dotstatsuite-documentation/images/favicon.ico"
    }
```

![Site title and logo](/dotstatsuite-documentation/images/faq-site-title-logo.png)

---

### Homepage background image
> **Prerequisite**: you need basic `HTML` and `CSS` knowledge before going further.  

> **Disclaimer**: Since release of [May 18, 2020 Release .Stat Suite JS 5.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#may-18-2020), the **class** object to overide the default background is replaced by a **unique ID** called **ID_HOME_PAGE**.

**Go to** `dotstatsuite/data/<env>/configs/assets/<tenant>/data-explorer/styles/styles.css`.  

**Add** a new entry called `#id_home_page` in the file in order to overide the default background.  
Add the url of a publicly available image, or the path of an image stored in `/assets/<tenant>/data-explorer/images`:  

```css
#id_home_page {
 background-image: url('https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832_960_720.jpg');
 }
```

![DE new background](/dotstatsuite-documentation/images/de-background.png)  


**Notes:**  
* Unique IDs are created for each of the Data Explorer page containers (background layers), but it does not imply all components of a page:
```css
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

* in `dotstatsuite-config/data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
    "assets": {
        "header": "/assets/siscc/data-explorer/dotstatsuite-documentation/images/sis-cc-logo.png",
        "subheader": "/assets/siscc/data-explorer/dotstatsuite-documentation/images/dotstat-data-explorer-logo.png",
        "footer": "/assets/siscc/data-explorer/dotstatsuite-documentation/images/sis-cc-icon.png",
        "splash": "/assets/siscc/data-explorer/dotstatsuite-documentation/images/dotstat-data-explorer-logo.png"
    }
```

* header:  

![Site logo header](/dotstatsuite-documentation/images/faq-site-logo-header.png)

* subheader:  

![Site logo subheader](/dotstatsuite-documentation/images/faq-site-logo-subheader.png)

* footer:  

![Site logo footer](/dotstatsuite-documentation/images/faq-site-logo-footer.png)

* splash:  

![Site logo splash](/dotstatsuite-documentation/images/faq-site-logo-splash.png)

---

### Add hyperlink on header logo
> Released in [July 23, 2020 Release .Stat Suite JS 5.2.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#july-23-2020)  
> (thanks to [Dhanya Chandrasekharan](https://gitlab.com/dhanya.sreekant) for the contribution!)

To add an hyperlink/URL behind the logo of the common site header (top-left part). This feature is useful when the Data Explorer is part of a web portal and thus allows users to browse from one application to another within the same portal.

* in `dotstatsuite-config/data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
    "assets": {
        "logoLink": "https://www.oecd.org",
    }
```

---

### Table and chart footer logo
Define the logo of the organisation in the footer of the table and chart views.  
The source can be a binary image or a link.<br>

* in `dotstatsuite-config/data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
    "viewer": {
        "logo": "dotstat-suite-config/data/prod/assets/oecd-logo.png",
    }
```

![viewer footer logo](/dotstatsuite-documentation/images/faq-viewer-logo.png)

---

### Table and chart footer terms and conditions
Define the name and hyperlink in the footer of the table and chart views behind the "c" copyright icon.<br>

* in `dotstatsuite-config/data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
    "viewer": {
        "terms": {
            "label": "Terms & Conditions",
            "link": "http://www.oecd.org/termsandconditions/",
    }
    }
```

![Terms and Conditions](/dotstatsuite-documentation/images/faq-terms-conditions.png)

---

### API documentation hyperlink
Define the hyperlink for the API documentation.<br>

* in `dotstatsuite-config/data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
    "viewer": {
        "api": {
            "doc": "https://data.oecd.org/api/sdmx-json-documentation/",
    }
    }
```

![API documentation](/dotstatsuite-documentation/images/faq-api-documentation.png)

---

### Contact us hyperlink
Define the hyperlink for the "Contact us" feature.<br>

* in `dotstatsuite-config/data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
    "viewer": {
        "api": {
            "contact": "https://stats.oecd.org/FAQAndContact.aspx",
    }
    }
```

![Contact us](/dotstatsuite-documentation/images/faq-contact-us.png)

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

**Second step** The `topojson` file needs to be added in the following path `dotstatsuite-config/data/<env>/assets/<tenant>/data-explorer/maps/world_map.json`<br>

**Third step** Then it needs to be referenced in Data Explorer settings in `dotstatsuite-config/data/<env>/configs/<tenant>/data-explorer/settings.json`:
```json
{
    "chart": {
        "maps": {
            "world_map": {
                "id": "world_map",
                "projection": ,
                "path": "/assets/<tenant>/data-explorer/maps/world_map.json",
                "levels": ["continents", "countries"],
                "scale": 
            }
        }
    }
}
```
A very important aspect here above is about `projection` and `scale` entries. Both are linked to the api specification of the D3 library for map rendering. Detailed specifications of D3 projection mechanism are to be found [here](https://github.com/d3/d3-3.x-api-reference/blob/master/Geo-Projections.md).  
Keep in mind that `projection` stands for the specific D3 projection you want to use (e.g. `mercator` for `d3.geo.mercator`).  


**Last step** is to make sure that each area level of the map has its label properly put in the translation files.  
For the English example of the world map, it should look like:  
`dotstatsuite-config/data/<env>/configs/<tenant>/data-explorer/i18n/en.json`
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
The SVG images must be scaled to fit into a 24 x 24px viewport in order to be fully visible.  

* in `dotstatsuite-config/data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
"sdmx": {
  ...others keys,
  "valueIcons": {
    "topic": {
      "HOME": "M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z" 
    } 
  }
}
```

**Note**: the key of the facet is always in **lowercase e.g. "topic"**, and the key of the facet value is always in **uppercase e.g. "HOME"**.  

Facets are localised, thus you must add the translated name of facet and duplicate the value for the icon, e.g.:  

```json
"sdmx": {
  ...others keys,
  "valueIcons": {
    "topic": {
      "HOME": "M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z" 
    } 
    "thème": {
      "HOME": "M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z" 
    } 
  }
}
```

The result is as follows:  

![facet icon 1](/dotstatsuite-documentation/images/faq-facet-icon-1.png)

![facet icon 2](/dotstatsuite-documentation/images/faq-facet-icon-2.png)
