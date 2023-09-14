#!/bin/zsh

op inject -i my.env.tpl -o my.env

docker run --name acme-fitness --env-file env0.env --env-file my.env ghcr.io/env0/deployment-agent:latest &

rm my.env