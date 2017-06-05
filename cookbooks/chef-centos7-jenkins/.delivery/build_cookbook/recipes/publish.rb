#
# Cookbook Name:: build_cookbook
# Recipe:: publish
#
# Copyright:: 2017, Jason DeBolt, All Rights Reserved.
include_recipe 'delivery-truck::publish'

include_recipe "chef-centos7-common::default"
include_recipe "chef-centos7-httpd::default"
