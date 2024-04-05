---
title: "General layout and common features"
subtitle: 
comments: false
weight: 1200
keywords: [
  'User Interface Design Specifications', '#user-interface-design-specifications',
  'Header', '#header',
  'Web Content Accessibility Support', '#web-content-accessibility-support',
  'Login', '#login',
  '"Contact us" form', '#contact-us-form',
  'Language', '#language',
  'Footer', '#footer',
  'URL parameters', '#url-parameters',
]
---

#### Table of Content
- [User Interface Design Specifications](#user-interface-design-specifications)
- [Header](#header)
- [Web Content Accessibility Support](#web-content-accessibility-support)
- [Login](#login)
- ["Contact us" form](#contact-us-form)
- [Language](#language)
- [Footer](#footer)
- [URL parameters](#url-parameters)

---

### User Interface Design Specifications
The UI design of the .Stat Data Explorer (DE) is following the specifications described in the [UI documentation](https://sis-cc.gitlab.io/.stat-suite/design/demo/ui-documentation/index.html).  
[Mockups](https://sis-cc.gitlab.io/.stat-suite/design/demo/de-material/index.html) are also available to illustrate the expected user experience. The UI design respects the general Data Explorer [design principles](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/design-principles/) agreed within SIS-CC.

![DE UI documentation](/dotstatsuite-documentation/images/de-ui-doc.png)

>**Disclaimer**: It is possible to see some differences between the specifications of the UI design, the mockups and the look and feel of the latest implementation version of .Stat DE, which is due to the sequential timing of design and implementation.  
Also, theming the Data Explorer is largely flexible (see the related documentation [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-customisation/)), you can thus see particular tenants of the .Stat DE demo instance that apply different layouts, colours or fonts.  

---

### Header
The Data Explorer header is common to all pages of the application, and consists of:
* a predefined, [configurable logo](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-customisation/#localised-common-site-logos)
* a **localised text field**, which by default is empty and hidden and which can be [customised](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-customisation/#page-header-footer-and-splash)
* a switch to enable [Accessibility support](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/general-layout/#web-content-accessibility-support)
* a link to [Login](#login) to the application
* a link to [Contact us](#contact-us)
* a [Language](#language) switch option

![DE Header](/dotstatsuite-documentation/images/de-header.png)

Since [April 4, 2024 Release .Stat Suite JS zoo](/dotstatsuite-documentation/changelog/#april-4-2024), in responsive mode (on mobile phone view), all header options are grouped and displayed under a hamburger menu button that expands on click:

![DE Responsive Header](/dotstatsuite-documentation/images/de-responsive-header.png)

---

### Web Content Accessibility Support
> Enhancements based on [DE Accessibility Audit WCAG 2.1 level AA compliance - October 2021](https://gitlab.com/groups/sis-cc/.stat-suite/-/epics/29) and delivered with [April 4, 2024 Release .Stat Suite JS zoo](/dotstatsuite-documentation/changelog/#april-4-2024)  
> Released in [June 23, 2020 Release .Stat Suite JS 5.1.0](/dotstatsuite-documentation/changelog/#june-23-2020)

The Data Explorer endorses [Web Content Accessibility Guidelines (WCAG)](https://www.w3.org/WAI/standards-guidelines/wcag/) 2.1 to Level AA, in order to make its content **accessible to people with disabilities**.  
The WCAG 2.1 accessibility standards are made of prioritised criteria improving the accessibility. While all the technical content of the Data Explorer meets WCAG 2.1 criteria at Level AA, large parts also already meet Level AAA criteria.  
The prioritised criteria include key areas of adaptability such as:
* Semantic mark-up code enabling screen readers accessibility;
* All functionalities are keyboard accessible;
* Correct contrast ratio across the entire design colours;
* Alternative features (see below) when the defaults ones are limited in terms of accessibility criteria.

In order to apply the Data Explorer content accessibility features, the user can 'enable accessibility support' using the related button in the application header.   
The option can be used to enable or disable accessibility support at any time during the user journey in the Data Explorer.  
With this feature enabled, the data table view and its 'Customise' panel become accessible by screen readers.  

![DE Accessibility](/dotstatsuite-documentation/images/de-accessibility1.png)

* **Accessible data table version**  
When accessibility support is enabled, using the `Tab` key of the keyboard allows to navigate through each cell and see its content. When the specific footnote cells in the column headers have no content, then they are skipped.  

![DE Accessibility](/dotstatsuite-documentation/images/de-accessibility2.png)

* **Accessible 'Customise' panel version**  
When accessibility support is enabled, using the `Tab` key of the keyboard allows to navigate through the table axes (Rows, Columns or Row sections) and dimensions in order to change the table layout:  
  - use `spacebar` or `enter` key to select/unselect a dimension  
  - use `left` and `right` control keys to move a dimension between axes  
  - use `up` and `down` control keys to re-order dimensions within an axis  

![DE Accessibility](/dotstatsuite-documentation/images/de-accessibility3.png)

> Note: We used [ANDI](https://www.ssa.gov/accessibility/andi/help/howtouse.html), the 'Accessible Name and Description Inspector' accessibility testing tool, in the developments and tests of the accessibility compliance features.

---

### Login
Registration is orchestrated at the organisation level, for one or several instances of the Data Explorer, and common with the Data Lifecycle Manager (DLM) registration mechanism (if the DLM is part of the same installation). For further information, check the [.Stat authentication configuration](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/authentication/) and the [DLM login mechanism](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/log-in-dlm/).  
.Stat Suite applications can use **[Keycloak](https://www.keycloak.org/)** as the authentication service or any other OpenID-Connect compliant identity provider or proxy.

![DE Log in](/dotstatsuite-documentation/images/de-login-1.png)

When clicking on the `Log in` icon of the DE, it opens an authentication popup webpage in order, if appropriate, to choose the identiy provider and, if required, to enter the username and password.  

![DE Register](/dotstatsuite-documentation/images/de-login-2.png)

Once logged in, clicking on the user icon displays a dropdown feature with the user's name, email address, and the option to log out.  

![DE Log out](/dotstatsuite-documentation/images/de-login-3.png)

**Note** that the authentication in the DE supports the auto-login within the same web session, meaning that if an authenticated user opens a second tab of the DE in the same web session, then the authentication will be automatically spread across.

Clicking on `Log out` will automatically unregister the user and refresh the DE homepage.  
In case when there are several authenticated tabs of the DE in the same session, when the user logs out from one, then he will be logged out from all the DE tabs when refreshing the contents.

---

### "Contact us" form
> Released in [December 5, 2022 Release .Stat Suite JS spin](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#december-5-2022)

In order to contact the organisation responsible for the DE instance, the user can use the "Contact us" form icon ![DE Contact us icon](/dotstatsuite-documentation/images/de-contact-us-icon.png) in the application header and accessible from all DE pages. After clicking on it, a form will is displayed in a popup window allowing the user to:  
1. make a choice for 1 of the 3 question types with the following dynamically displayed explanatory texts:
  - **Content question**: "I cannot find the data I’m looking for, the data I found doesn’t correspond to what I expected, or I have another question concerning the data."
  - **Technical problem**: "I have a technical problem to access, select, configure, view, share or download data, or with any other feature of this web site."
  - **Feedback**: "I wish to give some feedback on this site to help to improve it or to thank the teams behind it."

2. complete the additional information:
  - *personal information* (title, full name, organisation, email where at least the email is required); The 'email' and 'full name' entries are prefilled in case the user is authenticated.
  - *detailed question/information* (required).
  - *whether user can be contacted* to help improving the web site (with a tick box).

The form proposes a *link to organisation's privacy policy* and an **(on/off) configurable) easy-to-use captcha** (required, see below).  

When the user clicks on "Send", an email is generated and automatically sent by a pre-configured SMTP server to a pre-configured email address (see below). The user is then informed by a notification popup that the mail has been sent.

![DE Contact us popup and notification](/dotstatsuite-documentation/images/de-contact-us-popup-and-notification.png)

The email sent contains:
- **email subject**: the question type selected (`Content question`, `Technical problem` or `Feedback`), the word *" about "* and the DE instance name.
- **email body**: all the information filled in the screen (except for reCAPTCHA) and the current URL used in the DE, meaning the URL of the page from where the user has opened the user feedback form.

![DE Contact us mail](/dotstatsuite-documentation/images/de-contact-us-mail.png)

See [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#contact-us-form-recaptcha-and-email-settings) on how to configure the "Contact us" form, the reCAPTCHA feature and the email settings for the destination email.  
Note that the "Contact us" form and/or the reCAPTCHA feature are not displayed if not configured appropriately. They can also be switched off through configuration.

---

### Language
> Enhanced behavior when no language is matching the selected locale since  [September 22, 2022 Release .Stat Suite .NET blueberry](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#september-22-2022)

The Data Explorer is multilangual and supports the localisation of the static elements of the user interface, as well as the localised indexed data ([documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-de/searching-data/indexing-data/)).  
There must be at least one language defined per DE instance. If an instance supports more than one language, then a dropdown feature displays the list of available languages.

![DE language](/dotstatsuite-documentation/images/de-language.png)

Switching from one language to another will display the corresponding translated labels for the static UI elements, as well as for the contents (e.g. filter contents, table and chart view headers and labels, etc.).   
If, for a given language, the localised contents are not available (e.g. the data provider did not add the necessary translated elements), then they are replaced by the default language being the first language provided in the request (provided as the first language defined by the data owner).  

The behavior of switching language will change depending on the page where language is switched:
* Switching language from the homepage keeps the user on the homepage;
* Switching language from the search result page brings the user back to the homepage;
* Switching language from the visualisation page (table view or chart view) keeps the user on the same page.

---

### Footer
The Data Explorer footer is common to all pages of the application, and consists of two (left and right-aligned) predefined **localised text fields** allowing for a logo, rich text and hyperlinks. They can be customised as described [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-customisation/#page-header-footer-and-splash)

![DE Footer](/dotstatsuite-documentation/images/de-footer.png)

---

### URL parameters
The Data Explorer pages let the user drive the page content through URL parameters. This allows bookmarking and URL sharing of DE pages. 

| key | legacy key (for backward-compatibility) | type | definition | exemple |
| ------ | ------ | ------ | ------ | ------ |
| lc | locale | string | locale of the app | lc=fr
| fc | facet | string | open facet box in side in search results | fc=qmsoRy4r
| tm | term | string | search term | tm=people
| pg | start | integer | page index of the search | pg=0
| fs | constraints | array | facet values selected in the search | fs[0]=SIS-CC-stable
| df[ds\|id\|ag\|vs] _or better_ df={source},{agency},{id},{version} | dataflow[datasourceId\|dataflowId\|agencyId\|version] | object | dataflow identifiers | df[ds]=SIS-CC-stable&df[id]=DF_AIR_EMISSIONS&df[ag]=OECD&df[vs]=2.1
| _- removed -_ | filter | string | open filter box in side in viz | filter=COU
| dq | dataquery | string | sdmx dataquery | dq=.AUS+AUT.GP.A
| ac=true\|false | hasAccessibility=true\|false | boolean | a11y mode of the app | ac=false
| av=true\|false | hasDataAvailability=true\|false | boolean | sdmx data availability mode | av=false
| pd | period | string | period of the sdmx data request | pd=2017,2020
| _- removed -_ | frequency | string | frequency of the app | frequency=Q
| ly[rs\|rw\|cl] | layout[sections\|rows\|header] | object | layout of the table in the vis page | ly[rs]=&ly[rw]=STO&ly[cl]=TIME_PERIOD
| lb=nm\|id\|bt | display=label\|code\|both | string | display mode of sdmx (label, code, both) | lb=code
| to[]=true\|false | time[]=true\|false | object | order of time dimension(s) | to[TIME_PERIOD]=true
| mp[id\|lv] | map[mapId\|levelId]| string | map information:ID of the map and ID of the map level | mp[id]=world_countries&mp[lv]=countries
| vw=ov\|tb\|md\|br\|rw\|sp\|hs\|vs\|tl\|sb\|cp | viewer=Overview\|Table\|MicroData\|BarChart\|RowChart\|ScatterChart\|<br>HorizontalSymbolChart\|VerticalSymbolChart\|<br>TimelineChart\|StackedBarChart\|<br>ChoroplethChart  | string | type of viewer component used | vw=tb |
| lo | lastNObservations | integer | last N observations per time series | lo=1 |

> **Note** that, since the [November 30, 2020 Release .Stat Suite JS 6.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#november-30-2020), the keys in the above table have been shortened in order to reduce the browser url size and avoid reaching browser limitations as much as possible. Previous bookmarked urls with long keys will still work because the application converts them to their shorter match.  
As part of this refactoring work, the following keys have also been removed:
> * filter (open box in side in viz)
> * frequency (frequency of the app)

**Note** also that these URL options allow using the web browser's `Going Back` option to roll back to the corresponding previous state and user selections.
