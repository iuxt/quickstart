#!/bin/bash
../public/docker-network.sh

docker run -d --name=grafana \
    --network iuxt \
    --restart always \
    --user "$(id -u)" \
    --volume "$PWD/data:/var/lib/grafana" \
    -e "GF_SERVER_ROOT_URL=https://grafana.babudiu.com/" \
    -e "GF_INSTALL_PLUGINS=grafana-clock-panel" \
    --add-host=host.docker.internal:host-gateway \
    grafana/grafana


../public/add_config_to_nginx.sh
