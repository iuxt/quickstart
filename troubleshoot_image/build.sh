#!/bin/bash
set -euxo pipefail

docker build . -t iuxt/ubuntu:latest
docker push iuxt/ubuntu:latest

