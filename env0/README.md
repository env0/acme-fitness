# Bootstrap your env0 Organization with this demo repo
Using the scripts and TF code in this folder, we will setup your env0 Organization to help demonstrate the basic features and capabilities of env0.

## Requirements
1. env0 Organization GUID
2. env0 API Key / Secret Key
3. AWS Account programmatic access

## Notes

* We will need to run Terraform locally to help setup AWS, and env0
  * in AWS, we will be adding:
    * AWS Assume Role - to give TF the ability to create resources
  * in env0, we will be adding:
    * the AWS Assume Role connection
    * default Projects (w/ Policies) and Templates found in this repo.



