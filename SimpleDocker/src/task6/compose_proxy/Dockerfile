FROM nginx

MAINTAINER zenaluth <zenaluth@student.21-school.ru>

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y \
	libfcgi-dev \
	gcc \
	spawn-fcgi && \
    rm -rf /var/lib/apt/lists/* && \
    touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid && \
    chown -R nginx:nginx /var/log/nginx && \
    chown -R nginx:nginx /var/cache/nginx

USER nginx
