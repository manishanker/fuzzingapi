#!/bin/bash
echo "Checking GET /v2/images/{image_id}/file"
echo "Terminal acts in a weird way"
curl -i -X GET -H "X-Auth-Token: $token" http://172.16.17.8:9292/v2/images/b4250f4f-5acc-46cb-99da-9f849d36c5e9/file
