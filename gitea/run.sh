#!/bin/bash

../public/docker-network.sh

# https://docs.gitea.com/installation/install-with-docker
#    -m 512M --memory-swap=768M \

source .env

docker run -d \
    --name gitea \
    --network iuxt \
    -e USER_UID=1000 \
    -e USER_GID=1000 \
    --env-file=.env \
    --mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
    -v "$PWD"/gitea-data:/data \
    --restart=always \
    gitea/gitea:${GITEA_VERSION}

cp -f ./gitea-nginx-stream.conf ../nginx/stream.d/gitea.conf
../public/add_config_to_nginx.sh
