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

EB_CONFIG_STAGING_DIR=$(/opt/elasticbeanstalk/bin/get-config  container -k config_staging_dir)

for i in $(ls $EB_CONFIG_STAGING_DIR); do
  FILE_NAME=$(echo $i | sed -e 's/#/\//g')
  /bin/cp "$EB_CONFIG_STAGING_DIR/$i" "$FILE_NAME"
done
