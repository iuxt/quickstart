#!/bin/bash

docker run -d --name postgres \
    -v ./data:/var/lib/postgresql/data \
    --network iuxt \
    --restart unless-stopped \
    -e POSTGRES_USER=user \
    -e POSTGRES_PASSWORD=password \
    -e POSTGRES_DB=database \
    postgres:16-alpine