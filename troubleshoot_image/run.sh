#!/bin/bash
set -euxo pipefail

../public/docker-network.sh

docker run -it --rm --network iuxt registry.cn-hangzhou.aliyuncs.com/iuxt/admin_client:v1 bash
# kubectl run -i --tty manager --image=registry.cn-hangzhou.aliyuncs.com/iuxt/admin_client:v1 --restart=Never /bin/bash
