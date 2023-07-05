FROM nginx

MAINTAINER zenaluth <zenaluth@student.21-school.ru>

COPY ./source/main.c /home/main.c
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./source/5-start-main.sh /docker-entrypoint.d/5-start-main.sh

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y \
	libfcgi-dev \
	gcc \
	spawn-fcgi && \
    rm -rf /var/lib/apt/lists/* && \
    gcc -I/usr/local/include /home/main.c -lfcgi -o /home/main.fcgi && \
    touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid && \
    chown -R nginx:nginx /var/log/nginx && \
    chown -R nginx:nginx /var/cache/nginx

USER nginx
