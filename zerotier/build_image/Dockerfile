FROM zerotier/zerotier:latest
COPY entrypoint.sh /entrypoint.sh
RUN apt-get update && apt-get install -y procps && apt-get clean all
EXPOSE 9993/udp

ENTRYPOINT ["/entrypoint.sh"]
