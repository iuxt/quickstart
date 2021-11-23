#!/bin/bash

source ./.env
NOW=$(date "+%Y-%m-%d_%H:%M:%S")
docker exec wordpress-mysql bash -c "mysqldump -hlocalhost -uroot -p${MYSQL_ROOT_PASSWORD} wordpress" > "mysql_backup_${NOW}.sql"
tar zc "mysql_backup_${NOW}.sql" -f "backup/mysql_backup_${NOW}.tar.gz" --force-local && rm -f "mysql_backup_${NOW}.sql" 
