#!/bin/bash
set -euo pipefail

if [ "$(docker network ls | grep -c iuxt)" -eq 0 ]; then
  docker network create iuxt
else
  echo "docker network iuxt exists skip"
fi

docker run -d --name v2ray \
  --network iuxt \
  --restart always \
  --mount type=bind,source=$(pwd)/config.json,target=/v2ray/config.json \
  iuxt/v2ray

