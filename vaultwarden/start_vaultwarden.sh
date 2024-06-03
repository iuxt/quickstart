#!/bin/bash

../public/docker-network.sh

docker run -d \
    -v "$(pwd)"/vaultwarden_data/:/data/ \
    --env-file="$(pwd)"/.env \
    --network iuxt \
    --name=vaultwarden \
    --restart=always \
    vaultwarden/server:latest

# 生效nginx规则
/bin/cp nginx/vaultwarden.conf ../nginx/conf.d/
../nginx/reload_nginx.sh


# fail2ban规则
cd fail2ban && ./set_fail2ban.sh
systemctl enable fail2ban
systemctl reload fail2ban

fail2ban-client status

