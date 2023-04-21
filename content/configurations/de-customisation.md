---
title: ".Stat DE customisation"
subtitle: 
comments: false
weight: 73
keywords: [
  'Introduction', '#introduction',
  'Warning', '#warning',
  'Visual UI components demo', '#visual-ui-components-demo',
  'General theme settings', '#general-theme-settings',
  'Theme settings: how to override mixins', '#theme-settings-how-to-override-mixins',
  'Theme settings: palette', '#theme-settings-palette',
  'Theme settings: first loader', '#theme-settings-first-loader',
  'Theme settings: custom fonts', '#theme-settings-custom-fonts',
  'Site logo', '#site-logo',
  'Homepage background image', '#homepage-background-image',
  'Localised common site logos', '#localised-common-site-logos',
  'Add hyperlink on header logo', '#add-hyperlink-on-header-logo',
  'Add icons to specific facet values', '#add-icons-to-specific-facet-values',
  'Api documentation hyperlink', '#api-documentation-hyperlink',
  'Contact us hyperlink', '#contact-us-hyperlink',
  'Contact us and Share email: Header logo of the organisation', '#contact-us-and-share-email-header-logo-of-the-organisation',
  'Table and chart: footer logo', '#table-and-chart-footer-logo',
  'Table and chart: footer terms and conditions', '#table-and-chart-footer-terms-and-conditions',
  'Chart: map configuration', '#chart-map-configuration',
  'Chart: override stacked charts palette', '#chart-override-stacked-charts-palette',
]
---
<!-- This page (or a sub-page or sub-section of this page) of the documentation is referenced as an external resource in the .Stat Academy:
* https://academy.siscc.org/configuring-and-customising/
Any change affecting its URL must be communicated to the .Stat Academy content admin in advance. -->

#### Table of Content
- [Introduction](#introduction)
- [Warning](#warning)
- [Visual UI components demo](#visual-ui-components-demo)
- [General theme settings](#general-theme-settings)
- [Theme settings: how to override mixins](#theme-settings-how-to-override-mixins)
- [Theme settings: palette](#theme-settings-palette)
- [Theme settings: first loader](#theme-settings-first-loader)
- [Theme settings: custom fonts](#theme-settings-custom-fonts)
- [Site logo](#site-logo)
- [Homepage background image](#homepage-background-image)
- [Localised common site logos](#localised-common-site-logos)
- [Add hyperlink on header logo](#add-hyperlink-on-header-logo)
- [Add icons to specific facet values](#add-icons-to-specific-facet-values)
- [Api documentation hyperlink](#api-documentation-hyperlink)
- [Contact us hyperlink](#contact-us-hyperlink)
- [Contact us and Share email: Header logo of the organisation](#contact-us-and-share-email-header-logo-of-the-organisation)
- [Table and chart: footer logo](#table-and-chart-footer-logo)
- [Table and chart: footer terms and conditions](#table-and-chart-footer-terms-and-conditions)
- [Chart: map configuration](#chart-map-configuration)
- [Chart: override stacked charts palette](#chart-override-stacked-charts-palette)
---

### Introduction
This page is a guide on how to customise and interact with some of the .Stat Data Explorer look and feel and layout features.  

These customisations can be performed by Administrators with access to the .Stat DE installation files, but they should all be driven by business decisions.<br>

---

### Warning
When editing the configuration .json file(s) of the .Stat Suite applications, the **default encoding** on your server/system could potentially be **different than UTF-8**, e.g. **UTF-8-BOM**.  
`BOM` being an issue to handle in web client rendering, whenever editing your config. files, make sure that this is always managed in the right **UTF-8 encoding format**, in order to avoid introducing extra invisible BOM characters to your file.

---

### Visual UI components demo
**Visions** is a library of `React` components that compiles the definition and behavior of all the visual UI components used in the Data Explorer.  
The dynamic and interactive **[Visions demo site](https://visions-qa.siscc.org/#o)** describes and demoes each (material UI) components' behavior, properties and customisable theme. The Visions demo site is very handy when deciding to customise your DE theme settings.

![Visions](/dotstatsuite-documentation/images/de-visions.png)

The Visions demo site has additional options in the top-right header that are applied to all UI components: palette, right-to-left (RTL) mode, colour (example of an override of the theme in pink), web accessibility.

![Visions options](/dotstatsuite-documentation/images/de-visions-2.png)

---

### General theme settings
>The format and default theme was changed with the release [May 18, 2020 Release .Stat Suite JS 5.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#may-18-2020)  

It is possible to **override** the default **layout theme** of the application.  
The **default theme** is stored under `dotstatsuite-visions/src/theme.js`. You can **override** the default theme by adding new entries in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`.  
The default theme is applied if there is no theme added to the settings.json file.<br>

```json
{
  "theme": {
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
Data Explorer uses a [Material-ui](https://material-ui.com/) theme, and you can entirely customise it by using your [settings.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/blob/master/configs/default/data-explorer/settings.json) file under the `https://material-ui.com/` key. For your help, all components used in Data Explorer are in the website [**Visions**](https://visions-qa.siscc.org/#o).

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
you can find this component in visions [(**DataHeader**)](https://visions-qa.siscc.org/#oDataHeader), the name of this component being "DataHeader".

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
```json
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
  stroke: #ff00ff;
}
```

---

### Theme settings: custom fonts
> Since [August 3, 2022 Release .Stat Suite JS quark](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#august-3-2022), DE fonts are not hardcoded anymore.

**Disclaimer:** DE fonts are not harcoded, you need to use the settings **'linkTags'** to load explicitely the fonts. By default, the fonts of the browser will be used.

Additionally, there are currently two ways of loading fonts.

1) The first approach is to provide **stylesheet links** in the `settings.json` file with defined "font-face" inside.

e.g. in settings.json  
```json
{
  "app": {
    "linkTags": [
      "https://fonts.googleapis.com/css?family=Roboto+Slab:400",
      "https://fonts.googleapis.com/css?family=PT+Sans+Narrow:700"
    ]
  }
}
```

2) The second approach is to directly use the `styles.css` file and **define your own "font-face"**.  
Using the proprety "src", your can set a local path or an URL.

e.g. in styles.css  
```css
@font-face {
  font-family: 'Roboto Slab';
  font-style: normal;
  font-weight: 400;
  src: url(/assets/siscc/data-explorer/fonts/Roboto_Slab/RobotoSlab-400.woff2) format('woff2');
  src: url(https://fonts.gstatic.com/s/robotoslab/v23/BngbUXZYTXPIvIBgJJSb6s3BzlRRfKOFbvjojISmb2Rj.woff2) format('woff2');
}
```

You can also import a .css file inside the `styles.css`, although we do not recommend it, because imported .css files defer the loading of the included resource until the file is fetched.

We recommend using a dynamic provider like 'Google WebFonts' for the following reasons: 
  - better performance (speed)
  - It avoids the "flash of unstyled content" problem
  - All browsers are supported
  - Different languages are supported regarding the client's computer characters (Latin, Vietnamese... )
  - The API provides a transparent update.

---

### Site logo
> Deprecation: since [November 30, 2020 Release .Stat Suite JS 6.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#november-30-2020), the configuration for setting up the name of the application (*`"title": "OECD Data Explorer"`*) is moved to its natural behavior in the [localisation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/localisation/) management, enabling to translate it by any supported language of the application UI.

Define your website name and logo.<br>

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
    "app": {
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

### Localised common site logos
Define the common logos in the header, subheader, footer and homepage of the website.<br>
Since [October 5, 2021 Release .Stat Suite JS 10.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#october-5-2021), assets are localised, meaning that, if switching the locale of the DE, it will change the logo source depending on the corresponding language. This can be applied to all assets. If a localised asset is defined but a locale does not match any source image, then it will display a broken link. 

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
    "assets": {
        "header": {
          "en": "/assets/siscc/data-explorer/images/OECD-logo_en_Desktop.png",
          "fr": "/assets/siscc/data-explorer/images/OECD-logo_fr_Desktop.png",
          "es": "/assets/siscc/data-explorer/images/OECD-logo_es_Desktop.png"
        },
        "subheader": "/assets/siscc/data-explorer/images/dotstat-data-explorer-logo.png",
        "footer": "/assets/siscc/data-explorer/images/sis-cc-icon.png",
        "splash": "/assets/siscc/data-explorer/images/dotstat-data-explorer-logo.png"
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
> *Version history:*  
> Moved the definition of the hypelrink from `assets` to `app` in [January 13, 2022 Release .Stat Suite JS 12.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#january-13-2022)  
> Hyperlink is made localised with [October 5, 2021 Release .Stat Suite JS 10.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#october-5-2021)  
> Intorduced in [July 23, 2020 Release .Stat Suite JS 5.2.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#july-23-2020) (thanks to [Dhanya Chandrasekharan](https://gitlab.com/dhanya.sreekant) for the contribution!)

To add an hyperlink/URL behind the logo of the common site header (top-left part). This feature is useful when the Data Explorer is part of a web portal allowing thus users to browse from one application to another within the same portal. It is also localised, meaning that a different hyperlink/URL can be defined for each supported locale.

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
{
  "app": {
    "headerLink": "http://siscc.org"
  }
}
```

Localised example:

```json
{
  "app": {
    "headerLink": {
      "fr": "http://siscc.fr",
      "en": "http://siscc.org"
    }
  }
}
```

---

### Add icons to specific facet values

You can define individual icons that are to be displayed with specific facets values in the DE home and search result pages.  

This is a new entry of the configuration, and is supporting the **SVG path segment** format ONLY.  
SVG paths are to be considered as a best practice and solution for websites auto-layout and accessibility.  
The SVG images must be scaled to fit into a 24 x 24px viewport in order to be fully visible.  

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
"sdmx": {
  ...
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
  ...
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

---

### API documentation hyperlink
Define the hyperlink for the API documentation.<br>

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

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

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
  "viewer": {
    "api": {
        "contact": "https://stats.oecd.org/FAQAndContact.aspx",
    }
  }
```

![Contact us](/dotstatsuite-documentation/images/faq-contact-us.png)

---

### Contact us and Share email: Header logo of the organisation   
> [April 20, 2023 Release .Stat Suite JS unicorn](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#april-20-2023)  

Define the logo of the organisation in the header banner of the mail sent from the `Share` or the `Contact us` features. The source can be a binary image or a link.   
   
* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
  "assets": {
    ...
    "mailHeader": "/assets/siscc/data-explorer/images/siscc-email-logo.png",
  },
```
---

### Table and chart: footer logo
Define the logo of the organisation in the footer of the table and chart views. The source can be a binary image or a link.  
Since the [January 21, 2021 Release .Stat Suite JS 7.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#january-21-2021), the table and chart footer logo is **localised**. When .Stat DE is configured with several languages, then you can also have a table and chart footer logo different for each language *(e.g. "OECD" logo in English and "OCDE" logo in French)*.

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
  "assets": {
    ...
    "viewerFooter": {
      "en": "/assets/siscc/data-explorer/images/sis-cc-logo.png",
      "fr": "/assets/siscc/data-explorer/images/dotstat-data-explorer-logo.png"
    }
  },

```

![viewer footer logo](/dotstatsuite-documentation/images/faq-viewer-logo.png)

**Note:** If no locale is added to `"viewerFooter"`, then only the default logo asset is displayed for all languages. If at least one locale is added to `"viewerFooter"`, then all configured languages will expect a dedicated logo asset, hence if there is in this case one missing logo for a given language, then no footer logo will be returned in that specific language.

---

### Table and chart: footer terms and conditions

> Deprecation: since [November 30, 2020 Release .Stat Suite JS 6.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#november-30-2020), the configuration for setting up the name displayed on top of the hyperlink (*`"label": "Terms & Conditions"`*) is moved to its natural behavior in the [localisation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/localisation/) management, enabling to translate it by any supported language of the application UI.

Define the hyperlink in the footer of the table and chart views behind the "c" copyright icon.<br>

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
"viewer": {
  "terms": {
      "link": "http://www.oecd.org/termsandconditions/",
  }
}
```

![Terms and Conditions](/dotstatsuite-documentation/images/faq-terms-conditions.png)

---

### Chart: map configuration
>*Version history:*  
> Map projection renamed mercator -> `geoMercator`, and `scale` attribute removed with [December 14, 2021 Release .Stat Suite JS 11.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#december-14-2021)  
> Introduced in [November 19, 2019 Release JS v3.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#november-19-2019)

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

**Second step** The `topojson` file needs to be added in the following path `dotstatsuite-config-data/<env>/assets/<tenant>/data-explorer/maps/world_map.json`<br>

**Third step** Then it needs to be referenced in Data Explorer settings in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`:
```json
{
    "chart": {
        "maps": {
            "world_map": {
                "id": "world_map",
                "projection": "geoMercator",
                "path": "/assets/<tenant>/data-explorer/maps/world_map.json",
                "levels": [
                  { "id": "continents", "names": { "en": "World Continents", "fr": "Continents du Monde" } },
                  { "id": "countries", "names": { "en": "World Countries", "fr": "Pays du Monde" } }
                ],
            }
        }
    }
}
```
A very important aspect here above is about `projection` entry. It is linked to the api specification of the D3 library for map rendering. Detailed specifications of D3 projection mechanism are to be found [here](https://github.com/d3/d3-3.x-api-reference/blob/master/Geo-Projections.md).  
Keep in mind that `projection` stands for the specific D3 projection you want to use (e.g. `mercator` for `d3.geo.mercator`).  

As you may have noticed in this example, each area level is declared with the associated localised names which will be used by the application, in order to display all the possible maps selection for a chart display.

Know that all these area levels labels will be pass as `map` variables to the generic label of the Map Chart, registered under `chart.choropleth` key in the translation files. Here is an English example:
`dotstatsuite-config-data/i18n/en.json`
```json
{
    "chart.choropleth": "Map of {map}",
}
```
This example, associated with the previous settings example will result with 2 options (in the menu of the Data Explorer chart drop-down feature) labelled in English: "Map of World Continents" and "Map of World Countries".

---

### Chart: override stacked charts palette
> Introduced in [December 14, 2021 Release .Stat Suite JS 11.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#december-14-2021)

By default, the Stacked (bar & row) charts take one color and compute shades to render the different stacks. You can override the default settings in order to apply multiple colors from the options, or compute shades if only one overriden color is provided.

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-explorer/settings.json`

```json
{
  "chart": {
    "options":{
      "serie": {
        "colors": ["#A10100", "#DA1F05", "#F33C04", "#FE650D", "#FFC11F", "#FFF75D", "#aa83be", "#969696", "#333333"],
        "overColors": ["#DA8079", "#FA9778", "#FBB678", "#F6C960", "#F7D850", "#553488", "#aa83be", "#969696", "#333333"]
     }
    }
  }
}
```

The preexisting shading computing will still be applied in case of one unique color `"colors": []` provided.  
If there are more stacks in a chart than colors `"colors": []` are provided, then the stacks will loop and go again with the first colors.  
Don't forget to also configure the **`overColors`** palette, those are the colors to be displayed when the stack is hovered with the mouse, you can simply duplicate your palette or customize it for a nice shading effect.

![stacked color palette](/dotstatsuite-documentation/images/de-custom-chart-palette.png)
