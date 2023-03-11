#!/bin/bash -l

npm i

FORCE_COLOR=1 IS_GITHUB_ACTION=true NCM_TOKEN=$1 ncm report --gate > report.json
cat report.json
output="$(cat report.json)"
echo 'echo "::error file=package.json,line=1,col=1::NCM"'  > ncm.sh
chmod +x ncm.sh
