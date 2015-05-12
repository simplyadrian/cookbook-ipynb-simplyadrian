#
# Cookbook Name:: ipynb-simplyadrian
# Recipe:: mathjax 
#
# Copyright 2014, simplyadrian
#
# All rights reserved - Do Not Redistribute
#

actions :create #, :delete, :create_if_missing
default_action :create if defined?(default_action)

# Default action for Chef <= 10.8
def initialize(*args)
   super
   @action = :create
end

attribute :install_dir
attribute :owner, :regex =>  Chef::Config[:user_valid_regex], :default => node['ipynb-simplyadrian']['linux_user']
attribute :ipython_path, :kind_of => String, :default => "/bin/ipython"