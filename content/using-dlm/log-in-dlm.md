---
title: "Log in the DLM"
subtitle: 
comments: false
weight: 210
keywords: [
  'Log in', '#log-in',
  'My permissions', 'my-permissions',
  'Log out', '#log-out',
  'Connect to external sources using the native NSI authentication', '#connect-to-external-sources-using-the-native-nsi-authentication',
]
---

#### Table of Content
- [Log in](#log-in)
- [My permissions](my-permissions)
- [Log out](#log-out)
- [Connect to external sources using the native NSI authentication](#connect-to-external-sources-using-the-native-nsi-authentication)

---

*Note:* User identities, third-party identity providers and account registrations are managed autonomously by the organisation. For information about the authentication setup, check the [.Stat authentication configuration](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/authentication/). .Stat Suite applications are using **[Keycloak](https://www.keycloak.org/)** as the default authentication service, or any other OpenID-Connect compliant identity provider or proxy. Keycloak can be configured to act as a simple proxy to third-party identity providers such as ADFS.

### Log in
The DLM requires users to log in because the DLM is **not accessible in anonymous mode**. Thus, when launching the DLM in a web browser, it displays an empty homepage with a button to authenticate:

![DLM Login landing page](/dotstatsuite-documentation/images/dlm-login-landing-page.png)

When clicking on "Log in", it opens an authentication popup webpage in order to choose the identity provider and to enter the username and password.

![DLM Login](/dotstatsuite-documentation/images/de-login-2.png)

Once logged in, the DLM header displays the user's name, next to the user icon. When clicking on the name, a dropdown feature displays the user email address, and the option to log out.

![DLM Logout](/dotstatsuite-documentation/images/dlm-log-in.png)

The authentication in the DLM supports the auto-login within the same web session, meaning that if an authenticated user opens a second tab of the DLM in the same web session, then the authentication will be automatically spread across.

---

### My permissions
> Introduced in [December 5, 2022 Release .Stat Suite JS spin](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#december-5-2022)

The user's own permission page is accessible by clicking on the 'My permissions' button: see [this page section](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/manage-user-access/manage-permissions/#my-permissions).

![DLM Logout](/dotstatsuite-documentation/images/dlm-my-permissions.png)

It remains highlighted until the user switches to a different view.

---

### Log out
>Released in [February 28, 2020 Release .Stat Suite JS 4.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#february-28-2020)

When clicking on "Log out", the user is logged out from .Stat DLM and redirected again to the authentication page (empty DLM homepage). The logout feature allows thus changing the user credentials in case a user has different accounts with different roles.

In case when there are several authenticated tabs of the DLM in the same session, when the user logs out from one, then he will be automatically (with a little delay, or when refreshing the tab) logged out from all the DLM tabs.

---

### Connect to external sources using the native NSI authentication
> Introduced in [December 14, 2021 Release .Stat Suite JS 11.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#december-14-2021)

When the DLM is connected to an **external source using the native NSI** authentication mechanism, then the user will be invited to provide a dedicated access information.  
When the user select an external source using the native NSI authentication, a popup dialog box is dislayed an invites to provide a valid Username and Password.

![DLM NSI login](/dotstatsuite-documentation/images/dlm-login-native-nsi.png)

The authentication with credentials is a non-mandatory option, because anonymous users can also be allowed to see the fully public data. Therefore, users can select the "Coonect anonimously instead" option.

Once the 'Login' button is clicked, whether with credentials or anonymous, the system checks if the access request is successful or not. If successful, then the dialog box closes and the list of available artefacts is displayed (given that the user has selected / selects an artefact type).  
In case of unsuccessful access request, the dialog box reappears and states "Unauthorized: please enter a valid username and password".

**NOTE** that this mechanism requires to be configured in the `tenants.json` file (at the 'space' level) during the installation (see details [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/tenant-model/#external-source-with-native-nsiws-authentication)).
