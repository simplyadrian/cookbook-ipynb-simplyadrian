#
# Cookbook Name:: ipynb-nativex
# Recipe:: profile 
#
# Copyright 2014, NativeX
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

attribute :owner, :regex => [ /^([a-z]|[A-Z]|[0-9]|_|-)+$/, /^\d+$/ ], :default => node[:ipynb][:linux_user]
attribute :ipython_path, :kind_of => String, :default => "#{node[:ipynb][:virtenv]}/bin/ipython"
attribute :ipython_settings_dir, :kind_of => String