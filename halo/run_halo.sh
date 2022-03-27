#!/bin/bash
set -euo pipefail

docker run -it -d --name halo \
	-v $PWD/halo_data:/root/.halo \
	--network iuxt \
	--restart always \
	halohub/halo:latest
