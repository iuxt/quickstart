#!/bin/bash
set -euo pipefail

../public/docker-network.sh

docker run -d \
    --name cloudreve \
    --network iuxt \
    -e PUID=$UID \
    -e PGID=$(id -g) \
    --mount type=bind,source=$PWD/conf.ini,target=/cloudreve/conf.ini \
    -v $PWD/data/uploads:/cloudreve/uploads \
    -v $PWD/data/avatar:/cloudreve/avatar \
    -v $PWD/downloads:/downloads \
    --restart=always \
    cloudreve/cloudreve:latest

cp -f ./cloudreve-nginx.conf ../nginx/conf.d/cloudreve.conf
