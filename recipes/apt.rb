#
# Cookbook Name:: chef-logstash
# Recipe:: apt
#
# Copyright (C) 2014 Wouter de Vos
# 
# License: MIT
#

apt_repository "logstash" do
  uri "http://packages.elasticsearch.org/logstash/#{node[:logstash][:version]}/debian"
  distribution 'stable'
  components ["main"]
  key "http://packages.elasticsearch.org/GPG-KEY-elasticsearch"
end

