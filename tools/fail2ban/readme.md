# fail2ban防止暴力破解配置

## 测试方法

```bash
for i in {1..55}; do
    echo $i 次访问
    curl https://baidu.com
done
```