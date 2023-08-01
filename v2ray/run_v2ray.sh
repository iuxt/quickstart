#!/bin/bash
set -euo pipefail

../public/docker-network.sh

docker run -d --name v2ray \
  --network iuxt \
  --restart always \
  --mount type=bind,source=$(pwd)/config.json,target=/v2ray/config.json \
  iuxt/v2ray

