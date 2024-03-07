[[_TOC_]]

---

## How to create, run and monitor automated tests (Postman <> GitLab)

### Intro
This describes how to create, run, integrate, and monitor **integration tests** of the .Stat Suite .NET/SQL services, namely the transfer service, the nsiws, and the authorization service.

### Postman
Postman learning center: https://learning.postman.com/
#### Workspace
A dedicated workspace called the **"Team workspace"** is created under the "sis-cc.postman.com" paid license, in order to manage all collections of tests. Team members are granted access to this workspace in Edit mode depending on their needs.

#### Environments
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

#### Collection
A **collection** corresponds to a set of test scenarios.  
A collection can have several sub-folders, each folder corresponding to a test scenario, in order to organize them and ease the readability.

The collection contains:
- The 'Overview' with reference to the API documentations
- The 'Autorization' method used across all requests in this collection
- The 'Pre-request Script' allowing to request for a new valid authentication token when the previous has expired

#### Test scenario
A **test scenario**, identified as a sub-forlder of a collection, is defined with:
- The description of the test scenario
- The 'Authorization' type set as "Inherit auth from parent"
- An incremental list of requests replicating the tets scenario

Depending on the type and nature of the requests, it must always use the common Variables as defined in the 'Environments', e.g. {{base_url_transfer}}, {{base_url_nsiws_reset}}, or {{dataspace_reset}}, so that the test scenario will be valid when switching form one 'Environment' to the other.

#### Test scripts
Scripts in JavaScript are used at different levels of the test collections for:
- Requiring token authentication
- Compare content query responses with an expected initial content in various formats for data and structure queries
- Test specific features such as "Time Machine" features

##### Token authentication (Keycloak)  
- script defined in the "Collection" under "Pre-request Script"
- Requires environment variables `keycloak.token_url`, `keycloak.client_id`, `keycloak.token`, `keycloak.refresh_token`

```javascript
var chai = require('chai');
chai.config.truncateThreshold = 0;

var token_url = pm.environment.get("keycloak.token_url");
var client_id = pm.environment.get("keycloak.client_id");
var token = pm.environment.get("keycloak.token");
var refresh_token = pm.environment.get("keycloak.refresh_token");

if(!token_url && !client_id)
    throw new Error("No keycloak token_url or client_id is defined");

var now = new Date();
var expiryTime = 
    !!pm.environment.get("keycloak.token_expiry_time")
    ? Date.parse(pm.environment.get("keycloak.token_expiry_time"))
    : now;
var difference = Math.floor((now - expiryTime) / 1000);

// token defined and expiration more then 30 sec in the future
if(token && difference < -30)
    return;

var token_request_body = [
    { key: "client_id", value: client_id}
];

// no token and refresh_token
if(!token && !refresh_token)
{
    var username = pm.environment.get("keycloak.username");
    var password = pm.environment.get("keycloak.password");

    if(!username && !password)
        throw new Error("No keycloak username or password defined");

    console.log("Authenticating with username & password");
    token_request_body.push({key:"grant_type", value: "password"});
    token_request_body.push({key:"scope", value: "openid"});
    token_request_body.push({key:"username", value: username});
    token_request_body.push({key:"password", value: password});
}
// refresh a token
else  
{ 
    console.log("Old token expired, requesting new one...");
    token_request_body.push({key:"grant_type", value: "refresh_token"});
    token_request_body.push({key:"refresh_token", value: refresh_token});
}

pm.sendRequest({
        url: token_url,
        method: "POST",
        header: {
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: {
            mode: "urlencoded",
            urlencoded: token_request_body
        }
    }, 
    (error, response) => {
        if (error) 
        {
            throw new Error("Error retrieving a token");
        } 
        else if (response) 
        {
            setTokenVars(response.json());
        }
});

function setTokenVars(tokenObj)
{
    pm.environment.set("keycloak.token", tokenObj.access_token);
    pm.environment.set("keycloak.refresh_token", tokenObj.refresh_token);
    pm.environment.set("keycloak.token_expiry_time", new Date().addSeconds(tokenObj.expires_in));
}
```

##### Compare data query results (CSV, JSON, XML)
- script defined in the "Collection" under "Pre-request Script"

```javascript
var chai = require('chai');
chai.config.truncateThreshold = 0;

utils = {
sdmxCsvEqualityCheck:function(expected, content){
      expected = expected.trim().split('\r\n').sort().join('|');
      content = content.trim().split('\r\n').sort().join('|');
      pm.expect(expected).to.equal(content);
  },
  sdmxXmlEqualityCheck:function(expected, content){
    var expectedJson = xml2Json(expected)['message:GenericData']['message:DataSet'];
    var responseJson = xml2Json(content)['message:GenericData']['message:DataSet'];   
    // df attr check
    var expectedDfArr = this.mapXmlValues(expectedJson['generic:Attributes']);
    var contentDfArr = this.mapXmlValues(responseJson['generic:Attributes']);
    pm.expect(expectedDfArr).to.deep.equal(contentDfArr);
    // obs array check
    var expectedObsArr = this.serializeXmlObs(expectedJson);
    var contentObsArr = this.serializeXmlObs(responseJson);
    pm.expect(expectedObsArr).to.deep.equal(contentObsArr);
  },
  serializeXmlObs: function(obj)
  {
    var obs = obj['generic:Obs'];
    if(obs == undefined) return null;
    obs = Array.isArray(obs) ? obs : [obs];
    return obs.map(x=>{
        var dimMap = this.mapXmlValues(x['generic:ObsKey']);
        var attrMap = this.mapXmlValues(x['generic:Attributes']);
        return dimMap.concat(attrMap).join(',');
    })
    .sort();
  },
  mapXmlValues:function(arr)
  {      
    if(arr == undefined) return [];
    arr = arr['generic:Value'];
    if(arr == undefined) return [];
    arr = Array.isArray(arr) ? arr : [arr];
    return arr.map(v=>v['$']['id'] + ':' + v['$']['value']);
  },
  sdmxJsonEqualityCheck:function(expected, content){
    expected = this.serializeJsonObs(expected);
    content = this.serializeJsonObs(content);
    pm.expect(expected).to.equal(content);
  },
  serializeJsonObs:function(obj)
  {
    var structure = obj.data.structures[0];
    var data = obj.data.dataSets[0];
    var dims = [];
    var resultArr = [];

    if(structure.dimensions.series && structure.dimensions.series.length > 0)
        dims = dims.concat(structure.dimensions.series);

    if(structure.dimensions.observation && structure.dimensions.observation.length > 0)
        dims = dims.concat(structure.dimensions.observation);

    if(data.observations)
    {
        var obsAttrs = structure.attributes.observation;

        Object.keys(data.observations).forEach(coordinate => {
            var row = [];
            coordinate.split(':').forEach((v,i)=>{
                var valIndex = parseInt(v);
                var dimIndex = parseInt(i);
                row.push(dims[dimIndex].id + ':' + dims[dimIndex].values[valIndex].id);
            });
            data.observations[coordinate].forEach((v,i)=>{
                var key = i == 0 ? 'OBS_VALUE' : obsAttrs[i - 1].id;
                var value = i == 0 
                    ? v 
                    : Number.isInteger(v) ? obsAttrs[i - 1].values[parseInt(v)].value : v;

                row.push(key + ':' + (value == null ? '' : value));
            });
            resultArr.push(row.join(','));
        });
    }

    if(data.attributes && data.attributes.length > 0)
    {
        var row = [];
        data.attributes.forEach((v,i)=>{
            var attrObj = structure.attributes.dataSet[i];
            var key = attrObj.id;
            var value = Number.isInteger(v) ? attrObj.values[parseInt(v)].value : v;
            row.push(key + ':' + (value == null ? '' : value));
        });
        resultArr.push(row.join(','));
    }

    if(data.dimensionGroupAttributes)
    {
        var groupAttrs = structure.attributes.dimensionGroup;
        var groupAttrsCount = groupAttrs.length;

        Object.keys(data.dimensionGroupAttributes).forEach(coordinate => {
            var row = [];
            coordinate.split(':').forEach((v,i)=>{
                var valIndex = parseInt(v);
                var dimIndex = parseInt(i);
                row.push(dims[dimIndex].id + ':' + (isNaN(valIndex) ? v : dims[dimIndex].values[valIndex].id));
            });
            data.dimensionGroupAttributes[coordinate].forEach((v,i)=>{               
                var valIndex = parseInt(v);
                var key = i < groupAttrsCount 
                    ? groupAttrs[i].id 
                    : '';
                var value = isNaN(valIndex)
                    ? v 
                    : i < groupAttrsCount 
                        ? JSON.stringify(groupAttrs[i].values[valIndex].value) 
                        : structure.annotations[valIndex].type;

                row.push(key + ':' + (value == null ? '' : value));
            });
            resultArr.push(row.join(','));
        });
    }

    return resultArr.sort().join('|');
  }
}
```

- Script for **CSV format** defined in the data query under "Tests"

```javascript
const CSVtoCompare = ' /* add all csv lines joined and separated with \r\n */ ';
pm.test("CSV body is correct", function () {
    postman.setNextRequest('');
    utils.sdmxCsvEqualityCheck(CSVtoCompare, responseBody);
    postman.setNextRequest();
})
```

- Script for **JSON format** defined in the data query under "Tests"

```javascript
const JSONtoCompare = ' /* add Json expected content here */ ';
pm.test("JSON body is correct", function () {
  postman.setNextRequest('');
  utils.sdmxJsonEqualityCheck(JSONtoCompare, pm.response.json());
  postman.setNextRequest();
})
```

- Script for **XML format** defined in the data query under "Tests"

```javascript
const XMLtoCompare = ' /* add all Xml content as joined lines */ ';
pm.test("XML body is correct", function () {
   postman.setNextRequest('');
   utils.sdmxXmlEqualityCheck(XMLtoCompare, responseBody);
   postman.setNextRequest();
});
```

##### Compare structure query results (XML)
- Comparing **Content Constraint** result: script defined in the "Collection" under "Pre-request Script"
```javascript
var chai = require('chai');
chai.config.truncateThreshold = 0;

utils = {
  sdmxXmlStructureEqualityCheck(expected, content){
    var expectedJson = this.sdmxXmlStructureCleanup(xml2Json(expected));
    var responseJson = this.sdmxXmlStructureCleanup(xml2Json(content));
    pm.expect(expectedJson).to.deep.equal(responseJson);
  },
  sdmxXmlStructureCleanup(obj)
  {
    var structures = obj['message:Structure']['message:Structures'];
    if(structures['structure:Constraints']!=undefined)
    {
        var constraints = structures['structure:Constraints']['structure:ContentConstraint'];
        if(!Array.isArray(constraints))
        {
            delete constraints['$']['validFrom'];
        }
    }
    return structures;
  }
}
```

- Script for **Structure XML format** defined in the structure query under "Tests"

```javascript
const XMLtoCompare = ' /* add all Xml content as joined lines */ ';

pm.test("XML body is correct", function () {
   postman.setNextRequest('');
   utils.sdmxXmlStructureEqualityCheck(XMLtoCompare, responseBody);
   postman.setNextRequest();
})
```

##### Time Machine feature with updatedAfter parameter
- Requires environment variables `justBeforeUpdate`, `afterUpdateForTransfer`, `afterUpdate`
- Script defined in the "Collection" under "Pre-request Script"

```javascript
var chai = require('chai');
chai.config.truncateThreshold = 0;

 const moment = require('moment');
 let requestTime = moment().format('YYYY-MM-DDTHH:mm:ss.SSSZ');

if(pm.request.url.query.get('set_justBeforeUpdate') != undefined)
{
    pm.environment.set("justBeforeUpdate", encodeURIComponent(requestTime));
    console.log("justBeforeUpdate: " + pm.environment.get("justBeforeUpdate"));
}

if(pm.request.url.query.get('set_justBeforeUpdateForTransfer') != undefined)
{
    pm.environment.set("justBeforeUpdateForTransfer", requestTime);
    console.log("justBeforeUpdateForTransfer: " + pm.environment.get("justBeforeUpdateForTransfer"));
}
```

- Script in first data upload qery
```javascript
    {
        const moment = require("moment");
        setTimeout(function() {
            pm.environment.set("afterUpdate", encodeURIComponent(moment().format()));
            console.log("afterUpdate: " + pm.environment.get("afterUpdate"));

            pm.environment.set("afterUpdateForTransfer", decodeURIComponent(pm.environment.get("afterUpdate")));
            console.log("afterUpdateForTransfer: " + pm.environment.get("afterUpdateForTransfer"));
        }, 1000);
    }
```
