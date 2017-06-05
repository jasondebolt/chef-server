# chef-centos7-chef-client

Add this cookbook to a node that you want to converge on a regular basis.
Once this cookbook, and all its dependencies, are available on your chef server,
you will be able to add it to the run list for a node that you want to
regularly converge.

Use cases:
- Run this on your chef-centos7-haproxy nodes to make sure they are always
  up to date so that they can pick up new members.

To add this to the runlist of your chef-centos7-haproxy cookbook

```
Make sure your 'jasondebolt.pem' exists in your ~/.chef directory.
Make sure your ~/.chef/config.rb file contains the following lines:

  node_name                "jasondebolt"
  client_key               "#{current_dir}/jasondebolt.pem"
  chef_server_url          "https://api.chef.io/organizations/jasondebolt"

Then run these commands:

$ berks install
$ berks upload
$ cd cookbooks/chef-centos7-haproxy
$ vagrant up
$ vagrant ssh-config --> get port number
$ knife bootstrap localhost --ssh-port {enter port of LB} --ssh-user vagrant --sudo --identity-file /Users/jasondebolt/{path_to_haproxy_cookbook}/.vagrant/machines/load-balancer/virtualbox/private_key -N load-balancer --run-list "recipe[chef-centos7-chef-client],recipe[chef-centos7-haproxy]"
```
