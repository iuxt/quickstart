#!/bin/bash
set -euo pipefail

source .env

docker run -d --name v2ray \
	-p 443:443 \
	-p 80:80 \
	-v $PWD/caddy_data:/root/.caddy \
	pengchujin/v2ray_ws:0.11 ${DOMAIN} V2RAY_WS ${UUID}

sleep 3s
docker logs v2ray
