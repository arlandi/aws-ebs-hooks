#!/bin/bash

set -xe

if [ -d /etc/healthd ]
then
    PROXY_SERVER=$(/opt/elasticbeanstalk/bin/get-config optionsettings --namespace 'aws:elasticbeanstalk:container:nodejs' --option-name 'ProxyServer')

    if [ -f /var/elasticbeanstalk/healthd/current_proxy_server ]
    then
        CURRENT_PROXY_SERVER=$(cat /var/elasticbeanstalk/healthd/current_proxy_server)
    else
        CURRENT_PROXY_SERVER=$PROXY_SERVER
    fi

    if [ "$PROXY_SERVER" != "$CURRENT_PROXY_SERVER" ]
    then 
        case "$PROXY_SERVER" in
        nginx)
            /opt/elasticbeanstalk/bin/healthd-configure --appstat-log-path /var/log/nginx/healthd/application.log --appstat-unit sec --appstat-timestamp-on 'completion'
            ;;
        apache)
            /opt/elasticbeanstalk/bin/healthd-configure --appstat-log-path /var/log/httpd/healthd/application.log --appstat-unit usec --appstat-timestamp-on 'arrival'
            ;;
        *)
            /opt/elasticbeanstalk/bin/healthd-configure --appstat-log-path '' --appstat-unit '' --appstat-timestamp-on ''
            ;;
        esac

        /opt/elasticbeanstalk/bin/healthd-restart
    fi

    echo "$PROXY_SERVER" > /var/elasticbeanstalk/healthd/current_proxy_server
fi
