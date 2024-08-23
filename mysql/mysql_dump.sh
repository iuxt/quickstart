#!/bin/bash
set -euo pipefail

source ./.env
docker exec -it mysql bash -c "mysqldump -hlocalhost -uroot -p${MYSQL_ROOT_PASSWORD} --all-databases > /var/lib/mysql-files/all.sql"
