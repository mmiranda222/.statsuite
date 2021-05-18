---
title: "ESTAT NSIWS version compatibility"
subtitle: 
comments: false
weight: 9000

---

Table of version compatibility of the Eurostat **NSI Web Service** (nsiws.net [public mirrored source-code](https://gitlab.com/sis-cc/eurostat-sdmx-ri/nsiws.net.mirrored)) with the **.Stat Suite** .NET and JavaScript services, and the **ISTAT Data and Meta Manager DMM** *- previously MDM -* ([public mirrored source-code](https://gitlab.com/sis-cc/istat-dmm)):

| ESTAT nsiws | .Stat Suite .NET | .Stat Suite JS | ISTAT DMM | 
|:-------------|:-------------|:-------------|:-------------|
| nsiws.net v8.1.2 | .NET 5.0.0, .NET 6.0.0,.NET 6.1.0, .NET 6.2.0 | JS 7.0.0, JS 7.1.0, JS 7.1.1, JS 7.2.0, JS 7.2.1 | . |
| nsiws.net v7.13.2 | .NET 4.4.0 | JS 6.0.0, JS 6.1.0 | MDM v.1.4.0, MDM v.1.4.1, MDM v.1.5.0, MDM v.1.5.1 |
| nsiws.net v7.13.1 | .NET 4.3.0  | JS 5.4.0 | . |

---

> **Disclaimer on ISTAT DMM**: This table is filled with information publicly available regarding the ISTAT DMM application (see source [here](https://github.com/SDMXISTATTOOLKIT/META-DATA.MANAGER)). No test has taken place, especially for checking compatibility in the configurations of the nsiws in .Stat Suite and DMM. These additional tests to take place under the aegis of the SIS-CC DMM User Group (see corresponding kanban board *- to be created soon -* to follow issues or file requests).
