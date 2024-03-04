---
title: "Pop-up survey feature"
subtitle: 
comments: false
weight: 1000

---

> *Version history:*  
> Introduced in [August 03, 2023 Release .Stat Suite JS 'Wave'](/dotstatsuite-documentation/changelog/#august-03-2023)  

An externally hosted survey can be triggered from within a Data Explorer session to gather any user feedback, e.g. to track user satisfaction, to better know the users and their needs, and even to grow the user testing community through questions.

When the pop-up survey is configured, see the [DE configuration](/dotstatsuite-documentation/configurations/de-configuration/#user-research-pop-up-survey-feature), then the survey pop-up window appears (in the middle of the screen) once per user session and after the first of the following events has occurred:
- The user has created a shared view
- The user has executed a download
- The user has copied one of the developer API queries
- The user has spent at least 1 minute on any visualisation page  
  
![pop-up survey](/dotstatsuite-documentation/images/pop-up-survey.png)  
  
In addition to the configurable picture (size: width '700px', height '550px), the survey pop-up window shows 3 localisable elements:
- A text button (i18n key: `de.survey.button`), which opens the externally hosted survey in a new browser tab
- A title (i18n key: `de.survey.subtitle`)
- A subtitle (i18n key: `de.survey.title`)

Note that you need to fill the above localised elements in your own DE instance by following the [overwriting translations process](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/localisation/#overwriting-default-translations).

Any online survey tool can be used to create the survey, which must be accessible through a URL. Some tools propose real-time tracking, which allows easily analysing the results.
