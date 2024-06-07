#!/bin/bash
set -euo pipefail

docker rm -f v2ray

rm -f ../nginx/conf.d/v2ray.conf
../nginx/reload_nginx.sh

