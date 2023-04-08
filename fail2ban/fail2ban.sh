#!/bin/bash

service=(
frps
nginx-cc
)

for i in ${service[*]};
do

    cp -f filter.d/${i}.conf /etc/fail2ban/filter.d/
    cp -f jail.d/${i}.conf /etc/fail2ban/jail.d/

    if [ ${i} == "nginx-cc" ]; then
        container_id=$(docker inspect --format="{{.Id}}" nginx)
    else
        container_id=$(docker inspect --format="{{.Id}}" ${i})
    fi

    logpath=/var/lib/docker/containers/${container_id}/${container_id}-json.log
    sed -i "s#logpath = .*#logpath = ${logpath}#g" /etc/fail2ban/jail.d/${i}.conf

    systemctl reload fail2ban
    fail2ban-client status ${i}
done

