#
# Cookbook Name:: chef-logstash
# Recipe:: agent
#
# Copyright (C) 2014 Wouter de Vos
# 
# License: MIT
#

template "/etc/logstash/conf.d/agent.conf" do
  owner "logstash"
  group "logstash"
  mode "0755"
  source "logstash.conf.erb"
  variables( :config => node[:logstash][:agent] )
  notifies :restart, "service[logstash]"
end
