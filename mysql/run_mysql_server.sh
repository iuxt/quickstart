source ./.env
docker run --name mysql \
       -e MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} \
       -p ${MYSQL_PORT}:3306 \
       -v ${MYSQL_DATA}:/var/lib/mysql \
       -d mysql:${MYSQL_VERSION}
