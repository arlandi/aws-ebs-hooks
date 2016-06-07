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

EB_APP_USER=$(/opt/elasticbeanstalk/bin/get-config  container -k app_user)

if ! grep 'Elastic Beanstalk managed configuration file' /etc/nginx/nginx.conf; then
    cp /opt/elasticbeanstalk/containerfiles/nginx.conf /etc/nginx/nginx.conf
fi
