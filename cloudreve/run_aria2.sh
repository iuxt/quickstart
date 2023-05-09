#!/bin/bash

# Docker Network
if [ "$(docker network ls | grep -c iuxt)" -eq 0 ]; then
  docker network create iuxt
else
  echo "docker network iuxt exists skip"
fi


docker run -d \
    --name aria2 \
    --network iuxt \
    --restart unless-stopped \
    --log-opt max-size=1m \
    -e PUID=$UID \
    -e PGID=$GID \
    -e UMASK_SET=022 \
    -e RPC_SECRET=com.012 \
    -e RPC_PORT=6800 \
    -p 6800:6800 \
    -e LISTEN_PORT=6888 \
    -p 6888:6888 \
    -p 6888:6888/udp \
    -v $PWD/aria2-config:/config \
    -v $PWD/aria2-downloads:/downloads \
    p3terx/aria2-pro
