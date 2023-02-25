#!/bin/bash -l

rm -rf package-lock.json

if [[ "$2" = "yes" ]]
then
  FORCE_COLOR=1 IS_GITHUB_ACTION=true NCM_TOKEN=$1 ncm report --long
elif [[ "$3" = "yes" ]]
then
  FORCE_COLOR=1 IS_GITHUB_ACTION=true NCM_TOKEN=$1 ncm report --compliance
elif [[ "$4" = "yes" ]]
then
  FORCE_COLOR=1 IS_GITHUB_ACTION=true NCM_TOKEN=$1 ncm report --security
else
  FORCE_COLOR=1 IS_GITHUB_ACTION=true NCM_TOKEN=$1 ncm report
fi
