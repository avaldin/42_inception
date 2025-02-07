FROM debian:12

RUN apt update
RUN apt install -y \
    php-fpm \
    php-mysql\
    wget \
    unzip \
    curl \
    mariadb-client

RUN rm -rf /var/lib/apt/lists/*

RUN wget https://wordpress.org/latest.zip -O /tmp/wordpress.zip
RUN unzip /tmp/wordpress.zip -d /var/www/
RUN rm /tmp/wordpress.zip
RUN chown -R www-data:www-data /var/www/wordpress

COPY www.conf /etc/php/8.2/fpm/pool.d/www.conf

CMD ["php-fpm8.2", "-F"]

