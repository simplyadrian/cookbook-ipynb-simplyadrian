#
# iPython packages
default['ipynb-simplyadrian']['packages'] = {}
# System packages
default['ipynb-simplyadrian']['system_packages'] = {}
# iPython user
default['ipynb-simplyadrian']['linux_user'] = "ipynb"
# iPython group
default['ipynb-simplyadrian']['linux_group'] = "ipynb"
# iPython Notebook user home directory
default['ipynb-simplyadrian']['home_dir'] = "/home/ipynb"
# iPython Notebook working directory
default['ipynb-simplyadrian']['notebook_dir'] = "/home/ipynb/notebooks"
# iPython Notebook profile name
default['ipynb-simplyadrian']['profile_name'] = "nbserver"
# iPython Notebook listening address
default['ipynb-simplyadrian']['ip'] = node['ipaddress']
# iPython Notebook listening port
default['ipynb-simplyadrian']['port'] = 8888
