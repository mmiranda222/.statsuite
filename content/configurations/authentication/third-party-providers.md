---
Title: "Third-party Identity Providers in Keycloak"
subtitle: 
comments: false
weight: 84
keywords: [
  'Active Directory ADFS', '#active-directory-adfs',
  'Add attribute mappings', '#add-attribute-mappings',
  'GitLab', '#gitlab',
]
---

#### Table of Content
- [Active Directory ADFS](#active-directory-adfs)
  - [Add attribute mappings](#add-attribute-mappings)
- [GitLab](#gitlab)

---

### Active Directory ADFS
How to configure **ADFS** as a **SAML provider to Keycloak**

1. Add a new SAML provider

![Add new provider](/dotstatsuite-documentation/images/add-new-provider.png)

2. Start configuration by giving a unique **alias** to your realm for a provider

![Give alias](/dotstatsuite-documentation/images/give-alias.png)

3. Scroll to the bottom of the page & continue with "Import adfs (ldap) configuration" (through url or a file)

![Import LDP config](/dotstatsuite-documentation/images/import-ldp-config.png)

4. Once import is done, **Single Sign-ON Service URL** should be pre-filled. You can go on and fill in the rest of the fields like in the screenshot below:

![Configure saml in keycloak](/dotstatsuite-documentation/images/saml-config.png)

5. Once all fields are filled, save a form, proceed with the 'Export' tab and click on **download**. Import keycloak configuration on the ADFS side.  
Once this is done, the main configuration is complete and connection should function.

![Export keycloak config](/dotstatsuite-documentation/images/saml-config-export.png)

#### Add attribute mappings
The last step is to map claims coming from ADFS to Keycloak attributes. Go to **Mappers** tab and create mappings for **firstName** & **lastName** claims. Use built in **Attribute Importer** as a Mapper type.

![Attribute map](/dotstatsuite-documentation/images/attribute-maps.png)

|Name|Attribute Name|User Attribute Name
|--|--|--
|firstName|http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname|firstName
|lastName|http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname|lastName

---

### Gitlab
All steps to add GitLab identity provider with keycloak in order to connect to .Stat Suite applications using a GitLab account.

1. First, go to the **Identity Providers** left menu item and select **GitLab** from the **Add provider** drop-down list. This will bring you to the 'Add identity provider' page.

![Gitlab in keycloak](/dotstatsuite-documentation/images/config-keycloak-gitlab1.png)

2. You will have to get the **Client Id** and **Client Secret** from Gitlab, by using the redirect URI provided here.  
Default Scopes: by default, GitLab is configured to take **API** and **openid**, you can change to **read_user** and **open_id**.

![Gitlab in keycloak](/dotstatsuite-documentation/images/config-keycloak-gitlab2.png)

3. In GitLab, go to **Preferences** and then **Applications**.  
Paste the **redirect URI** provided by keycloak and make sure that **read_user** and **openId** scopes options are selected.

![Gitlab in keycloak](/dotstatsuite-documentation/images/config-keycloak-gitlab3.png)

4. Once you save your changes, you obtain an **Application ID** and **secret**. Copy those two respectively in **Client Id** and **Client Secret** in Keycloak and save.
