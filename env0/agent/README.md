# Docker Agent example

I've downloaded the `env0.env` from app.env0.com (org settings > agents).
I've modified the my.env.tpl that contains other secrets and values that I need for my agent.
In this case, I need to provide an AWS_ACCESS_KEY_ID and SECRET_KEY for fetching secrets (as I'm running my agent on my local machine)
I also need to provide an encryption key for the working directory to be stored with env0.

I'm using 1Password as my secrets manager and the script decrypts the secrets and then creates the docker container.
