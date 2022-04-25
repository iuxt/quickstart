docker run \
  --detach \
  --restart always \
  --name gitlab-ce \
  --privileged \
  --memory 4096M \
  --network iuxt \
  --publish 2222:22 \
  --publish 2080:80 \
  --publish 2443:443 \
  --hostname gitlab.babudiu.com \
  --env GITLAB_OMNIBUS_CONFIG=" \
    nginx['redirect_http_to_https'] = false; "\
  --volume /srv/gitlab-ce/conf:/etc/gitlab:z \
  --volume /srv/gitlab-ce/logs:/var/log/gitlab:z \
  --volume /srv/gitlab-ce/data:/var/opt/gitlab:z \
  yrzr/gitlab-ce-arm64v8:latest
