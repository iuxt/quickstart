#!/bin/bash -e

# 国家名
C=CN
# 省
ST=Shanghai
# 市
L=Shanghai
# 公司名
O=张理坤
# 组织或部门名
OU=张理坤
# 服务器FQDN或颁发者名
CN=张理坤
# 邮箱地址
emailAddress=iuxt@qq.com

# openssl 配置文件位置：ubuntu: /usr/lib/ssl/openssl.cnf    centos: /etc/pki/tls/openssl.cnf
# 证书的基础路径： centos 默认位置/etc/pki/CA， ubuntu默认为./demoCA
basedir=./demoCA

mkdir -p ${basedir}/{private,newcerts}
touch ${basedir}/index.txt
[ ! -f ${basedir}/seria ] && echo 01 > ${basedir}/serial
[ ! -f ${basedir}/crlnumber ] && echo 01 > ${basedir}/crlnumber
[ ! -f ${basedir}/cacert.pem ] && openssl req -utf8 -new -x509 -days 36500 -newkey rsa:2048 -nodes -keyout ${basedir}/private/cakey.pem -out ${basedir}/cacert.pem -subj "/C=${C}/ST=${ST}/L=${L}/O=${O}/OU=${OU}/CN=${CN}/emailAddress=${emailAddress}"
[ ! -f ${basedir}/private/ca.crl ] && openssl ca -crldays 36500 -gencrl -out "${basedir}/private/ca.crl"
