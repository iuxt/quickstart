docker run --name mysql \
       -e MYSQL_ROOT_PASSWORD=com.012 \
       -p 3306:3306 \
       -v $(pwd)/mysql_data:/var/lib/mysql \
       -d mysql:5.7
