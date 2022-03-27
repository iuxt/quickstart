#!/bin/bash
set -euo pipefail

source .env

if [ $(docker network ls | grep -c iuxt) -eq 0 ]; then
  docker network create iuxt
else
  echo "docker network iuxt exists skip"
fi

docker run --name mysql \
       -e MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} \
       -e MYSQL_DATABASE=${MYSQL_DATABASE} \
       -p ${MYSQL_PORT}:3306 \
       -v ${MYSQL_DATA}:/var/lib/mysql \
       --network iuxt \
       -d mysql:${MYSQL_VERSION}
