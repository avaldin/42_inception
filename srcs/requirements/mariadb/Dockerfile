FROM debian:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install -y mariadb-server
RUN rm -rf /var/lib/apt/lists/*

CMD ["mysqld"]