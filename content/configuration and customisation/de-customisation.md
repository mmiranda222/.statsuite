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
- [common site logos](#common-site-logos)
- [table and chart footer logo](#table-and-chart-footer-logo)
- [table and chart footer terms and conditions](#table-and-chart-footer-terms-and-conditions)
- [api documentation hyperlink](#api-documentation-hyperlink)
- [contact us hyperlink](#contact-us-hyperlink)


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

