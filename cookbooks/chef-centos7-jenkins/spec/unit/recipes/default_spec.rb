#
# Cookbook Name:: chef-centos7-jenkins
# Spec:: default
#
# Copyright:: 2017, Jason DeBolt, All Rights Reserved.

require 'spec_helper'

describe 'chef-centos7-jenkins::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:home)          { '/var/lib/jenkins' }
    let(:log_directory) { '/var/log/jenkins' }
    let(:user)          { 'jenkins' }
    let(:group)         { 'jenkins' }

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.2.1511') do |node, server|
        node.normal['jenkins']['master']['install_method'] = 'war'


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
    it 'should include the java recipe' do
      expect(chef_run).to include_recipe('java::default')
    end
    it 'should include the openjdk java recipe' do
      expect(chef_run).to include_recipe('java::openjdk')
    end
    it 'should use the openjdk flavor' do
      expect(chef_run.node['java']['install_flavor']).to eq('openjdk')
    end
    it 'should use a java version >= 1.7 for jenkins' do
      expect(chef_run.node['java']['jdk_version']).to eq('7')
    end
    it 'should include the jenkins master recipe' do
      expect(chef_run).to include_recipe('jenkins::master')
    end
    it 'creates the user for jenkins' do
      expect(chef_run).to create_user(user)
        .with_home(home)
        .with(system: true)
    end
    it 'creates the group for jenkins' do
      expect(chef_run).to create_group(group)
        .with_members([user])
        .with(system: true)
    end
    it 'creates the log directory for jenkins' do
      expect(chef_run).to create_directory(log_directory)
        .with_owner(user)
        .with_group(group)
        .with_mode('0755')
        .with_recursive(true)
    end
    it 'runs jenkins on port 8080' do
      expect(chef_run.node['jenkins']['master']['port']).to eq(8080)
    end
  end
end
