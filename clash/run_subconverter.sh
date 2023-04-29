#!/bin/bash
set -euo pipefail

if [ "$(docker network ls | grep -c iuxt)" -eq 0 ]; then
  docker network create iuxt
else
  echo "docker network iuxt exists skip"
fi

docker run -d --restart=always --network iuxt --name subconverter tindy2013/subconverter:latest
