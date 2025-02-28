
FROM debian:10

RUN apt-get update
RUN apt-get install -y nginx openssl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes  \
    -out /etc/nginx/ssl/inception.crt  \
    -keyout /etc/nginx/ssl/inception.key  \
    -subj "/C=FR/ST=IDF/L=Lyon/0=42/OU=42/CN=avadlin.42.fr/UID=avaldin"

COPY conf/nginx.conf etc/nginx/nginx.conf
RUN mkdir -p /var/run/nginx

CMD ["nginx", "-g", "daemon off;" ]

