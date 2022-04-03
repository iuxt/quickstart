#!/bin/bash
set -euo pipefail

source .env

if [ "$(docker network ls | grep -c iuxt)" -eq 0 ]; then
  docker network create iuxt
else
  echo "docker network iuxt exists skip"
fi

docker run --name nginx \
  -v "$(pwd)"/www:/usr/share/nginx/html:ro \
  -v "$(pwd)"/conf/nginx.conf:/etc/nginx/nginx.conf \
  -v "$(pwd)"/conf/conf.d:/etc/nginx/conf.d \
  -v "$(pwd)"/conf/ssl:/etc/nginx/ssl \
  -p "${HTTP_PORT}":80 \
  -p "${HTTPS_PORT}":443 \
  --network iuxt \
  --restart always \
  -d nginx:"${NGINX_VERSION}"
