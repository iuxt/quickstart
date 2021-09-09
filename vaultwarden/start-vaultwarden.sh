docker run -d \
    -v $(pwd)/vaultwarden_data/:/data/ \
    -p 127.0.0.1:10001:80 \
    -p 127.0.0.1:10002:3012 \
    --env-file=$(pwd)/vaultwarden.env \
    --name=vaultwarden \
    --restart=always \
    vaultwarden/server
    
