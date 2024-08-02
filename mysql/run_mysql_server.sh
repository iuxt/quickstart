#!/bin/bash
set -euo pipefail

source .env

../public/docker-network.sh

docker run --name mysql \
       -e MYSQL_ROOT_PASSWORD="${MYSQL_ROOT_PASSWORD}" \
       -e MYSQL_DATABASE="${MYSQL_DATABASE}" \
       -v "${MYSQL_DATA}":/var/lib/mysql \
       -v "$(pwd)/mysql_temp":/mysql_temp \
       -v "$(pwd)/config":/etc/mysql/conf.d \
       -v "$(pwd)/init_sql":/docker-entrypoint-initdb.d \
       -p "${MYSQL_PORT}":3306 \
       -p "${MYSQLX_PORT}":33060 \
       --network iuxt \
       --restart always \
       -d mysql:"${MYSQL_VERSION}"
