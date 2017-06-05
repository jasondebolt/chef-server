#
# Cookbook Name:: build_cookbook
# Recipe:: syntax
#
# Copyright:: 2017, Jason DeBolt, All Rights Reserved.
include_recipe 'delivery-truck::syntax'

include_recipe "chef-centos7-common::default"
include_recipe "chef-centos7-httpd::default"
