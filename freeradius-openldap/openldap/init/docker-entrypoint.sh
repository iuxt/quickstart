#!/bin/bash

slapd -h "ldapi:/// ldap:///"
while :
do
    if [ $(ps -ef | grep slapd | grep -cv "grep") -eq 0 ]; then
        exit 1
    fi
    sleep 5
done