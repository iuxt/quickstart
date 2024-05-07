## 证书生成

```bash
/usr/share/elasticsearch/bin/elasticsearch-certutil ca
/usr/share/elasticsearch/bin/elasticsearch-certutil cert --ca elastic-stack-ca.p12
```

## 初始化密码

```bash
docker exec elasticsearch1 bash -c "echo y | /usr/share/elasticsearch/bin/elasticsearch-setup-passwords auto"
```

## 重新设置密码

```bash
curl -XPUT -u elastic:belu3EfkGVLiU2vEcRno http://localhost:9200/_xpack/security/user/elastic/_password -H "Content-Type: application/json" -d '
{
  "password": "Ds8meuPwMDEv32f6qLdw"
}'
```

