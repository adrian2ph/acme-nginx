#!/bin/sh

scp Dockerfile docker-compose.yml  nginx.conf  ec2-user@ec2-16-162-219-103.ap-east-1.compute.amazonaws.com:/home/ec2-user/acme-nginx/
scp conf.d/* ec2-user@ec2-16-162-219-103.ap-east-1.compute.amazonaws.com:/home/ec2-user/acme-nginx/conf.d/