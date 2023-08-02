#!/bin/bash

../public/docker-network.sh

# https://docs.gitea.com/installation/install-with-docker

docker run -d \
    --name gitea \
    --network iuxt \
    -e USER_UID=$UID \
    -e USER_GID=$(id -g) \
    --mount type=bind,source=/etc/timezone,target=/etc/timezone,readonly \
    --mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
    -v $PWD/gitea-data:/data \
    --restart=always \
    gitea/gitea:latest

cp -f ./gitea-nginx.conf ../nginx/conf.d/gitea.conf
cp -f ./gitea-nginx-stream.conf ../nginx/stream.d/gitea.conf
