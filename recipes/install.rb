#
# Cookbook Name:: docker-mms
# Recipe:: install
#
# Copyright (C) 2014 Daniel Ku
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

mms = Chef::EncryptedDataBagItem.load "secrets", "mms"
api_key = mms['api_key']

docker_container 'monitoring-agent' do
  image 'kjunine/mms-monitoring-agent:latest'
  container_name 'monitoring-agent'
  detach true
  env [
    "MMS_API_KEY=#{api_key}"
  ]
  action :run
end

docker_container 'backup-agent' do
  image 'kjunine/mms-backup-agent:latest'
  container_name 'backup-agent'
  detach true
  env [
    "MMS_API_KEY=#{api_key}"
  ]
  action :run
end
