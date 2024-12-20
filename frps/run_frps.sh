#!/bin/bash
set -euo pipefail

docker rm -f frps

docker run --name frps \
  -v "$(pwd)"/frps.toml:/etc/frp/frps.toml \
  --network host \
  --restart always \
  --log-opt max-size=1G \
  -v /etc/localtime:/etc/localtime -v /etc/timezone:/etc/timezone \
  -v ./certs/:/certs/ \
  -d snowdreamtech/frps:0.60.0



cd fail2ban && ./set_fail2ban.sh

