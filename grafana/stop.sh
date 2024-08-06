#!/bin/bash

docker rm -f grafana
rm -f ../nginx/conf.d/"$(basename "$(pwd)")".conf

../nginx/reload_nginx.sh