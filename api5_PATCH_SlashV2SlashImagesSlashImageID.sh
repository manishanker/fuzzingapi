#!/bin/bash
echo $1
export token=$2
echo "Checking Fifth API Call"
echo "Checking PATCH /v2/images/{image_id}"
curl -i -X PATCH 'http://172.16.17.8:9292/v2/images/e670f0c4-5575-497b-861e-a24db514cda4' -H "Content-Type: application/openstack-images-v2.1-json-patch" -H "Accept: application/json" -H "X-Auth-Token: $token" -d '[{"op" : "replace", "path": "/name", "value": "'"$1"'"}]'
sleep 2
