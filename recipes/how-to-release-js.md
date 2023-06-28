# how to release (JS)

## conventions
- a release (gitab milestone) is used to centralize information about .Stat Suite states
- a release should includes 4 entries:
  - an operational changelog (breaking changes on kube strategies, docker image definitions)
  - a config changelog (breaking changes in settings, tenants)
  - an i18n changelog (generated with a script)
  - a summary of the .Stat Suite with links to gitlab releases, docker images
- the release has a name that is used to tag 2 things:
  - gitlab commits in master
  - docker images
- the semantic versioning is used **within** services/apps

## sample
- the .Stat Suite has 2 apps (DE, DLM) to simplify the sample
- previous release was named `jupiter`, the version of DE is `14.0.3` and the version of DLM is `10.0.1`
- new release is named `saturne` and only DE has been updated with a minor change
- after the release process:
  - in the DE repo, the latest commit in master will have 2 tags: `saturne` & `14.1.0`
  - in the DLM repo, the latest commit in master will have 2+1 tags: `saturne` & `jupiter` & `10.0.1`
  - in dockerhub, a new DE docker image will have 4 tags:  `saturne` & `14.1.0` & `master` & `<commithash>`
  - in dockerhub, the existing DLM docker image will have 4+1 tags:  `saturne` & `jupiter` & `10.0.1` & `master` & `<commithash>`

## flow

#### main
1. @j3an-baptiste draft a **milestone** at [.stat-suite level](https://gitlab.com/groups/sis-cc/.stat-suite/-/milestones): `dotstatsuiteJS` _(no more version at release level)_
1. issues from ([board](https://gitlab.com/groups/sis-cc/-/boards/1200479?label_name[]=JavaScript)) (not only release column) are attached to the milestone
1. rename the milestone with a name: `dotstatsuiteJS@<name>`
1. run helper in [config-data repo](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data) to get all related merge requests:
    - `yarn helper:mergerequests dotstatsuiteJS@<name> $GITLAB_API_KEY`
    - find GITLAB_API_KEY [here](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data/-/settings/ci_cd), section variables
1. remove merge requests from dependencies and deduce from the list of remaining merge requests the concerned services/apps
1. for each kube:
    - _transpose_ QA changes to Staging
    - update the **operational changelog** with kube diffs
    - update the kubernetes column of the summary
1. for each service/app:
    1. compare develop (or the latest acceptable commit for a release if QA is ahead) and master to define a semver (ie for [DE](https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-data-explorer/-/compare/master...develop?from_project_id=10532325))
    1. bump version in package.json in develop & update package-lock.json for vuln report (npm)
    1. add in the release the client impact
    1. create a release branch based on this commit following the name convention: `release-v<semver>`
    1. create a merge request from the release branch into master (default based on branch name is fine), bind it the the milestone, **no squash but rm branch afterwards**
    1. check diff and wait for pipeline to pass and merge it to master
        - a pipeline will create a docker image with the following tags: `master` & `<commithash>`
    1. if needed (last minute fixes), merge back to develop
    1. create a **tag** `v<semver>` on master
        - a pipeline will create a docker image with the following tag: `10.0.1`
    1. create a release by editing the tag and put an icon in the description
    1. wait the end of the pipeline to have a ref image in docker for named tag
    1. create a **tag** `<name>` on master using the gitlab release name
        - a pipeline will create a docker image with the following tag: `<name>`
    1. check in Docker the full chain: image with expected commit, image with same digest for tag, release and master
    1. run `node ./scripts/i18n-changelog.js spin radio` in the repo config-data to have the i18n changelog
    1. when deployement done (check pipeline), check the commit healthcheck of the service/app in staging ([dashboard for healtcheck list](https://gitlab.com/sis-cc/dotstatsuite-documentation/-/blob/master/devops-dashboard.md))

#### optionals
1. restart search service to load updated config (clean and re-index if major change related to search or if space/datasources have been updated)

#### hotfix
1. [OECD-PM] create a task in RedPelicans (RP) board (not an incident):
  - an incident is a technical issue local to an env
  - an incident should be fixed without code change because it has to be fast (ie, service(s) are interrupted)
  - worse case scenario for an incident is the rollback
  - an incident doesn't have a flow to follow
  - a task follows the flow (staging (often*), pre-prod (always), prod)
1. [OECD-DEV] create a MR based on master (and targeting master)
1. [OECD-DEV] merge the hotfix (keep the hotfix branch to backpport in develop later), merge potential config MR required for testing
1. [OECD-PM] test in staging (often*, staging can be ahead of what is deployed in production if the hotfix is done while creating a new release that is not yet deployed)
1. [RP] update in pre-prod the kubernetes strategy (a hotfix will rarely concern several strategies) with the commit hash of the newly created docker image, merge potential config MR required for testing
  - the release tag is not changed until full pre-prod validation
  - to ease maintance, release tag is used in kubernetes stratgies of pre-prod and prod
  - updating the release tag before testing pre-prod may (in case of GCP/GKE restart) update both pre-prod and prod
1. [OECD-PM] validates pre-prod
1. [OECD-DEV] delete release tag and create release tag on master (move):
  - except if the hotfix is done while creating a new release that is not yet deployed
1. [RP] update in prod the kubernetes strategy with the release tag (rollout restart), merge potential config MR required
  - except if the hotfix is done while creating a new release that is not yet deployed, apply the commit hash used in pre-prod

#### hotfix aftermath
1. [OECD-DEV] update release notes (milestone)
1. [OECD-DEV] backport hotfix in develop
