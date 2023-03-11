#!/bin/bash -l

npm i

FORCE_COLOR=1 IS_GITHUB_ACTION=true NCM_TOKEN=$1 ncm report --gate > report.json
cat report.json
chmod +x ncm.sh
