#!/bin/bash

set -xe

if [ -d /etc/healthd ]
then
    PROXY_SERVER=$(/opt/elasticbeanstalk/bin/get-config optionsettings --namespace 'aws:elasticbeanstalk:container:nodejs' --option-name 'ProxyServer')

    case "$PROXY_SERVER" in
    nginx)
        /opt/elasticbeanstalk/bin/healthd-track-pidfile --proxy nginx
        ;;
    apache)
        chmod 0755 /var/run/httpd
        /opt/elasticbeanstalk/bin/healthd-track-pidfile --proxy httpd
        ;;
    *)
        rm -rf /var/elasticbeanstalk/healthd/proxy.pid
    esac

    /opt/elasticbeanstalk/bin/healthd-track-pidfile --name application --location /var/run/nodejs.pid
fi
