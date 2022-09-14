FROM alpine:latest
ADD https://github.com/v2fly/v2ray-core/releases/download/v5.1.0/v2ray-linux-arm64-v8a.zip /v2ray/
RUN cd /v2ray && unzip v2ray-linux-arm64-v8a.zip 
COPY config.json /v2ray
CMD /v2ray/v2ray run
