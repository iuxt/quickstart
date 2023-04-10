#!/bin/bash -e

basedir=./demoCA

# 吊销一个签证过的证书
openssl ca -revoke "${1}/${1}.crt"
openssl ca -gencrl -out "${basedir}/private/ca.crl"
