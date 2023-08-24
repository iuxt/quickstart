docker network create elasticsearch

docker run -d --name elasticsearch \
    -e "ES_JAVA_OPTS=-Xms512m -Xmx512m" \
    -e "discovery.type=single-node" \
    -v "$(pwd)"/elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml:ro \
    -v "$(pwd)"/es-data:/usr/share/elasticsearch/data:rw \
    -v "$(pwd)"/es-logs:/usr/share/elasticsearch/logs:rw \
    --privileged --network elasticsearch \
    -p 9200:9200 -p 9300:9300 \
    elasticsearch:7.16.2

docker run -d --name kibana \
    --net elasticsearch \
    -p 5601:5601 \
    -v "$(pwd)"/kibana.yml:/usr/share/kibana/config/kibana.yml \
    kibana:7.16.2
