#
# Cookbook Name:: chef-centos7-haproxy
# Recipe:: default
#
# Copyright (c) 2017 Jason DeBolt, All Rights Reserved.

include_recipe "chef-centos7-common::default"
#include_recipe "chef-centos7-workstation::default"


haproxy_install 'package' do
end

haproxy_config_global '' do
  chroot '/var/lib/haproxy'
  daemon true
  maxconn 256
  log '/dev/log local0'
  log_tag 'WARDEN'
  pidfile '/var/run/haproxy.pid'
  stats_socket '/var/lib/haproxy/stats level admin'
  tuning 'bufsize' => '262144'
end

haproxy_config_defaults '' do
  mode 'http'
  timeout connect: '5000ms',
          client: '5000ms',
          server: '5000ms'
end

haproxy_frontend 'http-in' do
  bind '*:80'
  default_backend 'servers'
end

haproxy_backend 'servers' do
  server ['web1 192.168.10.43:80 maxconn 32','web2 192.168.10.44:80 maxconn 32']
end
