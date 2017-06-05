# chef-centos7-haproxy

0) Running kitchen tests

   Since the kitchen tests I wrote simply check that haproxy was installed
   and configured correctly, the test kitchen vagrant instance is not actually
   load balancing any nodes because the kitchen tests do not spin up any
   web nodes (web1 and web2). If you want the test kitchen haproxy instance
   to actually load balancer the web nodes, walk through steps 1 through 7 of
   this document and the test kitchen instance will be able to see/load-balance
   them.

```
   $ kitchen converge
   $ kitchen verify
```

1) Start up the 3 vagrant instances
```
  $ vagrant up
```

2) Verify they are running
```
  $ vagrant global-status
  $ vagrant ssh-config
  $ vagrant ssh web1
```

3) Make sure you have a .chef directory in the project directory of this cookbook
   with the the "knife.rb" and "jasondebolt.pem" files found in "https://manage.chef.io/organizations/jasondebolt":

```
   personal-cookbooks/.chef
   ├── jasondebolt.pem
   └── knife.rb
   personal-cookbooks/cookbooks/chef-centos7-haproxy
   ├── README.md
   ├── Vagrantfile
   ...
```

4) Bootstrap the instances (make sure ports, paths, and names match output of "vagrant ssh-config"). For example:

   NOTE: You can also add the --run-list flag to set the appropriate run list for each node (allowing you to skip the following 2 steps.)

```
   $ knife bootstrap localhost --ssh-port 2222 --ssh-user vagrant --sudo --identity-file /Users/jasondebolt/chef-repo/.vagrant/machines/web1/virtualbox/private_key -N web1

   $ knife bootstrap localhost --ssh-port 2200 --ssh-user vagrant --sudo --identity-file /Users/jasondebolt/chef-repo/.vagrant/machines/web2/virtualbox/private_key -N web2

   $ knife bootstrap localhost --ssh-port 2201 --ssh-user vagrant --sudo --identity-file /Users/jasondebolt/chef-repo/.vagrant/machines/load-balancer/virtualbox/private_key -N load-balancer
```

5) Add the appropriate runlists to each chef node:

```
   $ knife node run_list add web1 "recipe[chef-centos7-httpd]"
   $ knife node run_list add web2 "recipe[chef-centos7-httpd]"
   $ knife node run_list add load-balancer "recipe[chef-centos7-haproxy]"
```

6) Run 'sudo chef-client' on each node.

```
   $ vagrant ssh web1
   $ sudo chef chef-client
   $ curl localhost --> run this within the vagrant instance to see the HTML output.

   $ vagrant ssh web2
   $ sudo chef chef-client

   $ vagrant ssh load-balancer
   $ sudo chef chef-client
```

7) After you've successfully the recipes on the nodes (either during bootstrap or by manually running chef-client),
   you can go to your browser and open 'localhost:9000'. You will see that the web1 and web2 HTML pages are alternately
   displayed via round robin using your haproxy load balancer. You can also see the web1 and web2 server HTML pages
   directory by entering the private IP's from the Vagrantfile (192.168.10.43, 192.168.10.44) into your browser.

8) Other commands:

```
  $ knife node list
  $ knife node show web1
```

NOTES:
   If you want to change a recipe in this cookbook, make sure you change the version number
   in the metadata.rb file so that when you run "berks install" and "berks upload", the
   new version of the cookbook will be uploaded to the chef server. Berkshelf doesn't want
   to override versions of your cookbooks on the chef server, so that's why you always
   need to increment the version number before the upload.
