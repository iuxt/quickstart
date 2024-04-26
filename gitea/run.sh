#!/bin/bash

../public/docker-network.sh

useradd -m iuxt
# https://docs.gitea.com/installation/install-with-docker
#    -m 512M --memory-swap=768M \

docker run -d \
    --name gitea \
    --network iuxt \
    -e USER_UID=$(id -u iuxt) \
    -e USER_GID=$(id -g iuxt) \
    --env-file=.env \
    --mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
    -v $PWD/gitea-data:/data \
    --restart=always \
    gitea/gitea:1.21.11

cp -f ./gitea-nginx.conf ../nginx/conf.d/gitea.conf
cp -f ./gitea-nginx-stream.conf ../nginx/stream.d/gitea.conf
