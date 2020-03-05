---
title: "Issue process and Definitions of Done (DoD)"
subtitle: 
comments: false
weight: 92
---

#### Table of Content
- [intro](#intro)
- [production cycle](#production-cycle)
- [common rules](#common-rules)
- [product owner workflow](#product-owner-workflow)
- [graphical design workflow](#graphical-design-workflow)
- [technical (dev) workflow](#technical-dev-workflow)
- [technical (javascriptdev) workflow (wip)](#technical-javascriptdev-workflow-wip)

---

### intro
Every opened issue (see [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/contribution/report-an-issue/) how to report a new issue) will follow the agreed and below defined production cycle, in regards to quality criteria and relevance assessed by the Product Owner (PO) Team and the Technical (Dev) Team.  
The full workflow goes from open to PO, Graphical Design and Dev Teams (.NET/SQL and JavaScript), including review, quality check, implementation, peer-review, quality assurance and release, then finally closed.  
In some cases of course some steps are skipped, e.g. a bug will not go through Graphical Design steps.  
If at some point an issue has a very low activity after 12 months, it should then be closed. Nonetheless, re-opening an issue might still happen if someone is still willing to work on it.

### Production Cycle
The below diagram gives an overview of the Production cycle ran for each of the opened issues and according to the acceptance criteria, and for all types of issues (bugs or features).  
The Technical (Dev) Team is here divided into .NET/SQL and JavaScript technologies.  

{{< mermaid align="left" >}}
sequenceDiagram;
open->>PO: all issues;
PO->>Design: all features with UI impact;
PO->>Dev.NET/SQL: without UI impact but with .NET/SQL;
PO->>DevJavaScript: without UI impact nor .NET/SQL;
Design->>Dev.NET/SQL: with .NET/SQL;
Design->>DevJavaScript: without .NET/SQL;
Dev.NET/SQL->>DevJavaScript: with JavaScript;
Dev.NET/SQL-xclosed: without JavaScript;
DevJavaScript-xclosed: ;
PO--xclosed: rejected issues;
{{< /mermaid >}}

### Common rules
- An issue can go through several iterations of the process cycle through Product Owner, Graphical Design, .NET/SQL Dev and JavaScript Dev teams.
- At any step of a process, an issue can be put on hold or be returned to an earlier step.
- A Definition of Done (DoD) of a process step must be met and completed before an issue goes to any next step of the workflow.

### Product Owner workflow
1. Review  
A member of the PO Team reviews the content of the opened issue and makes sure it meets the minimal and expected quality criteria. If some parts are not clear, the PO Team member contacts (e.g. through comments) the person who has opened the issue in order to clarify it.  
**DoD**: the issue is created and quality checked:  
A bug's type must be clear enough to identify and reproduce it.  
A feature's type must have a clear detail of the functional or non-functional requirements.  

2. Implement  
For a bug: _skipped_  
For a feature: a member of the PO Team defines and describes the functional specifications based on the requirements.  
For all types of issue, the PO Team sets a priority indication.  
**DoD**: the issue is quality checked, prioritised, and functional specifications for a feature are described.  


3. Peer-review  
The PO Team reviews the issue and its priority indication.  
**DoD**: the issue meets the PO quality criteria and it is ready for Graphical Design (if relevant) or Dev Team review.  

4. Quality Assurance  
_skipped_  

5. Release  
_skipped_

### Graphical Design workflow
1. Review  
The Graphical Design Team reviews the description of the issue and makes sure it is clear and understandable. If some parts are not clear, the Design Team contacts (e.g. through comments) the PO Team in order to clarify it.  
**DoD**: the issue is quality checked and ready for Graphical Design.  

2. Implement  
The issue is being worked on by the Graphical Design Team.  
**DoD**: the graphical design is completed, and a merge request is submitted.  

3. Peer-review  
The merge request and underlying code is reviewed by another member of the Graphical Design Team.  
**DoD**: the graphical design meets the graphical design principles and standards, the merge request is merged to the dev branch and deployed to the appropriate test environment (quality-assurance).  

4. Quality Assurance  
The PO Team tests the implementation of the graphical design in the quality-assurance environment.  
**DoD**: the graphical design of the issue is validated and meets the user acceptance criteria.  

5. Release  
_skipped_

### Technical (Dev) workflow
1. Review  
The Dev Team reviews the issue and makes sure that the expected outcome of the fix/implementation/solution is clear, feasible and appropriate.  
If some parts are not clear, then the Technical Team contacts (e.g. through comments) the previous team in the process (PO Team, Graphical Design Team or .NET.SQL Dev Team).  
**DoD**: the issue is quality checked. It has been validated by both PO and Technical Teams and it is ready for Implementation.  

2. Implement  
The issue is being implemented/solved by the Technical Team.  
Unit and feature tests are defined (when relevant) and performed (e.g. on a live API or based on mocks).  
**DoD**: the implementation is done, unit tests are green, and a merge request is submitted.  

3. Peer-review  
The merge request and underlying code is reviewed by a Lead Developer who is responsible for the quality of the code base.  
**DoD**: development meets the coding standards, and the merge request is merged to the dev branch and deployed to the appropriate functional test environment (quality-assurance).  
The code is documented.  

4. Quality Assurance  
The PO Team tests the implementation of the issue in the quality-assurance environment.  
**DoD**: the issue is fully tested and meets the user acceptance criteria.  
The feature is documented.  

5. Release  
The issue is released as part of the latest production version of the code.  
**NOTE**: at this stage, when an issue needs to be implemented by both .NET/SQL and JavaScript Dev Teams (see Production Cycle diagram): the Dev workflow is applied once by the .NET/SQL Dev Team, then it goes to the JavaScript Dev Team for review. The issue goes again through the same workflow until final release.  

### Technical (JavaScriptDev) workflow (wip)
{{< mermaid align="left" >}}
sequenceDiagram;
participant Review;
participant Implement;
participant PeerReview;
participant QA;
participant Release;
Note right of Review: no git;
Note right of PeerReview: technical (code, merge);
Review->>Implement: clear on specs;
Review->Implement: bug/patch/feature = new branch from develop;
Review->Implement: production related = new branch from master;
Implement->>PeerReview: development done;
{{< /mermaid >}}



