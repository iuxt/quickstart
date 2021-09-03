访问出现js或css无法加载的情况，样式错乱

nginx 需要添加头

```conf
proxy_set_header X-Forwarded-Proto $scheme;
```

原因是在：
wp-config.php里面， 为了开启下面的参数

```php
if (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') {
    $_SERVER['HTTPS'] = 'on';
}
```

参考：
<https://github.com/docker-library/wordpress/pull/142>

<https://hub.docker.com/_/wordpress>
