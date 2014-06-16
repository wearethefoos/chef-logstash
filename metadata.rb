name             'chef-logstash'
maintainer       'Wouter de Vos'
maintainer_email 'oss@rein.io'
license          'MIT'
description      'Installs/Configures Logstash from the official packages.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w{ ubuntu debian redhat centos scientific amazon fedora }.each do |os|
  supports os
end

%w{ yum apt python logrotate }.each do |ckbk|
  depends ckbk
end
