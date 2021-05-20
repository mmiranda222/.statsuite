---
title: "Keycloak configuration"
subtitle: 
comments: false
weight: 78

---

#### Table of Content
- [Disclaimer](#disclaimer)
- [Introduction](#introduction)
- [Installing Keycloak](#installing-keycloak)
- [Configuring Keycloak](#configuring-keycloak)
  - [Creating a Realm](#creating-a-realm)
  - [Configuring the Realm](#configuring-the-realm)
  - [Creating a Client Scopes](#creating-a-client-Scopes)
  - [Creating a Client](#creating-a-client)
  - [Configuring a Client](#configuring-a-client)
  - [Creating a User](#creating-a-user)
  - [Making the User an Administrator](#making-the-user-an-administrator)
  - [Making .Stat use your Keycloak](#making-stat-use-your-keycloak)

---

### Disclaimer

The purpose of this tutorial, which is originally a contribution from [Ben](https://github.com/Kyelin25/dotstat-tutorials/blob/master/KeycloakConfiguration/KeycloakConfiguration.md), is to help do the minimum configuration to get a Keycloak server ready to work with the .Stat Suite products. It is not a guide on how to set it up securely, use for that the related installation documentation sections or advice from your organization's IT security team.

---

### Introduction

The purpose of this tutorial is to describe how to set up a Keycloak server to work with the .Stat .NET and JavaScript services. Obviously this means that in order to test this is all working, you'll need to have at least some of those services installed. Doing so is beyond the scope of this tutorial, but is described in the pages both [from source](https://sis-cc.gitlab.io/dotstatsuite-documentation/install-source-code/) and [from containers](https://sis-cc.gitlab.io/dotstatsuite-documentation/install-docker/). We are here working with a single instance of the NSI web service, the [Data Lifecycle Manager](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager), the [JavaScript config service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config) and the built-in proxy that comes with the Data Lifecycle Manager.

---

### Installing Keycloak

The actual installation of the Keycloak server is beyond the scope of this tutorial, but we will give here a few pointers. First up, there are some instructions [on the SIS-CC documentation page](https://sis-cc.gitlab.io/dotstatsuite-documentation/install-source-code/monotenant-install-js-as-windows-services/#keycloak) describing how to install it as a Windows service. Also, the [official Keycloak documentation](https://www.keycloak.org/docs/12.0/server_installation/#_standalone-mode) is great, if a little intimidating (due to the sheer number of options). For reference, we are running it locally in standalone-mode, which is almost certainly what you need to do too.

Finally, and this is important: use Keycloak 12.0.4! The .Stat JavaScript services are written to work with this version, not the latest.

```
Use Keycloak 12.0.4
```

---

### Configuring Keycloak

When you first open up the Keycloak administrative console (for instance located at http://127.0.0.1:8080/auth/admin because we're running it locally, but yours may vary), you'll be confronted with a page very similar to this:

![KeycloakFirstLogin](/dotstatsuite-documentation/images/keycloak-config01.png)

This is the "master" realm. The "one realm to rule them all". A "realm" in Keycloak manages a set of users, credentials, roles and groups. This means that a user in one realm cannot log into another, and is very useful for separating groups of applications. For instance, you could use one single Keycloak server for all your environments (DEV, QA, PROD etc.) by having a different realm for each one.

#### Creating a Realm

Now, it is [not recommended](https://www.keycloak.org/docs/latest/server_admin/#the-master-realm) to use the master realm to manage access to applications, so we are going to have to create a new realm. Luckily, that is very easy. Simply mouse-over the "Master" dropdown in the top left-hand of the page, and select the "Add realm" button.

![AddRealmButton](/dotstatsuite-documentation/images/keycloak-config02.png)

This will take you to the following screen, where you can either import some JSON defining your realm, or simply give it a name and create it. For our purposes, you can name it whatever you want, but it should be meaningful. In the above example of using a different realm for each environment, you might name them DotStat-DEV, DotStat-QA and DotStat-PROD. Because we're developing locally, we're calling ours DotStat-Local. Obviously, leave the Enabled toggle set to "ON", otherwise you won't be able to use the realm.

![AddRealmForm](/dotstatsuite-documentation/images/keycloak-config03.png)

Once we hit "Create", we are catapulted into the realm itself, and we can start configuring it.

![DotStatLocalRealm](/dotstatsuite-documentation/images/keycloak-config04.png)

#### Configuring the Realm

Before we even start talking about clients and users, there is a lot of configuration you can do with the realm. Most of these are not strictly speaking necessary for working with the .Stat Suite, so we are going to gloss over them, but you may like to check out the Email tab (necessary if you want Keycloak to verify email addresses or reset passwords... essentially if you're not simply using it as a go-between for some other identity provider).

The only setting we are going to draw particular attention to is "Require SSL" on the Login tab.

![RequireSSL](/dotstatsuite-documentation/images/keycloak-config05.png)

This setting controls under what circumstances attempts to log into (or any attempt to retrieve tokens) Keycloak must be made using a HTTPS connection. Ours is set on "external requests", which means as long as the request is being made from the same host as Keycloak, it's okay to make it over insecure HTTP. This suits us, because we cannot be bothered setting up SSL. If your Keycloak is hosted on a different server to where the requests will be coming from, you are faced with two choices:

1. Set up SSL for your servers
2. Set the setting to "none"

Number 2 is a fine option if you are just playing around in a sandpit environment. However, under no circumstances should this **ever** be set to "none" in production. Keycloak is used by .Stat to provide OpenID and OAuth2 tokens. Both of these protocols **require** SSL to be secure.

#### Creating a Client Scopes

##### Aside: Client Scopes
Client scopes are entities in Keycloak, which are configured at the realm level and they can be linked to clients. The client scopes are referenced by their name when a request is sent to the Keycloak authorization endpoint with a corresponding value of the scope parameter.

If you have many applications you need to secure and register within your organization, it can become tedious to configure the protocol mappers and role scope mappings for each of these clients.

Client scopes also provide support for the OAuth 2 scope parameter, which allows a client application to request more or fewer claims or roles in the access token, according to the application needs.

#### Back to Creating a Client Scopes

To create a client scope, follow these steps:

 - Go to the Client Scopes left menu item. This initial screen shows you a list of currently defined client scopes.  

 - Click the Create button.

![CreateClientScope](/dotstatsuite-documentation/images/keycloak-config-client-scope-01.png)
 - Name the client scope and save. A client scope will have similar tabs to a regular clients. You can define protocol mappers and role scope mappings, which can be inherited by other clients, and which are configured to inherit from this client scope.  

![AddClientScope](/dotstatsuite-documentation/images/keycloak-config-client-scope-02.png)
- Click the Create button.  

![CreateMapper](/dotstatsuite-documentation/images/keycloak-config-client-scope-03.png)

- Fill thoses field by those following params:  

![CreateProtocoleMapper](/dotstatsuite-documentation/images/keycloak-config-client-scope-04.png)

When the Groups client scope is linked to a client, that client automatically inherits all the protocol mappers defined in the Groups client scope. Access tokens issued for this client will contain the information about the user.

#### Creating a Client

We can see in your eyes the same confusion that was ours when we first encountered clients. "But I want to register an application?!" should you cry... However, client is one of the four "roles" (don't confuse this with roles in Keycloak) defined in the OAuth2 standard. It is an application making protected resource requests on behalf of the resource owner (in our case that's you, the end user of .Stat).

##### Aside: Tokens

As an aside, before we get stuck into the setup, let's briefly explore what it means for a .Stat application to "make protected resource requests on behalf of the resource owner". In the .Stat framework, the OpenID and OAuth2 (OpenID is an extension of OAuth2) protocols are used to secure access to "resources". A resource in .Stat could be an instance of the NSI web service, or a specific dataflow within that service. Other services such as the [Transfer service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer) and [Authorization Management service](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-auth-management) also represent and contain resources.

All of these services, when secured, will require that every call to them is accompanied by something called a JWT Bearer token (JWT standing for JSON Web Token), which we will often just refer to as a token. In the context of .Stat, this token will contain information about the end-user, including potentially their name, definitely their email, and a selection of "groups", which can be used by .Stat to determine access rights. If somebody has your token, to .Stat, they **are** you, or at least, they can do everything you can do (this is why performing these protocols not over SSL is a recipe for disaster).

It's Keycloak's job to hand out these tokens, and prior to doing so, confirm that the requester of the token is in fact who they claim to be.

##### Back to Creating a Client

As the simplest setup for Keycloak, we are going to create one single client to represent all the applications in .Stat that will either need to check somebody is who they say they are, make requests on behalf of somebody, or check that whoever made a request has a token saying that they are allowed to do what they are trying to do.

Luckily, creating a client is super easy. Click on the Clients button in the Configure menu, which will bring up a view of all currently-existing clients. You will notice that there are already a bunch of them, probably the same ones we have below.

![ClientsList](/dotstatsuite-documentation/images/keycloak-config06.png)

Now, we simply hit the "Create" button and get taken to the Add Client screen (seen below). Here, much like the "Add Realm" screen, we have the option to import some JSON that defines our client, or fill in some starting details.

The client **must** have a "Client ID", as this is the unique (within the realm) identifier that applications will use when requesting or verifying tokens. We have chosen "DotStat-Applications", because it's for .Stat, and it's all applications. We also need to pick a Client Protocol, and we may provide a Root URL. The Client Protocol is what kind of token the applications are expecting to receive. Our options are openid-connect and saml. Obviously, because .Stat is set up to use OpenID and OAuth2, we will be using openid-connect. The Root URL is not strictly-speaking necessary, but it will make our lives a little easier by configuring some other settings for us. This should be the root URL of whatever application will be "logging you in". For us, that's the DLM, and our DLM is hosted at "http://localhost:7000". If you have multiple applications (let's say you are trying to get both DLM and Data Explorer to work), don't panic. Just pick one and use it for Root URL. We will explain in a second why it's not too important.

![CreateNewClient](/dotstatsuite-documentation/images/keycloak-config07.png)

Hit "Save", and Keycloak will create the client, and dump us into its Settings page, where we can immediately become disoriented with the sheer volume of options. Luckily, because we are just trying to get things working, not secured, there is relatively little we have to change.

![ClientSettings](/dotstatsuite-documentation/images/keycloak-config08.png)

#### Configuring a Client

As we saw at the end of the last section, there are a **lot** of configuration settings for a new client. And that's even before going to the other tabs, or expanding any of the twisties! Luckily, if our aim is literally just to get things working and not securely (which it is), the client just needs three things (one of which is already done by default):

1. The client must have Access Type "public"
2. The client must have our application's root url followed by asterisk (eg http://localhost:7000/*) in the Valid Redirect URIs
3. The client must have our application's root url in the Web Origins list.

We know what you're thinking: "Hey, all that is already done for you in the screenshot you posted!" Yup, that's why it was worth setting the Root URL when we created the client ;) . Keycloak took that Root URL and generated sensible values for a bunch of settings, including Valid Redirect URIs and Web Origins. It's also used if you provide relative URLs for any of these settings, to convert them to an absolute URL. So, with the Root URL of http://localhost:7000, a Valid Redirect URI of /* would become http://localhost:7000/*.

Now, we promised that this would still be okay if you had multiple applications (let's say both DLM and Data Explorer), with different URLs (let's say DLM is hosted on http://localhost:7000 and Data Explorer on http://localhost:7005, or even on completely different servers!), and it will be okay! Because Valid Redirect URIs and Web Origins are lists, just add all required URLs. Below is a snapshot for if we were using both DLM and Data Explorer as described here.

![MultipleApplications](/dotstatsuite-documentation/images/keycloak-config09.png)

##### Aside: Access Type - public

The reason that we need our Access Type to be public, is because doing so lets applications use the client (like DLM asking it to log in a user) without providing a client secret. Client secrets are an extra layer of security to ensure that the application asking for a token (because the token goes to the application remember, not the end-user) are actually allowed to.

This client secret becomes a bit of an issue though when your application is entirely in the browser, like DLM and Data Explorer. Obviously you cannot put the client secret in the browser... You may as well just print it on the screen at that point. So, when the application you are using Keycloak with is one of the browser-side .Stat applications, you need Access Type set to public.

##### Aside: Valid Redirect URIs

The list of Valid Redirect URIs is another security layer Keycloak employs, for a number of reasons. Generally it is pretty bad form to allow arbitrary redirects (users getting redirected to malicious sites), but also the way that oidc-connect clients work involve passing information of varying sensitivity through redirects. The .Stat JavaScript browser applications all use something called the Authorization Code Flow to get its tokens from Keycloak. Boiling this down a **lot** (as in to the point that it's meaningless for understanding the protocol), once you log in via Keycloak, the browser application won't actually get a token; it will get an "authorization code" that it can exchange for a token or tokens (which not only prove who you are to say DLM, but also let it make calls on your behalf to other applications). Because .Stat requires "public" clients (see the previous aside for why), if this authorization code gets into somebody else's hands, they can use it to retrieve a token and impersonate you. One way this could happen is a malicious application sends a user to Keycloak, with themselves as the Redirect URI, so once they login, the malicious application gets the code. This can be mitigated by Keycloak checking the Redirect URI against a list of valid ones (which it does!).

So finally, that's why your application's root URL and star will need to be in that list, otherwise when the application tries to log you in using Keycloak, Keycloak won't let it.

##### Aside: Web Origins

This setting is all about [Cross-Origin Resource Sharing (CORS)](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS). CORS is great, but also very frustrating. Again, boiling this down to almost the point of inaccuracy, part of the dance the .Stat browser applications do with Keycloak to obtain their tokens involves them making a POST call to an endpoint on Keycloak, to exchange the authorization code they get from asking Keycloak to log you in for a token, which is what they **really** want. Because Keycloak is not hosted at the same origin (the port is included in determining whether an origin is the same) as the browser applications, the request needs to use CORS. So, Keycloak lets you provide a list of origins that are allowed to send requests. If your application's root url is not in that list, when it tries to exchange the code for a token, the call will be disallowed by the browser.

##### Back to Configuring a Client

![NewMapperPage](/dotstatsuite-documentation/images/keycloak-config10-00.png)

 - select "groups" and add it to Assigned Default Client Scopes.  

![client-scopes](/dotstatsuite-documentation/images/keycloak-config10-01.png)

#### Creating a User

Now, you could potentially be using Keycloak as an "Identity Broker", which is how we are using it in our [tenanted DevOps deployment](https://sis-cc.gitlab.io/dotstatsuite-documentation/getting-started/devops/). When logging in, users are given the option to use other identity providers like Github, or Google, or Facebook or whoever, as opposed to typing in a username and password.

We are not going to do that, so we are going to create a user manually, so we can actually verify this is working. First up, go to the Users button in the Manage menu, and you will be treated to a Users lookup page. Don't be fooled if this is empty even if you have users... you actually have the search, or hit "View all users" to see them. 

![UsersPage](/dotstatsuite-documentation/images/keycloak-config11.png)

Now, click "Add user". This will take us to the "Add user" page, where we can create our own identity. Keycloak requires only that we provide a Username, but if you want to use it with .Stat you will need an Email too (this is what .Stat uses as the user id), and you may as well give yourself a first and last name. Make sure the user is enabled, and (because we never set up Keycloak to be able to email), set the Email Verified to "On".

![CreateUserPage](/dotstatsuite-documentation/images/keycloak-config12.png)

Hit "Save".

![DotStatUserPage](/dotstatsuite-documentation/images/keycloak-config13.png)

Fantastic! Now let's give our new user a password by going to the Credentials tab, entering a new password and unchecking Temporary. Hit "Reset Password".

![DotStatUserPassword](/dotstatsuite-documentation/images/keycloak-config14.png)

#### Making the User an Administrator

In order for us to really begin using .Stat, we need to have a user that .Stat considers to be an administrator. The permissions a user has are controlled via rules in the [Authorization Management Service](https://sis-cc.gitlab.io/dotstatsuite-documentation/using-dlm/manage-user-access/). When you first start up .Stat, there will be two rules. The first states that any user with the email "admin" is an administrator, and the second that any user with the group "admins" is an administrator. We will be creating a Keycloak Group called "admins" and adding our user to it.

To create the group, we click on the Groups link in the left-hand navigation menu. From there we simply click "new", which lets us create a new group, called "admins".

![CreateAdminsGroup](/dotstatsuite-documentation/images/keycloak-config15.png)

Once we have done this, we can navigate back to the user, click on their "Groups" tab, and add them to the "admins" group. Now, when a token is issued for the user, it should contain the claim "groups" with the string "admins" in there, which will let .Stat know that they are an administrator.

#### Making .Stat use your Keycloak

Okay, we're almost there. Keycloak is set up just the way we like it, but our .Stat applications aren't ready to use it. Luckily, that's not too hard. We will run through them one by one in short order here.

##### The JavaScript browser applications

All of these will need two changes made, in two places.

First up, when starting them up, set the environment variable AUTH_SERVER_URL to the base url for your Keycloak server. For us, that's http://localhost:8080.

Secondly, you'll need to tell them what realm and client to use. This is done in the [tenants.json](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config/blob/develop/data/prod/configs/tenants.json) file in your config server. If you are going with the [mono-tenant deployment](https://sis-cc.gitlab.io/dotstatsuite-documentation/install-source-code/monotenant-install-from-artifacts/) and hence don't have a proxy service, you will need to update the "default" tenant. Otherwise you should know which tenant you are using, and update that one. You need to update the "keycloak" property to account for whatever you called your realm and client. In our example we called our realm "DotStat-Local" and our client "DotStat-Applications". So we'd have:

```javascript
"keycloak": { "realm": "DotStat-Local", "clientId": "DotStat-Applications" }
```
