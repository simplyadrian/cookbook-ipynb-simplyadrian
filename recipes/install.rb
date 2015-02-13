#
# Cookbook Name:: ipynb-nativex
# Recipe:: install 
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

# Install packages
%w{
  python-pandas
  python-numpy
  python-scipy
  python-matplotlib
  python-nose
  ipython-notebook
}.each do |pkg|
  package pkg do
    action :upgrade
  end
end

# iPython needs sympy
# So use [pip install] instead of package install (0.7.1).
python_pip "sympy"