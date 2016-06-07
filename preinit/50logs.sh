#!/bin/bash
#==============================================================================
# Copyright 2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Amazon Software License (the "License"). You may not use
# this file except in compliance with the License. A copy of the License is
# located at
#
#       http://aws.amazon.com/asl/
#
# or in the "license" file accompanying this file. This file is distributed on
# an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, express or
# implied. See the License for the specific language governing permissions
# and limitations under the License.
#==============================================================================

set -xe

/opt/elasticbeanstalk/bin/log-conf -n 'nodejs' -l'/var/log/nodejs/nodejs.log' -f /opt/elasticbeanstalk/containerfiles/nodejs.logrotate.conf
/opt/elasticbeanstalk/bin/log-conf -n 'npm' -l'/var/log/nodejs/npm-debug.log' -t taillogs,systemtaillogs,bundlelogs
/opt/elasticbeanstalk/bin/log-conf -n'nginx' -l'/var/log/nginx/*' -f /opt/elasticbeanstalk/containerfiles/nginx.logrotate.conf
/opt/elasticbeanstalk/bin/log-conf -n'httpd' -l'/var/log/httpd/*' -f /opt/elasticbeanstalk/containerfiles/httpd.logrotate.conf
