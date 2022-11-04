#!/bin/sh
crond

cp -f config.ini.example config.ini

sed -i ./config.ini \
    -e "s/id = .*/id = ${id}/g" \
    -e "s/key = .*/key = ${key}/g" \
    -e "s/domain = .*/domain = ${domain}/g" \
    -e "s/sub_domain = .*/sub_domain = ${sub_domain}/g"

crond -f

