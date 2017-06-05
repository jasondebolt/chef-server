name 'chef-centos7-chef-client'
maintainer 'Jason DeBolt'
maintainer_email 'jasondebolt@gmail.com'
license 'all_rights'
description 'Installs/Configures chef-centos7-chef-client'
long_description 'Installs/Configures chef-centos7-chef-client'
version '0.1.1'

issues_url 'https://github.com/jasondebolt/chef-centos7-chef-client/issues' if respond_to?(:issues_url)

source_url 'https://github.com/jasondebolt/chef-centos7-chef-client' if respond_to?(:source_url)

depends 'chef-centos7-common'
#depends 'chef-centos7-workstation'
depends 'chef-centos7-httpd'

depends 'chef-client', '= 7.0.2'
