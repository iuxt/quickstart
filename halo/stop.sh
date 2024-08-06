#!/bin/bash

docker rm -f halo
rm -f ../nginx/conf.d/"$(basename "$(pwd)")".conf

../nginx/reload_nginx.sh