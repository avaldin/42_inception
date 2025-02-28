FROM debian:11

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y mariadb-server --no-install-recommends
RUN mkdir -p /run/mysqld/
RUN chown -R mysql:mysql /run/mysqld/

COPY ./mariadb.cnf /etc/mysql/mariadb.conf.d/mariadb.cnf

COPY ./tools/mariadb.sh /usr/local/bin/mariadb.sh

RUN chmod +x /usr/local/bin/mariadb.sh

ENTRYPOINT ["/usr/local/bin/mariadb.sh"]

CMD ["mariadbd"]