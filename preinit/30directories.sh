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

EB_NODE_LOG_DIR=$(/opt/elasticbeanstalk/bin/get-config  container -k nodejs_log_dir)
EB_APP_USER=$(/opt/elasticbeanstalk/bin/get-config  container -k app_user)
EB_NODE_INSTALL_DIR=$(/opt/elasticbeanstalk/bin/get-config  container -k nodejs_install_dir)

mkdir -p $EB_NODE_LOG_DIR
chown $EB_APP_USER $EB_NODE_LOG_DIR

mkdir -p $EB_NODE_INSTALL_DIR
