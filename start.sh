#!/bin/sh
test -d conf.d || mkdir conf.d
test -d ssl || mkdir ssl
chown -R a+rw ssl
chown -R a+r conf.d

docker compose build
docker compose up -d

chown -R a+rw ssl

