#!/bin/bash
echo $1
export token=$2
echo "Checking GET v2/images/{image_id}"
curl -i -X GET http://172.16.17.8:9292/v2/images/e670f0c4-5575-497b-861e-a24db514cda4/$1 -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json"
sleep 2
