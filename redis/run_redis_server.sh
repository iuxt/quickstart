#!/bin/bash
set -euo pipefail

source .env

if [ "$(docker network ls | grep -c iuxt)" -eq 0 ]; then
  docker network create iuxt
else
  echo "docker network iuxt exists skip"
fi

docker run --name redis \
       --network iuxt \
       -p 6379:6379 \
       --restart always \
       -d redis:${REDIS_VER}
