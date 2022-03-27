#!/bin/bash
set -euo pipefail

docker run -it -d --name halo \
	-p 8090:8090 \
	-v $PWD/halo_data:/root/.halo \
	--restart always \
	halohub/halo:latest
