#!/bin/bash
echo $1
export token=$2
echo "Checking Third API Call" 
echo "Checking GET v2/images"
sleep 1
curl -i -X GET http://172.16.17.8:9292/v2/images/$1 -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json"
sleep 2
