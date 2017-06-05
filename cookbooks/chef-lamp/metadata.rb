name 'lamp'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'all_rights'
description 'Installs/Configures lamp'
long_description 'Installs/Configures lamp'
version '0.1.0'

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Issues` link
# issues_url 'https://github.com/<insert_org_here>/lamp/issues' if respond_to?(:issues_url)

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Source` link
# source_url 'https://github.com/<insert_org_here>/lamp' if respond_to?(:source_url)

issues_url 'https://github.com/learn-chef/lamp/issues' if respond_to?(:issues_url)
source_url 'https://github.com/learn-chef/lamp' if respond_to?(:source_url)

depends 'httpd', '~> 0.4'
depends 'mysql', '~> 8.0'
depends 'mysql2_chef_gem', '~> 1.1'
depends 'database', '~> 6.1'
