# # encoding: utf-8

# Inspec test for recipe chef-centos7-haproxy::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

describe port(80) do
  it { should be_listening }
end

describe package('haproxy') do
  it { should be_installed }
end

describe directory '/etc/haproxy' do
  it { should exist }
end

describe file('/etc/haproxy/haproxy.cfg') do
  it { should exist }
  it { should be_owned_by 'haproxy' }
  it { should be_grouped_into 'haproxy' }
  its('content') { should match(/daemon/) }
  its('content') { should match(/timeout connect 5000ms/) }
  its('content') { should match(%r{stats socket /var/lib/haproxy/stats level admin}) }
  its('content') { should match(%r{stats uri /haproxy-status}) }
  its('content') { should match(/frontend http-in/) }
  its('content') { should match(/bind \*:80/) }
  its('content') { should match(/backend servers/) }
  its('content') { should match(/server web1 192.168.10.43:80 maxconn 32/) }
  its('content') { should match(/server web2 192.168.10.44:80 maxconn 32/) }
end

describe service('haproxy') do
  it { should be_running }
end
