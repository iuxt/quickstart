#!/bin/bash
set -euo pipefail

docker rm -f wordpress

rm -f ../nginx/conf.d/"$(basename "$(pwd)")".conf

../nginx/reload_nginx.sh

