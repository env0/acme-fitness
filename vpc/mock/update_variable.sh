#!/bin/bash

set -x

curl --request POST \
--url https://api.env0.com/configuration \
--user $ENV0_API_KEY:$ENV0_API_SECRET \
--header "Content-Type: application/json" \
--data "[{
  \"name\": \"vpc_id\",
  \"value\": $(terraform output vpc_id),
  \"isReadonly\": true,
  \"isRequired\": true,
  \"scopeId\": \"$ENV0_PROJECT_ID\",
  \"scope\": \"PROJECT\",
  \"type\": 0,
  \"organizationId\": \"$ENV0_ORGANIZATION_ID\",
  \"description\": \"value updated from vpc (mock) environment env0.yml\",
  \"isSensitive\": false
}]"