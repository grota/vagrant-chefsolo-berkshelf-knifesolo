#
# Cookbook Name:: site-cookbooks/myface
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#
log "WELCOME TO CHEF MOFO" do
  level :info
end

include_recipe 'tomcat'
include_recipe "tomcat::users"


group node[:myface][:group]

user node[:myface][:user] do
  group  node[:myface][:group]
  system true
  shell "/bin/bash"
end

artifact_deploy "myface" do
  version "1.0.0"
  artifact_location "http://dl.dropbox.com/u/31081437/myface-1.0.0.tar.gz"
  deploy_to "/srv/myface"
  owner node[:myface][:user]
  group node[:myface][:group]
  action :deploy
end
