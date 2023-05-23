#!/bin/bash
sudo sysctl -w vm.max_map_count=262144

docker network create --subnet=172.16.0.0/24 elasticsearch-br0


docker run -d --name elasticsearch1 \
    -e "ES_JAVA_OPTS=-Xms512m -Xmx512m" \
    -v "$(pwd)"/elasticsearch1.yml:/usr/share/elasticsearch/config/elasticsearch.yml:ro \
    -v "$(pwd)"/data2:/usr/share/elasticsearch/data:rw \
    -v "$(pwd)"/logs1:/usr/share/elasticsearch/logs:rw \
    --privileged --network elasticsearch-br0 \
    --ip 172.16.0.11 \
    -p 9201:9200 -p 9301:9300 \
    elasticsearch:7.16.2

docker run -d --name elasticsearch2 \
    -e "ES_JAVA_OPTS=-Xms512m -Xmx512m" \
    -v "$(pwd)"/elasticsearch2.yml:/usr/share/elasticsearch/config/elasticsearch.yml:ro \
    -v "$(pwd)"/data2:/usr/share/elasticsearch/data:rw \
    -v "$(pwd)"/logs2:/usr/share/elasticsearch/logs:rw \
    --privileged --network elasticsearch-br0 \
    --ip 172.16.0.12 \
    -p 9202:9200 -p 9302:9300 \
    elasticsearch:7.16.2

docker run -d --name elasticsearch3 \
    -e "ES_JAVA_OPTS=-Xms512m -Xmx512m" \
    -v "$(pwd)"/elasticsearch3.yml:/usr/share/elasticsearch/config/elasticsearch.yml:ro \
    -v "$(pwd)"/data2:/usr/share/elasticsearch/data:rw \
    -v "$(pwd)"/logs3:/usr/share/elasticsearch/logs:rw \
    --privileged --network elasticsearch-br0 \
    --ip 172.16.0.13 \
    -p 9203:9200 -p 9303:9300 \
    elasticsearch:7.16.2


docker run -d --name kibana \
    --net elasticsearch-br0 \
    -p 5601:5601 \
    -v "$(pwd)"/kibana.yml:/usr/share/kibana/config/kibana.yml \
    kibana:7.16.2
