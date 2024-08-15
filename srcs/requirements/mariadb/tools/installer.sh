#!/bin/bash

touch init.sql

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DB;" >> init.sql

echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> init.sql

echo "GRANT ALL PRIVILEGES ON $MYSQL_DB.* TO '$MYSQL_USER'@'%';" >> init.sql

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> init.sql

echo "FLUSH PRIVILEGES;" >> init.sql

mkdir -p /run/mysqld

mv init.sql /etc/mysql/init.sql

exec "mysqld" "--init-file=/etc/mysql/init.sql" "--user=mysql" "--console"