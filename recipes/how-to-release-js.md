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
    1. bump version in package.json in develop
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
