#
# Cookbook Name:: chef-centos7-jenkins
# Recipe:: default
#
# Copyright:: 2017, Jason DeBolt, All Rights Reserved.

# Jenkins require Java version >= 1.7

node.default['java']['jdk_version'] = '7'
#node.default['jenkins']['java'] = '/usr/lib/jvm/java-1.7.0/bin/java'
node.default['jenkins']['java'] = 'java' # just run the default.

include_recipe "chef-centos7-common::default"
include_recipe "chef-centos7-workstation::default"
include_recipe "chef-centos7-httpd::default"
include_recipe "java::default"
include_recipe "maven::default"
include_recipe "jenkins::master"


# Create password credentials
jenkins_password_credentials 'wcoyote' do
  id          'wcoyote-password'
  description 'Wile E Coyote'
  password    'beepbeep'
end
