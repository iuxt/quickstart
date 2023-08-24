#!/bin/bash
set -euxo pipefail

docker build . -t registry.cn-hangzhou.aliyuncs.com/iuxt/admin_client:v1
docker push registry.cn-hangzhou.aliyuncs.com/iuxt/admin_client:v1

