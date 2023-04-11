启动后：先查看log

docker logs zerotier-moon

查看到加入命令, 在客户端执行此命令后
zerotier-cli orbit 8c388f4e9a 8c388f4e9a

查看是否生效

zerotier-cli listpeers


去除节点

zerotier-cli deorbit 8c388f4e9a
