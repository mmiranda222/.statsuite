# how to release (JS)

main:
1. @j3an-baptiste draft a **milestone** at [.stat-suite level](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones): `dotstatsuiteJS@vx.x.x`
1. issues from ([board](https://gitlab.com/groups/sis-cc/-/boards/1200479?label_name[]=JavaScript)) (not only release column) are attached to the milestone
1. given the list of issues, define a semver and rename the milestone
1. run helper pipeline in [config-data repo](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data) with the env var MILESTONE to get the list of merge requests
1. from the list of merge requests, note concerned services/apps
1. for each merge requests:
    - check kubernetes update to properly update staging (semver major if mandatory update to keep default)
    - check non-backward updates in specific data (siscc-config-data) to eventually update staging (semver major if any)
1. for each service/app:
    1. check develop branch history to pick the latest acceptable commit for a release (pipeline passed required)
    1. bump version in package.json
    1. create a release branch based on this commit following the name convention: `release-v<semver>`
    1. create a merge request from the release into master (default based on branch name is fine), bind it the the milestone, **no squash but rm branch afterwards**
    1. check diff and wait for pipeline to pass and merge it to master
    1. if needed (last minute fixes), merge back to develop
    1. create a **tag** on master with a **release** (add a description in optional release description) following the name convention: `v<semver>`
    1. paste the tag link in the milestone description (releases row) and attached it to the milestone
    1. when deployement done (check pipeline), check the commit healthcheck of the service/app in staging ([dashboard for healtcheck list](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/blob/master/devops-dashboard.md))

optionals:
1. restart search service to load updated config (clean and re-index if major change related to search or if space/datasources have been updated)


the milestone should contain:
  - a list of related issues with their related merge requests (discrete diffs)
  - a list of merge requests from develop to master branches (global diffs)
  - a changelog for none obvious changes
  - a list of tags/releases
  - a list of commits to ease update from source code
  - a i18n-changelog from dotstatsuite-config-data (pipeline triggered only on tags)

notes:
- a change of data in config is not considered as a release since the service itself hasn't changed
