#
# Cookbook Name:: chef-centos7-workstation
# Spec:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'chef-centos7-workstation::setup' do
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

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'should create home directory for jason' do
      expect(chef_run).to create_directory('/home/jason').with(owner: '1000')
    end

    it 'should create home directory for doug' do
      expect(chef_run).to create_directory('/home/doug').with(owner: '1001')
    end

    it 'should create .bashrc files for jason and doug' do
      expect(chef_run).to create_file('/home/jason/.bashrc')
      expect(chef_run).to create_file('/home/doug/.bashrc')
    end

    it 'should create .vimrc files for jason and doug' do
      expect(chef_run).to create_file('/home/jason/.vimrc')
      expect(chef_run).to create_file('/home/doug/.vimrc')
    end

    it 'should create .ssh/ directories for jason and doug' do
      expect(chef_run).to create_directory('/home/jason/.ssh').with(owner: '1000', mode: '0700')
      expect(chef_run).to create_directory('/home/doug/.ssh').with(owner: '1001', mode: '0700')
    end

    it 'should create users jason and doug' do
      expect(chef_run).to create_user('jason').with(uid: '1000', shell: '/bin/bash', home: '/home/jason')
      expect(chef_run).to create_user('doug').with(uid: '1001', shell: '/bin/bash', home: '/home/doug')
    end

  end
end
