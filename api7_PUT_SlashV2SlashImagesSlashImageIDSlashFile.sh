#!/bin/bash
echo "Checking PUT /v2/images/{image_id}/file"
echo "Using Glance image with name SUSELINUX, conatiner_format=bare and disk_format=iso"
curl -i -X PUT -H "X-Auth-Token: $token" -H "Content-Type: application/octet-stream" -d @/home/test/sfuzz/mini.iso http://172.16.17.8:9292/v2/images/c37cd623-2d81-44e3-a811-5aafe81dce28/file
