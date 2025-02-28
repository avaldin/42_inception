#!/bin/bash

if [ -z "$SQL_DATABASE" ] || [ -z "$SQL_USER" ] || [ -z "$SQL_PASSWORD" ] || [ -z "$SQL_ROOT_PASSWORD" ]; then
  echo "One or more required environment variables are not set."
  echo "Please set SQL_DATABASE, SQL_USER, SQL_PASSWORD, and SQL_ROOT_PASSWORD."
  exit 1
fi

chgrp -R mysql /var/lib/mysql
chmod -R g+rwx /var/lib/mysql

if [ -d "/var/lib/mysql/$SQL_DATABASE" ]; then
  echo "Database already exits"
else

if [ ! -d "/var/lib/mysql" ]; then
  mysql_install_db
fi

service mariadb start

mariadb << EOL
CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;
CREATE USER IF NOT EXISTS $SQL_USER@'localhost' IDENTIFIED BY "$SQL_PASSWORD";
GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO $SQL_USER@'%' IDENTIFIED BY "$SQL_PASSWORD";
ALTER USER 'root'@'localhost' IDENTIFIED BY "$SQL_ROOT_PASSWORD";
FLUSH PRIVILEGES;
EOL

service mariadb stop
fi
exec "$@"