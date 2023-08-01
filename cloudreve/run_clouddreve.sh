#!/bin/bash
set -euo pipefail

if [ ! -f ./data/cloudreve.db ];then
  touch ./data/cloudreve.db
fi

../public/docker-network.sh

docker run -d \
    --name cloudreve \
    --network iuxt \
    -e PUID=$UID \
    -e PGID=$(id -g) \
    --mount type=bind,source=$PWD/data/conf.ini,target=/cloudreve/conf.ini \
    --mount type=bind,source=$PWD/data/cloudreve.db,target=/cloudreve/cloudreve.db \
    -v $PWD/data/uploads:/cloudreve/uploads \
    -v $PWD/data/avatar:/cloudreve/avatar \
    -v $PWD/aria2-downloads:/downloads \
    --restart=always \
    cloudreve/cloudreve:latest
