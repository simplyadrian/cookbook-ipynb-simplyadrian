#
# Cookbook Name:: ipynb-simplyadrian
# Recipe:: default 
#
# Copyright 2014, simplyadrian
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'ipynb-simplyadrian::install'
include_recipe 'ipynb-simplyadrian::configure'
include_recipe 'ipynb-simplyadrian::launch'

