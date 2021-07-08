---
title: "How the search service can support API keys"
subtitle: 
comments: false
weight: 85

---

> Released in [November 30, 2020 Release .Stat Suite JS 6.1.0](https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/#november-30-2020)

### Original use case
Some externally-available NSI services have an API Gateway on front that limits the rate at which users can call the services. It is possible to call the service with or without an API Key attached to the request. Requests with an API Key are throttled according to that key's usage plan. Requests without an API Key are considered to be all on the same plan, with a relatively low acceptable rate of calls. 

The SDMX Faceted Search calling the services in order to index them without an API Key could quickly reach the rate limit and fail. The ability to specify an API Key for the service to use was therefore required, or the ability for the SDMX Faceted Search service to avoid calling the endpoints that require an API key.

### Implemented solution
The feature is implemented to answer the use case is adding a new config. file named `datasources.json` and depending on the `env`, it will overrides the `datasources.json` from the configuration service, without being spread over network and with a lot of flexibility. In other words, it overrides datasources at the `sfs` level thus allowing using API keys while indexing. An example of overriden `datasource.json` file:

```json
{
  "staging:SIS-CC-stable": {
    "url": "http://nsi-stable-siscc.redpelicans.com/rest",
    "headers": {
      "X-API-KEY-ID": "staging:SIS-CC-stable"
    }
  },
  "dev:unstable": {
    "url": "http://localhost:9001/rest"
  }
}
```

In `dev` (**source-code** installation), add a local file in `/data` folder.  
In **Docker**, add the file in the `/data` folder which is mount.  
In **Kube**, add a config map from a file named `sfs-datasources` (will be automatically used).

**Notes:**
* If the sources do not exist in the original datasource, then nothing is done (allow using a single configmap for many overrides);
* All HTTP headers can be used, SDMX headers will override them in order to make `sfs` always work properly with an expected API;
* The entire datasources content can be redefined.
