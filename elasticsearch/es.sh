docker network create elasticsearch

docker run -d --name elasticsearch -e "ES_JAVA_OPTS=-Xms512m -Xmx512m" -e "discovery.type=single-node" -v $PWD/es-data:/usr/share/elasticsearch/data -v $PWD/es-plugins:/usr/share/elasticsearch/plugins --privileged --network es -p 9200:9200 -p 9300:9300 elasticsearch:7.8.0

