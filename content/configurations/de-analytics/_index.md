---
title: .Stat DE analytics
subtitle: 
comments: false
weight: 75
keywords: [
  'Google Analytics', '/dotstatsuite-documentation/configurations/analytics/google-analytics/',
  'Google Tag Manager', '/dotstatsuite-documentation/configurations/analytics/google-tag-manager/',
]
---
<!-- This page (or a sub-page or sub-section of this page) of the documentation is referenced as an external resource in the .Stat Academy:
* https://academy.siscc.org/configuring-and-customising/
Any change affecting its URL must be communicated to the .Stat Academy content admin in advance. -->

includes:

* [Google Tag Manager](/dotstatsuite-documentation/configurations/de-analytics/google-tag-manager/)
* [Google Analytics](/dotstatsuite-documentation/configurations/de-analytics/google-analytics/)
* [Matomo](/dotstatsuite-documentation/configurations/de-analytics/matomo/)

---

### IMPORTANT NOTES
As of July 1st 2023, **Universal Analytics (UA) standard has stopped processing data in Google Analytics.** As a consequence, you will be able to see your Universal Analytics reports for a period of time after July 1, 2023. However, new data will only flow into **Google Analytics 4 properties**. [Read more](https://support.google.com/analytics/answer/11583528)

Our documentation will explain how to set up GTM and GA based on the new **Google Analytics 4 properties**. For details about moving from UA to GA4, please read **[how to migrate to Google Analytics 4](https://support.google.com/analytics/answer/10759417)**.

**Google Analytics** plugged to .Stat Data Explorer was first implemented with [August 25, 2020 Release .Stat Suite JS 5.3.0](/dotstatsuite-documentation/changelog/#august-25-2020).  
**Google Tag Manager** directly plugged to .Stat Data Explorer (between DE and Google Analytics) was implemented with [October 5, 2021 Release .Stat Suite JS 10.0.0](/dotstatsuite-documentation/changelog/#october-5-2021).

If you were using Google Analytics plugged to your DE instance in a version older than **JS 10.0.0**, then upgrading to JS 10.0.0 will not break your statistics usage tracking with Google Analytics, unless if you decide to move to Google Tag Manager.  
If you decide to use Google Tag Manager, then when upgrading to **JS 10.0.0**, it is **mandatory** to remove your previous GA_TOKEN from your deployment process, and replace it with the new GTM_TOKENs (refer to our documentation about [GTM setup](/dotstatsuite-documentation/configurations/de-analytics/google-tag-manager/)).

Google Tag Manager is plugged "between" your website and any compliant statistic and data analytical tool such as Google Analytics. Google Tag Manager's tags may differ from Google Analytics tags, therefore, when upgrading to JS 10.0.0 and deciding to use Google Tag Manager on top of Google Analytics, new events from GTM Tags and Triggers will not be compatible with the previously used with Google Analytics only (wihtout Google tag Manager). It is nonetheless possible to edit and change the names and variables of the Tags and Triggers defined by default in Google Tag Manager.


![GA GTM diagram](/dotstatsuite-documentation/images/ga-gtm-diagram.png)
