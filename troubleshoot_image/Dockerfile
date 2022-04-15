FROM ubuntu:latest
RUN apt update && \
    apt install -y curl \
    inetutils-ping \
    telnet \
    ncat \
    && apt clean all

RUN apt install -y python3 \
    mysql-client-core-8.0 \
    redis-tools \
    && apt clean all

CMD ["python3", "-m", "http.server", "80"]
