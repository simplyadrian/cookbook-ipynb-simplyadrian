#
# Cookbook Name:: ipynb-nativex
# Recipe:: default 
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'ipynb-nativex::install'
include_recipe 'ipynb-nativex::configure'
include_recipe 'ipynb-nativex::launch'

