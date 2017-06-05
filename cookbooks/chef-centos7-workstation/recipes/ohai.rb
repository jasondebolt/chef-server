#
# Cookbook Name:: chef-centos7-workstation
# Recipe:: ohai
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

template '/etc/motd' do
  source 'motd.erb'
  variables(
    :name => 'Jason DeBolt'
  )
end
