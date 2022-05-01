docker run \
  --detach \
  --restart always \
  --name gitlab-ce \
  --privileged \
  --memory 8192M \
  --network iuxt \
  --publish 2222:22 \
  --hostname gitlab.babudiu.com \
  --env GITLAB_OMNIBUS_CONFIG=" \
    gitlab_rails['gitlab_shell_ssh_port'] = 2222
    nginx['redirect_http_to_https'] = false 
    " \
  --volume "$PWD"/conf:/etc/gitlab:z \
  --volume "$PWD"/logs:/var/log/gitlab:z \
  --volume "$PWD"/data:/var/opt/gitlab:z \
  --restart always \
  yrzr/gitlab-ce-arm64v8:latest
