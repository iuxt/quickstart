# 自签证书工具

## 脚本说明

| 脚本名            | 作用                       |
| ----------------- | -------------------------- |
| create_ca_cert.sh | 生成ca证书和吊销列表的工具 |
| create_cert.sh    | 使用CA进行签发其他证书     |
| revoke_cert.sh    | 吊销证书工具               |

## 使用方法

首先运行一遍create_ca_cert 为了生成ca证书和吊销列表

创建证书:

```bash
./create_cert.sh --ou 研发部 --cn 张理坤 --email iuxt@qq.com
```

吊销证书:

```bash
./revoke_cert.sh 张理坤
```

## 证书用作https

需要将cert.ext里面的DNS内容换成你的域名, 将IP换成服务器的IP

自签证书需要把ca.crt导入到操作系统的受信任根证书颁发机构里面.
