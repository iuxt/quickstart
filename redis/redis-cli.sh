#!/bin/bash
set -euo pipefail
source .env
docker run -it --network iuxt --rm redis:${REDIS_VER} redis-cli -h redis
