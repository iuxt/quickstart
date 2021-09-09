VAULTWARDEN_DATA=$(pwd)/bitwarden-data/

docker run -d \
-v $VAULTWARDEN_DATA:/data/ \
-p 127.0.0.1:10001:80 \
-p 127.0.0.1:10002:3012 \
--env-file=$VAULTWARDEN_DATA/vaultwarden.env \
--name=vaultwarden \
--restart=always \
vaultwarden/server

