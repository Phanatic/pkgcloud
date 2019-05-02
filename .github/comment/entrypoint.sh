#!/bin/sh

COMMENTS_URL=$(cat "$GITHUB_EVENT_PATH" | jq -r '.pull_request.comments_url')

set +x

curl -Ss -d '{"body":"New Version of package was succesfully published  :tada: :rocket:! \r\n Please view it at https://github.com/Phanatic/pkgcloud/packages/10593"}' -H "Authorization: token $GITHUB_TOKEN" "$COMMENTS_URL" > /dev/null
