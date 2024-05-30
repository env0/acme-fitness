# Assume Role 

This allows env0 (SaaS) to use the assume role created here.

The assume role by should have permissions to do what your Terraform code is doing.
By default, this code assigns it admin privileges.

This code also creates the env0 aws credential - which must later be assigned to the project.

### Note: 

For **Self Hosted Agent** users - you can use this as a guide, but you will need to modify the principal (L45) to match role / account for your agent.  

e.g. if your agent was deployed in AWS account id :`123456789`
then your principal block in your trust policy should look like:

```
...
        "Principal" : {
          "AWS" : "arn:aws:iam::123456789:root"
        },
...
```

** `env0.system-env-vars.json` is a file that is generated in env0 that contains a json representation of all the environment variable values. we use this file to extract the organization id to be used a value in the assume role.