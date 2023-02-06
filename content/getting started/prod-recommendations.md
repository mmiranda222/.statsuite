---
title: "Production setup recommendations"
subtitle: 
comments: false
weight: 38
keywords: [
  'Target environments', '#target-environments',
  'Topology', '#topology',
  'High availability and Scalability', '#high-availability-and-scalability',
  'Performance', '#performance',
  'Security', '#security',
  'Deployment technology', '#deployment-technology',
  'Maintenance', '#maintenance',
  'Support', '#support',
]
---
<!-- This page (or a sub-page or sub-section of this page) of the documentation is referenced as an external resource in the .Stat Academy:
* https://academy.siscc.org/installing-dotstat-suite/
Any change affecting its URL must be communicated to the .Stat Academy content admin in advance. -->

#### Table of Content
- [Target environments](#target-environments)
- [Topology](#topology)
- [High availability and Scalability](#high-availability-and-scalability)
- [Performance](#performance)
- [Security](#security)
- [Deployment technology](#deployment-technology)
- [Maintenance](#maintenance)
- [Support](#support)

---

### Target environments
We recommend setting up and maintaining at least the following environments: 
- **Development:** for functional integration tests 
- **Pre-production:** for technical integration tests but required also for final user-acceptance tests 
- **Production**

Pre-production and Production should be two **fully identical** environments with the same software versions (except during upgrades and tests), same infrastructure, same security, when possible same/similar data.  
The pre-production environment will allow technically testing new .Stat Suite versions, as well as the infrastructure configuration, before upgrading the production environment in the same way. Those tests also include the required security audits. For security reasons, outside the specific well-defined test periods, the infrastructure configuration of the pre-production environment can be temporarily altered and be access-restricted.  
A separate development environment is useful especially if an organisation develops its own components and needs to integrate other tools and software.  

---

### Topology
The general recommendation is to use distinct data spaces for dissemination purposes (usually accessed by external end-users) separate from data spaces for internal usage (collection, modelling, production, validation, etc.). Otherwise, the topology is largely determined by the intended usage and the to-be-supported underlying business processes.

---

### High availability and Scalability
We strongly recommend using **SQL Server Database Mirroring** as a high-availability solution for all heavy-duty data spaces. It can be configured on databases with full recovery mode and should consist of a minimum two servers: the primary SQL Server, known as **Principal** server, and the secondary server, known as the **Mirror** server, and optionally a third server, known as Witness server. The Witness server will monitor the connection between these two servers and its availability and perform the automatic failover, or the role change, between these two servers.

SQL Server Database Mirroring works in two synchronisation modes: 
- **High-safety mode**, also known as synchronous mode, in which the transaction will be committed on the principal database after committing it and writing it to the transaction log file on the mirror database, which increases the possibility of transactions latency;
- In **high-performance synchronisation mode**, also known as Asynchronous mode, the transaction will be committed on the principal database without waiting for it to be committed on the mirror server, decreasing the possibility of transactions latency but increasing the possibility of data loss.

Database Mirroring is started by restoring a full backup and a SQL Server Transaction Log backup from the principal database to the mirror server, without bringing the mirror database online. After configuring Database Mirroring, the mirror database will be synchronised by sending **the active Transaction Log records** to the mirror database and redoing all these operations on the mirror database.

.Stat Suite has been successfully tested with SQL Server Database Mirroring, and profits from significant performance gains by targeting the Principal server for all 'Write' operations and the Mirror server for all 'Read' operations and thus better shares the workload on separate SQL Server instances. At minimum, the externally exposed and heavily used dissemination data space should use SQL Server Database Mirroring, but also any other heavily used internal data space should use this solution.  
Depending on the expected workload, availability can be further increased by using **different SQL Server instances for different data spaces**.  
It is strongly recommended to use **load balancing for all web servers** with (at least) two web servers, not only for internet-facing services/applications, but also for the internally facing ones, as this improves availability and performance. This will also allow to easily increase the number of web servers to scale to future demands.

MS SQL databases should be regularly (daily/weekly) backed-up and maintained with the usual SQL maintenance jobs (index optimisation, defragmentation, etc.).  
The Share Redis/MongoDB database is to be backed-up regularly (daily/weekly).

---

### Performance
Especially voluminous data that is to be uploaded into the .Stat Suite system should be **pre-sorted** in the order of dimensions and codes as defined in an SDMX DSD and their underlying codelists. This helps minimising SQL table fragmentation and avoids unnecessary loss of performance.  
It is advisable to also, regularly defragment your SQL databases and optimise your SQL indexes, use SSD disks whenever possible, and don't be shy on the amount of RAM, CPU or disk space.

---

### Security
It is good practice to use separate SQL Server instances for internal/confidential/embargoed data and for external/publicly accessed/freely accessible data.  
It is technically sound to use the same load-balanced web servers for internal and external .Stat Data Explorer (DE) and Data Lifecycle Manager (DLM) through the [.Stat Suite tenant feature](https://sis-cc.gitlab.io/dotstatsuite-documentation/configurations/tenant-model/). This would minimise the installation efforts by using only one DE and DLM installation in the DMZ. However, some organisations might prefer keeping separate installations of web servers for internal and external users, e.g. for availability reasons.

General advice is:
- All services should use **HTTPS**;
- All web apps (Data Explorer, Data Viewer, Data Lifecycle Manager) should auto-forward HTTP to HTTPS and use the appropriate HSTS headers. Using https://securityheaders.com/ the calculated security level should be “A”. Using https://www.ssllabs.com/ssltest/analyze.html?hideResults=on the calculated security level should be “A+”;
- All web services should have HTTP disabled. Using https://securityheaders.com/ the calculated security level should at least be “A”. Using https://www.ssllabs.com/ssltest/analyze.html?hideResults=on the calculated security level should at least be “A”;
- All services and applications not exposed to external users must be well protected behind the **firewall**;
- Minimise the number of people with admin permissions;
- Use specific service accounts for all database connections (except for future “DotStatGet” SQL stored procedure);
- It is strongly recommended to execute an independent security audit, especially **Dynamic Application Security Testing (DAST)**, in a fully set-up Pre-Production environment, before releasing the Production environment.

---

### Deployment technology
The .Stat Suite can be installed using its ready-made Docker images and the Docker-Compose deployment technology. The [docker-compose example](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-docker-compose) is however meant for developers for a complete installation (including a free SQL dev image) on a single machine and is not production-ready. It MUST BE extended with features for security, availability, scaling, backup, etc. in order to become production-ready. Those are dependent on the technology (docker-compose, kubernetes,…) and chosen cloud-hosting provider (GCP, AWS, Azure,…). It is therefore impossible to give generic recommendations, instructions or advice on aspects like backups, availability, scaling etc. Different approaches have been chosen by organisations depending on their individal needs and constraints.

---

### Maintenance
Not all new .Stat Suite versions need to be deployed. The balance between deployment effort and added value in new features and enhancements is to be considered. Unless a version contains important security updates or corrections of critical bugs that affect one's environments, new versions do not need to be systematically deployed. However, much older versions are not supported, therefore we recommend making at least two deployments per year.

---

### Support
Each organisation should use its own internal user support process for supporting end users.  
All advanced support requests (bugs, enhancement requests) are to be entered as tickets in the SIS-CC GitLab site https://gitlab.com/sis-cc/.stat-suite/, and following our [best pratices](https://sis-cc.gitlab.io/dotstatsuite-documentation/contribution/report-an-issue/). Only SIS-CC member organisations are quaranteed to receive support.
