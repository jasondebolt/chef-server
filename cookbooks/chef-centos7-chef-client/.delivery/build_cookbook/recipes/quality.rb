#
# Cookbook Name:: build_cookbook
# Recipe:: quality
#
# Copyright (c) 2017 Jason DeBolt, All Rights Reserved.
include_recipe 'delivery-truck::quality'

include_recipe "chef-centos7-common::default"
include_recipe "chef-centos7-httpd::default"
