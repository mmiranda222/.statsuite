# How to setup dev env
1. go to your local dotstatsuite-config and run `yarn init:data`
2. the current collection name in solr in the devops env (qa): **oecd**  
   rename the tenant id to: **oecd** (previously named default)  
   *tenant id and collection are mapped together*
3. paste **tenants.dev.json** content into your local tenants.json
4. replace in tenants.json dev by oecd
5. add `DEFAULT_TENANT="oecd:de"` in your local .env (to avoid query param usage)

## Authentification
- keycloak: **https://keycloak.siscc.org**
- reserved ports for localhost: [7000-7003]
