# how to release (JS)

1. define a scope about issues ([board](https://gitlab.com/groups/sis-cc/-/boards/1200479?label_name[]=JavaScript)) to include in the release in order to define next semver (major, minor, patch)
1. identify service/app to release (see template for the list)
1. define a semver compliant with changes of 1. and upper than all underlying releases from all service/app (see template for the list).
1. create a **milestone** at [.stat-suite level](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones) following the name convention: `dotstatsuiteJS@v<semver>`
1. assign [issues](https://gitlab.com/groups/sis-cc/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=JavaScript&label_name[]=s%3A%3Arelease) to the milestone
1. for each service/app:
    1. check develop branch history to pick the latest acceptable commit for a release (pipeline passed required)
    1. bump version
    1. create a release branch based on this commit following the name convention: `release-v<semver>`
    1. create a merge request from the release into master (default based on branch name is fine), bind it the the milestone
    1. check diff and wait for pipeline to pass and merge it to master
    1. if needed (last minute fixes), merge back to develop
    1. close related issues
    1. create a **tag** on master (default latest) with a **release** (add a description in optional release description) following the name convention: `v<semver>`
    1. paste the tag link in the milestone description (releases row)
    1. when deployement done (check pipeline), check the commit healthcheck of the service/app in staging ([dashboard for healtcheck list](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/blob/master/devops-dashboard.md))
1. the milestone should contain:
    - a list of related issues with their related merge requests (discrete diffs)
    - a list of merge requests from develop to master branches (global diffs)
    - a changelog for none obvious changes
    - a list of tags/releases
    - a list of commits to ease update from source code

**notes**:
- a change of data in config is not considered as a release since the service itself hasn't changed

**template**:

|icon|[explorer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer)|[viewer](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-viewer)|[dlm](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-lifecycle-manager)|[sfs](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-sdmx-faceted-search)|[share](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-share)|[config](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config)|[proxy](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-proxy)|
|---|---|---|---|---|---|---|---|
|releases|-|-|-|-|-|-|-|
|commits|-|-|-|-|-|-|-|
|docker|-|-|-|-|-|-|-|

> use https://gitmoji.carloscuesta.me/ for visual help
