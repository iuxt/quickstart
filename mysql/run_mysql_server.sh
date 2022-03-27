#!/bin/bash
set -euxo pipefail

source .env
docker run --name mysql \
       -e MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} \
       -e MYSQL_DATABASE=${MYSQL_DATABASE} \
       -p ${MYSQL_PORT}:3306 \
       -v ${MYSQL_DATA}:/var/lib/mysql \
       -d mysql:${MYSQL_VERSION}
