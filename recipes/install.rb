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
%w{
  python-ipython-notebook
  python33-scipy
}.each do |pkg|
  package pkg do
    action :upgrade
  end
end

# iPython needs sympy (0.7.2)
# So use [pip install] instead of package install (0.6.3).
python_pip "sympy"