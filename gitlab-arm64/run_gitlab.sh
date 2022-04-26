docker run \
  --detach \
  --restart always \
  --name gitlab-ce \
  --privileged \
  --memory 4096M \
  --network iuxt \
  --publish 2222:22 \
  --hostname gitlab.babudiu.com \
  --env GITLAB_OMNIBUS_CONFIG=" \
    nginx['redirect_http_to_https'] = false; 
    nginx['listen_https'] = nil" \
  --volume "$PWD"/conf:/etc/gitlab:z \
  --volume "$PWD"/logs:/var/log/gitlab:z \
  --volume "$PWD"/data:/var/opt/gitlab:z \
  yrzr/gitlab-ce-arm64v8:latest
