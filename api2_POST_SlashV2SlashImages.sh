#!/bin/bash
export token=$2
echo $1
export inp=$1
echo "Checking POST /v2/images API call"
curl -i -S -X POST http://172.16.17.8:9292/v2/images -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json" -d '{"name" :"'"$inp"'", "visibility" : "private"}'
sleep 5
