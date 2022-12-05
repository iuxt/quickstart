#!/bin/bash
set -euo pipefail

if [ ! -f ./data/cloudreve.db ];then
  touch ./data/cloudreve.db
fi

# Docker Network
if [ "$(docker network ls | grep -c iuxt)" -eq 0 ]; then
  docker network create iuxt
else
  echo "docker network iuxt exists skip"
fi

docker run -d \
    --name cloudreve \
    --network iuxt \
    --mount type=bind,source=$(pwd)/data/conf.ini,target=/cloudreve/conf.ini \
    --mount type=bind,source=$(pwd)/data/cloudreve.db,target=/cloudreve/cloudreve.db \
    -v $(pwd)/data/uploads:/cloudreve/uploads \
    -v $(pwd)/data/avatar:/cloudreve/avatar \
    --restart=always \
    cloudreve/cloudreve:latest
