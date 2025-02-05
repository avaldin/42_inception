FROM debian:latest

RUN	apt-get update
RUN apt-get install -y nginx openssl
RUN	apt-get clean
RUN	rm -rf /var/lib/apt/lists/*
RUN mkdir -p etc/nginx/nginx.nginx.conf
RUN mkdir etc/nginx/ssl
RUN openssl req -x509 -newkey rsa:4096\
    -keyout etc/nginx/ssl/private.key \
    -out etc/nginx/ssl/certificate.crt\
    -days 365 -nodes \
    -subj "/C=FR/ST=France/L=Lyon/O=42/CN=localhost"
RUN mkdir -p /var/log/nginx

COPY nginx.conf etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]

