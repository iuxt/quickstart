#!/bin/bash

docker run -d --name openldap \
  --env LDAP_ADMIN_USERNAME=admin \
  --env LDAP_ADMIN_PASSWORD=com.012 \
  --env LDAP_USERS=zhanglikun \
  --env LDAP_PASSWORDS=com.012 \
  --env LDAP_ROOT="dc=nutstore,dc=com" \
  -p 389:1389 \
  bitnami/openldap:latest