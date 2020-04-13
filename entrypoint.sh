#!/bin/bash -l

if [[ "$2" = "yes" ]]
then
  NCM_TOKEN=$1 ncm report --long
elif [[ "$3" = "yes" ]]
then
  NCM_TOKEN=$1 ncm report --compliance
elif [[ "$4" = "yes" ]]
then
  NCM_TOKEN=$1 ncm report --security
else
  NCM_TOKEN=$1 ncm report
fi
