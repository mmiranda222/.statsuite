---
title: Report an issue
subtitle: 
comments: false
weight: 33
---



## New issue
If you want to report an issue for any of the .Stat Suite applications, then you need to **open a new issue** into [Gitlab sis-cc/.Stat Suite issues](https://gitlab.com/groups/sis-cc/.stat-suite/-/issues).<br>
You can first try to find out if your issue (a bug or a new feature) has already been reported.<br>

Any new issue needs to be created in a specific .Stat Suite project. The list being quite long, if you don't know to which specific service, tool or application to refer to, then go for the simplest, e.g. *dotstatsuite-data-explorer*.<br>

There are two types of issues you can create: whether you want to report a **bug**, or you want to suggest a **significant change** (a new feature or an improvement of an existing behavior).<br>
For each type, when creating the new issue, please add the related **gitlab label**: *bug* or *feature*. <br>

![Gitlab Issue with label](/images/GitlabIssueLabel.png)

If you want to fix a bug yourself, then please refer to [How to contribute](https://sis-cc.gitlab.io/dotstatsuite-documentation/page/contributing/how-to-contribute/).<br>

## Writing a good issue
When reporting a **bug**:<br>
 - Describe what went wrong, what is the expected behavior and if relevant, what caused the problem;<br>
 - If it is not obvious, then list the steps to follow for someone else to reproduce the bug;<br>
 - Screenshots are sometimes very useful to understand the problem;<br>
 - In some cases (server-side errors, API queries, etc.) F12 console details or logs are extremely helpful.<br>

When suggesting a **feature**:<br>
 - Describe what you would expect to see as a user of the related application (e.g. "as a .Stat Data Explorer user, I want to be able to...");<br>
 - The full behavior and acceptance criteria will help understand the meaning of the feature;<br>
 - Give a clear description of the purpose of the feature, what is the outcome and added-value for the user.<br>

## Issue process and Definitions of Done (DoD)
Every open issue will follow the agreed and below defined production cycle, in regards to quality criteria and relevance assessed by the Project Management (PM) Team and the Technical (Dev) Team.<br>
The full workflow goes from open to PM, Design and Dev Teams (back-end and front-end), including review, quality check, implementation, peer-review, unit test and release, then finally closed.<br>
In some cases of course some steps are skipped, e.g. a bug will not go through Graphical Design steps.<br>
If at some point an issue has a very low activity after 12 months, it should then be closed. Nonetheless, re-opening an issue might still happen if someone is still willing for it.<br>

### Production Cycle

<!---```mermaid
sequenceDiagram;
open->>PM: all issues;
PM->>Design: some features;
PM->>DevBackEnd: without design but with back-end;
PM->>DevFrontEnd: without design nor back-end;
Design->>DevBackEnd: with design & back-end;
Design->>DevFrontEnd: with design but without back-end;
DevBackEnd->>DevFrontEnd: with back-end & front-end;
DevBackEnd-xclosed: with back-end but without front-end;
DevFrontEnd-xclosed: with front-end;
PM--xclosed: some issues;
```--->

The below diagram gives an overview of the Production cycle ran for each of the opened issues and according to the acceptance criteria, and for all types of issues (bugs or features).<br>
The Technical (Dev) Team is here declined by back-end and front-end technology.

![Issue process workflow overview](/images/IssueProcessWorkflow.png)


### Project Management worflow
1. Review<br>
A member of the PM Team reviews the content of the opened issue and makes sure it meets the minimal and expected quality criteria. If some parts are not clear, the PM Team member contacts (through comments) the person who has reported the issue in order to clarify it.<br>
A bug's type must be clear enough to identify and reproduce it.<br>
A feature's type must have a clear detail of the functional (or technical) requirements.<br>
**DoD**: the issue is created and quality checked.<br>

2. Implement<br>
For a bug: _skipped_<br>
For a feature: a member of the PM Team defines and describes the functional specifications out of the requirements.<br>
**DoD**: the issue is quality checked and functional specifications for a feature are described.<br>

3. Peer-review<br>
_skipped_

4. Quality Assurance<br>
The PM Team reviews the issue and sets a priority indication.<br>
**DoD**: the issue meets the PM quality criteria, is prioritised and ready for Graphical Design (if relevant) or Implementation.<br>

5. Release<br>
_skipped_

### Graphical Design worflow
1. Review<br>
The Graphical Design Team reviews the description of the issue and make sure it is clear and understandable. If some parts are not clear, the Design Team contacts (through comments) the PM Team in order to clarify it.<br>
**DoD**: the issue is quality checked and ready for Implementation.<br>

2. Implement<br>
The issue is being worked on by the Graphical Design Team.<br>
**DoD**: The graphical design is completed, and a merge request is submitted.<br>

3. Peer-review<br>
The merge request and underlying code is reviewed by a third-party member of the Graphical Design Team.<br>
**DoD**: the graphical design meets the coding standards, the merge request is merged to the dev branch and deployed to the appropriate test environment (quality-assurance).<br>

4. Quality Assurance<br>
The PM Team tests the implementation of the graphical design in the quality-assurance environment.<br>
**DoD**: the graphical design of the issue is validated and meets the user acceptance.<br>

5. Release<br>
_skipped_

### Technical (Dev) worflow
1. Review<br>
The Dev Team reviews the issue and make sure that the fix/implementation/solution that it requires is clear.<br>
If some parts are not clear, the Technical Team contacts (through comments) the PM Team or Graphical Design Team (or the back-end Dev Team when the review is made on an issue delt by the front-end Team and previously worked by back-end Team).<br>
**DoD**: the issue is quality checked. It has been validated by both PM and Technical Teams and it is ready for Implementation.<br>

2. Implement<br>
The issue is being worked on by the Technical Team.<br>
**DoD**: The development is implemented, including unit tests, and a merge request is submitted.<br>

3. Peer-review<br>
The merge request and underlying code is reviewed by a third-party member of the Technical Team.<br>
**DoD**: Development meets the coding standards, unit tests are green and the merge request is merged to the dev branch and deployed to the appropriate functional test environment (quality-assurance).<br>
The code is documented.<br>

4. Quality Assurance<br>
The PM Team tests the implementation of the issue in the quality-assurance environment.<br>
**DoD**: the issue is fully tested and meets the user acceptance.<br>
The feature is documented.<br>

5. Release<br>
The issue is released as part of the latest production version of the code.<br>
**NOTE**: at this stage, some issues are worked on by both back-end and front-end Dev Teams (see Production Cycle diagram). In these cases, the Dev workflow is applied once by the back-end Dev Team, then the issue is "released" to the front-end Dev Team for review and the same workflow is followed a second time until final release.<br> 