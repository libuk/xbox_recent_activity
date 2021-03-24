#! /bin/bash

#
# Author: libuk
# 
# Usage:
# bash xbox_api.sh {XBOX_API_KEY} {XUID}
#

if [ ! -n "$1" ] || [ ! -n "$2" ]
then
  echo "Argument missing"
  echo ""
  echo "Usage:"
  echo "bash xbox_api.sh {XBOX_API_KEY} {XUID}"
  echo "example: bash xbox_api.sh 8745efef84fjfg4925hruhf48 94859347584957"

  exit 1
fi

XBOX_API_KEY=$1
XUID=$2

OUTPUT_PATH=xbox_recent_activity.json

curl -H "X-AUTH: ${XBOX_API_KEY}" \
  -H "Content-Type: application/json" \
  "https://xapi.us/v2/${XUID}/activity/recent" \
  -o "${OUTPUT_PATH}"

echo "recent activity file created: ${OUTPUT_PATH}"

