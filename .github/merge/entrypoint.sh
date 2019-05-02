#!/bin/sh

PULL_URL=$(cat "$GITHUB_EVENT_PATH" | jq -r '.pull_request.url')

set +x

curl -Ss -XPUT -H "Authorization: token $GITHUB_TOKEN" "$PULL_URL/merge" > /dev/null
