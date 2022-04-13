#!/bin/bash
set -euxo pipefail

if [ "$(docker network ls | grep -c iuxt)" -eq 0 ]; then
  docker network create iuxt
else
  echo "docker network iuxt exists skip"
fi

docker run -it --rm --network iuxt iuxt/ubuntu bash
