#
# Cookbook Name:: ipynb-nativex
# Recipe:: launch 
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

bash 'Launch ipython notebook' do
  user node['ipynb-nativex']['linux_user']
  group node['ipynb-nativex']['linux_group']
  cwd node['ipynb-nativex']['notebook_dir']
  code <<-EOC
    nohup ./launch.sh restart
  EOC
end
