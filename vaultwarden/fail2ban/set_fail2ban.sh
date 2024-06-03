#!/bin/bash

if [ "$(id -u)" != "0" ]; then
    echo "Error: 必须使用ROOT用户来运行， 你可以在命令前面加上 sudo "
    exit 1
fi

# vaultwarden
cp -f filter.d/vaultwarden.conf /etc/fail2ban/filter.d/
cp -f jail.d/vaultwarden.conf /etc/fail2ban/jail.d/
logpath=$(dirname "$(pwd)")/vaultwarden_data/vaultwarden.log
sed -i "s#logpath = .*#logpath = ${logpath}#g" /etc/fail2ban/jail.d/vaultwarden.conf

systemctl reload fail2ban
fail2ban-client status vaultwarden
