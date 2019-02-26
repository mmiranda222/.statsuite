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
Every open issue will follow the below process steps, in regards to quality criteria and relevance assessed by the Project Management (PM) Team and the Technical (Dev) Team.<br>
The full workflow goes from open to PM, Design and Dev Teams, including reviews, quality check, implementation, peer-review and unit tests.<br>
In some cases of course some steps are skipped, e.g. a bug will not go through Design steps.<br>
If at some point an issue has a very low activity after 12 months, it should then be closed. Nonetheless, re-opening an issue might still happen if someone is still willing for it.<br>

<!---```mermaid
sequenceDiagram;
open->>PM: all issues;
PM->>Design: some features;
PM->>Dev: all issues without design;
Design->>Dev: all features with design;
Dev-xclosed: all issues;
PM--xclosed: some issues;
```--->


![Issue process workflow overview](/images/IssueProcessWorkflow.png)


### Project Management worflow
1. Review<br>
A member of the PM Team reviews the content of the opened issue and make sure it meets the minimal and expected quality criteria. If some parts are not clear, the PM Team member contacts (through comments) the person who has reported the issue in order to clarify it.<br>
**DoD**: the issue is created and quality checked.<br>

2. Implement<br>
_skipped_

3. Peer-review<br>
_skipped_

4. Quality Assurance<br>
The PM Team reviews the issue and sets a priority indication.<br>
**DoD**: the issue meets the PM quality criteria, is prioritised and ready for Design (if relevant) or Implementation.<br>

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
If some parts are not clear, the Technical Team contacts (through comments) the PM Team or Graphical Design Team.<br>
**DoD**: the issue is quality checked. It has been validated by both PM and Technical Teams and it is ready for Implementation.<br>

2. Implement<br>
The issue is being worked on by the Technical Team.<br>
**DoD**: The development is implemented, including unit tests, and a merge request is submitted.<br>

3. Peer-review<br>
The merge request and underlying code is reviewed by a third-party member of the Technical Team.<br>
**DoD**: Development meets the coding standards, unit tests are green and the merge request is merged to the dev branch and deployed to the appropriate functional test environment (quality-assurance).<br>

4. Quality Assurance<br>
The PM Team tests the implementation of the issue in the quality-assurance environment.<br>
**DoD**: the issue is fully tested and meets the user acceptance.<br>

5. Release<br>
The issue is released as part of the latest production version of the code.<br>
