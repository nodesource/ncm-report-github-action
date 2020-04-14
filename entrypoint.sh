#!/bin/bash -l

if [[ "$2" = "yes" ]]
then
  IS_GITHUB_ACTION=true NCM_TOKEN=$1 ncm report --long
elif [[ "$3" = "yes" ]]
then
  IS_GITHUB_ACTION=true NCM_TOKEN=$1 ncm report --compliance
elif [[ "$4" = "yes" ]]
then
  IS_GITHUB_ACTION=true NCM_TOKEN=$1 ncm report --security
else
  FORCE_COLOR=2 IS_GITHUB_ACTION=true NCM_TOKEN=$1 ncm report
fi
