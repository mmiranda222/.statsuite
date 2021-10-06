---
title: "Authentication"
subtitle: 
comments: false
weight: 76
keywords: [
'Introduction', '#introduction',
'Optional authentication of DE', '#optional-authentication-of-de',
'How to allow the DE to be accessible only by authenticated users', '#how-to-allow-the-de-to-be-accessible-only-by-authenticated-users',
'OpenID connect Middleware for NSIWS', '#openid-connect-middleware-for-nsiws',
'Intro', '#intro',
'Setup', '#setup',
'Configuration', '#configuration',
'Configuration settings', '#configuration-settings',
]

---

#### Table of Content
- [Introduction](#introduction)
- [Optional authentication of DE](#optional-authentication-of-de)
- [How to allow the DE to be accessible only by authenticated users](#how-to-allow-the-de-to-be-accessible-only-by-authenticated-users)
- [OpenID connect Middleware for NSIWS](#openid-connect-middleware-for-nsiws)
  - [Intro](#intro)
  - [Setup](#setup)
  - [Configuration](#configuration)
  - [Configuration settings](#configuration-settings)

---

### Introduction
> Since the [March 05, 2020 Release .Stat Suite JS 4.0.1](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#march-05-2020), The Data Explorer now works in both anonymous and authenticated modes.  

.Stat Suite is based on openid-connect authentication. Any openid-connect compliant identity provider can be used. The DevOps environment uses Keycloak for that purposes as well as an identity provider proxy for GitHub/GitLab. [**here**](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/authentication/keycloak-configuration/) (Thanks [Ben](https://github.com/Kyelin25)!).

The Data Explorer (DE) is working in both anonymous and authenticated modes (sends JWT token or nothing). The Data Lifecycle Manager (DLM) is working in authenticated mode (sends JWT token). 

The original SDMX web service (NSI) openid-connect auth configuration manual can be found [here](https://webgate.ec.europa.eu/CITnet/stash/projects/SDMXRI/repos/nsiws.net/browse/doc/openid-middleware.md). For convenience, the content has been replicated in this section.

---

### Optional authentication of DE
> Released in [November 30, 2020 Release .Stat Suite JS 6.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#november-30-2020).  
**WARNING:** this release will not break you DE instance but it will make it public, if not the case before, thus action is required (add `AUTH_PROVIDER` to keycloak while restarting) to avoid this.

The Data Explorer is public by default, but it can be configured to support authentication. Authentication requires a provider and an url (of the authentication server).  
Today, the only tested and included provider to .Stat Suite is [Keycloak](https://www.keycloak.org/), but others can be added (OpenId compliant ones, and others can be tested).  
Using authentication is critical and is thus configured at server level through 2 env. variables: `AUTH_PROVIDER` and `AUTH_SERVER_URL`. The authentication provider configuration per tenant is in `tenants.json` files in `config-data/configs` where each application, defined as `scopes`, could have a dedicated configuration (ie realm & clientId for Keycloak).
 
When provided, the `env.` variable **`AUTH_PROVIDER`** in your deployment process can be set to 'keycloak' and returns the expected log in mechanism and feature.  
If **`AUTH_PROVIDER`** is not provided, DE is considered as 'public', and no request from the DE is made to any authentication provider. In addition, the 'Log in' feature in the DE header is not displayed.  
By default, `AUTH_PROVIDER` is not provided.

---

### How to allow the DE to be accessible only by authenticated users
> Released in [October 5, 2021 Release .Stat Suite JS 10.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#october-5-2021)  

It is possible to allow an instance of the Data Explorer to be accessible **only** by authenticated users.  
Considering an instance of the DE with a valid Authentication Provider as described above. In your `tenants.json`, if the `"keycloak"` (as an example of a valid auth. provider) entry has the parameter **`"required": true`**, then the DE is in a **strickly authentication mode**, meaning that any URL of this DE instance, when queried, will redirect first to the login page of the auth. provider for authentication (if not already authenticated).

Example:

```json
"keycloak": {
  "realm": "demo",
  "clientId": "stat-suite",
  "required": true
},
```

If `"required": false`, then the DE is accessible in the mode (public or public+authenticated) corresponding to your auth. provider configuration.  
If `"required": true` and the auth. provider is not valid, then the DE will return a meaningful error message.

**Note** that, even if the DE is only accessible by authenticated users, the shared views generated from it will still be publicly accessible. It is thus possible to disable the share option: see [documentation](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/de-configuration/#disabled-share-option).

---

### OpenID connect Middleware for NSIWS

> Please note that currently middleware implements only authentication, user authorization logic will be supported later.

#### Intro

Middleware can be used in scenarios where user is authenticated against 3-d party identity service, responsible for issue a [JWT](https://jwt.io/introduction) token which later is used with every request to NSIWS for user impersonation and enforcing local authorization rules.

Middleware requires HTTPS connection to keep token secure.

OpenId-connect middleware expects a [JWT](https://jwt.io/introduction) token sent as a [Bearer header](https://en.wikipedia.org/wiki/JSON_Web_Token#Use). Middleware validates that token is issued by expected Authority for expected Client and not expired.

In use-case where HTTP request has no token or it is not valid **401 Unauthorized** http code is returned

#### Setup

To enable OpenID middleware set **OpenIdMiddlewareBuilder** under `<appSettings>` in `middlewareImplementation` of the  [main configuration file](https://webgate.ec.europa.eu/CITnet/stash/projects/SDMXRI/repos/nsiws.net/browse/doc/CONFIGURATION.md#main-configuration-file).

Example:

```xml
<add key="middlewareImplementation" value="OpenIdMiddlewareBuilder"/>
```

Please see the [PLUGINS](https://webgate.ec.europa.eu/CITnet/stash/projects/SDMXRI/repos/nsiws.net/browse/doc/PLUGINS.md) for more information regarding middleware configuration in NSIWS.

#### Configuration

add auth.json file to a config directory with following contents:

```json
{
    "auth": {
        "enabled":true,
        "allowAnonymous": false,
        "authority": "AUTHORITY URL",
        "clientId": "VALUE",
        "requireHttps": true,
        "validateIssuer": true
    }
}
```

#### Configuration settings

| Setting    | Description |
|------------|-------------|
| enabled | Is openid authentication enabled|
| allowAnonymous | Is anonymous access allowed (request without JWT token)|
| authority | Authority url of token issuer |
| clientId | Client/application Id |
| requireHttps | Is HTTPS connection to OpenId authority server required |
| validateIssuer | Is iss (issuer) claim in JTW token should match configured authority |

-----------------------------------------------------------

Note that  
- If NSI is configured to process sent JWT token then it's essential to configure it to `allowAnonymous=true` for the DE to work. 
- *(since [release .NET 6.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#march-05-2021))*, NSI openid-connect authentication is turned ON by default. When the NSI openid-connect authentication is turned OFF, all users (necessarily unauthenticated) can get all (even non-public) data.
- With NSI openid-connect authentication turned ON, on data retrieval, there is a check if user has a Data read permission in authorization DB (managed through the authorization service) even if request is anonymous (using the .Stat Suite AuthorizationManagement web service, there must be appropriate (probably read) permissions defined for anonymous users).

**P.S.** If you setup your environment just for testing turning ON openid-connect, authentication is not a mandatory thing. DLM/DE will perfectly work with NSI without it. NSI will just ignore JWT token sent from DLM.

