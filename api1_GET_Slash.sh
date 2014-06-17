#!/bin/bash
#shell script to Fuzz Openstack API
echo $1
export token=$2
echo "Checking First API Call"
echo "checking GET / "
sleep 1
curl -i -X GET http://172.16.17.8:9292/$1 -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json"
sleep 2
