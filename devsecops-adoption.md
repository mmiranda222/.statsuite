# SIS-CC DevSecOps Adoption

### Level of Maturity  
![Level0](https://img.shields.io/badge/M-0-lightgrey) planned ![Level1](https://img.shields.io/badge/M-1-orange) initiated ![Level2](https://img.shields.io/badge/M-2-blue) available ![Level3](https://img.shields.io/badge/M-3-brightgreen) fully adopted

<table>
<thead>
<tr><th>Plan</th><th>Create</th><th>Check</th><th>Package</th><th>Secure</th><th>Release</th><th>Monitor</th></tr>
</thead>
<body>
<tr>
<td>[Wish-list](#wish-list)<br> ![Level3](https://img.shields.io/badge/M-3-brightgreen)</td>
<td>[Git flow](#git-flow)<br> ![Level3](https://img.shields.io/badge/M-3-brightgreen)</td>
<td>[CI (pipelines, auto-build, tests)](#ci)</td>
<td>[Checklist on doc and install guides updates](#checklist-on-doc-and-install-guides-updates)</td>
<td>[SAST](#sast)</td>
<td>[Continuous delivery](#continuous-delivery)</td>
<td>[Incident management](#incident-management)</td>
</tr>
<tr>
<td>[Flight Planner](#flight-planner)<br> ![Level3](https://img.shields.io/badge/M-3-brightgreen)</td>
<td>[Code onwer](#code-onwer)</td>
<td>[Code coverage](#code-coverage)</td>
<td>[Release evidence](#release-evidence)<br> ![Level3](https://img.shields.io/badge/M-3-brightgreen)</td>
<td>[DAST](#dast)</td>
<td>[Changelog](#changelog)<br> ![Level3](https://img.shields.io/badge/M-3-brightgreen)</td>
<td>[GTM & Product analytics](#gtm-product-analytics)</td>
</tr>
<tr>
<td>[Scheduled backlog & Iterations](#scheduled-backlog-iterations)<br> ![Level2](https://img.shields.io/badge/M-2-blue)</td>
<td>[Code review & Approvers](#code-review-approvers)</td>
<td>[Usability compliance](#usability-compliance)</td>
<td>[Milestone](#milestone)<br> ![Level3](https://img.shields.io/badge/M-3-brightgreen)</td>
<td>[Dependency scanning](#dependency-scanning)</td>
<td>[Metrics: number of releases](#metrics-number-of-releases)<br> ![Level2](https://img.shields.io/badge/M-2-blue)</td>
<td>[Metrics: new bugs](#metrics-new-bugs)<br> ![Level2](https://img.shields.io/badge/M-2-blue)</td>
</tr>
<tr>
<td>[Kanban boards](#kanban-boards)<br> ![Level3](https://img.shields.io/badge/M-3-brightgreen)</td>
<td>[Live preview](#live-preview)</td>
<td>[Performance Tests](#performance-tests)<br> ![Level1](https://img.shields.io/badge/M-1-orange)</td>
<td>[Docker Trusted Publisher](#docker-trusted-publisher)<br> ![Level0](https://img.shields.io/badge/M-0-lightgrey)</td>
<td>[Third-Party components vulnerability](#third-party-components-vulnerability)<br> ![Level2](https://img.shields.io/badge/M-2-blue)</td>
<td>[Recorded demos](#recorded-demos)</td>
<td>[Metrics: performance results](#metrics-performance-results)<br> ![Level2](https://img.shields.io/badge/M-2-blue)</td>
</tr>
<tr>
<td>[Time tracking](#time-tracking)<br> ![Level1](https://img.shields.io/badge/M-1-orange)</td>
<td>[Permissions rules](#permisisons-rules)<br> ![Level3](https://img.shields.io/badge/M-3-brightgreen)</td>
<td>[E2E tests](#end-to-end-tests)<br> ![Level1](https://img.shields.io/badge/M-1-orange)</td>
<td>-</td>
<td>[Code quality](#code-quality)</td>
<td>-</td>
<td>[Usability tests](#usability-tests)</td>
</tr>
<tr>
<td colspan="7"><b>Manage & Protect</b><br> [Groups & Subgroups](#groups-subgroups) ![Level3](https://img.shields.io/badge/M-3-brightgreen)<br> [Open-source compliance](#open-source-compliance) ![Level3](https://img.shields.io/badge/M-3-brightgreen)<br> [Metrics on issues, cycle-time, bottlenecks, Build vs. Run](#metrics-issues-cycle-time-bottlenecks-build-vs-run) ![Level2](https://img.shields.io/badge/M-2-blue)<br> [2FA](#2fa) ![Level1](https://img.shields.io/badge/M-1-orange)<br> [Container scan](#container-scan)<br> [GitLab backup](#gitLab-backup)</td>
</tr>
</body>
</table>

# :repeat: Plan
### Wish-list
The wish list is the public full list of recorded feature requests and feature enhancements yet to be reviewed and prioritized.  
https://gitlab.com/groups/sis-cc/-/issues?scope=all&state=opened&label_name[]=wish%20list

### Flight planner
This flight planner allows travellers [implementers] getting a better understanding of the foreseen flight stops [availability of features] and their approximate timing according to the current fuel level [resource capacity] and Community priorities, and so to plan their own flight boarding [deployment strategy] as best as possible.  
The flight planner is updated every two months or more frequently in order to reflect the progression of delivery.  
https://sis-cc.gitlab.io/dotstatsuite-documentation/about/product-overview/#flight-planner

### Scheduled backlog & Iterations
The Scheduled backlog represents the short-term delivery strategy. Each iteration of the Scheduled backlog is an attempt to produce a .NET or JavaScript release. The tickets in each iteration can be subject to change of order or delayed. An iteration or tickets of an iteration will go to implementation when there are available resources to work on.  
https://gitlab.com/groups/sis-cc/-/boards/2352801

:eyes: *Next step in maturity plan:* Integrate the slideshow presented at SIS-CC MLG meetings to the [overview page](https://sis-cc.gitlab.io/dotstatsuite-documentation/about/product-overview/#flight-planner) along with the flight planner, and update it online every two months or more frequently.

### Kanban boards
The Kanban boards represent the work in progress of the production cycle. Each step (review, implement, peer-review, qa, release) has a [Definition of Done](https://sis-cc.gitlab.io/dotstatsuite-documentation/contribution/issue-process/) according to the Production Cycle.  
https://gitlab.com/groups/sis-cc/-/boards/834539

### Time tracking
Report time spent in tickets to better understand share between Build efforts versus Maintenance efforts. The report on time spent is to be done in all tickets ([Time tracking](https://gitlab.com/help/user/project/time_tracking.md)), from its creation to its closure, but for a minimum of significant time (e.g. more than 10 or 15 minutes).  
The objective is to improve reporting on time-intensive tickets to the SIS-CCommunity and use this information to improve ticket content and prioritisation (Scheduled backlog & Iterations planning).

:eyes: PM team to ensure the full application of this rule, and start drafting new indicators for reporting/metrics periodic reports.

# :repeat: Create
### Git flow
Git workflow fully adopted and applied. See full documentaiton and process:  
https://sis-cc.gitlab.io/dotstatsuite-documentation/contribution/development-guidelines/#git-flow

### Code onwer

### Code review & Approvers

### Live preview
quick pushes, local demos

### Permisisons rules
**Protected branches** 
- develop
- master & main (**`main`** for newly created project in order to align new *Git* convention)

**Rules on protected branches**
- develop
  - allowed to merge = Developers and Maintainers
  - allowed to push = Developers and Maintainers
- master & main
  - allowed to merge = Maintainers
  - allowed to push = Maintainers

Exceptions: JavaScript services are following the same rules, with the exception that the JS Lead dev. manage the roles and permissions for Maintainers with overridenn rules for senior developers. 

# :repeat: Check
### CI
https://gitlab.com/sis-cc/dotstatsuite-documentation/-/blob/master/devops-dashboard.md

### Code coverage
https://gitlab.com/sis-cc/dotstatsuite-documentation/-/blob/master/devops-dashboard.md

### Usability compliance
usability tests, localisation, browsers' compatibility, wcag, SDMX standard

### Performance tests
https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-quality-assurance/-/blob/master/PerformanceTests/README.md

:eyes: Plug and run performance tests on **QA** CI pipelines

### End-to-end-tests
End to end tests (E2E tests) for testing the applications workflows from beginning to end, by replicating real user scenarios so that the system can be validated for integration and data integrity.

:eyes: PM team starts drafting end-to-end test scenarios to be integrated once RedPelicans delivers the E2E automated integration (by end of 2021 summer): https://gitlab.com/sis-cc/dotstatsuite-documentation/-/quality/test_cases

# :repeat: Package
### Checklist on doc and install guides updates

### Release evidence
Each release of a new version of a .Stat Suite service or application is tracked through a [milestone](#milestone) containing the link, for each service's release, to a snapshot of data that is related to it: a **release evidence**. The data are saved in a .json file and it "includes test artifacts and linked milestones to facilitate internal processes, like external audits."  
Example of a release evidence accessible for download: https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/releases/v9.0.0

### Milestone
GitLab's milestones are used to scope a .Stat Suite release. Following the process described [here](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/blob/master/recipes/how-to-release-js.md), a milestone is created in the .stat-suite sub-group once a JavaScript or .NET release is planned. Issues are associated to the milestone, and the following information is added to its description:
- technical changelog
- the list of links to each service's tag, release, commit and docker image
- any additional dependency (e.g. ESTAT nsiws compatibility)

Link to all .Stat Suite milestones: https://gitlab.com/dashboard/milestones

### Docker Trusted Publisher
https://docs.docker.com/docker-hub/publish/

# :repeat: Secure
### SAST

### DAST

### Dependency scanning

### Third-Party components vulnerability
Third-party components used in the .Stat Suite can be potentially security vulnerable, and they are thus tracked by version in order to address and take action upon security disruption in the .Stat Suite.  
**Process:**
- Each third-party component is tracked with automated notifications received directly by the corresponding vendor or any other trusted platform.
- Each new reported vulnerability is added to a dashboard list *(accessible to members only)* and reviewed by the Solution Team.
- When relevant, the Solution team creates a *confidential* GitLab ticket that is added to the kanban board and prioritized according to the level of vulnerability.

Third-party components vulnerability dashboard *(for team members only)*: https://gitlab.com/sis-cc/dotstatsuite-documentation/-/snippets/2148995

### Code quality

# :repeat: Release
### Continuous delivery
https://gitlab.com/sis-cc/dotstatsuite-documentation/-/blob/master/devops-dashboard.md

### Changelog
The changelog page of the .Stat Suite products https://sis-cc.gitlab.io/dotstatsuite-documentation/changelog/ is prepared and updated after each verified deployment. Each entry of the changelog reports on the release date, technology product (.NET, JavaScript), semantic version of the release and corresponding services.  
Each new release recorded in the changelog indicates:
- the name and version of the release
- the link to the related [GitLab miletone](#milestone)
- the services impacted by the release
- the compatibility version with external dependencies when it is relevant
- the list of GitLab issues (with hyperlinks) with a meaningful title and description.

All released issues must be listed and ordered by semantic change impact:
- major change with backward-incompatiblity
- minor change
- patch change

### Metrics: number of releases
The total number of releases is automatically reported in GitLab [here](https://gitlab.com/groups/sis-cc/.stat-suite/-/analytics/ci_cd) but also on a weekly basis.  
*(accessible to members only)* [Weekly reports](https://community.oecd.org/community/siscc-governance/content?filterID=contentstatus%5Bpublished%5D~category%5Bstat-suite-weekly-reports%5D)

:eyes: Better prepare and automate the .Stat Suite weekly reports, using GitLab API + Power BI

### Recorded demos

# :repeat: Monitor
### Incident management
Support, Bugs, reactivity & priority

### GTM & Product analytics

### Metrics: new bugs
The number of new bugs is reported on a weekly basis.  
*(accessible to members only)* [Weekly reports](https://community.oecd.org/community/siscc-governance/content?filterID=contentstatus%5Bpublished%5D~category%5Bstat-suite-weekly-reports%5D)

:eyes: Better prepare and automate the .Stat Suite weekly reports, using GitLab API + Power BI

### Metrics: performance results
*tbc*  
https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-quality-assurance/-/tree/master/PerformanceTests#contents

:eyes: establish a periodic report of performances test results, at minimum after each new .Stat Suite release, with baselines and objectives.

### Usability tests

# :repeat: Manage & Protect
### Groups & Subgroups
Projects are managed by groups and sub-groups under the root GitLab SIS-CC group: https://gitlab.com/sis-cc.  
Each sub-group is independent from the others in terms of projects, meaning no limitation of numbers, and members, meaning that new members can be added to specific sub-groups.  

### Open-source compliance
The GitLab SIS-CC group, its sub-groups and underlying projects are open-source compliant and meet the following requirements:
- All of the code hosted in this GitLab group must be published under [OSI-approved open source licenses](https://opensource.org/licenses/category).
- The organisation (or underlying product) must not seek to make a profit through services or by charging for higher tiers (accepting donations to sustain the efforts is ok).
- The GitLab group, sub-groups and underlying source code must be publicly visible and publicly available (with the exception to very limited private projects).

Read also our [Code of Conduct](https://sis-cc.gitlab.io/dotstatsuite-documentation/about/code-of-conduct/).

### Metrics: issues, cycle-time, bottlenecks, Build vs. Run
Metrics reported on a weekly basis: number of issues per production cycle step (whish list, Scheduled backlog, Kanban, delivered), work-in-progress tickets by type of activity, ratio of closed tickets by activity, average cycle time, highlights.  
*(accessible to members only)* [Weekly reports](https://community.oecd.org/community/siscc-governance/content?filterID=contentstatus%5Bpublished%5D~category%5Bstat-suite-weekly-reports%5D)

:eyes: Better prepare and automate the .Stat Suite weekly reports, using GitLab API + Power BI

### 2FA
Two-factor Authentication (2FA) provides an additional level of security to users’ GitLab account withint our team members: https://gitlab.com/groups/sis-cc/-/group_members

:eyes: To be adopted by all members having a minimum of *Reporter* permission (or we enforce it to all users https://docs.gitlab.com/ee/security/two_factor_authentication.html#enforcing-2fa-for-all-users).

### Container scan

### GitLab backup
Being able to manually or automatically schedule a full backup of GitLab content, meaning code + issues.  
If not possible, being able to perform a manual periodic export of the content.
