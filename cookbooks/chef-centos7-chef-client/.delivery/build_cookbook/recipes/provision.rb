#
# Cookbook Name:: build_cookbook
# Recipe:: provision
#
# Copyright (c) 2017 Jason DeBolt, All Rights Reserved.
include_recipe 'delivery-truck::provision'

include_recipe "chef-centos7-common::default"
include_recipe "chef-centos7-httpd::default"
