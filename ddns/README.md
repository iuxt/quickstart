# 使用说明

这是个ddns的python实现，调用dnspod的api

首先准备配置文件

```bash
cp config.ini.example config.ini
```

生成虚拟环境

```bash
python -m venv venv
```

启用虚拟环境

```bash
source ./venv/bin/activate   # Linux 环境
venv\Scripts\activate.bat    # Windows 环境
```

crontab 示例：

```bash
*/5 * * * * cd /data/code/quickstart/ddns/ && ./venv/bin/python ./main.py >> /data/logs/cron.log 2>&1
```

Docker版使用命令：

```bash
docker run -d \
    --name ddns \
    --network=host \
    --restart unless-stopped \
    --log-opt max-size=1m \
    -e id=你的dnspod id \
    -e key=你的dnspod key \
    -e id=你的dnspod id \
    -e domain=主域名（一级域名） \
    -e sub_domain=域名前缀 \
    iuxt/dnspod_ddns:latest
```
