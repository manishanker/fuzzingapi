#!/bin/bash
#shell script to Fuzz Openstack API
curl -i -X GET http://127.0.0.1:9292/v2/$1 -H "X-Auth-token : $2"
