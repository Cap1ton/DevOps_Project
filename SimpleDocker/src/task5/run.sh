#!/bin/bash

docker build -t carnaget:tag . -f ./Dockerfile
docker run -d -p 80:81 -v "`pwd`/nginx":/etc/nginx carnaget:tag

dockle -ak NGINX_GPGKEY carnaget:tag