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

artifact_deploy "myface" do
  version "1.0.0"
  artifact_location "http://24.media.tumblr.com/tumblr_m7fpxfkHM81rzupqxo1_500.png"
  deploy_to "/srv/myface"
  owner "myface"
  group "myface"
  action :deploy
end
