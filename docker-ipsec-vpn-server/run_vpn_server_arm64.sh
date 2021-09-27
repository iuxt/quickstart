docker run \
  --name ipsec-vpn-server \
  --restart=always \
  -v $(pwd)/ikev2-vpn-data:/etc/ipsec.d \
  -p 500:500/udp \
  -p 4500:4500/udp \
  -d --privileged \
  --restart=always \
  iuxt/docker-ipsec-vpn-server:arm64-20210831
  