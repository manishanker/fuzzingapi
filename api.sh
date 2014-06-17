#!/bin/bash
#shell script to Fuzz Openstack API
<<<<<<< HEAD
#export token=$2
# All the Glance API calls
echo "Checking First GET request"
curl -i -X GET http://172.16.17.8:9292/ -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json"
sleep 10
echo
echo "Checking POST /v2/images API call"
curl -i -X POST http://172.16.17.8:9292/v2/images -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json" -d '{"name" : "KKubuntu", "visibility" : "private"}'
sleep 10
echo
echo "Checking GET v2/images"
curl -i -X GET http://172.16.17.8:9292/v2/images -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json"
sleep 10
echo
echo "Checking GET v2/images/{image_id}"
curl -i -X GET http://172.16.17.8:9292/v2/images/e670f0c4-5575-497b-861e-a24db514cda4 -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json"
sleep 10
echo
echo "Checking PATCH /v2/images/{image_id}"
curl -i -X PATCH 'http://172.16.17.8:9292/v2/images/e670f0c4-5575-497b-861e-a24db514cda4' -H "Content-Type: application/openstack-images-v2.1-json-patch" -H "Accept: application/json" -H "X-Auth-Token: $token" -d '[{"op" : "replace", "path": "/name", "value": "Fedora 17"}]'
sleep 10
echo
echo "Checking DELETE /v2/images/{image_id}"
curl -i -X DELETE http://172.16.17.8:9292/v2/images/cb21242f-43db-4251-ae73-f9de9fce698b -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json"
sleep 10
echo
echo "Checking DELETE /v2/images/{image_id}/{tag}"
curl -i -X DELETE 'http://172.16.17.8:9292/v2/images/686d9428-ab54-43d7-9be2-c88811b43193/tags/FedUbuntu' -H "X-Auth-Token: $token" -H "Content: application/json" -H "Accept: application/json"
sleep 10
echo
echo "Public images donot have members"
curl -i -X POST http://172.16.17.8:9292/v2/images/32ae4fe9-1-4b63-a2bb-192c4a14b335/members -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json" -d '{"member": "89c4f2eaeedb4dec8b6f3de01d720e14"}'
sleep 10
echo
echo "Checking GET /v2/images/{image_id}/members"
curl -i -X GET http://172.16.17.8:9292/v2/images/32ae4fe9-13c3-4b63-a2bb-192c4a14b335/members -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json"
sleep 10
echo
echo "Not working GET /v2/images/{image_id}/members/{member_id} :("
curl -i -X GET http://172.16.17.8:9292/v2/images/32ae4fe9-13c3-4b63-a2bb-192c4a14b335/members/c150b4e1d7b84a4a80701e0d4202ae4d -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json"
echo
echo "Checking DELETE /v2/images/{image_id}/members/{member_id}"
curl -i -X DELETE http://172.16.17.8:9292/v2/images/32ae4fe9-13c3-4b63-a2bb-192c4a14b335/members/89c4f2eaeedb4dec8b6f3de01d720e14 -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json"
sleep 10
echo
echo "Checking POST /v2/images"
echo "First create a new image with name and Glance will assign the id to it"
echo "Use this command to do so : curl -i -X POST http://172.16.17.8:9292/v2/images -H "X-Auth-Token: $token" -d '{"name" : "Mani", "container_format": "bare", "disk_format": "iso"}' -H "Content-Type: application/json" -H "Accept: application/json""
sleep 4
curl -i -X PUT -H "X-Auth-Token: $token" -H "Content-Type: application/octet-stream" -d @/home/test/sfuzz/mini.iso http://172.16.17.8:9292/v2/images/1d430a77-f834-48af-a32e-67bdedb56356/file
sleep 10
echo
echo "Checking GET /v2/images/{image_id}/file"
echo "Terminal is going to crash and weird results :|"
sleep 4
echo
echo "Command is working: curl -i -X GET -H "X-Auth-Token: $token" http://172.16.17.8:9292/v2/images/1d430a77-f834-48af-a32e-67bdedb56356/file"
sleep 5
echo
echo "Checking the GET /v2/schemas/images"
curl -i -X GET http://172.16.17.8:9292/v2/schemas/images -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json"
sleep 10
echo
echo "Checking GET /v2/schemas/image"
sleep 10
curl -i -X GET http://172.16.17.8:9292/v2/schemas/image -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json"
sleep 10
echo
echo "Checking GET /v2/schemas/members "
curl -i -X GET http://172.16.17.8:9292/v2/schemas/members -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json"
sleep 10
echo
echo "Checking GET /v2/schemas/member"
curl -i -X GET http://172.16.17.8:9292/v2/schemas/member -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json"
sleep 10
echo
echo "Checking GET /v2/images/{image_id}/members"
curl -i -X GET http://172.16.17.8:9292/v2/images/1d430a77-f834-48af-a32e-67bdedb56356/members -H "X-Auth-Token: $token"
sleep 10
echo
echo "Checking GET /v2/images/{images_id}/members"
curl -i -X GET http://172.16.17.8:9292/v2/images/32ae4fe9-13c3-4b63-a2bb-192c4a14b335/members -H "X-Auth-Token: $token"
sleep 10
echo
echo "Checking DELETE /v2/images/{image_id}/members/{member_id}"
curl -i -X DELETE http://172.16.17.8:9292/v2/images/32ae4fe9-13c3-4b63-a2bb-192c4a14b335/members/89c4f2eaeedb4dec8b6f3de01d720e14 -H "X-Auth-Token: $token"
sleep 10
echo
echo "Checkig PUT /v2/images/{image_id}/members/{member_id} and changing status"
curl -i -X PUT http://172.16.17.8:9292/v2/images/32ae4fe9-13c3-4b63-a2bb-192c4a14b335/members/29a17f9454314242a454ef2e5701abb3 -H "X-Auth-Token: $token" -d '{"status" : "accepted"}'
sleep 10
echo
echo "Goodbye! "

=======
curl -i -X GET http://127.0.0.1:9292/v2/$1 -H "X-Auth-Token : $2"
>>>>>>> ad9e9af93302de8a775fa80e7511a356205c0991
