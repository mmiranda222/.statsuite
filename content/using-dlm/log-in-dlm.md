---
title: "Log in the DLM"
subtitle: 
comments: false
weight: 210
keywords: [
  'Log in', '#log-in',
  'Log out', '#log-out',
]
---

<!-- 
ToC
- [Log in](#log-in)
- [Log out](#log-out)
 -->

#### Log in

The DLM requires and automatically invites users to log in because the DLM is **not accessible in anonymous mode**. Thus, when launching the DLM in a web browser, the user is automatically redirected to the authentication page in order to choose the identiy provider and to enter the username and password.

![DLM Login](/dotstatsuite-documentation/images/de-login-2.png)

Once logged in, the DLM header displays the user's name, next to the user icon. When clicking on the name, a dropdown feature displays the user email address, and the option to log out.

![DLM Logout](/dotstatsuite-documentation/images/dlm-log-in.png)

#### Log out

>Released in [February 28, 2020 Release .Stat Suite JS 4.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#february-28-2020)

When clicking on "Log out", the user is logged out from .Stat DLM and redirected again to the authentication page. The logout feature allows thus changing the user credentials in case a user has different accounts with different roles.

#### Note 

User identities, third-party identity providers and account registrations are managed autonomously by the organisations. For information about the authentication setup, check the [.Stat authentication configuration](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/authentication/). .Stat Suite applications are using **[Keycloak](https://www.keycloak.org/)** as the default authentication service. Keycloak can be configured to act as a simple proxy to third-party identity providers such as ADFS.
