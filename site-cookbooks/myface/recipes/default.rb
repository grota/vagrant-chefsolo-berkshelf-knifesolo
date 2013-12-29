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

############################ show the value inside a encrypted data bag ############################
# The encrypted data bag was created with `knife solo data bag create 111 222 --json-file some.json`
# where some.json is a ficticious file whose contents are:
#{
  #"id": "222",
  #"somekey": "the value of somekey"
#}
# You can view the file with `knife solo data bag show 111 222`.
# knife uses the default shared key mentiones in .chef/knife.rb

encrypted_databag_secret_file = Chef::Config[:encrypted_data_bag_secret]
string = "XXXXXX Chef::Config[:encrypted_data_bag_secret]=" + encrypted_databag_secret_file + " XXXXXX"
string += "\n Chef::Config[:data_bag_path]: " + Chef::Config[:data_bag_path].to_s

secret_string = Chef::EncryptedDataBagItem.load_secret encrypted_databag_secret_file
string += "\n Secret loaded from file: " + secret_string
# You can explicitly specify the secret, if you don't Vagrant uses
# the one in Chef::Config[:encrypted_data_bag_secret].
#uncrypted_databag_item = Chef::EncryptedDataBagItem.load "111", "222", secret_string
uncrypted_databag_item = Chef::EncryptedDataBagItem.load("111", "222")

# here we expect the value 'the value of somekey'
string += "\n Data bag item: 111::222[somekey]=" + uncrypted_databag_item[:somekey]
log string do
  level :info
end
