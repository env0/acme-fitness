# Bootstrap your env0 Organization with this demo repo
Using the scripts and TF code in this folder, we will setup your env0 Organization to help demonstrate the basic features and capabilities of env0.

## Requirements
1. env0 Organization GUID
2. env0 API Key / Secret Key
3. GitHub PAT
4. Terraform v0.15 or higher
5. AWS Account programmatic access

## Notes

* We will need to run Terraform locally to help setup AWS, GitHub, and env0
  * in AWS, we will be adding:
    * AWS Assume Role - to give TF the ability to create resources
  * in GitHub, we will be adding:
    * SSH Key to access private repos - that are used by TF
  * in env0, we will be adding:
    * the AWS Assume Role connection
    * the SSH Key for GitHub access
    * default Projects (w/ Policies) and Templates found in this repo.

## HowTo

1. Setup your credentials!
  * make a copy of `secrets-example.sh` and rename it to `secrets.sh`
  * add the following:
    * your env0 Organization ID (GUID)
    * your env0 API Key
    * your env0 SECRET Key
    * GitHub PAT
    * AWS Access Key (optional) 
    * AWS Secret Key (optional)
2. Run `./bootstrap.sh`


