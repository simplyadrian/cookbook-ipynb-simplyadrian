#
# Cookbook Name:: ipynb-nativex
# Recipe:: install 
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'python'

# Install packages
node['ipynb-nativex']['system_packages'].each do |pkg|
  package pkg do
    action :upgrade
  end
end

# Install packages
node['ipynb-nativex']['packages'].each do |pkg|
  python_pip pkg do
    action :install
  end
end