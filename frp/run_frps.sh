#!/bin/bash
set -euo pipefail

docker run --name frps \
  -v "$(pwd)"/frps.ini:/etc/frp/frps.ini \
  --network host \
  --restart always \
  --log-opt max-size=1G \
  -v /etc/localtime:/etc/localtime -v /etc/timezone:/etc/timezone \
  -d snowdreamtech/frps:latest
