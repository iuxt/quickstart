#!/bin/bash

docker rm -f nginx

rm -f /etc/fail2ban/jail.d/nginx-stream-cc.conf
rm -f /etc/fail2ban/jail.d/nginx-http-cc.conf

systemctl enable fail2ban
systemctl reload fail2ban

fail2ban-client status

