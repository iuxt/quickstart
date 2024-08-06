#!/bin/bash

docker rm -f gitlab-ce

rm -f ../nginx/conf.d/"$(basename "$(pwd)")".conf

../nginx/reload_nginx.sh
