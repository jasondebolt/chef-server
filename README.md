# chef
This is my umbrella repo which contains all of my cookbooks, roles, data bags, etc.

## Working with data bags
### Steps to create a *users* data bag on a chef server:
1) Create the data bag on the chef server using knife
```
  $ knife data bag create users
```

2) upload your existing databag file(s) to the chef server:
```
  $ knife data bag from file {bag} {item1} {item2} ...
  $ knife data bag from file users data_bags/users/jason.json data_bags/users/doug.json
```

## Other useful commands:
```
$ knife data bag list
$ knife data bag show users
$ knife data bag show users/jason
```
