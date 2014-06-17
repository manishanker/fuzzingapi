#!/bin/bash
echo "Checking DELETE /v2/images/{image_id}"
curl -i -X DELETE http://172.16.17.8:9292/v2/images/10d5b862-fe24-4617-947c-4264ca8a0b6f -H "X-Auth-Token: $token" -H "Content-Type: application/json" -H "Accept: application/json"

