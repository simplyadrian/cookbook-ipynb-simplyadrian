#
# Cookbook Name:: ipynb-simplyadrian
# Recipe:: profile 
#
# Copyright 2014, simplyadrian
#
# All rights reserved - Do Not Redistribute
#

action :create do
   Chef::Log.info("Creating profile \"#{new_resource.name}\" for #{new_resource.owner}")
   Chef::Log.info("IPython path is at #{new_resource.ipython_path}")
   Chef::Log.info("IPython settings are at #{new_resource.ipython_settings_dir}")
   create_profile(new_resource.ipython_path, new_resource.owner,
                  new_resource.name, new_resource.ipython_settings_dir)
end

def create_profile(ipython_path, owner, name, ipython_settings_dir)
   bash "create_profile" do
      user owner
      group owner
      code <<-EOH
      #{ipython_path} profile create --profile=#{name} --ipython-dir #{ipython_settings_dir}
      EOH
      environment
   end
end