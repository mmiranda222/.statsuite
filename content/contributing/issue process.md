---
title: Issue process and Definitions of Done(DoD)
subtitle: 
comments: false
weight: 34
---


Every opened issue (see [here](https://sis-cc.gitlab.io/dotstatsuite-documentation/page/contributing/report-an-issue/) how to report a new issue) will follow the agreed and below defined production cycle, in regards to quality criteria and relevance assessed by the Product Management (PM) Team and the Technical (Dev) Team.<br>
The full workflow goes from open to PM, Graphical Design and Dev Teams (back-end and front-end), including review, quality check, implementation, peer-review, quality assurance and release, then finally closed.<br>
In some cases of course some steps are skipped, e.g. a bug will not go through Graphical Design steps.<br>
If at some point an issue has a very low activity after 12 months, it should then be closed. Nonetheless, re-opening an issue might still happen if someone is still willing for it.<br>

### Production Cycle

<!---```mermaid
sequenceDiagram;
open->>PM: all issues;
PM->>Design: all features with UI impact;
PM->>DevBackEnd: without UI impact but with back-end;
PM->>DevFrontEnd: without UI impact nor back-end;
Design->>DevBackEnd: with back-end;
Design->>DevFrontEnd: without back-end;
DevBackEnd->>DevFrontEnd: with front-end;
DevBackEnd-xclosed: without front-end;
DevFrontEnd-xclosed: ;
PM--xclosed: rejected issues;
```--->

The below diagram gives an overview of the Production cycle ran for each of the opened issues and according to the acceptance criteria, and for all types of issues (bugs or features).<br>
The Technical (Dev) Team is here divided into back-end and front-end technology.

![Issue process workflow overview](/images/IssueProcessWorkflow.png)

### Common rules
- An issue can go through several iterations of the process cycle through Product Management, Graphical Design, Back-End Dev and Front-End Dev teams.
- At any step of a process, an issue can be put on hold or be retrogated.
- A Definition of Done (DoD) of a process step must be met and completed before an issue goes to any next step of the workflow.

### Product Management workflow
1. Review<br>
A member of the PM Team reviews the content of the opened issue and makes sure it meets the minimal and expected quality criteria. If some parts are not clear, the PM Team member contacts (e.g. through comments) the person who has opened the issue in order to clarify it.<br>
**DoD**: the issue is created and quality checked:<br>
A bug's type must be clear enough to identify and reproduce it.<br>
A feature's type must have a clear detail of the functional or non-functional requirements.<br>

2. Implement<br>
For a bug: _skipped_<br>
For a feature: a member of the PM Team defines and describes the functional specifications based on the requirements.<br>
For all types of issue, the PM Team sets a priority indication.<br>
**DoD**: the issue is quality checked, prioritised, and functional specifications for a feature are described.<br>

3. Peer-review<br>
The PM Team reviews the issue and its priority indication.<br>
**DoD**: the issue meets the PM quality criteria and it is ready for Graphical Design (if relevant) or Dev Team review.<br>

4. Quality Assurance<br>
_skipped_

5. Release<br>
_skipped_

### Graphical Design workflow
1. Review<br>
The Graphical Design Team reviews the description of the issue and makes sure it is clear and understandable. If some parts are not clear, the Design Team contacts (e.g. through comments) the PM Team in order to clarify it.<br>
**DoD**: the issue is quality checked and ready for Graphical Design.<br>

2. Implement<br>
The issue is being worked on by the Graphical Design Team.<br>
**DoD**: the graphical design is completed, and a merge request is submitted.<br>

3. Peer-review<br>
The merge request and underlying code is reviewed by another member of the Graphical Design Team.<br>
**DoD**: the graphical design meets the graphical design principles and standards, the merge request is merged to the dev branch and deployed to the appropriate test environment (quality-assurance).<br>

4. Quality Assurance<br>
The PM Team tests the implementation of the graphical design in the quality-assurance environment.<br>
**DoD**: the graphical design of the issue is validated and meets the user acceptance criteria.<br>

5. Release<br>
_skipped_

### Technical (Dev) workflow
1. Review<br>
The Dev Team reviews the issue and make sure that the expected outcome of the fix/implementation/solution is clear, feasible and appropriate.<br>
If some parts are not clear, then the Technical Team contacts (e.g. through comments) the previous team (PM Team, Graphical Design Team or back-end Dev Team).<br>
**DoD**: the issue is quality checked. It has been validated by both PM and Technical Teams and it is ready for Implementation.<br>

2. Implement<br>
The issue is being implemented/solved by the Technical Team.<br>
Unit and feature tests are defined (when relevant) and performed (e.g. on a live API or based on mocks).<br> 
**DoD**: the implementation is done, unit tests are green, and a merge request is submitted.<br>

3. Peer-review<br>
The merge request and underlying code is reviewed by a Lead Developer who is responsible for the quality of the code base.<br>
**DoD**: development meets the coding standards, and the merge request is merged to the dev branch and deployed to the appropriate functional test environment (quality-assurance).<br>
The code is documented.<br>

4. Quality Assurance<br>
The PM Team tests the implementation of the issue in the quality-assurance environment.<br>
**DoD**: the issue is fully tested and meets the user acceptance.<br>
The feature is documented.<br>

5. Release<br>
The issue is released as part of the latest production version of the code.<br>
**NOTE**: at this stage, when an issue needs to be implemented by both back-end and front-end Dev Teams (see Production Cycle diagram): the Dev workflow is applied once by the back-end Team, then it is "released" to the front-end Team for review. The issue goes again through the same workflow until final release.<br> 