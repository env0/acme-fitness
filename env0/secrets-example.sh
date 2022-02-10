#!/bin/bash

# The purpose of this file is to allow for first time users to bootstrap their env0 Environment and Cloud account
# First, in the app.env0.com - you will need to create an API Key under "Organization Settings" > "API Keys"
# Second, copy your ORG_ID (see the Organization Settings URL) e.g. 
# https://app.env0.com/organizations/612a5766-af0a-4222-b28b-67b48607636b/api-keys
# The org id is 612a5766-af0a-4222-b28b-67b48607636b

# Rename this file to secret.sh

## USAGE 
# Before you run terraform plan 
# Run secret.sh like this:  
# `. ./secret.sh`
# this is equivalent to running `source ./secret.sh` which allows us to export the following environment variables into your current shell session.

export ENV0_API_KEY=your_API_KEY
export ENV0_API_SECRET=your_SECRET
export ENV0_ORGANIZATION_ID=your_ORG_ID
export GITHUB_TOKEN=your_GITHUB_PAT
# export AWS_ACCESS_KEY_ID=
# export AWS_SECRET_ACCESS_KEY=