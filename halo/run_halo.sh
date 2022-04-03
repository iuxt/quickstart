#!/bin/bash
set -euo pipefail

if [ "$(docker network ls | grep -c iuxt)" -eq 0 ]; then
  docker network create iuxt
else
  echo "docker network iuxt exists skip"
fi

docker run -it -d --name halo \
  -v "$PWD"/halo_data:/root/.halo \
  --network iuxt \
  --restart always \
  halohub/halo:latest