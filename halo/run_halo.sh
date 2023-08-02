#!/bin/bash
set -euo pipefail

../public/docker-network.sh

docker run -it -d --name halo \
  -v "$PWD"/halo_data:/root/.halo \
  --network iuxt \
  --restart always \
  halohub/halo:1.6.1

cp -f ./halo-nginx.conf ../nginx/conf.d/halo.conf
