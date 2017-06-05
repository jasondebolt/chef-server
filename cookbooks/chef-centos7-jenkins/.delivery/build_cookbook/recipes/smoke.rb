#
# Cookbook Name:: build_cookbook
# Recipe:: smoke
#
# Copyright:: 2017, Jason DeBolt, All Rights Reserved.
include_recipe 'delivery-truck::smoke'

include_recipe "chef-centos7-common::default"
include_recipe "chef-centos7-httpd::default"
