#!/bin/bash

# frps
cp -f filter.d/frps.conf /etc/fail2ban/filter.d/
cp -f jail.d/frps.conf /etc/fail2ban/jail.d/
container_id=$(docker inspect --format="{{.Id}}" frps)
logpath=/var/lib/docker/containers/${container_id}/${container_id}-json.log
sed -i "s#logpath = .*#logpath = ${logpath}#g" /etc/fail2ban/jail.d/frps.conf

# nginx-http-cc
cp -f filter.d/nginx-http-cc.conf /etc/fail2ban/filter.d/
cp -f jail.d/nginx-http-cc.conf /etc/fail2ban/jail.d/
container_id=$(docker inspect --format="{{.Id}}" nginx)
logpath=/var/lib/docker/containers/${container_id}/${container_id}-json.log
sed -i "s#logpath = .*#logpath = ${logpath}#g" /etc/fail2ban/jail.d/nginx-http-cc.conf

# nginx-stream-cc
cp -f filter.d/nginx-stream-cc.conf /etc/fail2ban/filter.d/
cp -f jail.d/nginx-stream-cc.conf /etc/fail2ban/jail.d/
container_id=$(docker inspect --format="{{.Id}}" nginx)
logpath=/var/lib/docker/containers/${container_id}/${container_id}-json.log
sed -i "s#logpath = .*#logpath = ${logpath}#g" /etc/fail2ban/jail.d/nginx-stream-cc.conf

systemctl reload fail2ban
fail2ban-client status frps
fail2ban-client status nginx-http-cc
fail2ban-client status nginx-stream-cc
