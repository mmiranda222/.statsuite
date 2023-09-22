---
title: "Authentication"
subtitle: 
comments: false
weight: 82
keywords: [
'Generic OpenID Compliance', '#generic-openid-compliance',
'Authentication in the DE', '#authentication-in-the-de',
'Authentication in the DLM', '#authentication-in-the-dlm',
'Authentication in the CORE services', '#authentication-in-the-core-services',
'SDMX (NSI) web service', '#sdmx-nsi-web-service',
'Transfer web service', '#transfer-web-service',
'Authorisation Management web service', '#authorisation-management-web-service',
]

---
<!-- This page (or a sub-page or sub-section of this page) of the documentation is referenced as an external resource in the .Stat Academy:
* https://academy.siscc.org/configuring-and-customising/
Any change affecting its URL must be communicated to the .Stat Academy content admin in advance. -->

#### Table of Content
- [Generic OpenID Compliance](#generic-openid-compliance)
- [Authentication in the DE](#authentication-in-the-de)
- [Authentication in the DLM](#authentication-in-the-dlm)
- [Authentication in the CORE services](#authentication-in-the-core-services)
  - [SDMX (NSI) web service](#sdmx-nsi-web-service)
  - [Transfer web service](#transfer-web-service)
  - [Authorisation Management web service](#authorisation-management-web-service)

---

> *Version history:*  
> New `authority_aliases` property in the `tenants.json` under oidc entry for any app since [January 11, 2023 Release .Stat Suite JS tachyon](/dotstatsuite-documentation/changelog/#january-11-2023)  
> OpenID compliance fully empowered since [December 14, 2021 Release .Stat Suite JS 11.0.0](/dotstatsuite-documentation/changelog/#december-14-2021)  
> Allow to force DE authentication since [October 5, 2021 Release .Stat Suite JS 10.0.0](/dotstatsuite-documentation/changelog/#october-5-2021)  
> Empower both anonymous and authenticated modes with [March 05, 2020 Release .Stat Suite JS 4.0.1](dotstatsuite-documentation/changelog/#march-05-2020)  
> Make DE authentication optional with [November 30, 2020 Release .Stat Suite JS 6.1.0](/dotstatsuite-documentation/changelog/#november-30-2020)

### Generic OpenID Compliance
.Stat Suite is based on OpenID-Connect authentication. Any OpenID-Connect compliant identity provider can be used. The .Stat Suite DevSecOps environment uses the third party tool **Keycloak** for that purpose. In that context, this tool also serves as a proxy for the GitHub and GitLab identity providers. These providers must be accessible through a secured **HTTPS** connection.

For information about how to configure Keycloak as identity provider, see [here](/dotstatsuite-documentation/configurations/authentication/keycloak-configuration). 
For information about how to configure Keycloak as proxy to other identity providers, see [here](/dotstatsuite-documentation/configurations/authentication/third-party-providers).

---

### Authentication in the DE
The Data Explorer can be configured to **whether support authentication or be fully public (anonymous mode)**. Authentication is made through an external dentity provider, see [here](#generic-openid-compliance).  

The authentication is configured per tenant in the `tenants.json` file in the `config-data/configs` folder with the `oidc` object. Each application tenant, defined as `scopes`, can have a dedicated authentication configuration. **If `oidc` is not defined then the DE works without authentication (anonymous public access).**

| `oidc` setting    | description |
|------------|-------------|
| required | `true`: the user is required to login before using the DE <br/> `false`: both anonymous and authenticated access are permitted |
| authority | authority url of token issuer |
| authority_aliases | array of alternative urls in addition to the main authority url |
| client_id | client/application Id |

**Example:**  
in `tenants.json`:

```json
      "de": {
        "oidc": {
          "required": false,
          "authority": "https://keycloak.siscc.org/auth/realms/OECD",
          "authority_aliases": [],
          "client_id": "app"
        }
```

**Note** that, even if the DE is only accessible by authenticated users, the shared views generated from it will still be publicly accessible. It is thus possible to disable the share option: see [documentation](/dotstatsuite-documentation/configurations/de-configuration/#disabled-share-option).

---

### Authentication in the DLM
The Data Lifecycle Manager requires an authentication configuration. Authentication is made through an external dentity provider, see [here](#generic-openid-compliance).  

The authentication is configured per tenant in the `tenants.json` file in the `config-data/configs` folder with the `oidc` object. Each application tenant, defined as `scopes`, can have a dedicated authentication configuration.

| `oidc` setting    | description |
|------------|-------------|
| authority | authority url of token issuer |
| authority_aliases | array of alternative urls in addition to the main authority url |
| client_id | client/application Id |

**Example:**  
in `tenants.json`:

```json
      "dlm": {
        "oidc": {
          "authority": "https://keycloak.siscc.org/auth/realms/OECD",
          "authority_aliases": [],
          "client_id": "app"
        }
```

---

### Authentication in the CORE services

The .Stat Suite CORE services do actually not allow authenticating a user, but simply expect a [JWT](https://jwt.io/introduction) token obtained from a previous independent authentication. The token is to sent as a [Bearer header](https://en.wikipedia.org/wiki/JSON_Web_Token#Use). The CORE services validate that the token was issued by the expected Authority for the expected Client and that it is not expired. In use-case where an HTTP request has no token or the token is not valid, **401 Unauthorized** http code is returned.

Independently from the fact if the user is authenticated or not, the permissions defined with the Authorisation web service are being applied.

#### SDMX (NSI) web service

The complete documentation for the SDMX (NSI) web service openid-connect authentication configuration can be found [here](https://webgate.ec.europa.eu/CITnet/stash/projects/SDMXRI/repos/nsiws.net/browse/doc/openid-middleware.md) (mirrored [here](https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored/-/blob/master/doc/openid-middleware.md)). 

To enable OpenID middleware set **OpenIdMiddlewareBuilder** under `<appSettings>` in `middlewareImplementation` of the  [main configuration file](https://webgate.ec.europa.eu/CITnet/stash/projects/SDMXRI/repos/nsiws.net/browse/doc/CONFIGURATION.md#main-configuration-file). Please see the [PLUGINS](https://webgate.ec.europa.eu/CITnet/stash/projects/SDMXRI/repos/nsiws.net/browse/doc/PLUGINS.md) (mirrored [here](https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored/-/blob/master/doc/PLUGINS.md)) for more information regarding middleware configuration in the SDMX (NSI) web service.

**Example:**
e.g. in `app.config` in the `config` folder:

```xml
<add key="middlewareImplementation" value="OpenIdMiddlewareBuilder"/>
```

The authentication details are then configured in the `auth.json` file in the `config` folder with the `auth` object.

| `auth` setting    | Description |
|------------|-------------|
| enabled | Is openid authentication enabled|
| allowAnonymous | Is anonymous access allowed (request without JWT token)|
| authority | Authority url of token issuer |
| clientId | Client/application Id |
| requireHttps | Is HTTPS connection to OpenId authority server required |
| validateIssuer | Is iss (issuer) claim in JTW token should match configured authority |

**Example:**  
in `auth.json`:

```json
{
    "auth": {
        "enabled":true,
        "allowAnonymous": false,
        "authority": "https://keycloak.siscc.org/auth/realms/OECD",
        "clientId": "app",
        "requireHttps": true,
        "validateIssuer": true
    }
}
```

**Notes:**    
- Set `allowAnonymous=true` in case the SDMX (NSI) web service is configured to process the received JWT token and if the Data Explorer is configured to allow for anonymous access. 
- *(Since [release .NET 6.0.0](/dotstatsuite-documentation/changelog/#march-05-2021))*, the openid-connect authentication is enabled by default.
- When the openid-connect authentication is enabled, on data retrieval the permissions are checked if the user has a `data read` permissions even if request is anonymous.
- When the openid-connect authentication is disabled, all users (necessarily unauthenticated) can get all (even non-public) data.

#### Transfer web service

The complete documentation for the transfer web service openid-connect authentication configuration can be found [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer#auth-settings).  

The authentication is configured in the `dataspaces.private.json` file in the `config` folder with the `auth` object.

| `auth` setting    | Description |
|------------|-------------|
| enabled | Is openid authentication enabled
| authority | Authority url of token issuer
| clientId | Client/application Id
| requireHttps | Is HTTPS connection to OpenId authority server required
| validateIssuer | Is iss (issuer) claim in JWT token should match configured authority
| claimsMapping | Key/value mapping of a key used in the C# code to JWT token claim.
| authorizationUrl | Authorization url (used in swagger UI interface)
| tokenUrl | Token url (used in swagger UI interface), optional, if not defined will be constructed based on authorizationUrl
| scopes | Requested openId scopes (used as parameters for authorization url)

**Example:**  
in `dataspaces.private.json`:

```json
{
    "auth": {
        "enabled":true,
        "authority": "https://keycloak.siscc.org/auth/realms/OECD",
        "clientId": "app",
        "requireHttps": true,
        "validateIssuer": true,
        "claimsMapping": {
            "email": "email",
            "groups": "groups"
        },
        "authorizationUrl": "https://keycloak.siscc.org/auth/realms/OECD/protocol/openid-connect/auth",
        "tokenUrl": "https://keycloak.siscc.org/auth/realms/OECD/protocol/openid-connect/token",
        "scopes": [ "openid", "profile", "email" ]        
    }
}
```

**Note:** See the above linked transfer service documentation about **authorisation token claims mapping**. This is required in a scenario when the user's email address/groups not set as default claim keys in JWT token configuration contains a claims mapper.

#### Authorisation Management web service

The complete documentation for the authorisation management web service openid-connect authentication configuration can be found [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management/-/blob/develop/README.md?ref_type=heads#auth-settings).  

The authentication is configured in a `xxxxx.json` config file with the `auth` object.

| `auth` settingg    | Description |
|------------|-------------|
| enabled | Is openid authentication enabled
| authority | Authority url of token issuer
| clientId | Client/application Id
| requireHttps | Is HTTPS connection to OpenId authority server required
| validateIssuer | Is iss (issuer) claim in JWT token should match configured authority
| claimsMapping | Key/value mapping of a key used in the C# code to JWT token claim.
| authorizationUrl | Authorization url (used in swagger UI interface)
| tokenUrl | Token url (used in swagger UI interface), optional, if not defined will be constructed based on authorizationUrl
| scopes | Requested openId scopes (used as parameters for authorization url)

**Example:**  
in `xxxxx.json`:

```json
{
    "auth": {
        "enabled":true,
        "authority": "https://keycloak.siscc.org/auth/realms/OECD",
        "clientId": "app",
        "requireHttps": true,
        "validateIssuer": true,
        "claimsMapping": {
            "email": "email",
            "groups": "groups"
        },
        "authorizationUrl": "https://keycloak.siscc.org/auth/realms/OECD/protocol/openid-connect/auth",
        "tokenUrl": "https://keycloak.siscc.org/auth/realms/OECD/protocol/openid-connect/token",
        "scopes": [ "openid", "profile", "email" ]        
    }
}
```

**Note:** See the above linked authorisation management service documentation about **authorisation token claims mapping**. This is required in a scenario when the user's email address/groups not set as default claim keys in JWT token configuration contains a claims mapper.
