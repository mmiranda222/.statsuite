---
title: "How to get an Access Token in Postman"
subtitle: 
comments: false
weight: 81

---

The purpose of this short tutorial is to explain how to **setup [Postman](https://www.postman.com/)** (as an example of an API platform tool) in order to get an **Access Token** and thus being able to make requests on .Stat Suite services (nsiws) using the authorisation service and underlying permission rules.

**Note** that, like other variables and settings, Authorization can be setup on different level/scope (Collection, Folder or Individual request). In the following examples, screenshots of the Postman UI are done for an individual request. But if setup on a collection or folder level, this setup will apply to all http requests at the same level.

---

Navigate to the Postman **Authorization** tab of your request. From the **Type** dropdown menu, select **OAuth 2.0**:

Click on the **Get New Access Token** button that will open a dialog box for configuring the identity server (Keycloak in our case). Fill in the appropriate fields with the corresponding values for your environment, as such:
* **Token name** => give any name here
* **Grant Type** => select **Authorization Code** (or **Authorization Code with PKCE** depending on your auth. configuration)
* **Auth URL** => http://{YOUR-KEYCLOAK-BASE-URL}/auth/realms/{YOUR-REALM}/protocol/openid-connect/auth
* **Access Token URL** => http://{YOUR-KEYCLOAK-BASE-URL}/auth/realms/{YOUR-REALM}/protocol/openid-connect/token
* **Client ID** => Id of a client in your Keycloak setup
* **Scope** => which resource you want to provide (email openid profile)

**Authorize using browser** should also be ticked if required to open keycloak authentication from a web page.

![Postman get new token fields](/dotstatsuite-documentation/images/postman-step1.png)

Click on the **Request Token** button that should pop up a Keycloak's login dialog if everything was set up correctly. After a successful login, a **new Token** should be obtained as below:

![Postman use new token](/dotstatsuite-documentation/images/postman-step3.png)

Click on **Use Token** and the content of a requested token will be automatically added as a Bearer header in a Postman request. If the token is expired, then repeat the token obtaining request from the **Authorization** tab by clicking on **Get new Access Token**.
