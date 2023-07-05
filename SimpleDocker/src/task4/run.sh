#!/bin/bash

docker build -t carnaget:tag .
docker run -d -p 80:81 -v "`pwd`/nginx":/etc/nginx carnaget:tag
