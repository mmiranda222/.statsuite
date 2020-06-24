---
title: "General layout and common features"
subtitle: 
comments: false
weight: 1200

---

#### Table of Content
- [User Interface Design](#user-interface-design)
- [Web Content Accessibility Support](#web-content-accessibility-support)
- [Header](#header)
- [Login](#login)
- [Language](#language)
- [Footer](#footer)

### User Interface Design

>**Disclaimer**: It is possible to see some differences between the principles of the UI design from the referenced documentation, and the look and feel of the latest versions of .Stat DE, this being due to the timing of implementation.  
Also, theming the Data Explorer is largely flexible (see our documentation [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-customisation/) about the topic), you can thus meet tenants of the .Stat DE applying layouts, colors or fonts that are entirely different from the default ones.  

.Stat Data Explorer (DE) **UI design** and layouts are following and applying the principles described in the **[UI documentation](https://cis-itn-oecd.github.io/Design-artefacts/demo/ui-documentation/index.html)**.  
**[DE mockups](https://cis-itn-oecd.github.io/Design-artefacts/demo/de-material/index.html)** are also made and maintained up-to-date in order to illustrate how the design principles apply to the expected user experience.

![DE UI documentation](/images/de-ui-doc.png)

---

### Web Content Accessibility Support
> Released in [June 23, 2020 Release .Stat Suite JS 5.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#june-23-2020)  

The Data Explorer **endorses [Web Content Accessibility Guidelines (WCAG)](https://www.w3.org/WAI/standards-guidelines/wcag/) 2.1 to Level AA**, in order to make its content **accessible to people with disabilities**.  
The WCAG 2.1 accessibility standards are made of prioritised criteria improving the accessibility. While all the technical content of the Data Explorer meets WCAG 2.1 criteria at Level AA, large parts also already meet Level AAA criteria.  
The prioritised criteria include key areas of adaptability such as:
* Semantic mark-up code enabling screen readers accessibility;
* All functionalities are keyboard accessible;
* Correct contrast ratio across the entire design colours;
* Alternative features (see below) when the defaults ones are limited in terms of accessibility criteria.

In order to apply the Data Explorer content accessibility features, the user can **enable accessibility support** using the related button in the application header.   
The option can be used to enable or disable accessibility support at any time during the user journey in the Data Explorer.  
With this feature enabled, the data table view and its 'Customise' panel become accessible by screen readers.  

![DE Accessibility](/images/de-accessibility1.png)

* **Accessible data table version**  
When accessibility support is enabled, using the `Tab` key of the keyboard allows to navigate through each cell and see its content. When the specific footnote cells in the column headers have no content, then they are skipped.  

![DE Accessibility](/images/de-accessibility2.png)

* **Accessible 'Customise' panel version**  
When accessibility support is enabled, using the `Tab` key of the keyboard allows to navigate through the table axes (Rows, Columns or Row sections) and dimensions in order to change the table layout:  
  - use `spacebar` or `enter` key to select/unselect a dimension  
  - use `left` and `right` control keys to move a dimension between axes  
  - use `up` and `down` control keys to re-order dimensions within an axis  

![DE Accessibility](/images/de-accessibility3.png)

> Note: We used [ANDI](https://www.ssa.gov/accessibility/andi/help/howtouse.html), the **Accessible Name and Description Inspector** accessibility testing tool, in the developments and testing of the accessibility compliances features.

---

### Header
The Data Explorer header is common to all pages of the application, and consists of:
* a static logo ([*configurable*](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-customisation/#site-title-and-logo));
* a link to log in the application;
* a multilangual switch option.

![DE Header](/images/de-header.png)

---

### Login
Registration is orchestrated at the organisation level, for one or several instances of the Data Explorer, and common with the Data Lifecycle Manager (DLM) registration mechanism (if the DLM is part of the same installation). For further information, check the [.Stat authentication configuration](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/authentication/) and the [DLM login mechanism](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/log-in-dlm/).  
.Stat Suite applications are using **[Keycloak](https://www.keycloak.org/)** as the authentication service.  

![DE Log in](/images/de-login-1.png)

When cliking on the `Log in` icon of the DE, the user is redirected to the authentication page in order to provide his username and password.  

![DE Register](/images/de-login-2.png)

Once logged in, the DE header displays the user's name, next to the user icon. When clicking on the name, a dropdown feature displays the user email address, and the option to log out.  

![DE Log out](/images/de-login-3.png)

Cliking on `Log out` will automatically unregister the user and refresh the DE homepage.

---

### Language
The Data Explorer is multilangual and supports the localisation of the static elements of the user interface, as well as the localised indexed data )[documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/indexing-data/)).  
There must be at least one language defined per DE instance. If an instance supports more than one language, then a dropdown feature displays the list of available languages.

![DE language](/images/de-language.png)

Switching from one language to another will display the corresponding translated labels for the static UI elements, as well as for the contents (e.g. filter contents, table and chart view headers and labels, etc.).   
If, for a given language, the localised contents are not available (e.g. the data provider did not add the necessary translated elements), then they are replaced by their corresponding IDs.  

The behavior of switching language will change depending on the page where language is switched:
* Switching language from the homepage keeps the user on the homepage;
* Switching language from the search result page brings the user back to the homepage;
* Switching language from the visualisation page (table view or chart view) keeps the user on the same page.

---

### Footer
The Data Explorer footer is common to all pages of the application, and consists of:
* a static logo ([*configurable*](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-customisation/#site-title-and-logo));
* two (left and right) placeholders for localised text and hyperlink.

![DE Footer](/images/de-footer.png)

