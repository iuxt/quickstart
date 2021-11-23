# WordPress

## 快速启动

1. 安装Docker

    ```bash
    curl -fsSL get.docker.com | bash
    ```

2. 安装Docker-compose

    ```bash
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    ```

    > 或者你也可以使用`pip install docker-compose`来安装

3. 生成配置文件，并按需修改

    ```bash
    cp .env.example .env
    ```

4. 启动

    ```bash
    docker-compose up -d
    ```

5. 访问

    访问： <http://localhost:9999> 看看效果，不出意外会看到wordpress初始化界面

6. 配置反向代理

    首先安装nginx

    ```bash
    # Centos： 
    sudo yum install epel-release -y && sudo yum install nginx -y

    # Ubuntu:
    sudo apt install nginx -y
    ```

    复制配置文件到`/etc/nginx/conf.d`

    ```bash
    cp nginx_proxy_config_example.conf /etc/nginx/conf.d/example.conf
    ```

    > 配置文件内容按需修改，然后重新加载nginx配置文件

    ```bash
    sudo nginx -s reload
    ```

    HTTPS证书自动生成可以参考 <https://zahui.fan/28c679c3>

7. 做域名解析

## 如何备份

1. 数据库备份可以使用`backup_mysql.sh`
2. wordpress代码备份（包括插件）可以直接`tar zc wordpress_data -f wordpress_data.tar.gz`

## 常见问题

访问出现js或css无法加载的情况，样式错乱

nginx 需要添加Header

```conf
proxy_set_header X-Forwarded-Proto $scheme;
```

原因是在：
wp-config.php里面， 为了开启下面的参数，这样就可以自动识别是否使用了HTTPS

```php
if (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') {
    $_SERVER['HTTPS'] = 'on';
}
```

参考：  
<https://github.com/docker-library/wordpress/pull/142>  
<https://hub.docker.com/_/wordpress>  
