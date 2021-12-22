FROM centos:7

EXPOSE 389/tcp

RUN yum install -y openldap openldap-clients openldap-servers && \
    yum clean all && \
    cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG && \
    chown ldap. /var/lib/ldap/DB_CONFIG

COPY init /root
RUN  slapd -h "ldapi:/// ldap:///" && \
     ldapadd -Y EXTERNAL -H ldapi:/// -f /root/chrootpw.ldif && \
     ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/cosine.ldif && \
     ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/nis.ldif && \
     ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/inetorgperson.ldif && \
     ldapmodify -Y EXTERNAL -H ldapi:/// -f /root/chdomain.ldif

CMD [ "/root/docker-entrypoint.sh" ]
