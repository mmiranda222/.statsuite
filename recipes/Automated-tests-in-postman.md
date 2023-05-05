# How to create, run and monitor automated tests (Postman <> GitLab)

## Intro
This describes how to create, run, integrate, and monitor **integration tests** of the .Stat Suite .NET/SQL services, namely the transfer service, the nsiws, and the authorization service.

## Postman
Postman learning center: https://learning.postman.com/
### Workspace
A dedicated workspace called the **"Team workspace"** is created under the "sis-cc.postman.com" paid license, in order to manage all collections of tests. Team members are granted access to this workspace in Edit mode depending on their needs.

### Environments
**Environments** under the "Team workspace" are used to define common valVariables used across all collections os tests, e.g. credentials. Environments are scoped by DevOps instances:
- devops-qa
- devops-staging

The following variables are defined in each environment:

|Variable|Type|
|---|---|
| my_token | secret |
| refresh_token | secret |
| client_id | secret |
| grant_type | secret |
| postman_api_key_devops | secret |
| environmentId_devops | secret |
| base_url_transfer | default |
| base_url_nsiws_reset | default |
| base_url_nsiws_stable | default |
| my_token_up *(optional)* | default |
| refresh_token_up *(optional)* | default |
| my_token_expiry_time | default |
| dataspace_reset | default |
| dataspace_stable | default |

It is **crucial** to note that every test scenario must be created and defined such as it can be ran **as-is** with using both 'devops-qa' and 'devops-staging' environments.

### Collection
A **collection** corresponds to a set of test scenarios.  
A collection can have several sub-folders, each folder corresponding to a test scenario, in order to organize them and ease the readability.

The collection contains:
- The 'Overview' with reference to the API documentations
- The 'Autorization' method used across all requests in this collection
- The 'Pre-request Script' allowing to request for a new valid authentication token when the previous has expired

### Test scenario
A **test scenario**, identified as a sub-forlder of a collection, is defined with:
- The description of the test scenario
- The 'Authorization' type set as "Inherit auth from parent"
- An incremental list of requests replicating the tets scenario

Depending on the type and nature of the requests, it must always use the common Variables as defined in the 'Environments', e.g. {{base_url_transfer}}, {{base_url_nsiws_reset}}, or {{dataspace_reset}}, so that the test scenario will be valid when switching form one 'Environment' to the other.
