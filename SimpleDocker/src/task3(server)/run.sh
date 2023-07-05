#!/bin/bash

docker build -t carnaget:tag .
docker run -d -p 81:81 carnaget:tag