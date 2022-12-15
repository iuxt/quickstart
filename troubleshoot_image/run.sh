#!/bin/bash
set -euxo pipefail

if [ "$(docker network ls | grep -c iuxt)" -eq 0 ]; then
  docker network create iuxt
else
  echo "docker network iuxt exists skip"
fi

docker run -it --rm --network iuxt registry.cn-hangzhou.aliyuncs.com/iuxt/admin_client:v1 bash
# kubectl run -i --tty manager --image=registry.cn-hangzhou.aliyuncs.com/iuxt/admin_client:v1 --restart=Never /bin/bash
