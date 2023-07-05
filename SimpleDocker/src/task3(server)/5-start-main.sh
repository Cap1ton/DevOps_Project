#!/bin/bash

set -e

spawn-fcgi -a 127.0.0.1 -p 8080 /home/main.fcgi

exit 0
