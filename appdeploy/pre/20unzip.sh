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

EB_APP_STAGING_DIR=$(/opt/elasticbeanstalk/bin/get-config  container -k app_staging_dir)
EB_APP_SOURCE_BUNDLE=$(/opt/elasticbeanstalk/bin/get-config  container -k source_bundle)

/usr/bin/unzip -o -d $EB_APP_STAGING_DIR $EB_APP_SOURCE_BUNDLE
