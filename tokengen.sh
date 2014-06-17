#!/bin/bash
#shell script to create tokens
curl 'http://127.0.0.1:5000/v2.0/tokens' -X POST -H "Content-Type: application/json" -H "Accept: application/json"  -d '{"auth": {"tenantName": "admin", "passwordCredentials": {"username": "admin", "password": "'"$1"'"}}}' >jsonoutput.txt

