---
title: "Authentication"
subtitle: 
comments: false
weight: 82
keywords: [
'Generic OpenID Compliance', '#generic-openid-compliance',
'Optional authentication of DE', '#optional-authentication-of-de',
'OpenID connect Middleware for NSIWS', '#openid-connect-middleware-for-nsiws',
'Intro', '#intro',
'Setup', '#setup',
'Configuration', '#configuration',
'Configuration settings', '#configuration-settings',
]

---

#### Table of Content
- [Generic OpenID Compliance](#generic-openid-compliance)
- [Optional authentication of DE](#optional-authentication-of-de)
- [OpenID connect Middleware for NSIWS](#openid-connect-middleware-for-nsiws)
  - [Intro](#intro)
  - [Setup](#setup)
  - [Configuration](#configuration)
  - [Configuration settings](#configuration-settings)

---

> *Version history:*  
> New `authority_aliases` property in the `tenants.json` under oidc entry for any app since [January 11, 2023 Release .Stat Suite JS tachyon](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#january-11-2023)  
> OpenID compliance fully empowered since [December 14, 2021 Release .Stat Suite JS 11.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#december-14-2021)  
> Allow to force DE authentication since [October 5, 2021 Release .Stat Suite JS 10.0.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#october-5-2021)  
> Empower both anonymous and authenticated modes with [March 05, 2020 Release .Stat Suite JS 4.0.1](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#march-05-2020)  
> Make DE authentication optional with [November 30, 2020 Release .Stat Suite JS 6.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#november-30-2020)

### Generic OpenID Compliance
.Stat Suite is based on OpenID-Connect authentication. Any OpenID-Connect compliant identity provider can be used. The DevOps environment uses Keycloak for that purpose as well as an identity provider proxy for GitHub/GitLab.

example for a DLM scope in `tenants.json` :

```json
      "dlm": {
        "type": "dlm",
        "label": "dlm",
        "oidc": {
          "authority": "https://keycloak.siscc.org/auth/realms/OECD",
          "authority_aliases": [],
          "client_id": "app"
        }
```

example for DE scope in `tenants.json` :

```json
      "de": {
        "type": "de",
        "label": "de",
        "oidc": {
          "authority": "https://keycloak.siscc.org/auth/realms/OECD",
          "authority_aliases": [],
          "client_id": "app",
          "required": false
        }
```

**Notes:**
- The Data Explorer (DE) is working in both anonymous and authenticated modes (sends JWT token or nothing).
- The Data Lifecycle Manager (DLM) is working in authenticated mode (sends JWT token).
- The original SDMX web service (NSI) openid-connect auth configuration manual can be found [here](https://webgate.ec.europa.eu/CITnet/stash/projects/SDMXRI/repos/nsiws.net/browse/doc/openid-middleware.md). For convenience, the content has been replicated in this section.
- `authority_aliases` as optional to configure frame CSP when there is more than the authority endpoint (ADFS for instance)

---

### Optional authentication of DE
The Data Explorer can be configured to **whether support authentication or be fully public (anonymous mode)**. Authentication requires a Provider and an URL (of the authentication server).  
Today, the only tested and included provider to .Stat Suite is [Keycloak](https://www.keycloak.org/), but others can be added (OpenId compliant ones, and others can be tested too).

The authentication provider configuration is handled per tenant in `tenants.json` files in `config-data/configs` where each application, defined as `scopes`, can have a dedicated auth. configuration.

**example:**  
in `tenants.json`:

```json
      "de": {
        "type": "de",
        "label": "de",
        "oidc": {
          "authority": "https://keycloak.siscc.org/auth/realms/OECD",
          "client_id": "app",
          "required": false
        }
```

**Rules:**
- no `oidc` entry means **public (anonymous) DE**
- `oidc` entry & `required` to 'false' means that the DE has **both anonymous and authenticated** access (potentially public and private data)
- `oidc` entry & `required` to 'true' means that you are **required to login before using the DE** (as in DLM)

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

