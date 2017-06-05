name 'chef-centos7-httpd-demo'
maintainer 'Jason DeBolt'
maintainer_email 'jasondebolt@gmail.com'
license 'all_rights'
description 'Installs/Configures chef-centos7-httpd-demo'
long_description 'Installs/Configures chef-centos7-httpd-demo'
version '0.1.0'

issues_url 'https://github.com/jasondebolt/chef-centos7-httpd-demo/issues' if respond_to?(:issues_url)

source_url 'https://github.com/jasondebolt/chef-centos7-httpd-demo' if respond_to?(:source_url)

depends 'chef-centos7-common'
depends 'chef-centos7-httpd'
