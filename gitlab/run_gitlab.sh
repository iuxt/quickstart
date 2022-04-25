docker run -d \
    --hostname gitlab.babudiu.com \
    -p 2082:443 -p 2081:80 -p 2222:22 \
    --name gitlab \
    --restart always \
    -v "$PWD"/config:/etc/gitlab \
    -v "$PWD"/logs:/var/log/gitlab \
    -v "$PWD"/data:/var/opt/gitlab \
    ulm0/gitlab
