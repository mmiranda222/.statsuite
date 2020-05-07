---
title: "General layout and common features"
subtitle: 
comments: false
weight: 1200

---

#### Table of Content
- [User Interface Design](#user-interface-design)
- [Header](#header)
- [Login](#login)
- [Language](#language)
- [Footer](#footer)

*under construction...*

### User Interface Design

>**Disclaimer**: It is possible to see some differences between the principles of the UI design from the referenced documentation, and the look and feel of the latest versions of .Stat DE, this being due to the timing of implementation.  
Also, theming the Data Explorer is largely flexible (see our documentation [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-customisation/) about the topic), you can thus meet tenants of the .Stat DE applying layouts, colors or fonts that are entirely different from the default ones.  

**.Stat Data Explorer UI design** and layouts are following and applying the principles described in the **[UI documentation](https://cis-itn-oecd.github.io/Design-artefacts/demo/ui-documentation/index.html)**.  
**[DE mockups](https://cis-itn-oecd.github.io/Design-artefacts/demo/de-material/index.html)** are also made and maintained up-to-date in order to illustrate how the design principles apply to the expected user experience.

### Header
The Data Explorer header is common to all pages of the application, and consists of:
* a static logo ([configurable](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-customisation/#site-title-and-logo));
* a link to log in the application;
* a multilangual switch option.

![DE Header](/images/de-header.png)

### Login
Registration is orchestrated at the organisation level, for one or several instances of the Data Explorer, and common with the DLM registration mechanism (if the DLM application is also deployed). For further information, check the [.Stat authentication configuration](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/authentication/) and the [DLM login mechanism](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/log-in-dlm/).  
.Stat Suite applications are using **[Keycloak](https://www.keycloak.org/)** as the authentication service.  

![DE Log in](/images/de-login-1.png)

When cliking on the `Log in` icon of the DE, the user is redirected to the authentication page in order to provide his username and password.  
![DE Register](/images/de-login-2.png)

Once logged in, the DE header displays the user's name, next to the user icon. When clicking on the name, a dropdown feature displays the user email address, and the option to log out.  

![DE Log out](/images/de-login-3.png)

Cliking on `Log out` will automatically unregistered the user and refresh the DE hompage.

### Language
The Data Explorer is multilangual and supports the localisation of the static elements of the user interface, as well as the localised indexed data [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/indexing-data/).  
There must be at least one language defined for one instance of the DE. If an instance supports more than one language, then a dropdown feature displays the list of available languages.

![DE language](/images/de-language.png)

Switching from one language to another will display the corresponding translated labels for the static UI elements, and for the contents (e.g. filter contents, table and chart view headers and labels, etc.).   
If, for a given language, the localised elements are not available (e.g. the data proivided did not provided the necessary translated elements), then they are replaced by their corresponding IDs.  

The behavior changes depending of the DE page:
* Switching language from the homepage keeps the user on the homepage;
* Switching language from the search result page brings the user back to the homepage;
* Switching language from the visualisation page (table view or chart view) keeps the user on the same page.

### Footer
The Data Explorer footer is common to all pages of the application, and consists of:
* a static logo ([configurable](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-customisation/#site-title-and-logo));
* two (left and right) placeholders for localised text and hyperlink.

![DE Footer](/images/de-footer.png)

