#
# Cookbook Name:: chef-centos7-httpd-demo
# Recipe:: default
#
# Copyright (c) 2017 Jason DeBolt, All Rights Reserved.

include_recipe "chef-centos7-common::default"
include_recipe "chef-centos7-httpd::default"

remote_file '/var/www/html/jason.jpg' do
  source 'https://s3-us-west-1.amazonaws.com/jasondeboltpublic/jason_suit_night.jpg'
  owner 'web_admin'
  group 'web_admin'
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  action :create
  owner 'web_admin'
  group 'web_admin'
  mode 00744
end
