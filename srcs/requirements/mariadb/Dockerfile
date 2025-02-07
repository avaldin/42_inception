FROM debian:12

RUN apt update
RUN apt install -y mariadb-server
RUN apt install -y mariadb-client
RUN rm -rf /var/lib/apt/lists/*

COPY mariaDb.conf /etc/mysql/mysql.conf

CMD ["mysqld"]