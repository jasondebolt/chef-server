# chef-centos7-workstation

TODO: Enter the cookbook description here.

This is my workstation recipe. It sets up a bunch of packages and installs things
like vim and git.

Calling "kitchen converge" will create 2 instances (see .kitchen.yml file):
  1) A T1.Micro EC2 instance
  2) A centos vagrant instance

To log into one of the VM's:
$ kitchen login centos
$ kitchen login amazon

To get Ohai information on one of the VM's:
$ kitchen login {centos, amazon, etc.)
- A subset of Ohai information will appear when you login.

To run a command on one of the VM's:
$ kitchen exec amazon -c "uname -a"
$ kitchen exec centos -c "uname -a"

To run chef tests:
$ chef exec rspec --color spec/unit/recipes/default_spec.rb

To run kitchen tests
$ kitchen converge
$ kitchen verify

To do a complete kitchen create, kitche converge, kitchen verify, kitchen destroy:
$ kitchen test
