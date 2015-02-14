#
# iPython packages
default['ipynb-nativex']['packages'] = {}
# System packages
default['ipynb-nativex']['system_packages'] = {}
# iPython user
default['ipynb-nativex']['linux_user'] = "ipynb"
# iPython group
default['ipynb-nativex']['linux_group'] = "ipynb"
# iPython Notebook user home directory
default['ipynb-nativex']['home_dir'] = "/home/ipynb"
# iPython Notebook working directory
default['ipynb-nativex']['notebook_dir'] = "/home/ipynb/notebooks"
# iPython Notebook listening address
default['ipynb-nativex']['ip'] = node['ipaddress']
# iPython Notebook listening port
default['ipynb-nativex']['port'] = 8888
