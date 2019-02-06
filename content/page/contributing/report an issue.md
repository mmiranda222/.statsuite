---
title: Report an issue
subtitle: 
comments: false
weight: 32
---



# Report an issue
If you want to report an issue for any of the .Stat Suite application, then you need to **open a new issue** into [Gitlab sis-cc/.Stat Suite issues](https://gitlab.com/groups/sis-cc/.stat-suite/-/issues).<br>
You can first try to find out if your issue (a bug or a new feature) has already been reported.<br>

Any new issue needs to be created in a specific .Stat Suite project. The list being long, if you don't know to what specific service, tool or application your issue refers to, then go for the simplest, e.g. *dotstatsuite-data-explorer*.<br>

There are two types of issues you can create: whether you want to report a **bug**, or you want to suggest a **significant change** (a new feature or an enhancement in a existing behavior).<br>
For each type, when creating the new issue, please add the related **gitlab label**: *bug* or *feature*. <br>
![Gitlab Issue with label](content/images/GitlabIssueLabel.png)

If you want to fix a bug yourself, then please refer to [How to contribute](https://sis-cc.gitlab.io/dotstatsuite-documentation/page/contributing/how-to-contribute/).<br>

## Writing a good issue
When reporting a **bug**:
 - Describe what went wrong and if necessary, what caused the problem.
 - If it s not obvious, list the steps to follow for someone else to reproduce the bug.
 - Screenshots are sometimes very helpful.
 - In some cases (server-side errors, API queries, etc.) F12 console details or logs will be extremely helpful.

When suggesting a **feature**:
 - Describe what you would expect to see as a user of the related application (e.g. "as a .Stat Data Explorer user, ...").
 - The full behavior and acceptance criteria will help understand the meaning of the feature.
 - Give a clear description of the purpose of the feature, what is the outcome and added-value to the user.

## Issue process and Definitions of Done (DoD)
Every open issue will follow the below process steps, in regards to the quality criteria and relevance of it assessed by the Project Management (PM) Team and the Technical Team.<br>
If at some point an issue has a very low activity after 12 months, it should then be closed. Nonetheless, re-opening an issue might still happen if someone is still willing for it.<br>

**1. Review**<br>
The PM Team reviews the content of the opened issue and make sure it meets the minimal and expected quality criteria. If some part is not clear, the PM Team must contact (through comments) the person who reported the issue in order to clarify it.<br>
A priority indication can be set to an issue once it meets the quality criteria acceptance.<br>
The Technical Team reviews the issue and make sure that the fix/implementation that it requires is clear.<br>
DoD: the issue is created, quality checked and prioritised. It has been validated by both the PM and the Technical Teams. It is ready for Implement.<br>

**2. Implement**<br>
The issue is being worked on by the Technical Team.<br>
DoD: The development is implemented, including unit tests, and a pull request is submitted.<br>

**3.Peer-review**<br>
The pull request and underlying code is reviewed by a third-party member of the Technical Team.<br>
DoD: Development meets the coding standards, unit tests are green and the pull request is merged to the master branch and deployed to the appropriate functional test environment (pre-production).<br>

**4.QA**<br>
The PM Team tests the implementation of the issue in a pre-production environment.<br>
DoD: the issue is fully tested and meets the user acceptance.<br>

**5.Release**<br>
The issue is released as part of the latest production version of the code.<br>
