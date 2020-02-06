---
title: ".Stat authentication configuration"
subtitle: 
comments: false
weight: 74

---

.Stat Suite is based on openid-connect authentication. Any openid-connect compliant identity provider can be used. The DevOps environment uses Keycloak for that purposes as well as an identity provider proxy for GitHub/GitLab.

The Data Explorer (DE) is working in anonymous mode (doesn't send JWT token). 

The Data Lifecycle Manager (DLM) is working in authenticated mode (sends JWT token). 

The original SDMX web service (NSI) openid-connect auth configuration manual can be found [here](https://webgate.ec.europa.eu/CITnet/stash/projects/SDMXRI/repos/nsiws.net/browse/doc/openid-middleware.md). 

For convenience, the content has been replicated here:

-----------------------------------------------------------

### OpenID connect Middleware for NSIWS

> Please note that currently middleware implements only authentication, user authorization logic will be supported later.

##### Intro

Middleware can be used in scenarios where user is authenticated against 3-d party identity service, responsible for issue a [JWT](https://jwt.io/introduction) token which later is used with every request to NSIWS for user impersonation and enforcing local authorization rules.

Middleware requires HTTPS connection to keep token secure.

OpenId-connect middleware expects a [JWT](https://jwt.io/introduction) token sent as a [Bearer header](https://en.wikipedia.org/wiki/JSON_Web_Token#Use). Middleware validates that token is issued by expected Authority for expected Client and not expired.

In use-case where HTTP request has no token or it is not valid **401 Unauthorized** http code is returned

##### Setup

To enable OpenID middleware set **OpenIdMiddlewareBuilder** under `<appSettings>` in `middlewareImplementation` of the  [main configuration file](CONFIGURATION.md#main-configuration-file)

Example:

```xml
<add key="middlewareImplementation" value="OpenIdMiddlewareBuilder"/>
```

Please see the [PLUGINS](PLUGINS.md) for more information regarding middleware configuration in NSIWS

##### Configuration

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

##### Configuration settings

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

- if NSI is configured to process sent JWT token then it's essential to configure it to `allowAnonymous=true` for the DE to work. 
- with NSI openid-connect authentication turned ON structure upload/retrieval remain anonymous (we just haven't implemented the authorization for it yet)
- with NSI openid-connect authentication turned ON, on data retrieval, there is a check if user has a Data read permission in authorization DB (managed through the authorization service) even if request is anonymous (using the .Stat Suite AuthorizationManagement web service, there must be appropriate (probably read) permissions defined for anonymous users)

P.S. If you setup your environment just for testing turning ON openid-connect authentication is not a mandatory thing. DLM/DE will perfectly work with NSI without it. NSI will just ignore JWT token sent from DLM.
