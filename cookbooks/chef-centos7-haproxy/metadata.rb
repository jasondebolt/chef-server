name 'chef-centos7-haproxy'
maintainer 'Jason DeBolt'
maintainer_email 'jasondebolt@gmail.com'
license 'all_rights'
description 'Installs/Configures chef-centos7-haproxy'
long_description 'Installs/Configures chef-centos7-haproxy'
version '0.1.6'

issues_url 'https://github.com/jasondebolt/chef-centos7-haproxy/issues' if respond_to?(:issues_url)

source_url 'https://github.com/jasondebolt/chef-centos7-haproxy' if respond_to?(:source_url)

depends 'chef-centos7-common'
#depends 'chef-centos7-workstation'
depends 'chef-centos7-httpd'
depends 'haproxy', '~> 4.0.0'
