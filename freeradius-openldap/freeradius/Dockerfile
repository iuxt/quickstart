FROM centos:7

# RADIUS Authentication Messages
EXPOSE 1812/udp

# RADIUS Accounting Messages
EXPOSE 1813/udp

RUN yum install -y freeradius freeradius-utils freeradius-ldap && \
    yum clean all

COPY mods-enabled/ldap /etc/raddb/mods-enabled/ldap
COPY clients.conf /etc/raddb/clients.conf

CMD ["radiusd", "-f"]