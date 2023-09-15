FROM ubuntu:latest

RUN sed -i 's@//.*.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list
RUN apt update && \
    apt install -y curl \
    inetutils-ping \
    telnet \
    ncat \
    python3 \
    mysql-client-core-8.0 \
    redis-tools \
    iputils-tracepath \
    && apt clean all

CMD ["sleep", "infinity"]
