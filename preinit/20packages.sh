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

function is_baked
{
  if [[ -f /etc/elasticbeanstalk/baking_manifest/$1 ]]; then
    true
  else
    false
  fi
}

if is_baked nodejs_packages; then
  echo nodejs related packages have already been installed. Skipping installation.
else
  yum install -y \
      gcc-c++ \
      make \
      nginx \
      httpd24 \
      git
fi
