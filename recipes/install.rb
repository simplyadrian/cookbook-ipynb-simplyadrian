#
# Cookbook Name:: ipynb-simplyadrian
# Recipe:: install 
#
# Copyright 2014, simplyadrian
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'python'

# Install packages
node['ipynb-simplyadrian']['system_packages'].each do |pkg|
  package pkg do
    action :upgrade
  end
end

# Install packages
node['ipynb-simplyadrian']['packages'].each do |pkg|
  python_pip pkg do
    action :install
  end
end