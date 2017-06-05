# # encoding: utf-8

# Inspec test for recipe chef-centos7-workstation::setup

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

describe port(80) do
  it { should be_listening }
  skip 'This is an example test, replace with your own test.'
end
