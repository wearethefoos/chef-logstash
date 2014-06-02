#
# Cookbook Name:: chef-logstash
# Recipe:: yumrepo
#
# Copyright (C) 2014 Wouter de Vos
# 
# License: MIT
#

yum_repository 'logstash' do
  description "Logstash Stable repo"
  baseurl "http://packages.elasticsearch.org/logstash/#{node[:logstash][:version]}/centos"
  gpgkey 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch'
end
