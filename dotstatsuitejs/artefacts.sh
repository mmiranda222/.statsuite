#!/bin/bash

set -o errexit

TOKEN=$1

if [ ! $TOKEN ]; then
  echo "Error: Missing token for download artefacts";
  echo "For more details go to https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html"
  exit 1;
fi

BRANCH=develop;
JOB=(setup build);

PROJECTS=(10537079 10283564 10532325 12189645 10631000 10822973);

CONFIG=config; #10537079
SEARCH=search; #10283564
DATA_EXPLORER=explorer; #10532325
DATA_VIEWER=viewer; #12189645
SHARE=share; #10631000
DLM=dlm; #10822973

FOLDERS=(${CONFIG} ${SEARCH} ${DATA_EXPLORER} ${DATA_VIEWER} ${SHARE} ${DLM});
trap "exit" INT

echo ' -- Download artifacts -- ';

for index in `seq 0 5`; do
  folder="${FOLDERS[index]}"
  project="${PROJECTS[index]}"

  [ ! -d "$folder" ] && mkdir $folder
  cd $folder

  for job in ${JOB[*]}; do
    echo "Downloading $folder $job"
    echo ""https://gitlab.com/api/v4/projects/$project/jobs/artifacts/$BRANCH/download?job=$job""
    curl --insecure -L -o $job.zip --header "PRIVATE-TOKEN: $TOKEN" \
      "https://gitlab.com/api/v4/projects/$project/jobs/artifacts/$BRANCH/download?job=$job"
  done

  cd ..
done

echo ' -- Unzip artifacts -- ';

for folder in ${FOLDERS[*]}; do
  cd $folder
  for job in ${JOB[*]}
    do
      if [ -f ./"$job".zip ]; then
        echo unzip $folder $job...
        unzip $job
        echo unzipped
      fi 
    done
  cd ..
done
