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
  version node[:myface][:artifact_version]
  artifact_location node[:myface][:artifact_url]
  deploy_to node[:myface][:deploy_to]
  owner node[:myface][:user]
  group node[:myface][:group]
  action :deploy
end

link "#{node[:tomcat][:webapp_dir]}/myface.war" do
    to "#{node[:myface][:deploy_to]}/current/myface.war"
end
