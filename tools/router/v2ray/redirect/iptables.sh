#!/bin/bash
# 首先清空这条链（不存在会报错）
sudo iptables -t nat -F V2RAY
# 新建链
sudo iptables -t nat -N V2RAY

# 私有IP处理，RETURN: 过滤不通过，返回
sudo iptables -t nat -A V2RAY -d 0/8 -j RETURN
sudo iptables -t nat -A V2RAY -d 10/8 -j RETURN
sudo iptables -t nat -A V2RAY -d 127/8 -j RETURN
sudo iptables -t nat -A V2RAY -d 169.254/16 -j RETURN
sudo iptables -t nat -A V2RAY -d 172.16/12 -j RETURN
sudo iptables -t nat -A V2RAY -d 192.168/16 -j RETURN
sudo iptables -t nat -A V2RAY -d 224/4 -j RETURN
sudo iptables -t nat -A V2RAY -d 240/4 -j RETURN
sudo iptables -t nat -A V2RAY -d 255.255.255/32 -j RETURN

# 其他不想要代理的IP：
# 这里一定需要将代理服务器的IP加进来(如果服务器是域名参考后面的说明)：
sudo iptables -t nat -A V2RAY -s x.x.x.x -j RETURN 

# 需要代理的流量转发至V2ray的端口：1081，以下两行分别设置通过单个IP匹配、通过网络号匹配：
sudo iptables -t nat -A V2RAY -s 192.168.1.22 -p tcp -j REDIRECT --to-ports 12345
sudo iptables -t nat -A V2RAY -s 192.168.1.0/24 -p tcp -j REDIRECT --to-ports 12345

# 也可以直接设置剩下的所有流量全部转发，需要谨慎使用：
# sudo iptables -t nat -A V2RAY -p tcp -j REDIRECT --to-ports 1081

# 将 POSTROUTING & OUTPUT 链的流量转发到V2RAY，具体只是搜索：iptable三表五链
sudo iptables -t nat -A PREROUTING -p tcp -j V2RAY
sudo iptables -t nat -A OUTPUT -p tcp -j V2RAY
