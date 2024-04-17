#!/bin/bash

IP="10.0.0.101"


cat >> server.ext <<EOF
keyUsage = nonRepudiation, digitalSignature, keyEncipherment
extendedKeyUsage = serverAuth, clientAuth
subjectAltName=@SubjectAlternativeName

[ SubjectAlternativeName ]
DNS.1=i.com
DNS.2=*.i.com
IP.1=${IP}
EOF

openssl genrsa -out server.key 4096
openssl req -utf8 -new -key server.key -out server.csr -subj '/C=CN/ST=Shanghai/L=Pudong/O=iuxt/OU=张理坤/CN=*.i.com/emailAddress=iuxt@qq.com'
openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt -days 3650 -sha256 -extfile server.ext

