#!/bin/bash
#shell script to Fuzz Openstack API
export token=$2

# First Glance GET Method API call
echo "Checking First GET request"
curl -i -X GET http://172.16.17.8:9292/ -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json"
sleep 10
echo "Checking POST /v2/images API call"
curl -i -X POST http://172.16.17.8:9292/v2/images -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json" -d '{"name" : "MMubuntu", "visibility" : "private"}'
sleep 10
echo "Checking GET v2/images"
curl -i -X GET http://172.16.17.8:9292/v2/images -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json"
sleep 10
echo "Checking GET v2/images/{image_id}"
curl -i -X GET http://172.16.17.8:9292/v2/images/e670f0c4-5575-497b-861e-a24db514cda4 -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json"
sleep 10
echo "Checking PATCH /v2/images/{image_id}"
curl -i -X PATCH 'http://172.16.17.8:9292/v2/images/e670f0c4-5575-497b-861e-a24db514cda4' -H "Content-Type: application/openstack-images-v2.1-json-patch" -H "Accept: application/json" -H "X-Auth-Token: $token" -d '[{"op" : "replace", "path": "/name", "value": "Fedora 17"}]'
sleep 10
echo "Checking the same PATCH /v2/images/{image_id} with multiple operations"
curl -i -X PATCH http://172.16.17.8:9292/v2/images/7f009574-262c-478c-bcb6-66e3ab3078a2 -H "X-Auth-Token: $token" -H "Content-Type: application/openstack-images-v2.1-json-patch" -H "Accept: application/json" -d '[{"op" : "replace", "path": "/name", "value": "Fedubuntu 67"}]'
sleep 10
echo "Checking DELETE /v2/images/{image_id}"
curl -i -X DELETE http://172.16.17.8:9292/v2/images/7f009574-262c-478c-bcb6-66e3ab3078a2 -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json"
sleep 10
echo "Checking DELETE /v2/images/{image_id}/{tag}"
curl -i -X DELETE 'http://172.16.17.8:9292/v2/images/522ddede-db80-40c9-845a-e033a8f3a0cf/tags/fuzzing' -H "X-Auth-Token: $token" -H "Content: application/json" -H "Accept: application/json"
sleep 10
echo "Public images donot have members"
curl -i -X POST http://172.16.17.8:9292/v2/images/32ae4fe9-1-4b63-a2bb-192c4a14b335/members -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json" -d '{"member": "89c4f2eaeedb4dec8b6f3de01d720e14"}'
sleep 10
echo "Checking GET /v2/images/{image_id}/members"
curl -i -X GET http://172.16.17.8:9292/v2/images/32ae4fe9-13c3-4b63-a2bb-192c4a14b335/members -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json"
sleep 10
echo "Not working GET /v2/images/{image_id}/members/{member_id} :("
curl -i -X GET http://172.16.17.8:9292/v2/images/32ae4fe9-13c3-4b63-a2bb-192c4a14b335/members/c150b4e1d7b84a4a80701e0d4202ae4d -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json"
echo "Checking DELETE /v2/images/{image_id}/members/{member_id}"
curl -i -X DELETE http://172.16.17.8:9292/v2/images/32ae4fe9-13c3-4b63-a2bb-192c4a14b335/members/89c4f2eaeedb4dec8b6f3de01d720e14 -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json"
sleep 10
echo "Checking POST /v2/images"
echo "First create a new image with name and Glance will assign the id to it"
echo "Use this command to do so : curl -i -X POST http://172.16.17.8:9292/v2/images -H "X-Auth-Token: $token" -d '{"name" : "Mani", "container_format": "bare", "disk_format": "iso"}' -H "Content-Type: application/json" -H "Accept: application/json""
sleep 4
curl -i -X PUT -H "X-Auth-Token: $token" -H "Content-Type: application/octet-stream" -d @/home/test/sfuzz/mini.iso http://172.16.17.8:9292/v2/images/1d430a77-f834-48af-a32e-67bdedb56356/file
sleep 10
echo "Checking GET /v2/images/{image_id}/file"
echo "Terminal is going to crash and weird results :|"
sleep 4
echo "Command is working: curl -i -X GET -H "X-Auth-Token: $token" http://172.16.17.8:9292/v2/images/1d430a77-f834-48af-a32e-67bdedb56356/file"
sleep 5
echo "Checking the GET /v2/schemas/images"
curl -i -X GET http://172.16.17.8:9292/v2/schemas/images -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json"
sleep 10
echo "Checking GET /v2/schemas/image"
sleep 10
curl -i -X GET http://172.16.17.8:9292/v2/schemas/image -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json"
sleep 10
echo "Checking GET /v2/schemas/members "
curl -i -X GET http://172.16.17.8:9292/v2/schemas/members -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json"
sleep 10
echo "Checking GET /v2/schemas/member"
curl -i -X GET http://172.16.17.8:9292/v2/schemas/member -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json"
sleep 10
echo "Remaining GET, DELETE, PUT in /v2/images/{image_id}/members/{members_id}"
sleep 10
echo "Goodbye! "

