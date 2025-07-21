#!/bin/bash
set -euo pipefail
cd $(dirname $0)

source .env

../public/docker-network.sh

docker run --name redis \
       --network iuxt \
       -p 6379:6379 \
       --restart always \
       -d redis:${REDIS_VER}
