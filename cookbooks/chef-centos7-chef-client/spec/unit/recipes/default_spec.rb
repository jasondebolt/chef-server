#
# Cookbook Name:: chef-centos7-chef-client
# Spec:: default
#
# Copyright (c) 2017 Jason DeBolt, All Rights Reserved.

require 'spec_helper'

describe 'chef-centos7-chef-client::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.2.1511') do |node, server|
        server.create_data_bag('users', {
          'jason' => {
            'id' => 'jason',
            'uid' => '1000',
            'gid' => '1000',
            'shell' => '/bin/bash'
          },
          'doug' => {
            'id' => 'doug',
            'uid' => '1001',
            'gid' => '1001',
            'shell' => '/bin/bash'
          }
        })
      end
      runner.converge(described_recipe)
    end
  end
end
