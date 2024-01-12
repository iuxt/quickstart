#!/bin/bash

../public/docker-network.sh

docker run -d \
    -v $(pwd)/vaultwarden_data/:/data/ \
    --env-file=$(pwd)/.env \
    --name=vaultwarden \
    --restart=always \
    vaultwarden/server

