#!/bin/bash

docker run -d --name=grafana \
    --user "$(id -u)" \
    --volume "$PWD/data:/var/lib/grafana" \
    -e "GF_SERVER_ROOT_URL=http://my.grafana.server/" \
    -e "GF_INSTALL_PLUGINS=grafana-clock-panel" \
    grafana/grafana


cp -f ./grafana-nginx.conf ../nginx/conf.d/grafana.conf
../nginx/reload_nginx.sh
