FROM nginx

COPY ./source/main.c /home/main.c
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./source/5-start-main.sh /docker-entrypoint.d/5-start-main.sh

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y \
	libfcgi-dev \
	gcc \
	spawn-fcgi && \
    gcc -I/usr/local/include /home/main.c -lfcgi -o /home/main.fcgi

EXPOSE 81