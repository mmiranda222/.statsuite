#!/bin/bash

# any common tag or branch is valid
# ./artefacts.sh <your-token> wave
# ./artefacts.sh <your-token> master

set -o errexit

TOKEN=$1
TAG=$2

if [ ! $TOKEN ]; then
  echo "Error: Missing token for download artefacts";
  echo "For more details go to https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html"
  exit 1;
fi

JOBS=(setup build-srv build-dist);
PROJECTS=(dotstatsuite-data-explorer dotstatsuite-data-viewer dotstatsuite-data-lifecycle-manager dotstatsuite-sdmx-faceted-search dotstatsuite-share dotstatsuite-config dotstatsuite-proxy);

trap "exit" INT

for project in ${PROJECTS[*]}; do
  echo "Processing $project..."
  [ ! -d "$project" ] && mkdir $project
  cd $project

  for job in ${JOBS[*]}; do
    id="$project-$TAG-$job"
    url="https://gitlab.com/sis-cc/.stat-suite/$project/-/jobs/artifacts/$TAG/download?job=$job"
    if curl --insecure --fail -s -L -o $id.zip --header "PRIVATE-TOKEN: $TOKEN" $url; then
      echo "Downloading $id"
      curl --insecure -s -L -o $id.zip --header "PRIVATE-TOKEN: $TOKEN" $url
    fi;
    if [ -f ./"$id".zip ]; then
      echo "Unzipping $id"
      unzip -qq $id
    fi
  done

  cd ..
done
