#
# Cookbook Name:: chef-centos7-workstation
# Recipe:: setup
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

# Should have a data_bags dir two directories up from this one
# and should be clone from:
#    git clone https://github.com/jasondebolt/chef-data-bags users
users = data_bag('users')

users.each do |login|
  theuser = data_bag_item('users', login)
  homedir = "/home/#{login}"

  directory homedir do
    owner theuser['uid']
    group theuser['gid']
    mode '0755'
  end

  file "#{homedir}/.bashrc" do
    owner theuser['uid']
    group theuser['gid']
    mode '0755'
  end

  file "#{homedir}/.vimrc" do
    owner theuser['uid']
    group theuser['gid']
    mode '0755'
  end

  directory "#{homedir}/.ssh" do
    owner theuser['uid']
    group theuser['gid']
    mode '0700'
  end

  user(login) do
    uid theuser['uid']
    shell theuser['shell']
    comment theuser['comment']
    home homedir
  end

  # TODO: Try to encrypt a data bag so you can access a private github repo from a node.
  #git "#{homedir}/dotfiles" do
  #  repository 'git@github.com:jasondebolt/dotfiles.git'
  #  revision 'master'
  #  action :sync
  #  user theuser['uid']
  #  group theuser['gid']
  #end

end
