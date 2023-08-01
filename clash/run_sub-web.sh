#!/bin/bash
set -euo pipefail

../public/docker-network.sh

if [ -d sub-web ];then
    cd sub-web
    git pull
    cd ..
else
    git clone https://github.com/CareyWang/sub-web.git
fi

docker build . -t iuxt/sub-web
docker run -d --restart=always --network iuxt --name sub-web iuxt/sub-web
