#!/bin/bash


docker rm -f gitea

rm -f ../nginx/conf.d/gitea.conf
rm -f ../nginx/stream.d/gitea.conf
../nginx/reload_nginx.sh
