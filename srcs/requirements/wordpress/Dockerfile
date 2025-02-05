FROM debian:latest

RUN apt-get update
RUN apt-install -y \
    php-fpm \
    php-mysql\
    wget \
    unzip \
    curl \
    mariadb-client

RUN wget https://wordpress.org/latest.zip -O /tmp/wordpress.zip
RUN unzip /tmp/wordpress.zip -d /var/www/
RUN rm /tmp/wordpress.zip
RUN chown -R www-data:www-data /var/www/wordpress

RUN rm -rf /var/lib/apt/lists/*