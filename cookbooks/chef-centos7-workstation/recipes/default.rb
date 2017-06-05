#
# Cookbook Name:: chef-centos7-workstation
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

include_recipe 'chef-centos7-common::default'
include_recipe 'chef-centos7-workstation::setup'
include_recipe 'chef-centos7-workstation::ohai'
include_recipe 'chef-centos7-httpd::default'
