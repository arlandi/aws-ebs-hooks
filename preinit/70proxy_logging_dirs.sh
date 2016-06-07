#!/bin/bash

set -xe

mkdir -p /var/log/httpd
chmod -R 755 /var/log/httpd

if [ -d /etc/healthd ]
then
    mkdir -p /var/log/nginx/healthd
    chown -R nginx:nginx /var/log/nginx/healthd
    mkdir -p /var/log/httpd/healthd
fi
