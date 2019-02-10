#!/usr/bin/env bash
set -e # halt script on error

zip -r webgl_export.zip ./Builds/WebGL

curl -H "Content-Type: application/zip" \
     -H "Authorization: Bearer $NETLIFY_KEY" \
     --data-binary "@webgl_export.zip" \
     https://api.netlify.com/api/v1/sites/ecstatic-curran-54e788/deploys