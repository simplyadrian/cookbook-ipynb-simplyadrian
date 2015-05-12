#
# Cookbook Name:: ipynb-simplyadrian
# Recipe:: configure 
#
# Copyright 2014, simplyadrian
#
# All rights reserved - Do Not Redistribute
#

# Unless the paths got overridden, we set them up here
if node['ipynb-simplyadrian']['home_dir'].nil? || node['ipynb-simplyadrian']['home_dir'].empty?
    node.set['ipynb-simplyadrian']['home_dir'] = File.join("/home/", node['ipynb-simplyadrian']['linux_user'])
end

if node['ipynb-simplyadrian']['notebook_dir'].nil? || node['ipynb-simplyadrian']['notebook_dir'].empty?
    node.set['ipynb-simplyadrian']['notebook_dir'] = File.join(node['ipynb-simplyadrian']['home_dir'], "notebooks")
end

# Group running the IPython notebook (*nix permissions)
group node['ipynb-simplyadrian']['linux_group'] do
     group_name node['ipynb-simplyadrian']['linux_group']
     action :create
end

# User (also runs the IPython notebook)
user node['ipynb-simplyadrian']['linux_user'] do
  comment 'User for ipython notebook'
  gid node['ipynb-simplyadrian']['linux_group']
  home node['ipynb-simplyadrian']['home_dir']
  shell '/bin/bash'
  supports :manage_home => true
  action :create
end

# Create serve directory
directory node['ipynb-simplyadrian']['notebook_dir'] do
  owner node['ipynb-simplyadrian']['linux_user']
  group node['ipynb-simplyadrian']['linux_group']
  mode '0775'
  action :create
end

# Make sure the default profile exists.
ipynb_simplyadrian_profile 'default' do
   action :create
   owner node['ipynb-simplyadrian']['linux_user']
   ipython_path "/bin/ipython"
   ipython_settings_dir ipython_settings_dir
end

# Create custom iPython profile.
ipynb_simplyadrian_profile node['ipynb-simplyadrian']['profile_name'] do
   action :create
   owner node['ipynb-simplyadrian']['linux_user']
   ipython_path "/bin/ipython"
   ipython_settings_dir ipython_settings_dir
end

#ipynb_mathjax "MathJax!" do
#   action :create
#   owner node[:ipynb][:linux_user]
#   ipython_path "#{node[:ipynb][:virtenv]}/bin/ipython"
#   install_dir File.join(node[:ipynb][:virtenv], "lib", node[:ipynb][:py_version],"site-packages/IPython/html/static/mathjax")
#end

# Deliver launch script
template "#{node['ipynb-simplyadrian']['home_dir']}/launch.sh" do
  source "launch.sh.erb"
  owner node['ipynb-simplyadrian']['linux_user']
  group node['ipynb-simplyadrian']['linux_group']
  mode 00776
end