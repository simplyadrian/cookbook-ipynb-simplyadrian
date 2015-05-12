#
# Cookbook Name:: ipynb-simplyadrian
# Recipe:: mathjax 
#
# Copyright 2014, simplyadrian
#
# All rights reserved - Do Not Redistribute
#

action :create do
   Chef::Log.info("Installing mathjax to\"#{new_resource.install_dir}\" for #{new_resource.owner}")
   Chef::Log.info("Using IPython at #{new_resource.ipython_path}")
   install_mathjax(new_resource.install_dir, new_resource.ipython_path, new_resource.owner)
end

def install_mathjax(install_dir, ipython_path, owner)

   python "install_mathjax" do
       user owner
       group owner
       cwd node['ipynb-simplyadrian']['home_dir']

       environment "HOME" => node['ipynb-simplyadrian']['home_dir'],
                   "SHELL" => "/bin/bash",
                   "USER" => node['ipynb-simplyadrian']['linux_user'],
                   "PATH" => "/bin:/usr/local/bin:/usr/bin:/bin",

       code <<-EOH
from IPython.external.mathjax import install_mathjax
install_mathjax(replace=True, dest='#{install_dir}')
       EOH
   end

end
