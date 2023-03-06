#!/bin/bash -l

npm i

if [[ "$2" = "yes" ]]
then
  FORCE_COLOR=1 IS_GITHUB_ACTION=true NCM_TOKEN=$1 ncm report --json --long --gate > report.json
elif [[ "$3" = "yes" ]]
then
  FORCE_COLOR=1 IS_GITHUB_ACTION=true NCM_TOKEN=$1 ncm report --json --compliance --gate > report.json
elif [[ "$4" = "yes" ]]
then
  FORCE_COLOR=1 IS_GITHUB_ACTION=true NCM_TOKEN=$1 ncm report --json --security > report.json
else
  FORCE_COLOR=1 IS_GITHUB_ACTION=true NCM_TOKEN=$1 ncm report --json > report.json
fi
