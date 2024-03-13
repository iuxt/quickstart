#!/bin/bash

docker run -td --name hbbs \
	-v ./data:/root \
       	--net=host \
	--restart unless-stopped \
	rustdesk/rustdesk-server hbbs

docker run -td --name hbbr \
	-v ./data:/root \
       	--net=host \
	--restart unless-stopped \
	rustdesk/rustdesk-server hbbr

