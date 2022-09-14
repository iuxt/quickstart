FROM alpine:latest
ADD https://github.com/v2fly/v2ray-core/releases/download/v4.44.0/v2ray-linux-64.zip /v2ray/
RUN cd /v2ray && unzip v2ray-linux-64.zip 
COPY config.json /v2ray
CMD /v2ray/v2ray -config /v2ray/config.json
