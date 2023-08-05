https://docs.gitea.com/next/administration/config-cheat-sheet

## 如何使用ssh
gitea-data/gitea/conf/app.ini 在server下面

启用内置的ssh服务器
START_SSH_SERVER = true

页面上显示的url后面的端口
SSH_PORT = 22

监听的端口
SSH_LISTEN_HOST = 22222

然后将容器内的22222端口暴露出来,映射到主机的22端口即可.
