#!/bin/bash
set -euo pipefail

../public/docker-network.sh


docker run --name nginx \
  -v "$(pwd)"/www:/usr/share/nginx/html:ro \
  -v "$(pwd)"/nginx.conf:/etc/nginx/nginx.conf \
  -v "$(pwd)"/conf.d:/etc/nginx/conf.d \
  -v "$(pwd)"/stream.d:/etc/nginx/stream.d \
  -v "$(pwd)"/ssl:/etc/nginx/ssl \
  -v "$(pwd)"/src:/src \
  --mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
  -p 80:80 \
  -p 443:443 \
  -p 8000-8010:8000-8010 \
  -p 22:22 \
  --add-host=host.docker.internal:host-gateway \
  --network iuxt \
  --restart always \
  --log-opt max-size=1G \
  -d nginx:1.27.0


cd fail2ban && ./set_fail2ban.sh

