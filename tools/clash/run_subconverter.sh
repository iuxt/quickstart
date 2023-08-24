#!/bin/bash
set -euo pipefail

../public/docker-network.sh

docker run -d --restart=always --network iuxt --name subconverter tindy2013/subconverter:latest
