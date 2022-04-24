docker network create elasticsearch

docker run -d --name elasticsearch \
    -e "ES_JAVA_OPTS=-Xms512m -Xmx512m" \
    -e "discovery.type=single-node" \
    -v "$(pwd)"/elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml:ro \
    --privileged --network elasticsearch \
    -p 9200:9200 -p 9300:9300 \
    elasticsearch:7.8.0

docker run -d --name kibana \
    --net elasticsearch \
    -p 5601:5601 \
    -v "$(pwd)"/kibana.yml:/usr/share/kibana/config/kibana.yml \
    kibana:7.8.0
