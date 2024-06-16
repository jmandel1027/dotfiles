#!/bin/bash
statusCheck=$(gh pr status --json 'statusCheckRollup');
url=$(echo $statusCheck | jq '.currentBranch.statusCheckRollup[] | select(.context == "buildkite/runway") | .targetUrl' -r)
open $url

