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
