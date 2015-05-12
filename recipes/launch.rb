#
# Cookbook Name:: ipynb-simplyadrian
# Recipe:: launch 
#
# Copyright 2014, simplyadrian
#
# All rights reserved - Do Not Redistribute
#

bash 'Launch ipython notebook' do
  user node['ipynb-simplyadrian']['linux_user']
  group node['ipynb-simplyadrian']['linux_group']
  cwd node['ipynb-simplyadrian']['notebook_dir']
  code <<-EOC
    nohup ./launch.sh restart
  EOC
end
