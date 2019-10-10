---
title: Getting started
subtitle: 
comments: false
weight: 20

---

These pages will help developers and implementers to understand and install the full stack or individual components of the .Stat Suite platform with 3 different approaches:

* [.Stat Suite Open Source Framework](/getting-started/framework)  
 
  Provides a technical introduction to the.Stat Suite platform, the high-level technical architecture,  few typical use cases (topologies), the technical stack, detailed information about the components and their technical architecture, and finally detailed information about our DevOps implementation.

* [Infrastructure requirements](/getting-started/requirements)
* [Installation](/getting-started/installation)  

  Landing page for the navigation within installation instructions. The .Stat Suite platform and its modules and components are made available in the following 3 ways:

  * [As a fully-functional, ready-made service installation](/getting-started/installation/as-a-service)  

    This page provides information on how to easily deploy the .Stat Suite platform based on a fully-functional, ready-to-use service package, using a multi-tenant architecture. This eases cloud-hosting by any organisation for their own partners for test, demo, pilot or full-production purposes. Using this approach, we also provide cloud-hosting for SIS-CC member organisations and their partners for test, demo and pilot purposes.
    
    This approach doesn't require developer skills, but limits configuration options.

  * [As deployable containers](/getting-started/installation/as-container)  

    This page provides a short intro to the Docker technology, and information about the ready-to-use .Stat Suite docker images, which can be freely re-used to easily compose a new topology (system architecture) by anyone in its own cloud or premises.
    
    This approach requires knowledge of docker technology and orchestration (e.g. kubernetes technology).

  * [As code base](/getting-started/installation/from-code-base)  

    This page provides example topologies and the related required .Stat Suite platform components (applications, services, libraries), which can be freely re-used to compose a new topology (system architecture) by anyone in its own infrastructure. Also the links to the related instructions for installations starting from the code base are included.
    
    This approach requires solid technical knowledge of the underlying ecosystems (.Net, MS SQL Server, JS, OS) but offers most flexibility for topologies and configuration.

  * [Source code Windows installation example of .Stat Core services](/getting-started/installation/source-code-windows-installation-of-stat-core-services/)  

    This page provides the list of steps required to deploy a specific topology of the dotstatsuit-core components.
    
    This example provides predefined configuration values to ease the installation process. 
	
	The installation process is based on Git Bash commands as a way to standardize and reduce the installation steps.
	
  * [Data Explorer customisation and configuration](/getting-started/installation/de-customisation-configuration)

    This page currently contains a guide on how to setup, configure, customise and interact with most of the .Stat Data Explorer client-side configurations, look and feel and (sdmx) business rules. More information on customising the .Stat Data Lifecycle Manager will be added in the future.