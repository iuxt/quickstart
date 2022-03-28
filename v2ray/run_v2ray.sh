#!/bin/bash
set -euo pipefail

docker run -d --name v2ray \
	--network iuxt \
	--restart always \
	iuxt/v2ray

