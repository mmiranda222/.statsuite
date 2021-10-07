---
title: ".Stat DLM customisation"
subtitle: 
comments: false
weight: 84
keywords: [
  'Intro', '#intro',
  'Warning', '#warning',
  'Site logo', '#site-logo',
  'Common site logos', '#common-site-logos',
]
---

#### Table of Content
- [Intro](#intro)
- [Warning](#warning)
- [Site logo](#site-logo)
- [Common site logos](#common-site-logos)
---

### Intro
This page is a guide on how to customise and interact with some of the .Stat Data Lifecycle Manager look and feel and layout features.  
These customisations can be performed by Administrators with access to the .Stat DLM installation files, but they should all be driven by business decisions.

---

### Warning
When editing the configuration .json file(s) of the .Stat Suite applications, the **default encoding** on your server/system could potentially be **different than UTF-8**, e.g. **UTF-8-BOM**.  
`BOM` being an issue to handle in web client rendering, whenever editing your config. files, make sure that this is always managed in the right **UTF-8 encoding format**, in order to avoid introducing extra invisible BOM characters to your file.

---

### Site logo
> Deprecation: since [November 30, 2020 Release .Stat Suite JS 6.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#november-30-2020), the configuration for setting up the name of the application (*`"title": "OECD Data Lifecycle Manager"`*) is moved to its natural behavior in the [localisation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/localisation/) management, enabling to translate it by any supported language of the application UI.

Define your website name and logo.  

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-lifecyle-manager/settings.json`

```json
  "app": {
    "favicon": "/assets/siscc/data-lifecycle-manager/images/favicon.ico"
  }
```

---

### Common site logos
Define the common logos in the header and footer of the website.<br>

* in `dotstatsuite-config-data/<env>/configs/<tenant>/data-lifecyle-manager/settings.json`

```json
  "assets": {
    "logo": "/assets/siscc/data-lifecycle-manager/images/logo.png",
    "icon": "/assets/siscc/data-lifecycle-manager/images/sis-cc-icon.png"
  }
```

* logo:  

![Site logo header](/dotstatsuite-documentation/images/dlm-logo-header.png)

* footer:  

![Site logo footer](/dotstatsuite-documentation/images/faq-site-logo-footer.png)

---
