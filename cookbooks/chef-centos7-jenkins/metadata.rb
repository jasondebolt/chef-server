name 'chef-centos7-jenkins'
maintainer 'Jason DeBolt'
maintainer_email 'jasondebolt@gmail.com'
license 'all_rights'
description 'Installs/Configures chef-centos7-jenkins'
long_description 'Installs/Configures chef-centos7-jenkins'
version '0.2.9'

issues_url 'https://github.com/jasondebolt/chef-centos7-jenkins/issues' if respond_to?(:issues_url)

source_url 'https://github.com/jasondebolt/chef-centos7-jenkins' if respond_to?(:source_url)

depends 'chef-centos7-common'
depends 'chef-centos7-workstation'
depends 'chef-centos7-httpd'
depends 'java'
depends 'maven'
depends 'jenkins'
