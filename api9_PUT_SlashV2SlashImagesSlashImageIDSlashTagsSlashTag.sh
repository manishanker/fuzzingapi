#!/bin/bash
echo $1
exoprt token=$2
echo "Checking PUT /v2/images/{image_id}/{tag}"
curl -i -X PUT http://172.16.17.8:9292/v2/images/c37cd623-2d81-44e3-a811-5aafe81dce28/tags/$1 -H "X-Auth-Token: $token" -H "Content: application/json" -H "Accept: application/json"
sleep 2
