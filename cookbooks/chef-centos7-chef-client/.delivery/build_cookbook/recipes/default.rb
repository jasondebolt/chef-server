#
# Cookbook Name:: build_cookbook
# Recipe:: default
#
# Copyright (c) 2017 Jason DeBolt, All Rights Reserved.
include_recipe 'delivery-truck::default'

include_recipe "chef-centos7-common::default"
include_recipe "chef-centos7-httpd::default"
