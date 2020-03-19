---
title: "Source code Windows installation example of .Stat Core services"
subtitle: 
comments: false
weight: 44
---

#### Table of Content
- [Disclaimer](#disclaimer)
- [Pre-requisites](#pre-requisites)
- [Topology](#topology)
- [Installation overview](#installation-overview)
- [1. Download the source code](#1-download-the-source-code)
- [2. Compile the source code](#2-compile-the-source-code)
- [3. Initialize the databases](#3-initialize-the-databases)
- [4. Deploy the Transfer service](#4-deploy-the-transfer-service)
- [5. Deploy the Design NSI web service in port 81](#5-deploy-the-design-nsi-web-service-in-port-81)
- [6. Deploy the Disseminate NSI web service in port 80](#6-deploy-the-disseminate-nsi-web-service-in-port-80)

---

The following example, contains the list of steps required to deploy a **specific topology** of the dotstatsuite-core components. The configuration of the components has been **predefined with default values** to ease the installation process. The installation process is based on **Git Bash commands** as a way to standardize and reduce the installation steps.

## Disclaimer

> **`This example SHOULD NOT be used as is for production deployments.`**
> 
> In this installation example all sensitive information is set to use default values, including connection strings, SQL users and passwords, database names, application folders, among others.  
>  **This information is publically available, making your deployment vulnerable.**

## Pre-requisites
Make sure that the windows machine which will be used in this installation process, has all the following components already installed, and that you have all the required information.

- **SQL server 2017** or higher

    - SQL authentication enabled  
    - Named pipes enabled  
    - SQL browser service running  
    - SQL Server Agent running  
    - User and password with **sysadmin** role  
- **Microsoft .NET**    
    - Microsoft .NET Core Runtime - 2.2.\* [download](https://dotnet.microsoft.com/download/dotnet-core/2.2)
    - Microsoft .NET Core 2.2.\* - Windows Server Hosting [download](https://dotnet.microsoft.com/download/dotnet-core/2.2) 
    - Microsoft .NET Core SDK 2.2.\* [download](https://dotnet.microsoft.com/download/dotnet-core/2.2)
    - Microsoft .NET Framework 4.5.\* [download](https://www.microsoft.com/en-US/download/details.aspx?id=30653)
    - Microsoft .NET Core Runtime - 3.1.\* [download](https://dotnet.microsoft.com/download/dotnet-core/3.1)
    - Visual studio 2019 is needed to compile solutions with .net core 3.1 (NSI webservice, maapi.net, NSI plugin)

- **IIS Web server**  
    - IIS server 7.5 or later  
    - ASP.Net application roles/features enabled  
    - Microsoft Visual C++ 2015 Redistributable [download](https://www.microsoft.com/en-US/download/details.aspx?id=52685) 

- **Git for windows** [download](https://git-scm.com/download/win).  

- **Access to Eurostat's [bitbucket repository](https://webgate.ec.europa.eu/CITnet/stash/projects/SDMXRI)**  

> **`WARNING!`** - **`This installation example will fail if any of the pre-requisites is missing.`**  

## Topology

![.Stat Core topology two spaces](/images/stat-core-topology-two-spaces.PNG)

## Installation overview
1.   [Download the source code](#1-download-the-source-code)
2.   [Compile the source code](#2-compile-the-source-code)
3.   [Initialize the databases](#3-initialize-the-databases)
     * [DotStatSuiteCore_Common database](#initialize-the-dotstatsuitecore-common-database)
     * [Design DotStatSuiteCore_Data database](#initialize-one-design-dotstatsuitecore-data-database)
     * [Disseminate DotStatSuiteCore_Data database](#initialize-one-disseminate-dotstatsuitecore-data-database)
     * [Configure the maapi.net tool](#configure-the-maapi-net-tool)
     * [Design DotStatSuiteCore_Struct database (mappingstore db)](#initialize-one-design-dotstatsuitecore-struct-database-mappingstore-db)
     * [Disseminate DotStatSuiteCore_Struct database (mappingstore db)](#initialize-one-disseminate-dotstatsuitecore-struct-database-mappingstore-db)
4.   [Deploy the Transfer service](#4-deploy-the-transfer-service)
5.   [Deploy the Design NSI web service](#5-deploy-the-design-nsi-web-service-in-port-81)
6.   [Deploy the Disseminate NSI web service](#6-deploy-the-disseminate-nsi-web-service-in-port-80)

## 1 Download the source code

In this section we'll download the source code for the databases and for each of the applications.

### A word on versions

The versions of the source code we download here need to work together. This means that we need to download compatible versions of all the various components, which is why none of the clone statements refer to branches such as "master" or "develop", but instead refer to tags we know to be compatible.

  1 .  Open Git Bash with **admin rights** from the windows start menu

  2 .  Create a new folder *C:/git* to store the source code
```sh 
mkdir /c/git
```

  3 .  Move to the new folder
```sh 
cd /c/git
```

  4 .  Clone the dotstatsuite-core-data-access repository.- *This repository contains the dotstatsuite-core-dbup tool, which will be used to create and initialize the common and data databases.*
```sh 
git clone -b 6.1.1 --single-branch https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-data-access.git dotstatsuite-core-dbup
```

  5 .  Clone the maapi.net tool repository.- *This tool will be used to initialize the structure databases.* 

This is a private Eurostat repository, therefore you need to provide your login credentials. `Replace YOURUSERNAME and YOURPASSWORD `

```sh 
git clone -b v1.25.2 --single-branch --recurse-submodules https://YOURUSERNAME:YOURPASSWORD@webgate.ec.europa.eu/CITnet/stash/scm/sdmxri/maapi.net.git
```

> **WARNING!** - This repository has a git submodule (authdb.sql) that is cloned with the command "--recurse-submodules". If you are behind a network security firewall, this submodule might not be cloned. To clone it manually use the command:  
>  -  git clone -b 1.0 --single-branch --recurse-submodules https://YOURUSERNAME:YOURPASSWORD@webgate.ec.europa.eu/CITnet/stash/scm/sdmxri/authdb.sql.git maapi.net/src/Estat.Sri.Security/resources


  6 .  Clone the NSI web service repository

This is a private Eurostat repository, therefore you need to provide your login credentials. `Replace YOURUSERNAME and YOURPASSWORD`
```sh
git clone -b 7.11.3 --single-branch https://YOURUSERNAME:YOURPASSWORD@webgate.ec.europa.eu/CITnet/stash/scm/sdmxri/nsiws.net.git
```

  7 .  Clone the dotstatsuite-core-sdmxri-nsi-plugin repository.- *This plugin will be used to retrieve data form the DotStatSuiteCore_Data databases.* 

```sh
git clone -b 7.11.3 --single-branch https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin.git
```

  8 .  Clone the dotstatsuite-core-transfer repository
```sh
git clone -b 3.0.1 --single-branch https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer.git
```

## 2 Compile the source code

  1 .  Compile the dotstatsuite-core-dbup tool
```sh
dotnet publish /c/git/dotstatsuite-core-dbup
```
  2 .  Compile the maapi.net tool
```sh
dotnet publish /c/git/maapi.net/src/Estat.Sri.Mapping.Tool/Estat.Sri.Mapping.Tool.csproj
```
  3 .  Compile the NSI web service

*WARNING:* The nsi webservice requires a long list of libraries that are downloaded at build time. Sometimes a single build is not enough to download all these libraries, therefore *make sure all resources are downloaded at build time, otherwise run the build command multiple times*

```sh
dotnet build /c/git/nsiws.net/NSIWebServices.sln
```

```sh
dotnet publish /c/git/nsiws.net/NSIWebServices.sln
```
  4 .  Compile the dotstatsuite-core-sdmxri-nsi-plugin
```sh
dotnet publish /c/git/dotstatsuite-core-sdmxri-nsi-plugin
```
  5 .  Compile the dotstatsuite-core-transfer
```sh
dotnet publish /c/git/dotstatsuite-core-transfer
```

## 3 Initialize the databases

For this step you will need the Microsoft SQL sysadmin user and password.  

### Initialize the DotStatSuiteCore_Common database  

![.Stat Core topology Common](/images/stat-core-topology-common.PNG)  

Execute the DbUp tool (*DotStat.DbUp.dll*) with the parameters to create and initialize the DotStatSuiteCore_Common database.

`Replace SA_USER and SA_PASSWORD` with the Microsoft SQL sysadmin credentials.
```sh
dotnet /c/git/dotstatsuite-core-dbup/DotStat.DbUp/bin/Debug/netcoreapp2.1/publish/DotStat.DbUp.dll upgrade --connectionString "Server=localhost;Database=CommonDb;User=SA_USER;Password=SA_PASSWORD;" --commonDb --loginName testLoginCommon --loginPwd "testLogin(\!)Password" --force
```
### Initialize one Design DotStatSuiteCore_Data database  

![.Stat Core topology designData](/images/stat-core-topology-designData.PNG)  

Execute the Dbup tool (*DotStat.DbUp.dll*) with the parameters to create and initialize Design DotStatSuiteCore_Data database.

`Replace SA_USER and SA_PASSWORD` with the Microsoft SQL sysadmin credentials.
``` sh
dotnet /c/git/dotstatsuite-core-dbup/DotStat.DbUp/bin/Debug/netcoreapp2.1/publish/DotStat.DbUp.dll upgrade --connectionString "Server=localhost;Database=DesignDataDb;User=SA_USER;Password=SA_PASSWORD;" --dataDb --loginName testLoginDesignData --loginPwd "testLogin(\!)Password" --force
```
### Initialize one Disseminate DotStatSuiteCore_Data database  

![.Stat Core topology disseminateData](/images/stat-core-topology-disseminateData.PNG)  

Execute the DbUp tool (*DotStat.DbUp.dll*) with the parameters to create and initialize the Disseminate DotStatSuiteCore_Data database.

`Replace SA_USER and SA_PASSWORD` with the Microsoft SQL sysadmin credentials.
```sh
dotnet /c/git/dotstatsuite-core-dbup/DotStat.DbUp/bin/Debug/netcoreapp2.1/publish/DotStat.DbUp.dll upgrade --connectionString "Server=localhost;Database=DisseminateDataDb;User=SA_USER;Password=SA_PASSWORD;" --dataDb  --loginName testLoginDisseminateData --loginPwd "testLogin(\!)Password" --force
```

### Configure the maapi.net tool 

The maapi.net tool is used to initialize DotStatSuiteCore_Struct (mappingStore) databases. In this example we will use it to initialize two DotStatSuiteCore_Struct databases (design and disseminate).

The  tool requires a pre-configured list of connection strings of each of the databases that will be created and/or updated. This information should be added to the Estat.Sri.Mapping.Tool.dll.config file, under the section "\<connectionStrings\>".  

```xml
...
  <!--app.config -->
  <connectionStrings>
    <clear/>
    <add name="sqlserver" connectionString="Data Source=sodi-test;Initial Catalog=msdb_scratch;User Id=mauser;Password=123"
        providerName="System.Data.SqlClient"/>
    <add name="odp" connectionString="Data Source=sodi-test/xe;User ID=msdb_scratch;Password=123" providerName="Oracle.ManagedDataAccess.Client"/>
    <add name="mysql" connectionString="server=sodi-test;user id=mauser;password=123;database=msdb_scratch;default command timeout=120"
        providerName="MySql.Data.MySqlClient"/>
  </connectionStrings>
...
```

To simplify the process, we will use the configuration example maapi-app.config, from the dotstatsuite-core-sdmxri-nsi-plugin repository.

-  Move to the maapi.net folder
```sh
cd /c/git/maapi.net/src/Estat.Sri.Mapping.Tool/bin/Debug/netcoreapp2.2/publish/
```
- From the dotstatsuite-core-sdmxri-nsi-plugin repository, copy the content of the example configuration file `maapi-app.config` to the 
Estat.Sri.Mapping.Tool.dll.config 
```sh
cp -r -f /c/git/dotstatsuite-core-sdmxri-nsi-plugin/docs/installation/config-examples/maapi-app.config Estat.Sri.Mapping.Tool.dll.config 
```

### Initialize one Design DotStatSuiteCore_Struct database (MappingStore db)  

![.Stat Core topology designStruct](/images/stat-core-topology-designStruct.PNG)

The initialization of MappingStore databases is done in two steps, first the dotstatsuite-core-dbup tool is used to create an empty database with the user and its credentials, and finally the maapi.net tool will generate all the remaining database artifacts.

**Step 1.** Create the empty database using the dotstatsuite-core-dbup tool.

Execute the Dbup tool (*DotStat.DbUp.dll*) with the parameters to create and initialize the Disseminate DotStatSuiteCore_Struct database.

`Replace SA_USER and SA_PASSWORD` with the Microsoft SQL sysadmin credentials.
``` sh
dotnet /c/git/dotstatsuite-core-dbup/DotStat.DbUp/bin/Debug/netcoreapp2.1/publish/DotStat.DbUp.dll upgrade --connectionString "Server=localhost;Database=DesignStructDb;User=SA_USER;Password=SA_PASSWORD;" --mappingStoreDb --loginName testLoginDesignStruct --loginPwd "testLogin(\!)Password" --force
```

**Step 2.**   Initialize the database using the maapi.net tool

```sh
dotnet Estat.Sri.Mapping.Tool.dll init -m DesignStructDb -f 
```

### Initialize one Disseminate DotStatSuiteCore_Struct database (MappingStore db)  

![.Stat Core topology disseminateStruct](/images/stat-core-topology-disseminateStruct.PNG)
   
The initialization of MappingStore databases is done in two steps, first the dotstatsuite-core-dbup tool is used to create an empty database with the user and its credentials, and finally the maapi.net tool will generate all the remaining database artifacts.

**Step 1.** Create the empty database using the dotstatsuite-core-dbup tool.

Execute the Dbup tool (*DotStat.DbUp.dll*) with the parameters to create and initialize the Disseminate DotStatSuiteCore_Struct database.

`Replace SA_USER and SA_PASSWORD` with the Microsoft SQL sysadmin credentials.
```sh
dotnet /c/git/dotstatsuite-core-dbup/DotStat.DbUp/bin/Debug/netcoreapp2.1/publish/DotStat.DbUp.dll upgrade --connectionString "Server=localhost;Database=DisseminateStructDb;User=SA_USER;Password=SA_PASSWORD;" --mappingStoreDb --loginName testLoginDisseminateStruct --loginPwd "testLogin(\!)Password" --force
```

**Step 2.**   Initialize the database using the maapi.net tool

```sh
dotnet Estat.Sri.Mapping.Tool.dll init -m DisseminateStructDb -f 
```

## 4 Deploy the Transfer service  

![.Stat Core topology transfer](/images/stat-core-topology-transfer.PNG)

**Step 1.** Create a new folder to create the web service 

```sh
mkdir -p /c/dotstatsuite-website/transfer-service/
```

**Step 2.** Add full access rights to the users "IUSR" and "IIS_IUSRS" to the folder

```sh
icacls "C:\dotstatsuite-website\transfer-service" /grant:r "IUSR":"(OI)(CI)F"
icacls "C:\dotstatsuite-website\transfer-service" /grant:r "IIS_IUSRS":"(OI)(CI)F"
```
**Step 3.** Copy the compiled binaries to the new folder 

```sh
cp -r /c/git/dotstatsuite-core-transfer/DotStatServices.Transfer/bin/Debug/netcoreapp2.2/publish/.* /c/dotstatsuite-website/transfer-service/
```

**Step 4.** Create a new IIS application called **transfer-service** in port 83, using [appcmd command](https://docs.microsoft.com/en-us/iis/get-started/getting-started-with-iis/getting-started-with-appcmdexe)
>  Make sure git bash is running in admin mode.
```sh
/c/Windows/System32/inetsrv/appcmd add site /name:transfer-service /physicalPath:C:\\dotstatsuite-website\\transfer-service /bindings:http/*:83:
```

**Step 5.** Create a new IIS application pool (TransferServiceAppPool) 
```sh
/c/Windows/System32/inetsrv/appcmd add apppool /name:TransferServiceAppPool /managedRuntimeVersion:"" /managedPipelineMode:Integrated
```
*  Add the transfer-service application to the newly created application pool  

```sh
/c/Windows/System32/inetsrv/appcmd set app "transfer-service/" /applicationPool:TransferServiceAppPool
```

**Step 6.** Configure the transfer service

There are two options to configure the transfer service: 

1.  Json config files.- `NOT RECOMMENDED`

>  Copy the sample file dataspaces.private.json and auth.private.json from C:\git\dotstatsuite-core-transfer\docs\installation\config-examples to the deployment folder (C:\dotstatsuite-website\transfer-service\config). 

2.  Saving the configuration setting as environment variables for the IIS site (transfer-service). `Recommended`

>  [See more about the configuration settings](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-transfer/-/blob/master/README.md#configuration).

For this example we will use the second option: 

*  Set the common database connection string:
```sh
/c/Windows/System32/inetsrv/appcmd set config "transfer-service" -section:system.webServer/aspNetCore /+"environmentVariables.[name='DotStatSuiteCoreCommonDbConnectionString',value='Data Source=localhost;Initial Catalog=CommonDb;User ID=testLoginCommon;Password=testLogin(\!)Password']" /commit:apphost
```

* Set the default language code:
```sh
/c/Windows/System32/inetsrv/appcmd set config "transfer-service" -section:system.webServer/aspNetCore /+"environmentVariables.[name='DefaultLanguageCode',value='en']" /commit:apphost
```

*  Disable authentication:
```sh
/c/Windows/System32/inetsrv/appcmd set config "transfer-service" -section:system.webServer/aspNetCore /+"environmentVariables.[name='auth__enabled',value='false']" /commit:apphost
/c/Windows/System32/inetsrv/appcmd set config "transfer-service" -section:system.webServer/aspNetCore /+"environmentVariables.[name='auth__claimsMapping__email',value='null']" /commit:apphost
```

**NOTE** that the transfer service will not send emails (for actions performed on data from the .Stat DLM) until authentication is enabled and properly configured. To **enable authentication** in the transfer-service, see [.Stat authentication configuration](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/authentication/).

*  Set the design dataspace values:
```sh
/c/Windows/System32/inetsrv/appcmd set config "transfer-service" -section:system.webServer/aspNetCore /+"environmentVariables.[name='spacesInternal__0__Id',value='design']" /commit:apphost
/c/Windows/System32/inetsrv/appcmd set config "transfer-service" -section:system.webServer/aspNetCore /+"environmentVariables.[name='spacesInternal__0__DotStatSuiteCoreStructDbConnectionString',value='Data Source=localhost;Initial Catalog=DesignStructDb;User ID=testLoginDesignStruct;Password=testLogin(\!)Password']" /commit:apphost
/c/Windows/System32/inetsrv/appcmd set config "transfer-service" -section:system.webServer/aspNetCore /+"environmentVariables.[name='spacesInternal__0__DotStatSuiteCoreDataDbConnectionString',value='Data Source=localhost;Initial Catalog=DesignDataDb;User ID=testLoginDesignData;Password=testLogin(\!)Password']" /commit:apphost
/c/Windows/System32/inetsrv/appcmd set config "transfer-service" -section:system.webServer/aspNetCore /+"environmentVariables.[name='spacesInternal__0__DataImportTimeOutInMinutes',value='60']" /commit:apphost
/c/Windows/System32/inetsrv/appcmd set config "transfer-service" -section:system.webServer/aspNetCore /+"environmentVariables.[name='spacesInternal__0__DatabaseCommandTimeoutInSec',value='360']" /commit:apphost

```
*  Set the disseminate dataspace values:
```sh
/c/Windows/System32/inetsrv/appcmd set config "transfer-service" -section:system.webServer/aspNetCore /+"environmentVariables.[name='spacesInternal__1__Id',value='disseminate']" /commit:apphost
/c/Windows/System32/inetsrv/appcmd set config "transfer-service" -section:system.webServer/aspNetCore /+"environmentVariables.[name='spacesInternal__1__DotStatSuiteCoreStructDbConnectionString',value='Data Source=localhost;Initial Catalog=DisseminateStructDb;User ID=testLoginDisseminateStruct;Password=testLogin(\!)Password']" /commit:apphost
/c/Windows/System32/inetsrv/appcmd set config "transfer-service" -section:system.webServer/aspNetCore /+"environmentVariables.[name='spacesInternal__1__DotStatSuiteCoreDataDbConnectionString',value='Data Source=localhost;Initial Catalog=DisseminateDataDb;User ID=testLoginDisseminateData;Password=testLogin(\!)Password']" /commit:apphost
/c/Windows/System32/inetsrv/appcmd set config "transfer-service" -section:system.webServer/aspNetCore /+"environmentVariables.[name='spacesInternal__1__DataImportTimeOutInMinutes',value='60']" /commit:apphost
/c/Windows/System32/inetsrv/appcmd set config "transfer-service" -section:system.webServer/aspNetCore /+"environmentVariables.[name='spacesInternal__1__DatabaseCommandTimeoutInSec',value='360']" /commit:apphost
```

**Step 7.** Start the new application
```sh
/c/Windows/System32/inetsrv/appcmd start site /site.name:transfer-service
```

**Step 8.** Test that the application is up and running  

*  **Using curl**
```sh
curl localhost:83/health
```

*  **Using a web browser**  
Open a web browser and open the url localhost:83/health

**You should see the following result:**
```json
{
  "service": {
    "status": "Healthy",
    "details": {
      "version": "2.1.53+06130ed127",
      "auth_enabled": false
    },
    "responseTime": 0.3027
  },
  "database": {
    "status": "Healthy",
    "details": {
      "design": {
        "structureAlive": true,
        "dataAlive": true
      },
      "disseminate": {
        "structureAlive": true,
        "dataAlive": true
      }
    },
    "responseTime": 4.7351
  },
  "memory": {
    "status": "Healthy",
    "details": {
      "allocatedMb": 10.3886,
      "gen0Collections": 0,
      "gen1Collections": 0,
      "gen2Collections": 0
    },
    "responseTime": 0.02
  },
  "totalResponseTime": 5.4551
}
```
>  Note: By default all the logs will be stored at C:\dotstatsuite-website\transfer-service\logs\

## 5 Deploy the Design NSI web service in port 81  

![.Stat Core topology nsiwsDesign](/images/stat-core-topology-nsiwsDesign.PNG)

**Step 1.** Create a new folder to create the web service 

```sh
mkdir -p /c/dotstatsuite-website/nsiws-design/
```

**Step 2.** Add full access rights to the users "IUSR" and "IIS_IUSRS" to the folder

```sh
icacls "C:\dotstatsuite-website\nsiws-design" /grant:r "IUSR":"(OI)(CI)F"
icacls "C:\dotstatsuite-website\nsiws-design" /grant:r "IIS_IUSRS":"(OI)(CI)F"
```

**Step 3.** Copy the compiled binaries to the new folder 
```sh
cp -r /c/git/nsiws.net/src/NSIWebServiceCore/bin/Debug/netcoreapp2.2/publish/* /c/dotstatsuite-website/nsiws-design/
```

**Step 4.** Copy the following dotstatsuite-core-sdmxri-nsi-plugin binaries to the *Plugins* folder. This will allow the NSI web service to extract data from the Design DotStatSuiteCore_Data database.

- DotStat.Common.dll
- DotStat.DB.dll
- DotStat.Domain.dll
- DotStat.MappingStore.dll
- DotStat.NSI.DataRetriever.dll
- DotStat.NSI.RetrieverFactory.deps.json
- DotStat.NSI.RetrieverFactory.dll

```sh
cp -r /c/git/dotstatsuite-core-sdmxri-nsi-plugin/DotStat.NSI.RetrieverFactory/bin/Debug/netcoreapp2.2/publish/{DotStat.Common.dll,DotStat.DB.dll,DotStat.Domain.dll,DotStat.MappingStore.dll,DotStat.NSI.DataRetriever.dll,DotStat.NSI.RetrieverFactory.deps.json,DotStat.NSI.RetrieverFactory.dll,MicroKnights.Log4NetAdoNetAppender.dll} /c/dotstatsuite-website/nsiws-design/Plugins
```

**Step 5.** Configure the nsi web service 

From the local dotstatsuite-core-sdmxri-nsi-plugin repository, copy the following sample configuration to the deployment folder:
*  *nsiws-design-app.config* to the file */config/app.config* 

>  This sample configuration file has been set to use the databases and users that were previously created in this guide. [See more about the configuration settings](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/-/blob/master/readme.md).

```sh
cp /c/git/dotstatsuite-core-sdmxri-nsi-plugin/docs/installation/config-examples/nsiws-design-app.config /c/dotstatsuite-website/nsiws-design/config/app.config
```

**Step 6.** Create a new IIS application called **nsiws-design** in port 81, using [appcmd command](https://docs.microsoft.com/en-us/iis/get-started/getting-started-with-iis/getting-started-with-appcmdexe)

>  Make sure git bash is running in admin mode.

```sh
/c/Windows/System32/inetsrv/appcmd add site /name:nsiws-design /physicalPath:C:\\dotstatsuite-website\\nsiws-design /bindings:http/*:81:
```

**Step 7.** Create a new IIS application pool (NSIWSDesignAppPool) 
```sh
/c/Windows/System32/inetsrv/appcmd add apppool /name:NSIWSDesignAppPool /managedRuntimeVersion:"" /managedPipelineMode:Integrated
```
*  Add the nsiws-design application to the newly created application pool  
```sh
/c/Windows/System32/inetsrv/appcmd set app "nsiws-design/" /applicationPool:NSIWSDesignAppPool
```

**Step 8.** Configure the dotstatsuite-core-sdmxri-nsi-plugin

There are two options to configure the dotstatsuite-core-sdmxri-nsi-plugin:  
  1 .  Json config file.- `NOT RECOMMENDED`

>  Copy the sample file dataspaces-design.json from C:\git\dotstatsuite-core-sdmxri-nsi-plugin\docs\installation\config-examples to the deployment folder (C:\dotstatsuite-website\nsiws-design\config). 

  2 .  Saving the configuration setting as environment variables for the IIS site (nsiws-design). `Recommended`

>  [See more about the configuration settings](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/-/blob/master/readme.md).

For this example we will use the second option: 

*  Set the design dataspace values:
```sh
/c/Windows/System32/inetsrv/appcmd set config "nsiws-design" -section:system.webServer/aspNetCore /+"environmentVariables.[name='spacesInternal__0__Id',value='design']" /commit:apphost
/c/Windows/System32/inetsrv/appcmd set config "nsiws-design" -section:system.webServer/aspNetCore /+"environmentVariables.[name='spacesInternal__0__DotStatSuiteCoreStructDbConnectionString',value='Data Source=localhost;Initial Catalog=DesignStructDb;User ID=testLoginDesignStruct;Password=testLogin(\!)Password']" /commit:apphost
/c/Windows/System32/inetsrv/appcmd set config "nsiws-design" -section:system.webServer/aspNetCore /+"environmentVariables.[name='spacesInternal__0__DotStatSuiteCoreDataDbConnectionString',value='Data Source=localhost;Initial Catalog=DesignDataDb;User ID=testLoginDesignData;Password=testLogin(\!)Password']" /commit:apphost
/c/Windows/System32/inetsrv/appcmd set config "nsiws-design" -section:system.webServer/aspNetCore /+"environmentVariables.[name='spacesInternal__0__DataImportTimeOutInMinutes',value='60']" /commit:apphost
/c/Windows/System32/inetsrv/appcmd set config "nsiws-design" -section:system.webServer/aspNetCore /+"environmentVariables.[name='spacesInternal__0__DatabaseCommandTimeoutInSec',value='360']" /commit:apphost
```

**Step 9.** Start the new application
```sh
/c/Windows/System32/inetsrv/appcmd start site /site.name:nsiws-design
```

**Step 10.** Test that the application is up and running

*  **Using a web browser**  
Open a web browser and open the url localhost:81

**You should see a page with a banner of the European Commission**

>  Note: By default all the logs will be stored at C:/ProgramData/Eurostat/logs/

## 6 Deploy the Disseminate NSI web service in port 80  

![.Stat Core topology nsiwsDisseminate](/images/stat-core-topology-nsiwsDisseminate.PNG)

**Step 1.** Create a new folder to create the web service 

```sh
mkdir -p /c/dotstatsuite-website/nsiws-disseminate/
```

**Step 2.** Add full access rights to the users "IUSR" and "IIS_IUSRS" to the folder

```sh
icacls "C:\dotstatsuite-website\nsiws-disseminate" /grant:r "IUSR":"(OI)(CI)F"
icacls "C:\dotstatsuite-website\nsiws-disseminate" /grant:r "IIS_IUSRS":"(OI)(CI)F"
```

**Step 3.** Copy the compiled binaries to the new folder 
```sh
cp -r /c/git/nsiws.net/src/NSIWebServiceCore/bin/Debug/netcoreapp2.2/publish/* /c/dotstatsuite-website/nsiws-disseminate/
```

**Step 4.** Copy the following dotstatsuite-core-sdmxri-nsi-plugin binaries to the *Plugins* folder. This will allow the NSI web service to extract data from the Disseminate DotStatSuiteCore_Data database.

- DotStat.Common.dll
- DotStat.Config.dll
- DotStat.DB.dll
- DotStat.Domain.dll
- DotStat.MappingStore.dll
- DotStat.NSI.DataRetriever.dll
- DotStat.NSI.RetrieverFactory.deps.json
- DotStat.NSI.RetrieverFactory.dll
- MicroKnights.Log4NetAdoNetAppender.dll


```sh
cp -r /c/git/dotstatsuite-core-sdmxri-nsi-plugin/DotStat.NSI.RetrieverFactory/bin/Debug/netcoreapp2.2/publish/{DotStat.Common.dll,DotStat.DB.dll,DotStat.Domain.dll,DotStat.MappingStore.dll,DotStat.NSI.DataRetriever.dll,DotStat.NSI.RetrieverFactory.deps.json,DotStat.NSI.RetrieverFactory.dll,MicroKnights.Log4NetAdoNetAppender.dll} /c/dotstatsuite-website/nsiws-disseminate/Plugins
```

**Step 5.** Configure the nsi web service  
From the local dotstatsuite-core-sdmxri-nsi-plugin repository, copy the following sample configuration to the deployment folder:  

*  *nsiws-disseminate-app.config* to the file */config/app.config* 

>  This sample configuration file has been set to use the databases and users that were previously created in this guide. [See more about the configuration settings](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/-/blob/master/readme.md).

```sh
cp /c/git/dotstatsuite-core-sdmxri-nsi-plugin/docs/installation/config-examples/nsiws-disseminate-app.config /c/dotstatsuite-website/nsiws-disseminate/config/app.config
```

**Step 6.** Create a new IIS application called **nsiws-disseminate** in port 80, using [appcmd command](https://docs.microsoft.com/en-us/iis/get-started/getting-started-with-iis/getting-started-with-appcmdexe)  

>  Make sure git bash is running in admin mode.

```sh
/c/Windows/System32/inetsrv/appcmd add site /name:nsiws-disseminate /physicalPath:C:\\dotstatsuite-website\\nsiws-disseminate /bindings:http/*:80:
```

**Step 7.** Create a new IIS application pool (NSIWSDisseminateAppPool) 
```sh
/c/Windows/System32/inetsrv/appcmd add apppool /name:NSIWSDisseminateAppPool /managedRuntimeVersion:"" /managedPipelineMode:Integrated
```  

*  Add the nsiws-disseminate application to the newly created application pool
```sh
/c/Windows/System32/inetsrv/appcmd set app "nsiws-disseminate/" /applicationPool:NSIWSDisseminateAppPool
```

**Step 8.** Configure the dotstatsuite-core-sdmxri-nsi-plugin

There are two options to configure the dotstatsuite-core-sdmxri-nsi-plugin:  
  1 .  Json config file.- `NOT RECOMMENDED`

>  Copy the sample file dataspaces-disseminate.json from C:\git\dotstatsuite-core-sdmxri-nsi-plugin\docs\installation\config-examples to the deployment folder (C:\dotstatsuite-website\nsiws-disseminate\config). 

  2 .  Saving the configuration setting as environment variables for the IIS site (nsiws-disseminate). `Recommended`

>  [See more about the configuration settings](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-core-sdmxri-nsi-plugin/-/blob/master/readme.md).

For this example we will use the second option:  

*  Set the disseminate dataspace values:

```sh
/c/Windows/System32/inetsrv/appcmd set config "nsiws-disseminate" -section:system.webServer/aspNetCore /+"environmentVariables.[name='spacesInternal__0__Id',value='disseminate']" /commit:apphost
/c/Windows/System32/inetsrv/appcmd set config "nsiws-disseminate" -section:system.webServer/aspNetCore /+"environmentVariables.[name='spacesInternal__0__DotStatSuiteCoreStructDbConnectionString',value='Data Source=localhost;Initial Catalog=DisseminateStructDb;User ID=testLoginDisseminateStruct;Password=testLogin(\!)Password']" /commit:apphost
/c/Windows/System32/inetsrv/appcmd set config "nsiws-disseminate" -section:system.webServer/aspNetCore /+"environmentVariables.[name='spacesInternal__0__DotStatSuiteCoreDataDbConnectionString',value='Data Source=localhost;Initial Catalog=DisseminateDataDb;User ID=testLoginDisseminateData;Password=testLogin(\!)Password']" /commit:apphost
/c/Windows/System32/inetsrv/appcmd set config "nsiws-disseminate" -section:system.webServer/aspNetCore /+"environmentVariables.[name='spacesInternal__0__DataImportTimeOutInMinutes',value='60']" /commit:apphost
/c/Windows/System32/inetsrv/appcmd set config "nsiws-disseminate" -section:system.webServer/aspNetCore /+"environmentVariables.[name='spacesInternal__0__DatabaseCommandTimeoutInSec',value='360']" /commit:apphost
```

**Step 9.** Start the new application
```sh
/c/Windows/System32/inetsrv/appcmd start site /site.name:nsiws-disseminate
```

**Step 10.** Test that the application is up and running

*  **Using a web browser**  
Open a web browser and open the url localhost:80

**You should see a page with a banner of the European Commission**

>  Note: By default all the logs will be stored at C:/ProgramData/Eurostat/logs/
