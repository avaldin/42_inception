FROM debian:12

RUN apt update
RUN apt install -y mariadb-server
RUN apt install -y mariadb-client
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld /var/lib/mysql

USER mysql

COPY mariaDb.conf /etc/mysql/mysql.conf

CMD ["mysqld"]