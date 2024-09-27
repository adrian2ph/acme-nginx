#!/bin/sh
test -d conf.d || mkdir conf.d
test -d ssl || mkdir ssl
chown -R a+rw ssl
chown -R a+r conf.d

docker compose build -t nginx-acme
docker compose up -d


