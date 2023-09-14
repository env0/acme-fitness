# Docker Agent example

I've downloaded the `env0.env` from app.env0.com (org settings > agents).
I've modified the my.env.tpl that contains other secrets and values that I need for my agent.
In this case, I need to provide an AWS_ACCESS_KEY_ID and SECRET_KEY for fetching secrets (as I'm running my agent on my local machine)
I also need to provide an encryption key for the working directory to be stored with env0.

I'm using 1Password as my secrets manager and the script decrypts the secrets and then creates the docker container.

For a list of the environment variables that are acceptable in the Docker Container (the docs need to be updated), but you can unpack and inspect the Helm Chart. secrets.yml

https://artifacthub.io/packages/helm/env0-agent/env0-agent/

```
  AWS_ACCESS_KEY_ID: {{ .awsAccessKeyIdEncoded }}
  AWS_SECRET_ACCESS_KEY: {{ .awsSecretAccessKeyEncoded }}  
  DEPLOYMENT_TRIGGER_API_KEY : {{ .env0ApiGwKeyEncoded }}
  ASSUMER_ACCESS_KEY_ID: {{ .assumerKeyIdEncoded | default "" | quote }}
  ASSUMER_SECRET_ACCESS_KEY: {{ .assumerSecretEncoded | default "" | quote }}
  INFRACOST_API_KEY: {{ .infracostApiKeyEncoded | default "" | quote }}
  EPSAGON_TOKEN: {{ .epsagonTokenEncoded | default "" | quote }}
  CUSTOMER_AWS_ACCESS_KEY_ID: {{ .customerAwsAccessKeyIdEncoded | default "" | quote }}
  CUSTOMER_AWS_SECRET_ACCESS_KEY: {{ .customerAwsSecretAccessKeyEncoded | default "" | quote }}
  CUSTOMER_GOOGLE_PROJECT: {{ .customerGoogleProject | default "" | quote }}
  CUSTOMER_GOOGLE_CREDENTIALS: {{ .customerGoogleCredentials | default "" | quote }}
  CUSTOMER_AZURE_CLIENT_ID: {{ .customerAzureClientId | default "" | quote }}
  CUSTOMER_AZURE_CLIENT_SECRET: {{ .customerAzureClientSecret | default "" | quote }}
  CUSTOMER_AZURE_TENANT_ID: {{ .customerAzureTenantId | default "" | quote }}
  BITBUCKET_SERVER_CREDENTIALS: {{ .bitbucketServerCredentialsEncoded | default "" | quote }}
  GITLAB_ENTERPRISE_CREDENTIALS: {{ .gitlabEnterpriseCredentialsEncoded | default "" | quote }}
  GITHUB_ENTERPRISE_APP_CLIENT_SECRET: {{ .githubEnterpriseAppClientSecretEncoded | default "" | quote }}
  GITHUB_ENTERPRISE_APP_PRIVATE_KEY: {{ .githubEnterpriseAppPrivateKeyEncoded | default "" | quote }}
  CUSTOMER_VAULT_TOKEN: {{ .customerVaultTokenEncoded | default "" | quote }}
  CUSTOMER_VAULT_ADDRESS: {{ .customerVaultUrl | default "" | quote }}
  {{ if .alternativeLogLocation }}
  ALT_LOGS_DYNAMO_WRITER_EXTERNAL_ID : {{ .alternativeLogLocation.dynamoWriterExternalIdEncoded | default "" | quote }}
  {{ end }}
  {{ if .env0StateEncryptionKey }}
  ENV0_STATE_ENCRYPTION_KEY: {{ .env0StateEncryptionKey | default "" | quote }}
```