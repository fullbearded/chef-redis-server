name 'chef-redis-server'
maintainer 'jerry'
maintainer_email 'jerrery520@gmail.com'
description 'this is redis-server for CentOS'
version '0.0.3'

depends 'install_from', '>= 0.0.0'

recipe 'chef-redis-server', 'install redis server'
