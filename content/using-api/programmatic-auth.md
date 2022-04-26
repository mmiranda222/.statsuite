---
title: "Programmatic authentication"
subtitle: 
comments: false
weight: 9000
keywords: [
  'Scenarios for programmatic authentication', '#scenarios-for-programmatic-authentication',
  'Store and refresh a set of tokens', '#store-and-refresh-a-set-of-tokens',
  'Systematically get a new access token using stored credentials', 'systematically-get-a-new-access-token-using-stored-credentials',
  'Example implementation in R', '#example-implementation-in-r',
  'Example implementation in Python', '#example-implementation-in-python',
]
---

### Scenarios for programmatic authentication
Using the configured OpenID-Connect compatible identify provider service, e.g. Keycloak, it is possible to programmatically authenticate for getting access to .Stat Suite services from a user program, e.g. written with statistical software such as R or Python.

Indeed, all .Stat Suite services, when secured, will require that every call to them is accompanied by something called a JWT Bearer token (JWT standing for JSON Web Token), which we will often just refer to as a token. In the context of the .Stat Suite, tokens will contain information about the end-user, such as name, email and a selection of “groups”, and can be used by the .Stat Suite service to determine access rights.

In token-based authentication, there are 3 sorts of tokens with individual expiration times returned by the identity provider in response to a successful authentication request:
- id token (short lifetime): to cache user profile information and provide it to the user program
- **access token** (short lifetime): to allow a user program to access an API, 
- **refresh token** (longer lifetime): to get a new set of tokens without additional user interaction.

There are **2 different approaches** to get authenticated access to .Stat Suite components in unattended user programs, whether using a service account (recommended) or a user account:

#### Store and refresh a set of tokens
This requires manually retrieving a first set of valid tokens through one of these 2 means:
   
1) Using the authentication in the .Stat Data Explorer or the .Stat Data Lifecycle Manager in developer mode (F12) and exploring the network tab. This is not user-friendly because it needs some basic technical knowledge.

2) Using the .Stat Suite component [**OauthToken.exe**](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-token-console), which is an executable Windows console tool. It also allows the user interactively signing-in on a web browser page and returns the tokens in a more user-friendly way in its console output. It is possible, but not required, to call this tool from within the user program, however it will temporarily interrupt the user program, so that the user can enter the credentials.

Once the initial set of tokens is obtained and **stored in secure place** (e.g. environment variables, protected/masked pipeline variables) and as long as at least the refresh token is valid, the user program can use and refresh these tokens as follow:

- The user program sends the .Stat Suite service request with the *access token*
- If the *access token* is valid, then the .Stat Suite service executes the request
- Otherwise, if the *access token* is invalid (e.g. too old), then the user program tries to programmatically get a new set of tokens from the identity provider's authentication service using the *refresh token* (without user intervention)
  - If the refresh request passes (because the *refresh token* is still valid), then the user program stores the new set of tokens and re-sends the initial .Stat Suite service request with the new *access token*
  - Otherwise, if the refresh request fails, then the user needs to manually re-authenticate and update the stored set of tokens

Notes: 
- For more efficiency, the user program could also store and consider the expiration times of the tokens.
- To guarantee that the *refresh token* is not expired there could be a background task that regularly (with a period less than the token validity) obtains and stores a new *refresh token*.

#### Systematically get a new access token using stored credentials
It is also possible to use credentials (username/password), which are stored in and retrieved from a **secure place** (e.g. environment variables, protected/masked pipeline variables), in a specific secured (HTTPS) call to the identity provider's authentication service to systematically retrieve a new *access token* without user interaction.

Note that when using [Keycloak](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/authentication/keycloak-configuration/#configuring-a-client) as an identity provider, the direct retrieval of a token with username and password requires to enable ["Direct Access Grants" option](https://sis-cc.gitlab.io/dotstatsuite-documentation/images/keycloak-config08.png) in the Keycloak GUI. This option is disabled by default. 

The user program sends the .Stat Suite service request(s) with the newly retrieved *access token*.

---

### Example implementation in R
This [R code example](/dotstatsuite-documentation/StatSuite-auth-access-R-example.R) demonstrates the following:  
- how to call the OauthToken.exe console to authenticate and get an access token and a refresh token
- how to use the refresh token to get a new access token
- how to use the access token in a call of the SDMX (NSI) web service to get all dataflows from a .Stat Suite data space

### Example implementation in Python
This [Python script example](/dotstatsuite-documentation/StatSuite-auth-access-Python-example.py) demonstrates the following:  
- how to authenticate using pre-set credentials (username/password) and get an access token (remember that this needs HTTPS to send the whole request including the password)  
- how to use the access token in a call of the Transfer web service to upload data from an SDMX-CSV file into a .Stat Suite data space
- how to use the access token in a call of the Transfer service to check the outcome of the previous data upload request
