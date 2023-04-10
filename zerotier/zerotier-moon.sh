#!/bin/bash
set -euo pipefail

public_ip=$(curl ip.sb)

docker run --name zerotier-moon \
    -d -p 9993:9993 -p 9993:9993/udp \
    -v $(pwd)/zerotier-moon:/var/lib/zerotier-one \
    jonnyan404/zerotier-moon -4 ${public_ip}

