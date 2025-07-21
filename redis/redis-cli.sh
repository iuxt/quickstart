#!/bin/bash
set -euo pipefail
cd $(dirname $0)

source .env
docker run -it --network iuxt --rm redis:${REDIS_VER} redis-cli -h redis
