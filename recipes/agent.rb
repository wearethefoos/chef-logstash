#
# Cookbook Name:: chef-logstash
# Recipe:: agent
#
# Copyright (C) 2014 Wouter de Vos
# 
# License: MIT
#

template "/etc/logstash/conf.d/agent.conf" do
  source "logstash.conf.erb"
  variables( :config => node[:logstash][:agent] )
  notifies :restart, "service[logstash]"
end
