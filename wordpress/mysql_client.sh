#!/bin/bash

source ./.env
docker exec -it wordpress-mysql bash -c "mysql -hlocalhost -uroot -p${MYSQL_ROOT_PASSWORD}"
