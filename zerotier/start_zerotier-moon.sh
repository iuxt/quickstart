#!/bin/bash
set -euo pipefail

public_ip=$(curl ip.sb)

docker run --name zerotier-moon \
    -d -p 9993:9993 -p 9993:9993/udp \
    -v $(pwd)/data:/var/lib/zerotier-one \
    --restart=always \
    iuxt/zerotier-moon:latest -4 ${public_ip}

