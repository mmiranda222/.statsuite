---
title: "Localisation"
subtitle: 
comments: false
weight: 82
keywords: [
  'Scope, technical architecture, main change processes', '#scope-technical-architecture-main-change-processes',
  'Scope', '#scope',
  'Technical architecture', '#technical-architecture',
  'Management of the complete list of keys for default translations', '#management-of-the-complete-list-of-keys-for-default-translations',
  'Management of translations', '#management-of-translations',
  'Translation gathering process', '#translation-gathering-process',
  'Overwriting default translations', '#overwriting-default-translations',
  'Rich-text translations', '#rich-text-translations',
  'Supported locales', '#supported-locales',
  'Adding a new locale', '#adding-a-new-locale',
  'Defining a sub-set of locales to be used in an application tenant', '#defining-a-sub-set-of-locales-to-be-used-in-an-application-tenant',
]

---

#### Table of content
- [Scope, technical architecture, main change processes](#scope-technical-architecture-main-change-processes)
  * [Scope](#scope)
  * [Technical architecture](#technical-architecture)
  * [Management of the complete list of keys for default translations](#management-of-the-complete-list-of-keys-for-default-translations)
  * [Management of translations](#management-of-translations)
- [Translation gathering process](#translation-gathering-process)
- [Overwriting default translations](#overwriting-default-translations)
- [Rich-text translations](#rich-text-translations)
- [Supported locales](#supported-locales)
- [Adding a new locale](#adding-a-new-locale)
- [Defining a sub-set of locales to be used in an application tenant](#defining-a-sub-set-of-locales-to-be-used-in-an-application-tenant)

---

### Scope, technical architecture, main change processes

#### Scope

The JavaScript-based .Stat Suite web applications **Data Explorer**, **Data Lifecycle Manager** and **Data Viewer** are multilingual and support the localisation of their static UI elements. A '**locale**' (in computer software) is a set of parameters that defines the user's language, region and any special variant preferences that the user wants to see in their user interface. Often a locale is defined by a language and a region. In the .Stat Suite we use the https://tools.ietf.org/html/bcp47 standard with a primary sub-code that identifies the language (e.g. "en" according to  ISO 639-1 alpha-2), and an optional sub-code in capital letters that specifies the national variety (e.g., "GB" or "US" according to ISO 3166-1 alpha-2), both being linked with a hyphen (e.g. "en-GB").  
By extrapolation, the internationalization - abbreviated **i18n** - of our JavaScript applications also covers localisation, number, currency, etc... formatting.

The following describes how locales are set and maintained in these .Stat Suite web applications.

#### Technical architecture  
> Introduced in [October 7, 2020 Release .Stat Suite JS 5.4.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#october-7-2020)

1) Each locale has one **default**, application-independent and tenantless language version of all static UI element labels/texts. 
   They are stored in the corresponding `<locale>.json` file in the `./i18n/` folder of the [config repo](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config).  
   The file contains the complete list of keys and their corresponding localised values (e.g. `"de.search.topics.browse": "Browse by"`).  
   One single localised file contains all translations for **.Stat DE, .Stat DLM** UI elements (since [November 30, 2020 Release .Stat Suite JS 6.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#november-30-2020)) and **.Stat DV** (since [ADD NEW RELEASE DATE])). For ease of readibility, they are dinamically listed first by alphabetically DE used elements, then by DLM used elements in a second alphabetic order and finaly by DV used elements. 

2) If an application tenant needs an **alternative** localised value that is different from the default, then this value can be entered in the corresponding `<locale>.json` file in the `./configs/<tenant>/<app>/i18n/` folder of the [config repo](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config).  
   The file contains only those keys and their corresponding localised values (e.g. `"de.search.topics.browse": "Select a"`) that should be used to overwrite the above mentioned default values.

3) The `dotstatsuite-config` service is responsible for serving these (default and alternative) `<locale>.json` files to the consuming applications.

4) The back-ends of the consuming applications, such as the Data Explorer or the Data Lifecycle Manager, handle the localised value reconciliation between defaults and alternatives. The alternatives always replace the corresponding default values, including if the default value changed. If a default key is removed or renamed, then the alternative value is ignored.

![localisation](/dotstatsuite-documentation/images/localisation.png)

*Note:* in the following, the term 'translation' is frequencly being used instead of 'localised version of a static UI element label/text' or shorter 'localised value'. The term 'i18n' stands for 'internationalization' (where 18 stands for the number of letters between the first i and the last n in the word). 

#### Management of the complete list of keys for default translations

The list of *keys* of default translations is managed by the **developers**. If functional requirements and related developments have an impact on translation keys, then one script needs to be run in the host app and one script in the config service before pushing changes from host app and config service into git. The script automatically extracts the necessary keys from the source code and updates the default localisation files. 

*how-to:*  
1. go to [config repo](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config)
1. run `yarn i18n:update data-explorer branch-name` to: *(3)* *(4)*
    - update default keys from data-explorer at `./i18n/data-explorer.json` *(5)*
    - update locales at `/i18n` *(6)* *(7)*

*notes*:
* (0) currently only the data-explorer supports the default translations 
* (1) localisation of dynamic keys is not supported, only statically defined keys are extractible
* (2) the file is ignored by git and overwritten by the script, you should leave it as is
* (3) the script expects to find the keys file in the adjacent dotstatsuite repo, use `KEYS_PATH` to override
* (4) the source (data-explorer) is required to handle key removal (if a key is removed from data-explorer, then check if the key is not used in another app before removing it from default keys)
* (5) handled by the script only and not ignored by git, not to be touched
* (6) only existing files are updated, the script *discovers* locales through files not with hardcoded var or a cmd arg that may unsync locales if not everything is updated at once
* (7) overrides are not covered by the automatic update, *(could be an evolution)*

#### Management of translations

The default translations - the underlying localised labels/texts, but not their keys - are managed by the **product managers**. In addition, they also keep up-to-date the alternative translations for the applications running in the SIS-CC quality assurance (QA) and functional staging (demo) environments.

*How to:* 
1. go to [config repo](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config);
1. go to `./i18n/<locale>.json` to update **default** translation values of `<locale>`;
1. go to `./configs/<tenant>/<app>/i18n/<locale>.json` to **overwrite** translations values of `<locale>` for a specific `<app>` of a specific `<tenant>`.

---

### Translation gathering process

We try to support as many locales as possible for the .Stat Suite applications, but to do so we also need the contribution of the users and stakeholders to the translations.  
International **English** and international **French** are the out-of-the-box locales provided by the product managers. All releases will thus always contain the complete and up-to-date international English and international French locale versions. Indeed, contributions for enhancing these two locales are also very welcome!  
For the other currently included locales, we can only rely on the users and stakeholders to contribute with translations.

The process to contribute with translations is as follow:

1. as soon as possible in our [development process](https://sis-cc.gitlab.io/dotstatsuite-documentation/contribution/issue-process/), the product managers identify when a new translation key is created for one of the .Stat Suite applications;
1. any new key is added by the developer to the default `./i18n/<locale>.json` files for all supported locales, and translation values are left blank *(1)*. See [Management of the complete list of keys for default translations](#management-of-the-complete-list-of-keys-for-default-translations);
1. for any new key, the product managers enter translation values for both international English and international French. The values are either provided in the description of the corresponding GitLab ticket, or directly in the default `./i18n/[en|fr].json` files (new branch + new merge request) - see [Management of translations](#management-of-translations). In the first case, the implementing developer makes the updates in these files;
1. the product managers contact and ask the stakeholders for each supported locale to provide the translation values for all new keys. The communication with the stakeholders is done at best through GitLab by submitting a merge request, or simply through comments in the related ticket;
1. translations provided in due time are released along with the corresponding feature and their default international English and international French translations. Missing translations are left blank until a translation value is provided. Subsequently provided translation values can be included in any following release of the corresponding application.

(1) When a translation value is left blank for a given locale, the corresponding application (e.g. Data Explorer) displays the key instead of the expected value.

---

### Overwriting default translations

For a specific application tenant, default translations can be dynamically overwritten by defining alternative translation values.  
**Implementers** should follow these steps to define these alternative translations:
1. go to your application tenant's `configs/<tenant>/<app>/` folder. Create here a new `i18n` folder if it doesn't already exist;
1. for each required locale, create a new `<locale>.json` file - if it doesn't already exist - in this `i18n` folder and use the file to enter the corresponding application-tenant-specific alternative translations values;
1. add **only** those keys and their corresponding localised values (`key: value` combinations, e.g. `"de.search.topics.browse": "Select a"`) for which you want to overwrite the default translations.

The alternative translations always overwrite the corresponding default translations, even if the value of the default translation has been updated meanwhile. If a developer removed or renamed a default translation key, then the alternative translation is ignored.

---

### Rich-text translations

> Introduced in [October 7, 2020 Release .Stat Suite JS 5.4.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#october-7-2020)

All translations can be formatted using whitelisted **rich text elements**.  This allows using basic formatting syntax in the `<locale>.json` translation files.

> Whitelisting is used in order to prevent xss attacks with unexpected text content in unrestricted `html` documents. The display of labels in the web applications doesn't profit from sanitization, which is done during the build process, because translations are injected afterwards.

The currently defined format whitelist is:

- line break: `{br}`
- italic text: `<i></i>`
- bold text: `<b></b>`

*How to:*  
```
"my.normal.translation": "this is normal",
"my.new.line.translation": "this is{br} a new line",
"my.italic.translation": "this is <i>italic</i>",
"my.bold.translation": "this is <b>bold</b>",
"my.nested.translation": "this is <i>n<b>e</b>sted</i>",
```

**Current known limitation:** Text formatting of a button label may not always work as expected: When a button label is composed of several words and tags such as `<i> </i>` are used, then the spaces between words are trimmed. Text formatting of a static text field (e.g. the DE footer disclaimer) doesn't have this limitation.

---

### Supported locales

.Stat Suite supports a large number of locales. Check our [dotstatsuite-config repo](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/tree/master/data/dev/i18n) to see if your locale is supported. Each translation file corresponds to one locale, which identifier is constructed according to the https://tools.ietf.org/html/bcp47 standard with a primary sub-code that identifies the language (e.g., "en" according to  ISO 639-1 alpha-2), and an optional sub-code in capital letters that specifies the national variety (e.g., "GB" or "US" according to ISO 3166-1 alpha-2), both being linked with a hyphen (e.g. "en-GB").

---

### Adding a new locale

Adding a locale to the .Stat Suite that is not yet supported requires slightly updating the codebase. It is therefore necessary to create a ticket in [GitLab](https://gitlab.com/groups/sis-cc/-/issues) for such a request by following the [contribution process](https://sis-cc.gitlab.io/dotstatsuite-documentation/contribution/report-an-issue/). Within your ticket you will need to provide:
* The name and id ([IETF language tag](https://tools.ietf.org/html/bcp47)) of the newly requested locale,
* A translation file with all the translation keys and their localised values. Always complete and up-to-date references for this work are the English and the French translations that can be retrieved from the **`master`** branch in https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/-/tree/master/data/dev/i18n;
* As a technical contributor, you can also refer to the [developer how to](#Management of the complete list of keys for default translations) for additionally submitting a merge request to the codebase for the new language by linking it to the related ticket.

Once a new locale is defined (and publicly released), it needs to be added to the configuration of each application tenant that wants to use it (see [Defining a sub-set of locales to be used in an application tenant](#defining-a-sub-set-of-locales-to-be-used-in-an-application-tenant)).

---

### Defining a sub-set of locales to be used in an application tenant

Locales to be used in a .Stat Suite application tenant are configured in the `./data/[dev|prod]/configs/<tenant>/<app>/settings.json` config file.  

The following rules are to be considered when setting up locales for an application tenant:
* It is mandatory to define **at least one locale**;
* The default locale (locale used by the application UI when the URL has no language parameter) is defined by the property `localeId` of `i18n` in the `settings.json` file (see the example below);
* Some of the configurations for a given application, e.g. the Data Explorer, are localised. You will thus need to replicate those configurations for each required locale. You can refer to the [.Stat DE configuration](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/) for more details;
* Some languages, such as Arabic, are read from right to left. You thus need to add the property `"isRtl": true` for those locales, so that the application UI adapts accordingly.

Example:

```json
 "i18n": {
    "localeId": "en",
    "locales": {
      "en": {
        "id": "en",
        "delimiters": { "thousands": " ", "decimal": "."  },
        "timeFormat": "YYYY-MMM"
      },
      "fr": {
        "id": "fr",
        "delimiters": { "thousands": " ", "decimal": ","  },
        "timeFormat": "MMM YYYY"
      },
      "es": {
        "id": "es",
        "delimiters": { "thousands": " ", "decimal": ","  },
        "timeFormat": "MMM YYYY"
      },
      "ar": {
        "id": "ar",
        "isRtl": true,
        "delimiters": { "thousands": " ", "decimal": ","  }
      }
    }
```
