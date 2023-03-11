#!/bin/bash -l

npm i

FORCE_COLOR=1 IS_GITHUB_ACTION=true NCM_TOKEN=$1 ncm report --gate > report.json
cat report.json
output="$(cat report.json)"
echo 'echo "::error file=app.js,line=1::Missing semicolon"  > ncm.sh
chmod +x ncm.sh
