#
# Cookbook Name:: chef-centos7-chef-client
# Recipe:: default
#
# Copyright (c) 2017 Jason DeBolt, All Rights Reserved.

include_recipe "chef-centos7-common::default"
#include_recipe "chef-centos7-workstation::default"
include_recipe "chef-centos7-httpd::default"

# A 15 minute interval with 15 minute splay ensures all nodes converge within
# 30 min.
node.default['chef_client']['interval'] = '300'
node.default['chef_client']['splay'] = '60'

include_recipe 'chef-client::default'
