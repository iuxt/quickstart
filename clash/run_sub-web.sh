#!/bin/bash
set -euo pipefail

if [ "$(docker network ls | grep -c iuxt)" -eq 0 ]; then
  docker network create iuxt
else
  echo "docker network iuxt exists skip"
fi

if [ -d sub-web ];then
    cd sub-web
    git pull
    cd ..
else
    git clone https://github.com/CareyWang/sub-web.git
fi

docker build . -t iuxt/sub-web
docker run -d --restart=always --network iuxt --name sub-web iuxt/sub-web
