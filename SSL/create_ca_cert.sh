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

mkdir -p ./demoCA/{private,newcerts}
touch ./demoCA/index.txt
[ ! -f ./demoCA/seria ] && echo 01 > ./demoCA/serial
[ ! -f ./demoCA/crlnumber ] && echo 01 > ./demoCA/crlnumber
[ ! -f ./demoCA/cacert.pem ] && openssl req -utf8 -new -x509 -days 36500 -newkey rsa:2048 -nodes -keyout ./demoCA/private/cakey.pem -out ./demoCA/cacert.pem -subj "/C=${C}/ST=${ST}/L=${L}/O=${O}/OU=${OU}/CN=${CN}/emailAddress=${emailAddress}"
[ ! -f ./demoCA/private/ca.crl ] && openssl ca -crldays 36500 -gencrl -out "./demoCA/private/ca.crl"
