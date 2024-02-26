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

JOBS=(yarn-dependencies build-srv build-dist);
PROJECTS=(dotstatsuite-data-explorer:explorer dotstatsuite-data-viewer:viewer dotstatsuite-data-lifecycle-manager:dlm dotstatsuite-sdmx-faceted-search:search dotstatsuite-share:share dotstatsuite-config:config dotstatsuite-proxy:proxy);

trap "exit" INT

for project in ${PROJECTS[*]}; do
  readarray -d ":" -t projectdir <<< "$project"
  echo "Processing ${projectdir[0]}..."
  [ ! -d "${projectdir[1]}" ] && mkdir ${projectdir[1]}
  cd ${projectdir[1]}

  for job in ${JOBS[*]}; do
    id="${projectdir[0]}-$TAG-$job"
    url="https://gitlab.com/sis-cc/.stat-suite/${projectdir[0]}/-/jobs/artifacts/$TAG/download?job=$job"
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
