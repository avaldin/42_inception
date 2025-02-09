#!/bin/bash

set -e

if [ -z "$SQL_DATABASE" ] || [ -z "$SQL_USER" ] || [ -z "$SQL_PASSWORD" ] || [ -z "$SQL_ROOT_PASSWORD" ]; then
  echo "Environment Variable not set."
  exit 1
fi

chgrp -R mysql /var/lib/mysql
chmod -R g+rwx /var/lib/mysql

if [ -d "/var/lib/mysql/$SQL_DATABASE" ]; then
  echo "data base exist"
else

if [ ! -d "/var/lib/mysql/$SQL_DATABASE" ]; then
  mysql_install_db
fi

service mariadb start

mysql -u root -p"$MYSQL_ROOT_PASSWORD" <<-EOSQL
    CREATE USER 'masterOfThisWorld' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
    CREATE USER 'simpleUser' IDENTIFIED BY '%{MYSQL_PASSWORD}';
    GRANT ALL PRIVILEGES ON wordpress.* TO 'masterOfThisWorld';
    FLUSH PRIVILEGES;
EOSQL