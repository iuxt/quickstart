#!/bin/bash
ip=120.136.158.158

jail_list=$(fail2ban-client status | grep "Jail list" | awk -F ":" '{print $2}' | xargs | sed 's/,//g')

for i in ${jail_list[*]};
do
    echo $i
    fail2ban-client set ${i} unbanip ${ip}
done
