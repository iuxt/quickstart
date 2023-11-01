#!/bin/bash
set -euo pipefail

../public/docker-network.sh
source .env

docker run -d --name wordpress-mysql \
    --env-file=.env \
    -v "$(pwd)/mysql_data":/var/lib/mysql \
    -v "$(pwd)/mysql_temp":/mysql_temp \
    --network iuxt \
    --restart always \
    -d mysql:"${MYSQL_VERSION}"

docker run -d --name wordpress \
  -v "$PWD"/wordpress_data:/var/www/html \
  --mount type=bind,source="$PWD/php_custom.ini",target=/usr/local/etc/php/conf.d/php_custom.ini \
  --env-file=.env \
  --network iuxt \
  --restart always \
  wordpress:${WORDPRESS_VERSION}

cp -f ./wordpress_nginx.conf ../nginx/conf.d/wordpress.conf

