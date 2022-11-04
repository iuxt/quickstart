#!/bin/bash
set -euo pipefail

source .env

docker run --name mysql \
       -e MYSQL_ROOT_PASSWORD="${MYSQL_ROOT_PASSWORD}" \
       -e MYSQL_DATABASE="${MYSQL_DATABASE}" \
       -v "${MYSQL_DATA}":/var/lib/mysql \
       --network host \
       --restart always \
       -d mysql:"${MYSQL_VERSION}"
