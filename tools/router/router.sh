#!/bin/bash

systemctl disable --now ufw

mkdir /data/{logs,tools,code} -p
chown -R iuxt. /data

sudo apt install -y python-is-python3

git config --global user.name zhanglikun
git config --global user.email "iuxt@qq.com"


sudo apt install python3-pip
sudo apt install python3-venv

ln -sf /usr/bin/vim.basic /etc/alternatives/editor

timedatectl set-timezone Asia/Shanghai

sudo mount -t cifs //192.168.1.11/0/ /mnt -o vers=2.0,uid=0,gid=0,dir_mode=0755,file_mode=0755,mfsymlinks,cache=strict,rsize=1048576,wsize=1048576,username=iuxt,password="password"


# v2ray
sudo cp -f v2ray.service /usr/lib/systemd/system/


