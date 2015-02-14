#
# Cookbook Name:: ipynb-nativex
# Recipe:: configure 
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

# Unless the paths got overridden, we set them up here
if node['ipynb-nativex']['home_dir'].nil? || node['ipynb-nativex']['home_dir'].empty?
    node.set['ipynb-nativex']['home_dir'] = File.join("/home/", node['ipynb-nativex']['linux_user'])
end

if node['ipynb-nativex']['notebook_dir'].nil? || node['ipynb-nativex']['notebook_dir'].empty?
    node.set['ipynb-nativex']['notebook_dir'] = File.join(node['ipynb-nativex']['home_dir'], "notebooks")
end

# Group running the IPython notebook (*nix permissions)
group node['ipynb-nativex']['linux_group'] do
     group_name node['ipynb-nativex']['linux_group']
     action :create
end

# User (also runs the IPython notebook)
user node['ipynb-nativex']['linux_user'] do
  comment 'User for ipython notebook'
  gid node['ipynb-nativex']['linux_group']
  home node['ipynb-nativex']['home_dir']
  shell '/bin/bash'
  supports :manage_home => true
  action :create
end

# Create serve directory
directory node['ipynb-nativex']['notebook_dir'] do
  owner node['ipynb-nativex']['linux_user']
  group node['ipynb-nativex']['linux_group']
  mode '0775'
  action :create
end

# Make sure the default profile exists.
profile 'default' do
   action :create
   owner nnode['ipynb-nativex']['linux_user']
   ipython_path "/bin/ipython"
   ipython_settings_dir ipython_settings_dir
end

# Create custom iPython profile.
profile node['ipynb-nativex']['profile_name'] do
   action :create
   owner node['ipynb-nativex']['linux_user']
   ipython_path "/bin/ipython"
   ipython_settings_dir ipython_settings_dir
end

# Deliver launch script
template "#{node['ipynb-nativex']['home_dir']}/launch.sh" do
  source "launch.sh.erb"
  owner node['ipynb-nativex']['linux_user']
  group node['ipynb-nativex']['linux_group']
  mode 00776
end