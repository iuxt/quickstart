#!/bin/bash
set -euo pipefail

docker rm -f wordpress

rm -f ../nginx/conf.d/wordpress.conf
../nginx/reload_nginx.sh

